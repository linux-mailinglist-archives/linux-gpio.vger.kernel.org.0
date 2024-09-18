Return-Path: <linux-gpio+bounces-10246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C07097BBFD
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 14:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 442771F24194
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 12:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080D418A6B7;
	Wed, 18 Sep 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv2GURIZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C337189BBE;
	Wed, 18 Sep 2024 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726661384; cv=none; b=R3JYASOPmAQTpFOZLmTU1Y4xXY86Tbc4W2OBB0jE9HWLcJi4BUYteH7KuUlMtU+w963yY/jZy3yqzlNyRzB8IjKcmpj1jttjFn8FlgYtLIQJswO/IlR5A95fN9rxyNtN7E1xJ13Zz5ydQMokb2XO/1CqB3LfLMBRO9LUhdfYgUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726661384; c=relaxed/simple;
	bh=X/949uAy9EOLkTozfGj1MVgsrKdv3X8SWrPgimitv/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hetcYP4v80cgpbQH135QL7mH15fxZCzvD/GtQvIPh/vjF0pUg8hBzaOH+u/ReKDZZ4WvyAGT85kOgCCbhpoORYZrHY/g725kwoxAOnJS06PJ4VCuBJ4d4vXRxrFlHh9PEh1YUBgsb4595jBlySoHBVNTnIRNDbOs5RugTsIqK84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mv2GURIZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d24f98215so780634666b.1;
        Wed, 18 Sep 2024 05:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726661381; x=1727266181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O2SGb8QY6E1LzTohtlGw4IsNUVeMjJmkMi81Potg88=;
        b=Mv2GURIZdF6tivTK8MOvhwXg2w5IOFvXSWN3GuULLkxTHi/PnMupx7Gqn2qORWyu5L
         a5hAk3oEVqolNMlv+/iJDWBrS/4A8avVjj3rq9AS7iDi08CBnj1mKu6KuPqI6lJnB9Zn
         f9EjwEyMyWCAZWNTPvMFVwVZouwkKXPz9jXzn4Y/QGKoBuDcWc7bGcO0/obcyCKhpXyx
         W8pW7v3KvInmVX9ER7RbFLWII5en7PmQSR0KPyxxkaLEnvmhf+dvIx3M+c+JZRt/JfMB
         MuHpvIUvlosxOP6rM4uav4l3qZCGRYGp/tzraGCCNzH0yd+Gk0qgH+vEnyMDYqzo+gQ6
         nJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726661381; x=1727266181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/O2SGb8QY6E1LzTohtlGw4IsNUVeMjJmkMi81Potg88=;
        b=f871OlY1NwfTEkXVpdsW35k45gk0S67cb9Nn9izScZhaPSxI8vc2sPw4Ht2pGolhpo
         k6R20LWvB97uJvah6tp8Xybt6/nFC4TSkIEsTXJmlNqHEfETn0uHytZ18bYo97ap8BJ/
         jrl0MSI1av1VMpJVqQ11ANT4+E3DGwzqkezodY9NWKelJgkaCa/vEiV8nKGs/0lgB3vp
         n/x2l0gscIeoS+XH9oH5MC54E3t+mcvWagNAxW5qz1KkhLC8w4m6mDMSEKN7tpvAHo52
         ZmK+A6V0YvibwytZfPREkMGe4Drpsx4dtmCk048IaBoQNntsfCd9yrRjzWVTAnWnOWp3
         1rlA==
X-Forwarded-Encrypted: i=1; AJvYcCUBgAKFJuoxg9kPX/a7rHhXaRNYljvVAiJxOf/YZNKkGZbeHEd+TEG8IERhiJVxOA44PrFc4cpnizyB@vger.kernel.org, AJvYcCUixA3GOoiJU2X3m5/pSJCF8RDUNPLVdbnbcByNRX85/Z1PWWUIgOnmfzPwV6RqWRCrIpAMvYIrotxqYA==@vger.kernel.org, AJvYcCViZcP9uUFXrJ8RP01e12KpU0wKdH0BG+4nMx2SMusKZRmbgJOya0VkvQEFSpmDvP3r48ptIfKaOibxHgdY@vger.kernel.org
X-Gm-Message-State: AOJu0YxVqTEoEFcSrYnq/4VpO6KufpR9VXfy/+44/4gJEdHDgcmn5GBq
	Jh2WViX+9pSHxopOTc0SngpnreyMU9vD8wC9pYCLrybFltIftclUcAMX3Q==
X-Google-Smtp-Source: AGHT+IEq6/2e51ev4Ch2Nwkl3CyGCR2R6OIHKXExqBzzYnk8Ct2yDN0l9hZ/x7veEZM2i55zQJPC3w==
X-Received: by 2002:a17:907:6e8f:b0:a8d:c3b:b16 with SMTP id a640c23a62f3a-a9047d1afaemr1613314066b.28.1726661381440;
        Wed, 18 Sep 2024 05:09:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b384fsm584440366b.142.2024.09.18.05.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 05:09:40 -0700 (PDT)
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
Subject: [PATCH 3/3] pinctrl: renesas: rzg2l: Add support for configuring schmitt-trigger
Date: Wed, 18 Sep 2024 13:09:09 +0100
Message-Id: <20240918120909.284930-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for configuring the multiplexed pins as schmitt-trigger
inputs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 42181cc877fe..60ef20ca3ccf 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -140,6 +140,7 @@
 #define PUPD(off)		(0x1C00 + (off) * 8)
 #define ISEL(off)		(0x2C00 + (off) * 8)
 #define NOD(off)		(0x3000 + (off) * 8)
+#define SMT(off)		(0x3400 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
@@ -162,6 +163,7 @@
 #define SR_MASK			0x01
 #define PUPD_MASK		0x03
 #define NOD_MASK		0x01
+#define SMT_MASK		0x01
 
 #define PM_INPUT		0x1
 #define PM_OUTPUT		0x2
@@ -1348,6 +1350,15 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		break;
 
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (!(cfg & PIN_CFG_SMT))
+			return -EINVAL;
+
+		arg = rzg2l_read_pin_config(pctrl, SMT(off), bit, SMT_MASK);
+		if (!arg)
+			return -EINVAL;
+		break;
+
 	case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
 		if (!(cfg & PIN_CFG_IOLH_RZV2H))
 			return -EINVAL;
@@ -1484,6 +1495,13 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			rzg2l_rmw_pin_config(pctrl, NOD(off), bit, NOD_MASK, 1);
 			break;
 
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (!(cfg & PIN_CFG_SMT))
+				return -EINVAL;
+
+			rzg2l_rmw_pin_config(pctrl, SMT(off), bit, SMT_MASK, arg);
+			break;
+
 		case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
 			if (!(cfg & PIN_CFG_IOLH_RZV2H))
 				return -EINVAL;
-- 
2.34.1


