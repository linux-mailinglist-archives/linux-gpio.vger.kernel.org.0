Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3805D1FA5C0
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 03:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgFPBuw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 21:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgFPBuu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 21:50:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28FDC061A0E;
        Mon, 15 Jun 2020 18:50:49 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id n2so7652863pld.13;
        Mon, 15 Jun 2020 18:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7VA1crYBpyDM52CpMnnLPBWe4Gv8lDrqZmEiV/H49WQ=;
        b=apsKMJBNubzRb5VfKkwlTGzIW30DhAXetU7+QX6ZMS+t6UZee5AcuxkRbRg9wjbv/I
         MYTCxXmW4u8qoG8P/tEstRaJNbSZMzHrHPxHIiH7iujv1r2oEKhYVrRZTIhSjUkcxdKQ
         uvgGCyob7ixnZZX13282HZ49p91GO7NLKnYXVkOO04LKLWFepkDkj1ItV1eYviN6G+Pv
         FZ+axQQDM/rnxAqUgIHNg10axVSotPCB8rCJIx3Q+gF4cbEkw4TOqsInh+91FvEh8gdJ
         qpXlV1n6/JBD5TNN/LDsUBG6dyX6U0JBB1MJq34RocmBnI8v2ZGcLQwhkf0FPmmnpryQ
         rnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7VA1crYBpyDM52CpMnnLPBWe4Gv8lDrqZmEiV/H49WQ=;
        b=FBtrBAdv3LMf1Jl0omjAeJDlXN5ZqUyO6wo3FQhPYqrCgXx9PD95RVTKK59hoCufb6
         DowrsBFnDE/iti1uhkG+bvIrN9bUEZ0IKhliS4OhyhefkritaUvlyw8DZWPheNlLtB0w
         M52CfiY6m31OiojeB9P8NfxrFlbdPYbztYJ/pZNPt0z5QclMWa8I7XH3shCG/5YqVQZs
         wBkdGABDuKPdkMmteju7mf/EZCwFOJCeThYuy0wZOvCROes37n5rMApX6WT68l6BQpu/
         l2Yag9RYM597Jel+15r+lK7UJkxOERRGfKA3LqzMgFgNiPFSfe/y0tJJ/t8ysHKI73dI
         tiOQ==
X-Gm-Message-State: AOAM533ba6EfPWn4W6XC22imdAoLmCTLZBeVTYLZkvUcZrcU4GBna6yh
        bzZx3plZ0UX8w0l3+z39S4Swd/5g0A==
X-Google-Smtp-Source: ABdhPJyeOaUhju+BDLTm1Ft539XgRC2rQTPXd/LOFaBWCs9fxyyGDPH26OGuzMGWzsBVPMiQ39vILw==
X-Received: by 2002:a17:90a:c717:: with SMTP id o23mr490537pjt.195.1592272249044;
        Mon, 15 Jun 2020 18:50:49 -0700 (PDT)
Received: from localhost (98.86.92.34.bc.googleusercontent.com. [34.92.86.98])
        by smtp.gmail.com with ESMTPSA id n3sm12435211pgq.30.2020.06.15.18.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 18:50:48 -0700 (PDT)
From:   Jacky Hu <hengqing.hu@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        Jacky Hu <hengqing.hu@gmail.com>
Subject: [PATCH] pinctrl: amd: fix npins for uart0 in kerncz_groups
Date:   Tue, 16 Jun 2020 09:50:24 +0800
Message-Id: <20200616015024.287683-1-hengqing.hu@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

uart0_pins is defined as:
static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};

which npins is wronly specified as 9 later
	{
		.name = "uart0",
		.pins = uart0_pins,
		.npins = 9,
	},

npins should be 5 instead of 9 according to the definition.

Signed-off-by: Jacky Hu <hengqing.hu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 3e5760f1a715..d4a192df5fab 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -252,7 +252,7 @@ static const struct amd_pingroup kerncz_groups[] = {
 	{
 		.name = "uart0",
 		.pins = uart0_pins,
-		.npins = 9,
+		.npins = 5,
 	},
 	{
 		.name = "uart1",
-- 
2.27.0

