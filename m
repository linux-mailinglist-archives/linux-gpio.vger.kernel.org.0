Return-Path: <linux-gpio+bounces-38737-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AIhZJdOaNmrcBgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38737-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 15:51:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A216A8F6C
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 15:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=LVuiQ2f6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38737-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38737-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A44E63012CEF
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 13:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCA9394464;
	Sat, 20 Jun 2026 13:51:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA8394499;
	Sat, 20 Jun 2026 13:51:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781963472; cv=none; b=Jf8JqwRcrNg0EGvhc71BYAnGS56NZcekoWJ86kPCPcaPhpqambZurGyzGYmS3wvQ+R89U4Ct36wfw7wrSVxUqQR6ebALfAN+HtT1uomh0sEba+GBPYhiBFcsrB6290+x2gKL7iXWkk+g/iy5HtPEQqjXtCEoICo3SNPIfUC8v5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781963472; c=relaxed/simple;
	bh=CDvojPxVpOM+sEeIqGqmH822Kv7W5mWFKE1eek8OHmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ml5O4nCO32jTiE0ncVenVQwLevhhtlXF1S05L2M31dSD+ZmQ0sOMoDyhbXbR99lUriNP4x7bey8KExDpMEJC8TeBGpo0Bg62x+r1oD+WIBBeCpFiHgmBYNDShklhGCxl6aSeISS1mMnTN2wRsAp/gcaTVwJLniw93G5X08BNXUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LVuiQ2f6; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 500B34E40293;
	Sat, 20 Jun 2026 13:51:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2466C601B7;
	Sat, 20 Jun 2026 13:51:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97D89106C8906;
	Sat, 20 Jun 2026 15:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781963463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HPl4CSgoMUUpfbJy08uK5TPTqnyk/iDusqQS0vClhZg=;
	b=LVuiQ2f6k4IP1W/F8r/2B40yXSTsDXfz876Sluz4FecnC2oL+DSNYgBvAPJ6V1+sgDwtto
	fvCE5g8QmetItB1xVLXmLpbxeHWX0ys3FkQkx9/yQfsXPNBzuVserPs7gof9PBDL+adF31
	9Nj0meoeKowEOmY9aTU464uI8z8Gpn/EdB4xf5lTuHcF1sH6bLJ9IliyKKiN8oUvYRy+OB
	hUCltFoChGXqOe1cvzQwhBc5ZJ445LO83oe5vIJwzst98cbGolEkI9v0rh7DHRwZaOKqSP
	e4CG7QN1jFH+sEVkBN8YDcSNbgvo0WKIne1/jyGp2LvS6KDWXEaAxk5qVesvYg==
From: Diogo Ivo <diogo.ivo@bootlin.com>
Date: Sat, 20 Jun 2026 15:50:59 +0200
Subject: [PATCH 2/2] ASoC: rt5677: Enable standalone compilation for
 generic card use
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-smaug-audio-v1-2-e318acdf5abd@bootlin.com>
References: <20260620-smaug-audio-v1-0-e318acdf5abd@bootlin.com>
In-Reply-To: <20260620-smaug-audio-v1-0-e318acdf5abd@bootlin.com>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Diogo Ivo <diogo.ivo@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=669; i=diogo.ivo@bootlin.com;
 h=from:subject:message-id; bh=CDvojPxVpOM+sEeIqGqmH822Kv7W5mWFKE1eek8OHmc=;
 b=owEBbQKS/ZANAwAKAQa+fFtWXslFAcsmYgBqNprNRIRmUbYX7IL6LJOiMwmFmayQqoKru/osT
 yhDmD1g2uGJAjMEAAEKAB0WIQTma35o1i1081e8B2UGvnxbVl7JRQUCajaazQAKCRAGvnxbVl7J
 RUypEACOxC6GoIH0VjF/b107YUfI66eDA3fDEchXeyb6gMGdF0/qSg9BaPa84mYkhwRoQcVV00T
 BHHpOSrGs9Q6352vorW4SopwY1rpxmoAQkPZpml7ti9e14QvwaSPZ+gXTvmYdGQl1jwOpqZxUgN
 M8WaZQfdnyNrMl8UvYfKLZoGgvbq85miQE8FI5y7nTGU7hhWMFP9Tn0vGsyntnZLoTQWGlth0eQ
 1nxwxOKZ+92vg6hZoW/MqhnAHaDgZ8RIJXMwj5i/iDz+y57e6AoRbJj+g4ouBoiyPsxRyibkccd
 YpLvd3Fcib15B80JCIupq+TDlBTcDbEMOJfWeDBLdKXV9aqUNRZsxg2HLwmaa8JJSo+ysZRP1k1
 /RJx2qQpNe/QFpqvZoUPTVcxzV7QCck+IBMCbD0SLy7XZHSQ/1dPB0sErjjfLUUDYm3bGTuAyJ8
 e/U1VQX4I0wYiig2zLrOH+jGnAwsSbPgKmGkNI5XawgB59e9l4id6Cg4S4V4W+Oadw9hIErrgiW
 /C3/3Ltx9ydSq+ohc5zuLI3l17kVAJ2WSnS4hDwy1RoKJppg7X9YE8evj3aC5wTRqcMabl9A27o
 HxgxPOsImYgzXXKHSPGb2P/tYXRpsR2L0gjTGQ7l/FfaeS42ADCYlIT9iAu49KGch4PRx51aff8
 dEI7czDrvcHoqNQ==
X-Developer-Key: i=diogo.ivo@bootlin.com; a=openpgp;
 fpr=E66B7E68D62D74F357BC076506BE7C5B565EC945
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38737-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[realtek.com,gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oder_chiou@realtek.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:diogo.ivo@bootlin.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[diogo.ivo@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diogo.ivo@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0A216A8F6C

Add a prompt string to make the RT5677 driver user-selectable, allowing
it to be built independently for use with generic sound card bindings.

Signed-off-by: Diogo Ivo <diogo.ivo@bootlin.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 252f683be3c1..e9de333c5c8a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1888,7 +1888,7 @@ config SND_SOC_RT5670
 	depends on I2C
 
 config SND_SOC_RT5677
-	tristate
+	tristate "Realtek RT5677 Codec"
 	depends on I2C
 	select REGMAP_I2C
 	select REGMAP_IRQ

-- 
2.54.0


