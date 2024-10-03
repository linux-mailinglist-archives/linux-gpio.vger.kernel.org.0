Return-Path: <linux-gpio+bounces-10799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BB98F1BA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 16:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71346B2253C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 14:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21B819F13A;
	Thu,  3 Oct 2024 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DeMT+SH0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B739413D245
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727966688; cv=none; b=lQ9o30TPwTafR0jCCf8H/L+Y8bwuSOdeAf/2NQQoLmkJuSsbgdWZ2/OSKtIESJvZbthyNMO1a3/b3zegniwKdSU/H0HYaBywG9B7JpY4vqwYbpwxe5iLTvAIxzRHQu9MQWqUNwAa22GOXz/g6scUbIgg1+P9KwYNt6heySj6OhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727966688; c=relaxed/simple;
	bh=7+aP9ngiERY++bSipEn/meXfFGZWq0pGflH9pnNus2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SERZRMF2ZR8ihlKYR+HcBYepkm0qPt2Se4RJUasOmWCrDZZeONJgIKen7xTARsWFfmutNMn6WIHVah8jmyzchOuODP6D++pd7qy8nS30HjaG1eSZV/q0EtYUTBUzC5dgid5i8P3CLn6FAXgccMhre3s4l2kyCdr3g+/ba2xIfJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DeMT+SH0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c8784e3bc8so1352857a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727966685; x=1728571485; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YiGfpCn+Qx4GWXnhyGLUPQaxnXcCAhGF+c2SZKzhn4w=;
        b=DeMT+SH0s6xKn/WSYG//YnDHdCzVHUCVmwMBe6VO0KfQ9yvLR+92DqZ484foUuvUPf
         di25Pwkb/rxm5Wc//0jP1BudFiYb7Dzk0M5aj8vA04vjoxN2YzNmNb28+ZlYIaWRQ/fZ
         BKXLyK/SCYamqBZOp0p4zVSBT4ajRdhvpmU9Xt/d04bXO/tCRyFvZ+RQQNQAtgHGAEnG
         nMc+bLXznKfSbW2r5UxXW4uttfY0PlRaYujEZL27awoniOAcGieAs5BwFrCUf1TNHB0j
         Cz//I/hwZAxVL+3YGq7Zbl4+DLgE8b7MzhDgduGKXMB2iQinA6dTj7swnW8JBPcxtBIw
         usHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727966685; x=1728571485;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiGfpCn+Qx4GWXnhyGLUPQaxnXcCAhGF+c2SZKzhn4w=;
        b=Y8/i+BrtYyQFgO3cbGtfKQzdNG69Vip8JHp71h9zoorjkPEs1/R/PtCYatezT2zksP
         PsfI3qLgL+3pVAwhdnJqGobeDWANwBc8zE6ZA9XysR4XOClzM3LnakSD/d+yvWz5bgxM
         z4+76UMbHbdnzh4KTUA8bnoWW/8Kh/CcWLxSbfO2zPc0Rq3q+7luRZyuuhd7MhdXJw3j
         VVsD2lmUHjIpuQRJ9qVwcAUv6Rg+wuhUI5cXRD/43pXgD0QKtzoCc8q0p0YPA4SD+4DG
         7hiAMkPOQtU5y1GFgQUZWnc6YCkpWiL1pwzY53v8Ctvqsq1nu77VlNgkI6R9PSwCLnu4
         Px9g==
X-Gm-Message-State: AOJu0Yw0krNJkmC8WHMvvg1xQgDc5OixNCQXuy0WPuRpZ7LJlBM/faMo
	A9aTBZ87Y74mLpG2JhLLFq4ztgku4dkcAlCsUJCRrrXJRCuXIABsA79wh6xfZhVVsEKtshK4ALt
	z
X-Google-Smtp-Source: AGHT+IGlM58JqIGSSPSJyNt4LFBxxbnV2Q0ItrsV7E6eHUFcLaZn/WIj4bDjrxyyM1UbuYacvQDjgw==
X-Received: by 2002:a17:907:3687:b0:a8d:2c00:949a with SMTP id a640c23a62f3a-a98f8213ddcmr589513266b.9.1727966685140;
        Thu, 03 Oct 2024 07:44:45 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99102a99efsm94427966b.92.2024.10.03.07.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 07:44:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 03 Oct 2024 16:44:43 +0200
Subject: [PATCH] pinctrl: k230: Drop unused code
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-k320-unused-v1-1-72e65bc2f27b@linaro.org>
X-B4-Tracking: v=1; b=H4sIANqt/mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwNj3WxjIwPd0rzS4tQUXdOk5BQzE2MzU6NkYyWgjoKi1LTMCrBp0bG
 1tQAyzx94XQAAAA==
To: Ze Huang <18771902331@163.com>
Cc: linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The build robot complains about unused code. Let's drop it,
this can be restored with simple git revert when needed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410021136.ie3cFM2w-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-k230.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-k230.c b/drivers/pinctrl/pinctrl-k230.c
index 4266516886fc..a9b4627b46b0 100644
--- a/drivers/pinctrl/pinctrl-k230.c
+++ b/drivers/pinctrl/pinctrl-k230.c
@@ -156,7 +156,7 @@ static void k230_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
 				      struct seq_file *s, unsigned int offset)
 {
 	struct k230_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
-	u32 val, mode, bias, drive, input, output, slew, schmitt, power;
+	u32 val, bias, drive, input, slew, schmitt, power;
 	struct k230_pin_group *grp = k230_pins[offset].drv_data;
 	static const char * const biasing[] = {
 			"pull none", "pull down", "pull up", "" };
@@ -167,11 +167,9 @@ static void k230_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
 
 	regmap_read(info->regmap_base, offset * 4, &val);
 
-	mode	= (val & K230_PC_SEL) >> K230_SHIFT_SEL;
 	drive	= (val & K230_PC_DS) >> K230_SHIFT_DS;
 	bias	= (val & K230_PC_BIAS) >> K230_SHIFT_BIAS;
 	input	= (val & K230_PC_IE) >> K230_SHIFT_IE;
-	output	= (val & K230_PC_OE) >> K230_SHIFT_OE;
 	slew	= (val & K230_PC_SL) >> K230_SHIFT_SL;
 	schmitt	= (val & K230_PC_ST) >> K230_SHIFT_ST;
 	power	= (val & K230_PC_MSC) >> K230_SHIFT_MSC;

---
base-commit: 58414a31c5713afb5449fd74a26a843d34cc62e8
change-id: 20241003-k320-unused-5bcd643652c3

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


