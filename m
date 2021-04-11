Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA23735B49C
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 15:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhDKNbH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 09:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235592AbhDKNbH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 09:31:07 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FF3C061574;
        Sun, 11 Apr 2021 06:30:50 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id x11so10611879qkp.11;
        Sun, 11 Apr 2021 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fjZkGAV2onA9W0zA2KcPEQhI5/QgShDnA+nmt2xDiXo=;
        b=JL7y8uJ3qrLnXv0uBLbFYyUhrRSi3qZMIEb9MtYjEU7mG3LNJZhhy5jaBzlHZETg8k
         2fB91Su4taYcPp0O+CXH9WagnNawgI5TcrGOCgn8r3d82UXPOAgpoWQ02i8RqAA0q96W
         sxkNoSsDF18e7afZm5p7C1cLZSoocEb42k98B2VgpqJWtITzIxcXN1J+d+aD228N/XkK
         g7Pg3mVgjb3kTkia6dPHhsnww/XFynoht1xRSfLKauBZvL2CWm1FF6CaIqwmXsgr6Jn8
         HX9MCiBGzwoy+C6eRKxSasfLIhBeiV/iLcnZIlwFou2Cn6QtbIxPr+CmV4Eklv25paU9
         ACXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fjZkGAV2onA9W0zA2KcPEQhI5/QgShDnA+nmt2xDiXo=;
        b=sT1UtYN4T2g524hR6nE/eQdbST4mab1xbwAAk2IgEnFtywFLAFx/6BfV+KvDc/UWYk
         3i84UnvW/gBthfGNo5Tbb60HMqzkLlVuFaz1O5nAZ+gaO5JnUY7zgouW+rxWvFIOfyss
         3BEtQIAyXdPDI0A+4s5nYzZ6RBKuT/s1SYYXQD8TK589creyfdlEPXWTD3Ul/mkwALDn
         Uqgwrg/YnyR7NHh9bap31eHKeNkKuhRxhkbN2VPwv0BuKHJWeWdUYZFvoUQAONUeYeD6
         SXNOdq0lN0Dbo4XThNZ7fosNrxr4HWqxLUWRUXFJZPa1xzZnPRXWSYL8vtN8NKGbwblk
         F+Fw==
X-Gm-Message-State: AOAM531yeawAKOPEWgToUlxlI+MMn9Zx6Y5CrPzRacRG7sukY8O4ixqQ
        /p29d0zpdByJERvEALZ106c=
X-Google-Smtp-Source: ABdhPJx4m6emyVfwdSgwe7XXc4ccXCP+aQItscdwP5r0OLXK0thS+NBsh27Mdxuy07Kirx+wfB3eLA==
X-Received: by 2002:a05:620a:a89:: with SMTP id v9mr5565174qkg.279.1618147849820;
        Sun, 11 Apr 2021 06:30:49 -0700 (PDT)
Received: from master-laptop.sparksnet (c-98-233-193-225.hsd1.md.comcast.net. [98.233.193.225])
        by smtp.gmail.com with ESMTPSA id l17sm5734204qtk.60.2021.04.11.06.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 06:30:49 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
Date:   Sun, 11 Apr 2021 09:30:25 -0400
Message-Id: <20210411133030.1663936-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210411133030.1663936-1-pgwipeout@gmail.com>
References: <20210411133030.1663936-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jianqun Xu <jay.xu@rock-chips.com>

Store a pointer from the pinctrl device for the gpio bank.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index dba9e9540633..4aa3d2f1fa67 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -81,6 +81,7 @@ struct rockchip_drv {
 
 /**
  * struct rockchip_pin_bank
+ * @dev: the pinctrl device bind to the bank
  * @reg_base: register base of the gpio bank
  * @regmap_pull: optional separate register for additional pull settings
  * @clk: clock of the gpio bank
@@ -105,6 +106,7 @@ struct rockchip_drv {
  * @route_mask: bits describing the routing pins of per bank
  */
 struct rockchip_pin_bank {
+	struct device			*dev;
 	void __iomem			*reg_base;
 	struct regmap			*regmap_pull;
 	struct clk			*clk;
-- 
2.25.1

