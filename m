Return-Path: <linux-gpio+bounces-32606-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK4yAyvYqWl5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32606-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:23:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D022176F7
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0C55300E625
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 19:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707C830ACFB;
	Thu,  5 Mar 2026 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iz+LoX0V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C5E214A9B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738518; cv=none; b=pSgNMV4xXft1z2H90PUm/J10hwIfx7d7slatM/ZAfCenn3H8572YXDRl2BTmU027zs7qNMy5OHlPvKdOD/C/YGitiautAQfz7xD3syfi27EDmQJaIgpcAkYHKCVcSA26TYaLJj5YcjRZIiIH2CZsLS1do1prbZjhedD5BN/lb3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738518; c=relaxed/simple;
	bh=MvllY5ZtAepd2o9C5tkQ/ey/kovbVY5Gr4Z0ciR/tdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jbupejl+KwdNOiMui6MU6Qn8Nwkx/vZQH32nUsHr59yJMFqgxlpH/TffpJBHKIBZVJKgV9c6bMxgjl+KtmGaMiYz8i7MXwhMiktHhqtaDIGAibEF4crT1K0UHvDQBfjTdXvMWdArHO5ATq4O2m8fx9f0fTGL3akYlqCzgUAm4C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iz+LoX0V; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b4520f6b32so9693672eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 11:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738516; x=1773343316; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVQsp4yjVr1S8WVqzluv3UyIwYDdzrxzgvj6D1S97jo=;
        b=Iz+LoX0VYM6E5d95hNPiMLn7cDxlwTMZjIKUR/BVo+dxjR3SuZaEgwKlcebIF79qZn
         r89QAdGdv1pMlmWYEpzELpCs24Ed0WzwHXQSR4x5gArNE91UF/6h4DMhztVbgG7Tpub0
         haGMGJ4JkK9caW4Pp2+mE3vXGvTAw9lXPF/ParSj6LPjdPLRrZzWGza2SLFinzfmstwf
         AAu2BGTNVAFt29mzIC/g/0HtvBnY6ewqK7v8nuI92rkDTrhEroMnB1mN3fwP2E1RDM2k
         zh1xLDbJ0Uc1+VLsw77SFelLk8BZM/rPGDaXOnorMtB31nbD/Dzd5C0533WwBukzc84m
         yhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738516; x=1773343316;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVQsp4yjVr1S8WVqzluv3UyIwYDdzrxzgvj6D1S97jo=;
        b=NzkcQ1CSFIMzajUCVouJmv7ivrCh4ywJPXwmaCjhSIubr+HmgunUcoXO3MaykhilWu
         KjU9qrUOix/76ueI4tRPnN3u3oFTdZ5iUYSmAKznlIM0tfJLRZvw4UXETtA46xK7sBWP
         EWtqzUXqj6HWktNtp9O2luS2bK9LXWPajni4jls60E8pZ/pFGAt9RkmiZiXBu0kAcfkM
         7HxROx54NZieljgWITE676S/ZsSPiWEPhfdUnDVlUJ8pxEpnofSAl36cVgmCBc0A76iN
         +6Ksl6FB7d9qE4clr0Gzrp5x2UkaVsHpv71n9Lwc6akaJteCfVovVKg01WWKIk2kCKI/
         qnWw==
X-Forwarded-Encrypted: i=1; AJvYcCWvvRFTb5G2dS65VfkdKzNE2Bqb1wZbK2ke6EJYnnaT3N5D0mqDdf2FgvIVTzVWH5JKCvIQapKo6Buo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Dc7a+bVE23xW4YUs3yXpSV9ssHwyMhytZzHqRDz3d9A8Uzg1
	knzB9Qnuc7ShitEpEfhgGvX6PxQtYT9rV5ul8SfA0EMwjGXnY21rR32U
