Return-Path: <linux-gpio+bounces-30928-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLOrAl5HcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30928-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:50:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407B6940E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BDC13023379
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B02480DE8;
	Thu, 22 Jan 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6eXGSeC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00C745BD63
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096647; cv=none; b=UAw1RgCWFB0DpfbWSO2rMQqF3/xbSTrv0Wh9EDNw48bPblT0wiBZaj0clMQTv2UowFYF2Ub6IL5yWPsy+3ruygyJPYcouS6cKrk+0fDC2TiutPda4Nx9n05FvTrqzoJ6Dn+nCtBHqYXejMAwQVZ3I7RQMfIrK63QjL9cZchtrwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096647; c=relaxed/simple;
	bh=fvS/dFCro9ZHFc5w+Z6ZcYVzHaBeI4A1V0hAZLvZGMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsjXjV5EGAy+euyiFNlTKN0AIZ+M2fSjydRRdO0XRgkqd/YrzFslRUm3rXLjOZ2K6OhZmf4ptBhSxNDjp2su/drOQdsBNMnAMll6O2Wxq4QZ8GWkqQMbjO2/rlZvdg9sG4xaGF54WK67aQ69MS4Idj/hrrBHZTTjG+Jq5qo6KoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6eXGSeC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b879d5c1526so212129666b.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096629; x=1769701429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHOuCyW6EXubWNPSSTKgH38OWUudqlrjbcjJqHW6R9g=;
        b=q6eXGSeC6xQtTszI24s4UCfblfJr1UGkDEM5OfhYx2iKEskE6fHH5JaSKdz1Q+je47
         1UuyErgGIpPxrpvXA1SaklTDNGGtlpUBR2+kVyOxA7KHEcZznyELDQ7apQP04cSqM14n
         IJORFrwl+bqg0OPkX8IpCDBPCYK17DmZjxCyPIrORiL5IsMv/chmydL9xWmxCLQ4Tetm
         //DIVXiJNVz6BoxiHM4yYUovkTUddK1jB9EhfwJNtAfAjYC+4060egsScebCh6y3qmwO
         F6YiNOIoYCVngPxLz/zCqPbNSokUC7DCa2nKJ4Ke3eYM7mFePbrMK1L1cTpPZz9KP3Yu
         YYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096629; x=1769701429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHOuCyW6EXubWNPSSTKgH38OWUudqlrjbcjJqHW6R9g=;
        b=nFd3QGJLGxPM8pIFy+tJx69MAUagRD6KuaoqnriHWRq1eazimhKKQRHDI46NRpJ9Ir
         PUfS/DvO0gT/jdY02ShCrFuFFEQ1Q6uk1/UsrPfTP/QZ8/dWZtmqITLTwDlgjTNnkuQC
         3TX+GpGtaAM+I122mHCcbHhReAVaz5+9eR4lOL3hXeowLxfJk6QpHtdUcz0oHFaZ/sR9
         ZDRK2BKiwzC6VZJXAmB1SobyBm0d0cfR23qD8fbqg8MEYD+F0jc29ZUkZQBC7rGLX8Sv
         jgqP+mjNR7iRoUHwlQ2Ofe+XD6VO0NgBS+Axpkg1ckus76mVHKf5KXgMSGiDeuUEyniu
         im4A==
X-Forwarded-Encrypted: i=1; AJvYcCXiOV4GwlRhBNmyudZZGcASUCOCXaIrdsHKF7c6FhJ9n6BjaZma7eu1EAcn8AZv6qJXGpZ3AchKdKGu@vger.kernel.org
X-Gm-Message-State: AOJu0YznHDaYK2AXEKvhdDGeylo5z5dbf/bNP/qPWjS9cB/qRr8mPQeM
	osr2tr3DWGg94iVic7bkmaLdMF9rWb33lFLPMerDGKJSTamIlKqIhN2WuhMqHqmON60=
X-Gm-Gg: AZuq6aLave/Sr6z5ZmEo+8pQZIDDUhodymcKShoPqK13wzubjJWhWmVVWBSA1c5Z3lD
	L9smrgziVC1hOSdoGuzv/SCVaI1NccM9iYxlUfYor0I3/8Nq58yaYDJt/iXpH2g/jl4ZLiuOvde
	AMbeiXQASB48WOS627DcCtbI0Bbu7L9oKzgkrT4t8VP0YfQEif4Ga5AM+LM4BxiJk2KTwxWKU+5
	rweGnWLQ1iktFEksT4zeSxUFwqk1WEkIPoImCcyktKoZMYfDut/2+5HPmiByJdk7fO4BRkWCnaf
	znfwV7Jk1DoczActcgIkDv7phJTVz8cxmiBCGL5LUegY0LC5vIx3dw6DsUa9BRaao0K3A6SQL3u
	/n9mTXy0wg0wf/YEBBB77SxsALBWuF9FGe/S8Fifp43IhEXGlDQ6Yns0tu2aaOqwlJxvo1bld6e
	Uoea3QvDUfYR06zXYK9PU/dOCSgpJ1LeQOSfebvoVseNPvFE+7+iegVsGYB5B+38LmUzUV3lTmr
	OT24w==
X-Received: by 2002:a17:907:7ba8:b0:b87:6ce:1267 with SMTP id a640c23a62f3a-b8796bf624amr1670208066b.64.1769096628967;
        Thu, 22 Jan 2026 07:43:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:47 +0000
Subject: [PATCH v7 20/20] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-20-3b1f9831fffd@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30928-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8407B6940E
X-Rspamd-Action: no action

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 4a9d70947f17cb7520e0e820d3d1b9eb370ff600..2d5510acd0780ab6f9296c48ddcde5efe15ff488 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -362,7 +362,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.52.0.457.g6b5491de43-goog


