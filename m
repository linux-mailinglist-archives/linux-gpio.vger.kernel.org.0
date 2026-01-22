Return-Path: <linux-gpio+bounces-30917-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNBSLTBMcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30917-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:11:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EFF69ADB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 366E23005671
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8BD44D68F;
	Thu, 22 Jan 2026 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UbQTwfBd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB92244CF47
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096634; cv=none; b=Yy2cPmtDFJ5hN/+csE3IXNr/W+rptoJr0aDuYJdLW0lqi8AossP9etkumdEwUib8hxnp9vavRZgTfxJ2dwlz2PFpxeICIlNd6lQP1HjgDuaMHsEtG4hALaYuGZKziZoQeR2Ioqwg8Ev684jww0obDl0zr9OWzwg3f90CoQwPT0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096634; c=relaxed/simple;
	bh=wZmkgKDnx+gLs+hVAjzPq8Ts28TSMZhJDdmeEe4ghKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMAZI6WYakYTpweoVZJIQdeDMF79+nS4m2yHbqlEgotIhFCCZXCF1PDFwNf1bMN2lOBO82jtEq1rDRUIC5dYDNgk9J2Ioypj+MIVB0Og4JLsITRID6beUDW3OcUKTHmBVHOH8hkMXnPZ/Mnsfwo6Iem6SonbkqXrMTd9ZNpehT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UbQTwfBd; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-655af782859so2172193a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096624; x=1769701424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFHwW2bdepIoOkuLol6lBUlgXwxd7Z9UOUy1vWjRyW8=;
        b=UbQTwfBdZb9doROzA8I17uUkU+CXostUYYsbS9z50MVXeJYl8CsD43wk04GlqAyoSh
         9MpxhLSxXaEiRkRLKh2zV2nuQOOBFYUhmBg02hhRcLJD4XW9gO0pRLeUC3S/dk1stWtA
         WG0oIOuR+yNPGRTKn0bEGKpzzlEfEeHHuqpnzH3Lpg0MRx+ySE542AFXSr22Th5wDzoo
         upTzLC2rpTaZamVS694rIFqJiW0OwqbOjaKjnh/IT4nQqvRwz0LEvcmiaXbGafphHmI0
         d7D18Jxhlju6VgrD3PXx4agWXHoZjNPiO+L6vsVn0iVBuBxeHZbBNO2olNhE38qg0lt0
         l9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096624; x=1769701424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFHwW2bdepIoOkuLol6lBUlgXwxd7Z9UOUy1vWjRyW8=;
        b=SOWXeNYLNlG9IuE7Kkw2FxaWOG4sZSLD28fEBhinQhBF0+vDylpg8WcGAq1ARn9rWP
         DFrJ7gXBwK4/DIeHMlPZKj1ih8FZRVOhBI1Bjk4a5EogB0nBFhD9GSSx5czXfEY4MNV7
         YK1At/1cOOwsdmUKHeROKQDzeBCaeR13YP5DICFlvR/QzdMUONI86qQLIwoeAAZeHL93
         RBAiLCglgdgpOtyDAh4iZy0m3Ku/ASo+qHrtljMnF3rvCuWoOn+iZcMVSUc4FEDPl7TB
         jK87SxI5DbyLJtKeX8Ef+PQEc7DaIi7iqZRSEBh0qaKp+qqYIgEQWycZNZ2uA8aqBqqe
         96dg==
X-Forwarded-Encrypted: i=1; AJvYcCVmkwcmvVn3tdhWm2DyD//YzdsW9K4JLZvX55njUAYurMtdnbwL0m32qtJ0R1/ZFW4/PHo8jlRSRM51@vger.kernel.org
X-Gm-Message-State: AOJu0YwrG4G+HOkUoc8gfavrg0HQAAkkJgf09StC0C9sgPgQz/VZm9J9
	fIy/88gms2X16A3xcp4To/Kk99ZMTEzeq3Y54MwTzYk9B+V+Arag9+yCkux4T7js2jc=
X-Gm-Gg: AZuq6aKlC4vL+W06SgUnjxKeA3mqobx86A+VvpS8/FSAJVAPQn6H/YNRdchk1hKSEs8
	r1YnsnytqPcgGIBPihGaNJLFWakW/JlPERF3TTatNXdwPhBtXDfkqJjnc5WcbURIO2AgLOoLyuX
	cpEZIBtipS6KQFyxei1HbbJmMMrCPKhv4gLNHXoW4/sdDBNd3jgJtWagjy11pQ6C6WIAQEenTAZ
	kn6wPPqK34rj0wyBBxAmmGk1MEb4V2l3YaP1kOIPcVTsMD0NvKObW51myYa7s72PFAyu9j8iwg6
	BS9GDBM4ch0aGVSEAjer1K7xjT7GgZBuJowgr7cumfyC58M0WjsHmwZ/PImwDS1EKxo810s0CU3
	R8I7Ty4xAle5VK3yEfqlQTWP4PFJZ5/aZck5uivuovdjBs6U7hqSA8i2uVoANM9kUuD0S8wQirO
	Bawppz9OaKt3vtVgIXDgVefXjZDLRUpwYXBhwtQsmjriYDH1ffV2vfa3vCkiLmR7MO5dEpGfSgF
	Vz4Zw==
X-Received: by 2002:a05:6402:1d50:b0:64b:3225:b771 with SMTP id 4fb4d7f45d1cf-6584874e664mr45457a12.6.1769096624145;
        Thu, 22 Jan 2026 07:43:44 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:38 +0000
Subject: [PATCH v7 11/20] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-11-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30917-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 18EFF69ADB
X-Rspamd-Action: no action

The initialisations being removed are needless, as both variables are
being assigned values unconditionally further down. Additionally, doing
this eager init here might lead to preventing the compiler from issuing
a warning if a future code change actually forgets to assign a useful
value in some code path.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 04ae9c6150bd5ae9dba47b9b3cfcfb62e4698b6d..1f51fbc6c7b6e158f9707c04d9f030b9eee5e842 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1207,8 +1207,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
-	unsigned int rdev_num = 0;
-	int i, ret = 0;
+	unsigned int rdev_num;
+	int i, ret;
 	const struct regulator_desc *regulators;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),

-- 
2.52.0.457.g6b5491de43-goog