X-Gm-Gg: ATEYQzxVJlaEsqWqPxvKdtOIrKuaXCr4um7mgcJKdGJ/GYPDtvNnTriD2zdQhGvOQPz
	UOyZ2kbe/LkItiQ1YIh+2DCziKc0AIQ0JnHXOdKKQavlKeZzNYZy5BfBvOXvgW+BnGvuvu5/RFF
	qqAiyQNe2eToEZc0oBFPOatVkujFpaPCq9N4tkvWP4+L5M5Y4/5e3tInXsXBsJHBpiQH6IPNL3i
	yjmanyE2LNLrCLb7c0GqVanvswkNauW2k+wQhiF1WDf2eRFAzYrclrYdrCC4B/YMHP1DwBQA3F6
	/GXztUrNz0mV7krytrd5JsCPeI21rFEMvGbZeSXx1yvYyj+shTbgLW6BJUdYQKQWLrGZ0Qobyos
	SJvjNoaqvX9hMYTWU/qfJcQcCESfSdfcvOavB1F8QLtvFBHBty1dXoSIzRo58o5e2HAka8gWatM
	2qRxQy2hgvE0jyrr+J4EQjSvGbSvBPgOYdFU50IHe2E+KX33UZ/I0nkUZs97kB+ap3SVV8/RVK6
	LKM1OCf3osNDEY=
X-Received: by 2002:a05:7300:dc8a:b0:2bd:fe33:dd8c with SMTP id 5a478bee46e88-2be4ab38704mr388100eec.19.1772738515706;
        Thu, 05 Mar 2026 11:21:55 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7788:d145:a740:ca06])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1281ff70sm10800980eec.14.2026.03.05.11.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:21:55 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 0/6] ti-ads7950: fix gpio handling and facelift
Date: Thu, 05 Mar 2026 11:21:51 -0800
Message-Id: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/XqWkC/03MQQ6CMBCF4auYWTukFIvUlfcwLipMYSKlZtoQD
 eHuNq5c/i953waJhCnB5bCB0MqJ41KiOR6gn9wyEvJQGrTSrdJaYWZ0Qzpbo9C7nmb2uQzdwzR
 WudacoDxfQp7fP/V2L+0lBsyTkPuzals8q23VGNOprsYah8BZPlWOEp9TXK9jcDxXfQyw719ey
 7ciqgAAAA==
X-Change-ID: 20260220-ti-ads7950-facelift-ad8b5390a654
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-94184
X-Rspamd-Queue-Id: 71D022176F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32606-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The original reason for this series is to make sure ti_ads7950_get()
returns result in range [0, 1] or a negative error code to comply with
gpiolib requirement.

During review David noticed the fact that the function also clobbers
gpio state. Fixing that lead to adding cleanups using guard() and devm.

v3:

- Added "Fixes" tags
- Picked up reviewed-by tags for #1 and #2
- Dropped the conversion to "error" variables
- Avoid using scoped_guard (per David)
- directly return results of function calls at the end of function (David)
- Split spi_sync() error handling into a new patxch (Andy)
- Switch to using devm_regulator_get_enable_read_voltage() (David)

v2:

- style fixes in #1 (per David)
- fix to not clobber state (#2, new)
- #3 and #4 (new)

---
Dmitry Torokhov (6):
      iio: adc: ti-ads7950: normalize return value of gpio_get
      iio: adc: ti-ads7950: do not clobber gpio state in ti_ads7950_get()
      iio: adc: ti-ads7950: switch to using guard() notation
      iio: adc: ti-ads7950: simplify check for spi_setup() failures
      iio: adc: ti-ads7950: switch to using devm_regulator_get_enable_read_voltage()
      iio: adc: ti-ads7950: complete conversion to using managed resources

 drivers/iio/adc/ti-ads7950.c | 188 ++++++++++++++-----------------------------
 1 file changed, 59 insertions(+), 129 deletions(-)
---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260220-ti-ads7950-facelift-ad8b5390a654

Thanks.

-- 
Dmitry


