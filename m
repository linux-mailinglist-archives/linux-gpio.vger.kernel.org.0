Return-Path: <linux-gpio+bounces-10840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C699031A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91CE2824E2
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 12:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BD91D2B32;
	Fri,  4 Oct 2024 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWcLM6y8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17501D415D;
	Fri,  4 Oct 2024 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728045437; cv=none; b=REVuoc+CGkGZWdB6VeNPfaQsyCXnxOxT3ZB8rDtlDjjgsq+0CsEmpAm9NtB2WcZMQ+V0cCpOgPbjaM7A9Em456Dtj+1efmT2YHV6IpfP8qxwMGewJ65aw9kX8ZSfNOCawXAC6U1SugXURYX0q6NY5DtL3p9xKYw3tVVe6DZQBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728045437; c=relaxed/simple;
	bh=4BBNMYwM3bArToQvua/9nkuOAZApAYuroIv+f0FVVEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNShEm1174MXXSSXlpo+JkEx2pWfJr8FOhQRuziy8U57tXzjIB4dGtXJkQYKjmopH5eODkSHb+NLHH2wuye5J0tm86iSgd3iAUgXHn6XK6u5VerkFI0oNVm0VYqKXVSIke8VFPDaAQIFzCqBaTNchPLjRCzJcXjFx0GVqXtQA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWcLM6y8; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fad6de2590so34960161fa.0;
        Fri, 04 Oct 2024 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728045434; x=1728650234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX8aRy2R9IVitUqBnE1mlHTx6SRUmp7WK/BrUoRev2A=;
        b=jWcLM6y8SfVLTWC1cTJV4zUaipNdva0ViOntXtsaeWxtP2cgjyTh+DZHVD9w6H3aS0
         uU9PggP4Qwbm6gNulty3FqzAk5EuJjQsFiETLvZujZTvm0T0gkb3w873dUfmQtcimDKA
         lzgF81CYzft9qYcg3AGri+R5VVHQxRV+eNSrhRRFXJpURXH8cl6Z4GJYNkfSSRXSqsEV
         aMRLAcPQ+SAV3S5VMLp4oUuLhW45seoCGH8d1D3Je36mSeQrVDcaYMnuc9IpgPzyJwax
         UWiNdb3kPudJ0WdqvIp9FWs+vi2V2AP8uz6S8POLwTl4mYmBucxOYZQ4zg+4woS3isUC
         VfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728045434; x=1728650234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX8aRy2R9IVitUqBnE1mlHTx6SRUmp7WK/BrUoRev2A=;
        b=EWZZafTuVf19cle9HHcD7I0XLt13nZcltTgNU0zO+daLwBIjNxuAfI53x2PGU/X2k7
         Ty28ZU2b8sVdZG/2x7kyH+ZeEEIZwAjfxGoCCGn7n+tOmYzqAhpI3gUyGfhONbIOMkRi
         w8g4YwQ4I4xfFHge/LkAHhPzDier56pbBMchfk7Cz2/fQ7NGnBMmPTS6veQyOYtePwrG
         TgGOJIYH/hP00W7DUfUwOHm9Xe1ZX/V1G0+R2CGBxwHbPGlg39UnnlOJ+WBLV77lQ+eM
         CWy9e3A6uxdIAUBnUSNkF8iJxfN+KNmQg2dokiIvRxyn09Du2Yo6WyRJTbFLv2oigpFU
         eOkA==
X-Forwarded-Encrypted: i=1; AJvYcCUWIcAloCODz4znrb904GThdcEkq5mIR0xCdK54rsUJ4KlM4Lna2sTQG9Pr8YTkBcLkkdJADMO5TwFz@vger.kernel.org, AJvYcCWPZMwQbepmEKA9vufX1DhMk/332CuScdpOyt4dom2LraSzM+o1v31LIIaImfB1Bk6KVCK3IuUOpMBslaCR5Li6+f8=@vger.kernel.org, AJvYcCXSbV2MBZBNqjNh1O9UuQSqV+SDrFRhQVWFvyRv8EtsWYQ5Qac4fTwmmyF/B5Y4clq6irkmy6dWa1mGg2va@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZGiY2jUHsrfATyyFlnjzyatMxfi6zCveDyLSCKT1rXOU2axL
	2SsR3tiaw66PuImh9WzwUr69Wa/Oa3GfdVPCj/2RwHKB2xccoR4HVNHjaA==
X-Google-Smtp-Source: AGHT+IG2Slm11cpazobv9t04cqXOWIHb/N6RY5QpiUUdRG0WgeXAMz/IHnlxRgGReCnk7rSnApZ1MQ==
X-Received: by 2002:a2e:878a:0:b0:2f7:5a41:b0b with SMTP id 38308e7fff4ca-2faf3c44dc5mr18810751fa.26.1728045433408;
        Fri, 04 Oct 2024 05:37:13 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910285ad0sm221601166b.34.2024.10.04.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 05:37:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Add support for enabling/disabling open-drain outputs
Date: Fri,  4 Oct 2024 13:36:57 +0100
Message-ID: <20241004123658.764557-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for enabling and disabling open-drain outputs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Implemented PIN_CONFIG_DRIVE_OPEN_DRAIN to disable open drain
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index b2d309f742af..8d576cc74003 100644
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
@@ -1337,6 +1339,18 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 	}
 
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		if (!(cfg & PIN_CFG_NOD))
+			return -EINVAL;
+
+		arg = rzg2l_read_pin_config(pctrl, NOD(off), bit, NOD_MASK);
+		if (!arg && param != PIN_CONFIG_DRIVE_PUSH_PULL)
+			return -EINVAL;
+		if (arg && param != PIN_CONFIG_DRIVE_OPEN_DRAIN)
+			return -EINVAL;
+		break;
+
 	case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
 		if (!(cfg & PIN_CFG_IOLH_RZV2H))
 			return -EINVAL;
@@ -1466,6 +1480,15 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, index);
 			break;
 
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			if (!(cfg & PIN_CFG_NOD))
+				return -EINVAL;
+
+			rzg2l_rmw_pin_config(pctrl, NOD(off), bit, NOD_MASK,
+					     param == PIN_CONFIG_DRIVE_OPEN_DRAIN ? 1 : 0);
+			break;
+
 		case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
 			if (!(cfg & PIN_CFG_IOLH_RZV2H))
 				return -EINVAL;
-- 
2.43.0


