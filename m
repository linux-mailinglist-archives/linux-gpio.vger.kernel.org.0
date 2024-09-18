Return-Path: <linux-gpio+bounces-10245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8EF97BBF9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 14:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB510B2597B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 12:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3A618A6A5;
	Wed, 18 Sep 2024 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDDQWk7M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FB7189B86;
	Wed, 18 Sep 2024 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726661384; cv=none; b=PYLBpaV9I9ZkOtX0u+i/5iMr7RMKv0m0k6ainlXsLSWoTW16t/0O4KYs5Lgg8GPcx4wl7JKz1bN106roQQcYd+au2mkFcJ+Ya7oWdQEhVjBKc5Iv/vjKOAcWsRvKa3xSzmusJ4xlqVTcK8w7wV0BzfabWDjUSFg3+Gc69AJB0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726661384; c=relaxed/simple;
	bh=Snglm+mxxJAyFGYRrbGHWfWAizMKR2s64FLMC36FCCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XCn3c9XQtjFvZ7vz3vreW2N6vA0NHhvzWkFgliPomNRceFmFEa7ZYbpF4SHs/qLAgzmVJfyYhCxkFtmOvCJqQlsK8rN6PqqCvaMCimZSMC/F4fL6irVb6kNXOUAI6PbuVvxrfR2VYc1UPuAWe8QT2KWXtFmBWF8lsOyHFHqW9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDDQWk7M; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365aa568ceso6574755e87.0;
        Wed, 18 Sep 2024 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726661380; x=1727266180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry3Wg0ef/AaXidW74fUxwnjAXIzqFDEdHfVZRNVAVes=;
        b=TDDQWk7Mozl4bEWA+v7hA0kONTDnkvfH+rHuPQq2CUIPi3QyLj0UFKq184da20BCW1
         MV0+tMSnEt4h67/6zUzGeHFrbWkoAYIl7ijVpiSsSimbo7dBBugoRfb+RGoQOVMXaSjI
         zRv2caC1uQopO3FJJBi0MvvFoE7l8au69LGYF14+pTi1jzndIwt4YjRSLDf54VJU0gUq
         C1lSdDbLIFpfqdXMTQ4UBjVIfClX8+TjbiY2s3nBIm5WF9DTpxD4zyzywz2ZtzG6y4ro
         3i0AK2CiKHeAsnETCKK6EhgyYYJVQhmPMAXFpUUP4ghZVT217kgVtmJPuN8Yf7QkMvg5
         OPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726661380; x=1727266180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ry3Wg0ef/AaXidW74fUxwnjAXIzqFDEdHfVZRNVAVes=;
        b=ousG/zb0Zl/Y1Qm2aPkojs+JCxXg77S5Q2gRY/ca5OCdOyW+RsKsFW/Wj17QAJUaIT
         X7fKQc8XjrzJ9i9MAULuFNm+fXCL1WEA9urpqqPpSaUTrOpkE1Tspnko6PqzckUiwmF/
         OyePW5FMHcAFjDvVo+pWdKNZsVMF5qGT7Fi2MSBgpcU7szEPK6fsuq2rfjfvkvjdmyoi
         OuQfFW0R3kaf1GYjaTbk7p2RejMASNzca9Uy0TSWSJYTodVzroM3VfHIkJqxm8yLfRZF
         p2OHApAlb4kUmRjyYVqdw8Ns0NgF9xljt1ZbE6LsW8rNGUiTU2A5nWmRCpINCmW+uXyu
         MWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBUs1TRLBAm/axX4isauSgjBzjryiJdmuW9jgSzcmmc6wztuFd9KRurlVaGr0fXF19EJX+OhSBEaB1GQ==@vger.kernel.org, AJvYcCVDld/lapQfv2Ark2Vwt5dbg0Qlw1qhU9nnCPIL40iylKRaoOqk9+4pIp5DvnchTLBxoZE5PXOYPlyG3omc@vger.kernel.org, AJvYcCX3WMzvVRRbmzZI7xcFRJyLCzXkzl07NwKrUDcD3+JqUe79+4yppxxxG+SaVMTWXvJ8Wau2vwdEo/x5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9LXp0Iyaf8HCAMrVGJ813J7fj55ezRFtIYKcsPsImMQy0UHPi
	zccOHqLzLS2GGlyPuns2zsNk7Nqej5Nvs5zHgWaTR1I/1yI8gf1l
X-Google-Smtp-Source: AGHT+IHgTj3pfkzoQ3zjRblSV5Xdg2iueL9VJdNmRjr0pQQOWyeqUy6rQH1sEwRpD2PZVoZQmo8jFw==
X-Received: by 2002:a05:6512:39c4:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-5367feb95a4mr13460836e87.2.1726661379983;
        Wed, 18 Sep 2024 05:09:39 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b384fsm584440366b.142.2024.09.18.05.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 05:09:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] pinctrl: renesas: rzg2l: Add support for configuring open-drain outputs
Date: Wed, 18 Sep 2024 13:09:08 +0100
Message-Id: <20240918120909.284930-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for configuring the multiplexed pins as open-drain outputs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5a403915fed2..42181cc877fe 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -139,6 +139,7 @@
 #define IEN(off)		(0x1800 + (off) * 8)
 #define PUPD(off)		(0x1C00 + (off) * 8)
 #define ISEL(off)		(0x2C00 + (off) * 8)
+#define NOD(off)		(0x3000 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
@@ -160,6 +161,7 @@
 #define IOLH_MASK		0x03
 #define SR_MASK			0x01
 #define PUPD_MASK		0x03
+#define NOD_MASK		0x01
 
 #define PM_INPUT		0x1
 #define PM_OUTPUT		0x2
@@ -1337,6 +1339,15 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 	}
 
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		if (!(cfg & PIN_CFG_NOD))
+			return -EINVAL;
+
+		arg = rzg2l_read_pin_config(pctrl, NOD(off), bit, NOD_MASK);
+		if (!arg)
+			return -EINVAL;
+		break;
+
 	case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
 		if (!(cfg & PIN_CFG_IOLH_RZV2H))
 			return -EINVAL;
@@ -1466,6 +1477,13 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, index);
 			break;
 
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			if (!(cfg & PIN_CFG_NOD))
+				return -EINVAL;
+
+			rzg2l_rmw_pin_config(pctrl, NOD(off), bit, NOD_MASK, 1);
+			break;
+
 		case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
 			if (!(cfg & PIN_CFG_IOLH_RZV2H))
 				return -EINVAL;
-- 
2.34.1


