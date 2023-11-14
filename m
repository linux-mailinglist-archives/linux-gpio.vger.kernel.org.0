Return-Path: <linux-gpio+bounces-101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 339577EB0E4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 14:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF43280CC7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB983FE59;
	Tue, 14 Nov 2023 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iwa7FL6B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58E03FE40
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 13:30:08 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB69C1AD
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:30:06 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso6754592e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699968605; x=1700573405; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M20ZdrtdL4mxBFowxVPsPIZrP+Nk6G9G7Ln02uErXU0=;
        b=Iwa7FL6BDniv0iPHKBBHNj5+75pONPLefd1Nb0d0shFitp62KYE28S/+6vcaTN3t4/
         ukS1KrKm1sSVOTDC4Lul38tQsMHfmcu0NgKHh19C3UTti5iCH7n4voUklnsDkC2TPLdt
         w33y5e00c3fI9rpPKib0ECqt3CXhK3jMC6A4uVJsCFtvgTM72/+DNy3Aiz1EpEk5XYjE
         YMyAT1y6qcTY/l7gL9bsOgbK5JlXNdDWpwM7Ctb16tvEnbcLcJE0COlhhWYN+Ye3slmQ
         0K4nKyB40dnRKxMOpGEhfcp+HR/8MfbPkByQ6lzI58EDum6pu1EklGQKha911nt+zwaE
         8AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699968605; x=1700573405;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M20ZdrtdL4mxBFowxVPsPIZrP+Nk6G9G7Ln02uErXU0=;
        b=UlAowWyqNAFybQt6uuUj61UglizO5SBvLCt44T6RLBndPh2SMJ8v3WaHTl1oNt5JKw
         konr0JGPjUUsAftv23N1uOnVuFbd37VVk3U0W6iBek4ea2ft1+j800pfe8ymytqIv9FO
         rT/6IxQ5YPPBESrcOMYvo/QkBaWp5VHkPjah2xHDA4JP7SWGOJGpX7FBhVWvoCNOhyf2
         N06F6Qu+UqNzOH5Ni5xqIkwe0TARBqJbqEHG9gTPnWS9S05UyLxAEgUckW2wMZnLkGe8
         XfQygOO5Zi5fujnM1DRttIDoVsQCPHUZMVDgQOaY3sPfn24YxkakoFbZcELsJw6DVNR1
         nMqA==
X-Gm-Message-State: AOJu0YxTWgTd4K9iE4TmK5rPxC5v5jgxzOk81sjfZXkqdWD8nyeS2/NF
	hWgE1ZynfEL/PitGh9HEHyeBtbXYDs0TAPijbzA=
X-Google-Smtp-Source: AGHT+IGQZ5W8krMJo5A5oV2eHBatfpOu32KBHpFDNp9vB113dOCGQxUYSSQsgX/yfJAV0DzO9TffWA==
X-Received: by 2002:a05:6512:3d18:b0:500:92f1:c341 with SMTP id d24-20020a0565123d1800b0050092f1c341mr9226552lfv.54.1699968604692;
        Tue, 14 Nov 2023 05:30:04 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id t9-20020a056512068900b00507b1783b3csm1339714lfe.54.2023.11.14.05.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 05:30:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:30:04 +0100
Subject: [PATCH] pinctrl: cy8c95x0: Fix doc warning
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-cy8c95x0-doc-v1-1-31674103ad18@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFt2U2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQ0MT3eRKi2RL0woD3ZT8ZN0042QDi9REsxQzYwsloJaCotS0zAqwcdG
 xtbUA2CcB5V4AAAA=
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

One member of struct cy8c95x0_pinctrl is missing kerneldoc,
which leads to warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311031342.r4To3GaD-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 04285c930e94..4ccfa99ed93a 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -143,6 +143,7 @@ static const struct dmi_system_id cy8c95x0_dmi_acpi_irq_info[] = {
  * @pinctrl_desc:   pin controller description
  * @name:           Chip controller name
  * @tpin:           Total number of pins
+ * @gpio_reset:     GPIO line handler that can reset the IC
  */
 struct cy8c95x0_pinctrl {
 	struct regmap *regmap;

---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231114-cy8c95x0-doc-f3c08ea6d638

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


