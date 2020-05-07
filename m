Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD6D1C80A0
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 05:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgEGDri (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 May 2020 23:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725809AbgEGDri (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2020 23:47:38 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391CDC061A0F;
        Wed,  6 May 2020 20:47:38 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d184so2296620pfd.4;
        Wed, 06 May 2020 20:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=k42B0v+KyyPwXu1TxJ3NGB+Mz8tcGMWNDg8BOG5X2is=;
        b=fOAXfSmtHy7lzjwH9nWI5vGd1yHZZPStW3GW1bYOQqGke1WNtouCxNQsSz90iYTS6r
         Hx8OfIYANa5Rwv5PlUgSvrQ/0VnwKC9cKL+MI/OzYsZAyY+dBDGjRJZtJh5Emr3Rusfy
         OUqf6q+dKRXE7q4V2035TYzqDG92bHKGqhxvSUWx1ovSBCB+I7t7AmrnXSefkX7HI/oF
         wRikRHkJJ3m/YhFgBU873E01jRxvqL7r1d8iD6ON46OPz5Y9Y/Emhf/Eh/0VZ+cSc2zw
         tGL/BMEE+9X5to6tLunbS205C0vyefX/0fgHwVAAnL2Wh8haaB3kRtfE9YiyOWpmOs9F
         IL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=k42B0v+KyyPwXu1TxJ3NGB+Mz8tcGMWNDg8BOG5X2is=;
        b=osA0sg1OcpFJVQmCSaJI1IUJgyCFW5rqV1mPUgyj4kRxZ+v3gWmBfKbahLzH0gUPU0
         7vJPi9ozYPLsvVrkGdjRkay4cI9T2V79+m3GlsXMeSi6j6JUnycRbwPzshxu5cdg2lJU
         E3hUYhDtMutu7WmSinhbeiGIQIqisktFHRGQ4+OTeqtAGFr8ialwvZItUyh0tNtMsleE
         YpkwCqKLEiWkdXM1bPRoJHmeYTDOMWj5MT3YBih9tvwZ/vwpqNRRv5+pGsZTv/yS4i4D
         2kiGcHyTooyR4MkEex3sCU2yRewK2R2xqSEVz/L9YBK6u+GLypgFXpNxVdtDlKaAYWfy
         DRTA==
X-Gm-Message-State: AGi0PuYtmY/a5bIiItSZuEeAravr+Yb6qoH0vqMRPYlr+NGSq237DE6E
        FI1DbTe2E9SHbEZE9gyUBtw=
X-Google-Smtp-Source: APiQypK4A84ZXMUNrHmbDEQoXCfj0mgTIbuCvHuFZnvKDZjmlLnwqTsib4w28kxI/hDuD805kIO41A==
X-Received: by 2002:a63:e050:: with SMTP id n16mr9888597pgj.93.1588823257540;
        Wed, 06 May 2020 20:47:37 -0700 (PDT)
Received: from sh03840pcu.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id z5sm3130716pfn.142.2020.05.06.20.47.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 20:47:36 -0700 (PDT)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     linus.walleij@linaro.org
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sprd: Fix the incorrect pull-up definition
Date:   Thu,  7 May 2020 11:47:25 +0800
Message-Id: <e973f8f194ce4cb2639121572e8621b5efa5bfbe.1588823152.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bits of pull up resistor selection were defined mistakenly,
thus fix them.

Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 48cbf2a..08dc193 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -68,8 +68,8 @@
 #define SLEEP_PULL_UP_MASK		0x1
 #define SLEEP_PULL_UP_SHIFT		3
 
-#define PULL_UP_20K			(BIT(12) | BIT(7))
-#define PULL_UP_4_7K			BIT(12)
+#define PULL_UP_4_7K			(BIT(12) | BIT(7))
+#define PULL_UP_20K			BIT(7)
 #define PULL_UP_MASK			0x21
 #define PULL_UP_SHIFT			7
 
-- 
1.9.1

