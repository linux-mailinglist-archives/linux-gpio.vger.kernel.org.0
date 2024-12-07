Return-Path: <linux-gpio+bounces-13609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E69299E8285
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 23:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4295D281A37
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 22:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7734314F10F;
	Sat,  7 Dec 2024 22:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRTuXABq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F276034;
	Sat,  7 Dec 2024 22:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733610935; cv=none; b=g2r58lBssBtr7Qp59fl0ArqTJ7n6+ftcUiAxQES4ca66YXIjioew8pDQN6XdLSmEqTjjzr6nOKyaArfHEr+BZ6xSgXSxlJKeMbRAzXHAcFRFXcML2yd/a6jOnMFB2wkNYi9k/Domlx4mf6KQef56GpgzIM08Y7xi+iaPStZngL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733610935; c=relaxed/simple;
	bh=Q4+sPBwCuYwmAg52VaxNjFeohxnBuPXqhgc6nPK6WmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ASDK3NAh9Yo316dtrYnPDoBiINNFTkzTmz+Mi5jNwl5HmP+kqtwf14hgyEF1jC+2LRUE2LuEreTFSGbCrX7JraUN2Et9wRbd87+pBUr7Pn0fBNwT0ypYN5H9YRuichr2Jdhrh+E7V4ncJcUSylxkOlroqZaxFRicW/ttf7SjRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRTuXABq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7258cf297d4so3093077b3a.2;
        Sat, 07 Dec 2024 14:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733610933; x=1734215733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=biQLT6WhaUCBgk+PMUIw1nFil6NbTXIyMFqXt2GCxnU=;
        b=SRTuXABqzsZLKffPw1z4xD8MhPL0rNGT5c3ayrMMsUx+YqfiMErm/OV1fwOh7r2PFO
         f784byQkYKrOSNcjRAbsaalvAZV1eWSTKn4ntg9be1CeZKuf5rxtbdRKQ3QzPDtgy9Br
         pbN6Qpjs3dDEM7sZKGRqW5KIHso3gOnDmFtLcKCjX3hXfAoVxFWRXGsLzho5NQ3psH8I
         DnORR58mHnDkP+mzRYeK/BIMQ/0ApQFqcK/cNTXOhf0KK+ToPYcdWxoofRLsVFga9F/1
         scKZoATQlt+/4sq+j7o6qlVINDJhDVS4EXZWF/rJNmUcFGVN2jOPSJ8TSILgnJSyLLno
         o7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733610933; x=1734215733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biQLT6WhaUCBgk+PMUIw1nFil6NbTXIyMFqXt2GCxnU=;
        b=u1jQ/V2hul3c+ag5W4XSn35ipHPtmkvu9I2I8C/PBaxVWkxtcTLp8SmMWW+uYtejw6
         HBWnlfyqowlG0qhQ21rPIOZrXRf7inWE0OQgu+C2MPQHey3UYmEkDs1E/PDmBdB9J566
         Vv0slVtvCoiKFRg4Yr5tFVihWS7cp3H+7nd7S3jopz5ADQR6cqU19OZt4UwTCIQQtLWU
         +SdDTmYVmzWPuXNy+PQQyVjqlx/sdnfxAcz0OJu1HdYSIMd6SXUuBcLXR3tmRMq1e2CN
         DlETTOws0FitSrVu7nlS4IrXusVH9xi3gqAFm5RBqBkpzU7Jv6rnnDMf94SmPuQpO7Fi
         9h5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpx/wD8E+KCBNK2tgLImXWj93TxKLwDA+GcGST2gDO1n5YBukx1yVdjZ2HC/4cWEy4Q57NcmYGZuxjx18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzCjanogp6bnSKxa3fbsYDZc40MKUbwhBPUeCaP5O/0d4ZhMw
	MOEoDQJ3cQ58JVlBeQF7Ah3+gFB7uTXibkO+7ZQVBv7JeHwZwJD+
X-Gm-Gg: ASbGncuZgHfCU9v6Drppgu3yj4CZOyhZnVBl1Kt8LyxML7MXuxqRCYhrrBCMn/kYtbB
	68pPgLoJndTelzkO1qjll4Gqe88ESm63IDrMi+54UKoNaW1ByFsQGnRqNt7s1dzUiiTaXLsqjtE
	YiTR3ZOgiuThlrGIenFmIFk7P8y6Ej0Z6+UdxqkmEzjWRojZ9L2ADLtYL1WNIuZW80y9tYHYc6k
	sqGqe/taifJo40Xto4Tzdvf2UqmcU/USP6tJ7prcbS50+XSCBz8hWRM8dSsemFTfaQT
