$(function () {
				var SECNOD = 12 * 60 * 60;
				var seconds = SECNOD;
				
				$(":button").on('click',
				function () {
					
					var codeIntervalId = window.setInterval(function () {
						var $bnt = $(":button");
						$bnt.val(Math.floor(seconds / (60 * 60))+"小时"+Math.floor((seconds / 60) % 60)+"分钟"+Math.floor(seconds % 60)+"秒"+"后重新发送");
						
						$bnt.attr("disabled","disabled");
						
						
						if (seconds == 0) {
							window.clearInterval(codeIntervalId);
							seconds = SECNOD;
							
							$bnt.val("获取验证码");
							$bnt.removeAttr("disabled");
							
							return false;
						}
						
						seconds--;
					},1000);
					
					
				});
			});