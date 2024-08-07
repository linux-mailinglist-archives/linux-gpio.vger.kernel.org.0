Return-Path: <linux-gpio+bounces-8662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2794AECB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 19:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73DA01C2180E
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 17:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8077713C8F0;
	Wed,  7 Aug 2024 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsFb2jGM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F097829C
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723051410; cv=none; b=Ik2kGxJhQahAnFZ1OT1D5s6Q1iDIhpfzWxCT+UjYvigxHO1UCMrv6BG3PQ0q4fIvJUMCdhAlSCVydPSa/3vEQeRorFp26YJaFUHDvHe+w4fgkEUKuUDxBuiCtE7gL4y4CSPzqZIaIQ7+i0ifqEKTxq7jrtxJzhouI3q9/byqe9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723051410; c=relaxed/simple;
	bh=EYzGczITxzqmYLT01PwrDI8MGFsGwk/I8y0m/O49lRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CeA0XtSGxDGFjL2ICsuk9A1LXWWAqmh2bZy5IC6nmb346aG2M8vnk0yQU+fH1TuyQ/g5AUupT5JsBi1Mc5+hI3WMblBsbOfZfhaiyH8BobC826hXGh4jMacXhWrEnft9oD5HaprTTgtbUlubWoz5Ckv5A1FnM24FIwYmO4qtJAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsFb2jGM; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7bc39eef24bso7458a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723051408; x=1723656208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2VfGxvvrtodTt4Uoxajg9WwZwPH9dbWJ0QoUIY7mzs0=;
        b=AsFb2jGMhTiKA8cnpcutU246s62b60RsGu6RNUi0/dntw4PHRHYAWHkyinuOYhEb5f
         z9pSrg8nZHS5zv9UeKhQJ5e9MHHbE6SzESTzA35shaYIiiWzOCxVUHfpjFRVhoQFLvtR
         I5NpW+eTr41WY+iQ16TBxcTSPquiO9CXY8YLRVVI6MjqgYAlsKpGuXMpfSGQaO1rm4KT
         /CE6rgU2KOnaT2LUoBlhR1+/og6h/1NoauMjkn+cFWtCG9L+Q8pqqIbsuQs2MU/U/0fa
         RHgabB1zKHE6fAFIg9HCjdrFhFGsCw6m6ntN3eScZkf3B2Yai+gFbVy43kELUCrXP4WQ
         H8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723051408; x=1723656208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VfGxvvrtodTt4Uoxajg9WwZwPH9dbWJ0QoUIY7mzs0=;
        b=iXkSJcBa+j0nXv5HQvdW19OLl5U+Od+8XVTdh9pD0TtASD14jJBw00Rn+cpQidp5tn
         KbGYNS+eFU+l8dfxct1Tz07P7VJDZQ59xW0OyNfNTwvLL5otB7eDkNJ05Pp518ziCqs6
         799HXvazqAaFKxeULeD3YeyyxJMQDrmMPchAUvg7SrFVWB3Qtddbt/TJ36CWy5umxZzx
         QRQFX+JWGEotvXzrfPcN8gX+uWtzhURA/CahqLbSkgHYaew9dj0x9UxC89rjcFTLurEb
         7Kud6L8HUxKqS9ye7/BU96LZ9Hnh5rid/cGtV9pKbK3Q//NUM7ZW4HWpt1IG64Yj7dY+
         xYWw==
X-Forwarded-Encrypted: i=1; AJvYcCVCTI/QSpMdLrAxBjv5P5lxMAxUvAWkS4bQX+pwxU6edBEJa3gsh3xxda/TBAU5erZfnsGsZW4KTZDI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkb50Ypc2u3NJCo4oNWQccmIlo9WVWFSKXb+w39/u3os9Ao4ld
	LXlbcqhQBPH3qm32GC01RyU9g4KoEOLoN3Ypxvc19xKuxPRh3DraSlnWrQ==
X-Google-Smtp-Source: AGHT+IFI7/o4PcNIwRXPflK/O7ig096EGfnm7fr3LvWJfY85Ui30/ki22RxRf60g5HkH8Vs9zLd1Yg==
X-Received: by 2002:a17:902:ce88:b0:1fb:19fc:1b44 with SMTP id d9443c01a7336-1ff5728c6c3mr125844275ad.3.1723051408229;
        Wed, 07 Aug 2024 10:23:28 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5e1c:17b4:a72d:e3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm109406395ad.261.2024.08.07.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 10:23:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linus.walleij@linaro.org
Cc: aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Date: Wed,  7 Aug 2024 14:22:56 -0300
Message-Id: <20240807172256.69440-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_LATE_SYSTEM_SLEEP_PM_OPS() with its modern
LATE_SYSTEM_SLEEP_PM_OPS() alternative.

The combined usage of pm_ptr() and LATE_SYSTEM_SLEEP_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9c2680df082c..c83e866d78e9 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -772,7 +772,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	imx_pinctrl_desc->pins = info->pins;
 	imx_pinctrl_desc->npins = info->npins;
 	imx_pinctrl_desc->pctlops = &imx_pctrl_ops;
-	imx_pinctrl_desc->pmxops = &imx_pmx_ops;
+	imx_pinctrl_desc->pmxops = pm_ptr(&imx_pmx_ops);
 	imx_pinctrl_desc->confops = &imx_pinconf_ops;
 	imx_pinctrl_desc->owner = THIS_MODULE;
 
@@ -804,14 +804,14 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(imx_pinctrl_probe);
 
-static int __maybe_unused imx_pinctrl_suspend(struct device *dev)
+static int imx_pinctrl_suspend(struct device *dev)
 {
 	struct imx_pinctrl *ipctl = dev_get_drvdata(dev);
 
 	return pinctrl_force_sleep(ipctl->pctl);
 }
 
-static int __maybe_unused imx_pinctrl_resume(struct device *dev)
+static int imx_pinctrl_resume(struct device *dev)
 {
 	struct imx_pinctrl *ipctl = dev_get_drvdata(dev);
 
@@ -819,8 +819,7 @@ static int __maybe_unused imx_pinctrl_resume(struct device *dev)
 }
 
 const struct dev_pm_ops imx_pinctrl_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
-					imx_pinctrl_resume)
+	LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend, imx_pinctrl_resume)
 };
 EXPORT_SYMBOL_GPL(imx_pinctrl_pm_ops);
 
-- 
2.34.1