X-Google-Smtp-Source: AGHT+IEXJ62pmjBZAoJ6iNL+bEvsYji/Ab7Oufs6x+6Z9sMdfJKZUKN5WvFeHOY0eihIE3sBKudw9A==
X-Received: by 2002:a17:903:2a8b:b0:215:54a1:8584 with SMTP id d9443c01a7336-21614d39804mr99243065ad.17.1733610932961;
        Sat, 07 Dec 2024 14:35:32 -0800 (PST)
Received: from localhost.localdomain ([207.34.149.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216316d8086sm12803845ad.223.2024.12.07.14.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 14:35:32 -0800 (PST)
From: Kyle Hendry <kylehendrydev@gmail.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kyle Hendry <kylehendrydev@gmail.com>
Subject: [PATCH] pinctrl: bcm63268: Add gpio function
Date: Sat,  7 Dec 2024 14:33:35 -0800
Message-ID: <20241207223335.17535-1-kylehendrydev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no guarantee that the bootloader will leave the pin configuration
in a known default state, so pinctrl needs to be explicitly set in some
cases. This patch adds a gpio function for drivers that need it, i.e.
gpio-leds.

Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm63268.c | 68 ++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63268.c b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
index 80c2fc55ffa2..5ad86b40f0b3 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63268.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
@@ -38,6 +38,7 @@ enum bcm63268_pinctrl_reg {
 	BCM63268_MODE,
 	BCM63268_CTRL,
 	BCM63268_BASEMODE,
+	BCM63268_NOREG,
 };
 
 struct bcm63268_function {
@@ -242,6 +243,61 @@ static struct pingroup bcm63268_groups[] = {
 	BCM_PIN_GROUP(vdsl_phy3_grp),
 };
 
+static const char * const gpio_groups[] = {
+	"gpio0",
+	"gpio1",
+	"gpio2",
+	"gpio3",
+	"gpio4",
+	"gpio5",
+	"gpio6",
+	"gpio7",
+	"gpio8",
+	"gpio9",
+	"gpio10",
+	"gpio11",
+	"gpio12",
+	"gpio13",
+	"gpio14",
+	"gpio15",
+	"gpio16",
+	"gpio17",
+	"gpio18",
+	"gpio19",
+	"gpio20",
+	"gpio21",
+	"gpio22",
+	"gpio23",
+	"gpio24",
+	"gpio25",
+	"gpio26",
+	"gpio27",
+	"gpio28",
+	"gpio29",
+	"gpio30",
+	"gpio31",
+	"gpio32",
+	"gpio33",
+	"gpio34",
+	"gpio35",
+	"gpio36",
+	"gpio37",
+	"gpio38",
+	"gpio39",
+	"gpio40",
+	"gpio41",
+	"gpio42",
+	"gpio43",
+	"gpio44",
+	"gpio45",
+	"gpio46",
+	"gpio47",
+	"gpio48",
+	"gpio49",
+	"gpio50",
+	"gpio51",
+};
+
 static const char * const led_groups[] = {
 	"gpio0",
 	"gpio1",
@@ -427,7 +483,16 @@ static const char * const vdsl_phy_override_3_groups[] = {
 		.mask = val,				\
 	}
 
+#define BCM63268_NOMODE_FUN(n)			\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM63268_NOREG,			\
+	}
+
 static const struct bcm63268_function bcm63268_funcs[] = {
+	BCM63268_NOMODE_FUN(gpio),
 	BCM63268_LED_FUN(led),
 	BCM63268_MODE_FUN(serial_led_clk),
 	BCM63268_MODE_FUN(serial_led_data),
@@ -562,6 +627,9 @@ static int bcm63268_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 		mask = f->mask;
 		val = f->mask;
 		break;
+	case BCM63268_NOREG:
+		/*Do nothing, leave registers as default*/
+		break;
 	default:
 		WARN_ON(1);
 		return -EINVAL;
-- 
2.43.0


