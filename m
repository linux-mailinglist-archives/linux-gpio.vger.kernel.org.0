Return-Path: <linux-gpio+bounces-37099-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIZ/Hne0C2q2LAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37099-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:53:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370F575CAC
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A5F2301F355
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F109F2F5A13;
	Tue, 19 May 2026 00:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QoX5yKYw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F022D47FF
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151957; cv=none; b=k7j9y+xfpP7JUeCOiB0U1eOn9qbb6V/9HSwCFAkY/H6qthUBiVyLAwDC1L45YHyMIVHDlJLvb7IlR4S6HM/hB0mKqTjcuDfURWswrP8j92YgiCq0TTyj8mfPUWB3PuzhmE3ps+EIi4ncSBD/DGirR4HLgjYLdIeIjDZdmQ3Un4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151957; c=relaxed/simple;
	bh=iQxdf1yuFfxkq4dVmlhtA1OD3Mg8u9x0iWEOejR0KI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4vX0UuFTpEcXwPZWqhHWixgLxZNaeToLTbL1F+JfFi0St+2NOmgk2el8+m6WjwHx5rzEPLjO7iM0OrU7fiTGLWeWpuNsZD1bllfJeblEkUHJXn0nA9JqDYf3XTh4NpQDBXILiUn63ynvo8wyHKn4puKjCAkxidcv6VN2lE4sCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QoX5yKYw; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-130c9dcbd25so2527870c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 17:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151954; x=1779756754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2P8AA+VKiT9we9opdJjInDAt+Givsn990e3P/EhFhw=;
        b=QoX5yKYw9dzTwxSdddXoeYY5y/bVNsZ0pGp6Lo0U6U0HNxtv+Qdz5AIftI6ji4eR1r
         3M7kt4AcLBD/Q7RlXTR1Wvn4lBXM/U918fFrifzLlPjFusPZLHdo5uUDkUcbZdT2Ub2U
         0LkuIlk/x2/RTsNPNYeTNuO/GxHMnY4lZHxE6DF0Y+LrkfVi/Gd+Q/pRVLzkL2Af4/6y
         aXkxL2h048IsfN65fCv7/k9q6VZB5CC4y8dg2UDnHjoqGGF7oHom+12jPkIVHbEVtSjr
         e7GWYORoFUflbUjAG0Iboi71j/cQWC7mK63roxpqYv/NxVKatksru6I1lkLlGIOj1ZOM
         h0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151954; x=1779756754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y2P8AA+VKiT9we9opdJjInDAt+Givsn990e3P/EhFhw=;
        b=DoANllDhLIy4DMhkp5xjJOFMzZyqnGxnQS4uI2D6eC3rRyV42V4XxvaGUDdzaOaqKs
         RbDOR9lPBHefhBvlAQEvhosUyGkTrRt/Bed7kxa/VoaZEjFlv01ZULsLHhCfMPiB4PQe
         gDt5Fwrv/abqY9iAY3p5RAjqGaATp127vhnC9JHdsnsukQ+vCEMZhixiK61uxOdF+Ayz
         JaC6Q1wNIDckPlP9XamsosT40uAt3cL8VQw37aKDKo2dEH4nh4vAoDm2KNGCOtN0eJrO
         NpKTwJxu6fYJFvNa3RKRiMb8sFpWdr8fQ8vzcONnqd4M/KGuTOypiArRw/YTOEhrl8mT
         39tA==
X-Forwarded-Encrypted: i=1; AFNElJ/3IU/ZrVJ+FLJ11kg9dHmIuRR2JYdJtrJM6gdiI7tJ9umHJe9UyVwrpWltmK29zYspCvWMatkaNZqz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7RjgWbhH3akVLxwcXLVOqhzcXwsSub8gXIOsu0xEzPz3vL+cQ
	PdX+WmllSt1DUZmuQxx8RrrgXEe6JThIbmQ4DXtKsX09EfJye5yPYgX2LK8zx2K7Ttd2ENxhMXU
	9VepUbAo=
X-Gm-Gg: Acq92OFV1rEdpwaXoMtylFP49UF6JWgdun5vK3rmbdHaXJ1Ks47OlWp/HyYhax5L0ij
	3zoonneB0sKCJlsUwn+Z4Jti1oScZ3rrmowAQG14u49vYjWTrv2aU6k9SD3hK4eIDDi/27jeE2j
	rb8NgHBkCAorXn9FdJLGF23x4LKSvO3BNhRoZLg4MjnMwmsBLaHXGawHxneIOUc7oi3tnXo6kIU
	6xcHQMHzAAjc5780oCknn73B7xuQ7yXVq1Gfb6DgwiwwQ8tjHZZZO01sF76PpDw01x9QuWj+Qy9
	DTFBvgvkRUTFTE0BnHOm1V7jsqp8MG3lcQEdiRtQGVL3R8j8RwNXypEHqoNVImZctMmtctKiCL1
	ZGG3WSgAqy5KJTJM3D53GyVRgkKJlkpmsbz/oR1gKpCM7HrryOyoHp/37bE8+PRBLAjvscwi8OX
	twfhd4cbS8aNYg4ZbhuKNGlrAl6w==
X-Received: by 2002:a05:7022:45a2:b0:12d:c3d8:1f95 with SMTP id a92af1059eb24-134c880b6bemr8010416c88.4.1779151954194;
        Mon, 18 May 2026 17:52:34 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:33 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:29 -0700
Subject: [PATCH v3 5/8] hwmon: (pmbus/adm1266) register the nvmem device
 after pmbus_do_probe()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-5-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=1611;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=iQxdf1yuFfxkq4dVmlhtA1OD3Mg8u9x0iWEOejR0KI0=;
 b=TcrBIRWgrteBYTVwtpzSU+2Wm3eg5LmBx6FfTh0fYto/+XZGoCtTnc6S6Pu63qnTE8+oW3o5t
 lXy2qBOOeXWAvofdMd9M+EiP8hmV2QzMP4JS+jPrPk+hvk+oDWwCO9U
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	TAGGED_FROM(0.00)[bounces-37099-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nexthop.ai:email,nexthop.ai:mid,nexthop.ai:dkim]
X-Rspamd-Queue-Id: 2370F575CAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

adm1266_probe() calls adm1266_config_nvmem() -- which goes on to
devm_nvmem_register() and exposes adm1266_nvmem_read() to userspace --
before pmbus_do_probe() has initialised the per-client PMBus state.

Same latent hazard as the gpio_chip one fixed in the previous patch:
once the nvmem device is registered, gpiolib's nvmem char-dev / sysfs
interface is reachable, and any concurrent read triggers
adm1266_nvmem_read() -> adm1266_nvmem_read_blackbox(), which issues
PMBus traffic that races pmbus_do_probe()'s own device accesses with
no serialisation.

Move adm1266_config_nvmem() down past pmbus_do_probe() so the nvmem
device isn't reachable from userspace until the PMBus state the
nvmem accessors depend on is fully initialised.

Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index b91dcf067fa6..8b9fbb99a4bd 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -471,14 +471,14 @@ static int adm1266_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = adm1266_config_nvmem(data);
-	if (ret < 0)
-		return ret;
-
 	ret = pmbus_do_probe(client, &data->info);
 	if (ret)
 		return ret;
 
+	ret = adm1266_config_nvmem(data);
+	if (ret < 0)
+		return ret;
+
 	ret = adm1266_config_gpio(data);
 	if (ret < 0)
 		return ret;

-- 
2.53.0


