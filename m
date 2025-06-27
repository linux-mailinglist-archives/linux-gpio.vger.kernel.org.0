Return-Path: <linux-gpio+bounces-22346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF5AEBAEF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 17:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B0D37B66ED
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 15:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4291B29C35A;
	Fri, 27 Jun 2025 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W51L+XQb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0269D2F1FC0
	for <linux-gpio@vger.kernel.org>; Fri, 27 Jun 2025 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036522; cv=none; b=tSlNjaybGRRwHrLRJQ5j7hjiwqA+4VrlzSodu3XhIOX9qRJPTPyftpqhCAANE3RNj5zauIt14Ddc+ccACcVdBoianSPempVwhB+d5mgzshs0W3/hYmaC9e8wJ65qnMD+JCOo4vPJABSqDdp77qWL/TXhkr7wUVoOWFqaQNMA4VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036522; c=relaxed/simple;
	bh=tvemBTZpiyrD46N6zk7rfayLgzBxywzqqAe7XHjfwIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3Nz+XUtJ9OTuzL2eIW0wu/6FIONMsaH4hCt67xczB6Hr4UEFGAlpO9T2orAlDP27VOKLdTM8k59BKuIG4QT0yn/8YiZSqrfCX1b6r8p9Facmef3j5mtXw5WTVJk0BC3tMeFuk9UyA3LWBM8JuMb5aXnfzmDr55+Av0VuKOKU/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W51L+XQb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8655C4CEED;
	Fri, 27 Jun 2025 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751036521;
	bh=tvemBTZpiyrD46N6zk7rfayLgzBxywzqqAe7XHjfwIM=;
	h=From:To:Cc:Subject:Date:From;
	b=W51L+XQbaqn3InOKKuKLRsgBgxLt6quRwbwdOwUxiu8fqFMwIr2hy9d0S9T4LXfVf
	 oCaLlw4hNVMQh5kmUIAr+MxCP8uhpyX1M2smm1qHOhNTSFTZJrVEpBpHiIXvFNEJMd
	 Dm1us6XJ/rts8Z5KtE5pZG4e0lEbIKyr+AN45Tq/Pk/2cE+E1zSR7zZeygB2CrB9HX
	 rZVwZNK3PdCPzgQva+jJaUlK6RXY+7SO4nn7llSo2yMD+ia0pYx7ocmpGRGQiw/rdv
	 3ySFHYAbDgbSbQ//VLSlQGpSXWgTVMFKVCfRkxIA0kQLNNTMHu7JDblMw+7nkzMrmy
	 KqheU/Nk4dGzw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com,
	Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org,
	dmitry.torokhov@gmail.com,
	hansg@kernel.org
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH v2] pinctrl: amd: Clear GPIO debounce for suspend
Date: Fri, 27 Jun 2025 10:01:46 -0500
Message-ID: <20250627150155.3311574-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

soc-button-array hardcodes a debounce value by means of gpio_keys
which uses pinctrl-amd as a backend to program debounce for a GPIO.

This hardcoded value doesn't match what the firmware intended to be
programmed in _AEI. The hardcoded debounce leads to problems waking
from suspend. There isn't appetite to conditionalize the behavior in
soc-button-array or gpio-keys so clear it when the system suspends to
avoid problems with being able to resume.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>
Fixes: 5c4fa2a6da7fb ("Input: soc_button_array - debounce the buttons")
Link: https://lore.kernel.org/linux-input/mkgtrb5gt7miyg6kvqdlbu4nj3elym6ijudobpdi26gp4xxay5@rsa6ytrjvj2q/
Link: https://lore.kernel.org/linux-input/20250625215813.3477840-1-superm1@kernel.org/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2:
 * clarify comment for pinctrl (Hans)
---
 drivers/pinctrl/pinctrl-amd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5cf3db6d78b79..b3f0d02aeeb35 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -979,6 +979,17 @@ static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend
 				  pin, is_suspend ? "suspend" : "hibernate");
 		}
 
+		/*
+		 * debounce enabled over suspend has shown issues with a GPIO
+		 * being unable to wake the system, as we're only interested in
+		 * the actual wakeup event, clear it.
+		 */
+		if (gpio_dev->saved_regs[i] & (DB_CNTRl_MASK << DB_CNTRL_OFF)) {
+			amd_gpio_set_debounce(gpio_dev, pin, 0);
+			pm_pr_dbg("Clearing debounce for GPIO #%d during %s.\n",
+				  pin, is_suspend ? "suspend" : "hibernate");
+		}
+
 		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 	}
 
-- 
2.43.0


