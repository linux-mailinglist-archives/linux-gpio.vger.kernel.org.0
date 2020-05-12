Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C998E1CFF6B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 22:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731191AbgELUfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 16:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731183AbgELUfi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 16:35:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7434AC061A0C;
        Tue, 12 May 2020 13:35:37 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y16so10366156wrs.3;
        Tue, 12 May 2020 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=B1auPUCQJ6jnhcwlo7ZQktJWdnEzk2MQBv9Xkb5qeSw=;
        b=nceJPZeojs6qraZ8fSw/SYQJlTdlVDPgIYgLp301owRsMMVQaScvhpVAbEBY7DoCen
         hM6a+G6qSjNbGrcDnjjcTJVIOaUysZAmQi5H/IFhXPUL82iFLfqDtCYuocwh9pXjU/Dc
         2g2Noow6pWxBbO/xkfGqnDoUXDqtf+EkarqnDTP5Ob4t7zFEP4nu850SIu8tX1gRL31d
         Hlxj23K5dXKqFmbKlaw3c9/AIOF83gCJgyq5LY+nYIn6SXGYLavTaxRPJ7HUoqQZpPLn
         6PONYfvWuCpA02crwLMom9YiLzUOXwRmFlhZ84fQdsI/cgNwjgTFs1hOanrSQzkktKMy
         HjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=B1auPUCQJ6jnhcwlo7ZQktJWdnEzk2MQBv9Xkb5qeSw=;
        b=o52x9CMlAWTVg1WW9S8jG1Au0gpEuoiUi3dj+1X9eFHAl5kL5fchzFlgfstSiAtinl
         OadpWYfpd9XbWE2lRaEFNAmdgI37nzZQVhJw8yXx6SXrFimJ1Gfx1Qtpa9vyMN7JIK+p
         a1T3+SEJi8RrDqJvCILJyotAkQ/wqzHWL2/DGEXcn0T4skBDLyZZ8Vw85gn/dGlfENc4
         tvXke0we20wOhjWvWZV1QRhDy5HMEI4tJcdnV6Ud5cKwmH76tGASqvc6CHNUDrugyz2q
         2ZVTBmENNJRga9UIDNvnOMOpF15BQLCs6Rq5zYu+cF0LnEZYlAdewTKjkQMQH7l344TU
         k8+A==
X-Gm-Message-State: AGi0Pua/H7WzjsmhKM/WcfTt3EHmY3T1QP9GPgqdqx26IoIgdRFqfj9X
        jd1xxwXOVvlYp4gWWypB3C4=
X-Google-Smtp-Source: APiQypLmrnkToJDCa/tZNLkmV4SRoLb0lnQbv6DphIFu9wMNPlB73GP2mZkrvbhGxQJldgXB7izfsA==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr15743833wrp.419.1589315736169;
        Tue, 12 May 2020 13:35:36 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k131sm418219wma.2.2020.05.12.13.35.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 13:35:35 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] include: dt-bindings: rockchip: remove unused defines
Date:   Tue, 12 May 2020 22:35:24 +0200
Message-Id: <20200512203524.7317-3-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200512203524.7317-1-jbx6244@gmail.com>
References: <20200512203524.7317-1-jbx6244@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Rockchip dtsi and dts files have been bulk-converted for the
remaining raw gpio numbers into their descriptive counterparts and
also got rid of the unhelpful RK_FUNC_x -> x and RK_GPIOx -> x
mappings, so remove the unused defines in 'rockchip.h' to prevent
that someone start using them again.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 include/dt-bindings/pinctrl/rockchip.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/include/dt-bindings/pinctrl/rockchip.h b/include/dt-bindings/pinctrl/rockchip.h
index 6d6bac1c2..5f291045e 100644
--- a/include/dt-bindings/pinctrl/rockchip.h
+++ b/include/dt-bindings/pinctrl/rockchip.h
@@ -9,13 +9,6 @@
 #ifndef __DT_BINDINGS_ROCKCHIP_PINCTRL_H__
 #define __DT_BINDINGS_ROCKCHIP_PINCTRL_H__
 
-#define RK_GPIO0	0
-#define RK_GPIO1	1
-#define RK_GPIO2	2
-#define RK_GPIO3	3
-#define RK_GPIO4	4
-#define RK_GPIO6	6
-
 #define RK_PA0		0
 #define RK_PA1		1
 #define RK_PA2		2
@@ -50,9 +43,5 @@
 #define RK_PD7		31
 
 #define RK_FUNC_GPIO	0
-#define RK_FUNC_1	1 /* deprecated */
-#define RK_FUNC_2	2 /* deprecated */
-#define RK_FUNC_3	3 /* deprecated */
-#define RK_FUNC_4	4 /* deprecated */
 
 #endif
-- 
2.11.0

