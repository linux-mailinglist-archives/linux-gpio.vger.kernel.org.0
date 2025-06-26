Return-Path: <linux-gpio+bounces-22307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E01AEA96C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 00:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1835A7A52D3
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 22:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AD02609CC;
	Thu, 26 Jun 2025 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHMrCZgi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C823B634
	for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750976053; cv=none; b=kL9ciVMOmW2zDOfIUFIfmxUswJuesa5eO+V48JGZYWAk6MBeLaIn5ViRZv2ZbEyxqs52teAYZ1DEnkzZVTXgLA/iQ0R2LVJBMuvxAjo2H+fNb2bkqVuckydGbIGqC3eNdYCjrnLAUx4vfZyMV8XP+vUKo64EkUPH53bLU1BUXTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750976053; c=relaxed/simple;
	bh=gC56RmKKAhF68pqoNPPH7KgGZDtwgImiwR3h/lnssx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4yXPXvMVYtAjRJhr25TAGmn3+jXZyTX63fBo265O+skTPoE9j2Tfb2bmDOPltzP9BBdsPGuvbr01JcFlDmxTVEz78WpEPd/KrR26Z3MVFR9xNrXB+/DSzV9ETLciznNK00ZlulbqoeJgYmZItiEMmduzu37RprEeFByK+0VKtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHMrCZgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395DAC4CEEB;
	Thu, 26 Jun 2025 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750976052;
	bh=gC56RmKKAhF68pqoNPPH7KgGZDtwgImiwR3h/lnssx0=;
	h=From:To:Cc:Subject:Date:From;
	b=YHMrCZgis6JxjnkFXILeJqjntX+esdvAS4C40yJcl6MbXZRjV4EnpkNeFfUZXQ+M4
	 hfUUgRBXIYgxqHjQpOruY8CU/ymGFT/mr1606z1beViR8H0kxenWCEexyUXAla464q
	 7n+N67ictGy/2NKeM2NiUZG2QClrezphN4kilIjTWA1oKbUTFQRWEC6gyU2YtfiZnd
	 g0yVAM5OfXRaT1v1K9zLI+i8cCTBR6vawjpHx7zq7ldXQRcD1nTWYgSF1WWFKt8JRI
	 CcDll9TVWeofP3UTmPR7BjZbR8nAZ6le7joTgur6BMXvsJd1u3tRLuPzERfPD78cDI
	 ZwF8I84/WcsLA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com,
	Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org,
	dmitry.torokhov@gmail.com,
	hansg@kernel.org
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: amd: Clear GPIO debounce for suspend
Date: Thu, 26 Jun 2025 17:14:08 -0500
Message-ID: <20250626221409.2256551-1-superm1@kernel.org>
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
 drivers/pinctrl/pinctrl-amd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5cf3db6d78b79..4276bbe77e0e9 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -979,6 +979,13 @@ static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend
 				  pin, is_suspend ? "suspend" : "hibernate");
 		}
 
+		/* clear debounce */
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


