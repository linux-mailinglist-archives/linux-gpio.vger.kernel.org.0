Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E8A1878CE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 05:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgCQEzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Mar 2020 00:55:12 -0400
Received: from outbound.smtp.vt.edu ([198.82.183.121]:37044 "EHLO
        omr2.cc.vt.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726157AbgCQEzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2020 00:55:08 -0400
Received: from mr1.cc.vt.edu (mr1.cc.ipv6.vt.edu [IPv6:2607:b400:92:8300:0:31:1732:8aa4])
        by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 02H4t7lX021321
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2020 00:55:07 -0400
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
        by mr1.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 02H4t2AT007664
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2020 00:55:07 -0400
Received: by mail-qv1-f70.google.com with SMTP id ev8so11274073qvb.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2020 21:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:mime-version:date
         :message-id;
        bh=Y91b1uFvN0HdY0iOBxMABqgP7XI6TzW5dwQDX8YUsV0=;
        b=GGwaVTtmrZsMud01LmGNE830R125/PsGBmtpyF3JfX1EkLURC+9kIlyW3X7nf9cKwz
         zLXuiE8p/RA70K/Wz5bzuppd7ruWTtcyWOYK4UfRKjOzlOdYG5Kpk2UOEgTxrudK6nCF
         RVrz2Dn+QGpyHnUoYbS+sKIHKWfUGMA08A6aPlQRw4dYkuNjRLcHynNvVCrPC1Sckbte
         3tgwn10cGyxt9PtI589prc7+VL6iDNn+ywgvRPobzD6p6EtQ9JwjXEXZoQa32h8sSohC
         MmiC2sJkCe+lQlriSF2ZhXbMgV2/WqoWpC10gE2v2IZ9BELtgA/2Yh7RLmFMOx/JFwLk
         dEoA==
X-Gm-Message-State: ANhLgQ2h1mPsFRb7W42LTSDuDB2KvmnrqQcjTybo+FBcd6MNdn8CPoRh
        FTKpKwLm/MP+XFpsGZqvlIQpIpfBEyPdTp3AoMntP4+iUTmneTrIDy4f0Ry9EZGe/wtrW1WH9Db
        PL8JK+JP4RDpg7qEMGh0NVjG970YIjC3A
X-Received: by 2002:ae9:eb12:: with SMTP id b18mr3285573qkg.168.1584420902119;
        Mon, 16 Mar 2020 21:55:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtUDl88z4JRPHz2zyJmbf9sHj2p29cr0lvKwcAfBTOfcp5n1kViR0e7V1WWDMMM/h35D2RbEw==
X-Received: by 2002:ae9:eb12:: with SMTP id b18mr3285560qkg.168.1584420901793;
        Mon, 16 Mar 2020 21:55:01 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
        by smtp.gmail.com with ESMTPSA id 73sm1264022qkf.82.2020.03.16.21.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 21:55:00 -0700 (PDT)
From:   "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Marco Felsch <m.felsch@pengutronix.de>
cc:     Support Opensource <support.opensource@diasemi.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: da9062: Fix include path
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date:   Tue, 17 Mar 2020 00:54:59 -0400
Message-ID: <773115.1584420899@turing-police>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Found during a allmodconfig build on ARM on an RPi4:

  CC      drivers/pinctrl/pinctrl-da9062.o
drivers/pinctrl/pinctrl-da9062.c:28:10: fatal error: ../gpio/gpiolib.h: No such file or directory
 #include <../gpio/gpiolib.h>
          ^~~~~~~~~~~~~~~~~~~
compilation terminated.

So... fix the errant include.

Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Fixes: 56cc3af4e8c8e ("pinctrl: da9062: add driver support")

diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index f704ee0b2fd9..cfbe529e66c3 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -25,7 +25,7 @@
  * We need this get the gpio_desc from a <gpio_chip,offset> tuple to decide if
  * the gpio is active low without a vendor specific dt-binding.
  */
-#include <../gpio/gpiolib.h>
+#include <../drivers/gpio/gpiolib.h>
 
 #define DA9062_TYPE(offset)		(4 * (offset % 2))
 #define DA9062_PIN_SHIFT(offset)	(4 * (offset % 2))

