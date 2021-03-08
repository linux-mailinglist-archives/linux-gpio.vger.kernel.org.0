Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30375331211
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 16:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhCHPZa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 10:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbhCHPZM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 10:25:12 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CD9C06174A;
        Mon,  8 Mar 2021 07:25:12 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ox4so5536035ejb.11;
        Mon, 08 Mar 2021 07:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fb49KXRWPSJi42ztaavXoYPspVtYhsjrcySTJoONhEo=;
        b=rBsc/nkxlErn6sb8I2v8ZZmrC8Ef58RjQGLt8YHSyQ7AL+kMWfSTbx4rnTr8fGMMth
         eL/2ZSflVwUdq6b83/XDhGarNt6nwhaQgV+9CmLSpR0kpbPNKCXKuHxxVKT0zhe96pG0
         NsX2/3jiPvav7hKOGDG+Z7IYcdklTMH8fp0q5ExNDx/pSMf6Ka5rH1NVrucjea+07dJZ
         +GLn3IuNLkC6GhX5D65SHBOXsgtEFwWYI2k7dUQDQ6+tM2DdxIeDP7nTlfKl3Uc7dO6l
         TOUemE2NIw9JRxedVq8PCPi/QpItvhU8ly1iTpi2UMfPBzaWyWU86vtNPwlT5PtsdEak
         5ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fb49KXRWPSJi42ztaavXoYPspVtYhsjrcySTJoONhEo=;
        b=hcTjNPZzX7vsIavJePyVUygqMeRfymBQxzTgU9KWeywQb9ZqxJ2Z52xcJz8DnNNciT
         xiZAyIlWgN1l0Q7aeQhEoxpKTi1avS+b9E0Jf140kZtzGdCb/RuYJz6mqpXBM3NbxSd/
         cpA8xJvFsLsj/rpO1Bw4PSALURSsdNKreRv3fd8h0jBHwbcc3mK++p2dNDw1M/hIzywB
         whj+m/wMpEyTgG0PcStble7wQDRhb/d5UlkCSzg6rsCuVvu6ydB9DBUUoHSPPEaLakGR
         2bGLuIEmP7UyedoZtf9ap1WOIubg0eGFmdZb4a0IPK54pCiJ6y9ztfdJKcsC/0qcBK6I
         ySHQ==
X-Gm-Message-State: AOAM5335O+W2pVGpHO/oQCpcazLk5Oogo6hch/9GK21pzg9o+ZaWKDy8
        7cNYiQdi/Mr8h/8bbKV58jo=
X-Google-Smtp-Source: ABdhPJxZ06PwZtWQ2lXfc7pWL5OQxzL7HDR/dJNDiNDBQHTuZtn0D29F62WEYp4HGztEmjLSGpBW1w==
X-Received: by 2002:a17:906:b6c8:: with SMTP id ec8mr15729105ejb.223.1615217111014;
        Mon, 08 Mar 2021 07:25:11 -0800 (PST)
Received: from xws.localdomain ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id u15sm6738227ejy.48.2021.03.08.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 07:25:10 -0800 (PST)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "pinctrl: intel: Split intel_pinctrl_add_padgroups() for better maintenance"
Date:   Mon,  8 Mar 2021 16:25:05 +0100
Message-Id: <20210308152505.3762055-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Following commit 036e126c72eb ("pinctrl: intel: Split
intel_pinctrl_add_padgroups() for better maintenance"),
gpiochip_get_desc() is broken on some Kaby Lake R devices (specifically
a Microsoft Surface Book 2), returning -EINVAL for GPIOs that in reality
should be there (they are defined in ACPI and have been accessible
previously). Due to this, gpiod_get() fails with -ENOENT.

Reverting this commit fixes that issue and the GPIOs in question are
accessible again.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---

There is probably a better option than straight up reverting this, so
consider this more of a bug-report.

Regards,
Max

---
 drivers/pinctrl/intel/pinctrl-intel.c | 60 +++++++++------------------
 1 file changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8085782cd8f9..0fe6caf98a8a 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1331,19 +1331,34 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	return 0;
 }
 
-static int intel_pinctrl_add_padgroups_by_gpps(struct intel_pinctrl *pctrl,
-					       struct intel_community *community)
+static int intel_pinctrl_add_padgroups(struct intel_pinctrl *pctrl,
+				       struct intel_community *community)
 {
 	struct intel_padgroup *gpps;
+	unsigned int npins = community->npins;
 	unsigned int padown_num = 0;
-	size_t i, ngpps = community->ngpps;
+	size_t ngpps, i;
+
+	if (community->gpps)
+		ngpps = community->ngpps;
+	else
+		ngpps = DIV_ROUND_UP(community->npins, community->gpp_size);
 
 	gpps = devm_kcalloc(pctrl->dev, ngpps, sizeof(*gpps), GFP_KERNEL);
 	if (!gpps)
 		return -ENOMEM;
 
 	for (i = 0; i < ngpps; i++) {
-		gpps[i] = community->gpps[i];
+		if (community->gpps) {
+			gpps[i] = community->gpps[i];
+		} else {
+			unsigned int gpp_size = community->gpp_size;
+
+			gpps[i].reg_num = i;
+			gpps[i].base = community->pin_base + i * gpp_size;
+			gpps[i].size = min(gpp_size, npins);
+			npins -= gpps[i].size;
+		}
 
 		if (gpps[i].size > 32)
 			return -EINVAL;
@@ -1361,38 +1376,6 @@ static int intel_pinctrl_add_padgroups_by_gpps(struct intel_pinctrl *pctrl,
 				break;
 		}
 
-		gpps[i].padown_num = padown_num;
-		padown_num += DIV_ROUND_UP(gpps[i].size * 4, 32);
-	}
-
-	community->gpps = gpps;
-
-	return 0;
-}
-
-static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
-					       struct intel_community *community)
-{
-	struct intel_padgroup *gpps;
-	unsigned int npins = community->npins;
-	unsigned int padown_num = 0;
-	size_t i, ngpps = DIV_ROUND_UP(npins, community->gpp_size);
-
-	if (community->gpp_size > 32)
-		return -EINVAL;
-
-	gpps = devm_kcalloc(pctrl->dev, ngpps, sizeof(*gpps), GFP_KERNEL);
-	if (!gpps)
-		return -ENOMEM;
-
-	for (i = 0; i < ngpps; i++) {
-		unsigned int gpp_size = community->gpp_size;
-
-		gpps[i].reg_num = i;
-		gpps[i].base = community->pin_base + i * gpp_size;
-		gpps[i].size = min(gpp_size, npins);
-		npins -= gpps[i].size;
-
 		gpps[i].padown_num = padown_num;
 
 		/*
@@ -1529,10 +1512,7 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 		community->regs = regs;
 		community->pad_regs = regs + offset;
 
-		if (community->gpps)
-			ret = intel_pinctrl_add_padgroups_by_gpps(pctrl, community);
-		else
-			ret = intel_pinctrl_add_padgroups_by_size(pctrl, community);
+		ret = intel_pinctrl_add_padgroups(pctrl, community);
 		if (ret)
 			return ret;
 	}
-- 
2.30.1

