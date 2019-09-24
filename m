Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFDF5BC065
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2019 04:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408135AbfIXCuC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 22:50:02 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43379 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408131AbfIXCuC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 22:50:02 -0400
Received: by mail-pf1-f193.google.com with SMTP id a2so262456pfo.10;
        Mon, 23 Sep 2019 19:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=uaaaLuCGRZnOfdmCLyNq9t4oN/F+9BF6AGKkNBUPoi8=;
        b=aJtQ3AAgg2ZeEGsckD3yHD0VQG/gnZcwD+Er8eIFqLqUUFtMsC/RCxbtkMJG24GjsR
         xCmE+CyraZGtls9hscnHyFcUJjKCfpS0CctTbLFzrQfyIYRPCM+absbqzG0OQO164e2+
         FBQNCWHtiIEksa1eiLNcaX81gTZkQiHfN3+udbI5l91BZK+Zq86Q7yA5gaxelvcJsRIF
         xsTAjgovZYYlpO9aeJlRzsmR5+HpkizRgyhSe6kC7jdw6vdqXfl19/xvy422Pa5ozs86
         P3yCXpGiVw3AXDuarmrSdK4W69bvKhtiyMJqxWJJ5+HnYFFjtOGQpoKeA7pS6PFxPQiz
         DNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=uaaaLuCGRZnOfdmCLyNq9t4oN/F+9BF6AGKkNBUPoi8=;
        b=jqGypnFc8HeZNY0DhgEiWcbiOd+WFrnGhwU+T9HTOJyR9jHN+DOl1NyXWnU4MYviqf
         SeVswidlhyeOrXuNZd30XfpN4IGEsKSbZq8v/TqfdwGVrMX60YAwQJzHUfgCyTsClCfy
         d6Nm/jhdyvEG20v+ZQUJKWs1CnQwthknMwdCYTbe+DkzSwkZFg/bI6OJKkNE8lF3FaHd
         v852E5R1XsnwxRw2nkC5yKiuuQ2CYoahxHEKxVmdV/aytHffZwe2CsUXvNDi5tHYJucU
         BBwqIzusHOTi7H6HdRyw7eEOkuEFSwPOd4wV+iibBYUqSkbX6xxpxmXJ4UDm5k8UqM5F
         YGbA==
X-Gm-Message-State: APjAAAW4xGo/p1SDQeVgZLDsImrItedtV3AyaT9L/olS9dJcmWw2JMbr
        MJ4qFjVnMFmBmD/m2XZ6aRw=
X-Google-Smtp-Source: APXvYqy+STHovVAg2uN+u2fpKlestMnHiVz0Gd0nURyZwMPI2AUYaUSufxF8VKSILdeNFlqCJ2DKiQ==
X-Received: by 2002:a62:be01:: with SMTP id l1mr714053pff.236.1569293401293;
        Mon, 23 Sep 2019 19:50:01 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 31sm240901pgr.55.2019.09.23.19.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 19:50:00 -0700 (PDT)
Date:   Mon, 23 Sep 2019 19:49:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alex Levin <levinale@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: cherryview: restore Strago DMI workaround for all
 versions
Message-ID: <20190924024958.GA229906@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is essentially a revert of:

e3f72b749da2 pinctrl: cherryview: fix Strago DMI workaround
86c5dd6860a6 pinctrl: cherryview: limit Strago DMI workarounds to version 1.0

because even with 1.1 versions of BIOS there are some pins that are
configured as interrupts but not claimed by any driver, and they
sometimes fire up and result in interrupt storms that cause touchpad
stop functioning and other issues.

Given that we are unlikely to qualify another firmware version for a
while it is better to keep the workaround active on all Strago boards.

Reported-by: Alex Levin <levinale@chromium.org>
Fixes: 86c5dd6860a6 ("pinctrl: cherryview: limit Strago DMI workarounds to version 1.0")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 03ec7a5d9d0b..bf049d1bbb87 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1513,7 +1513,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_Strago"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
 		},
 	},
 	{
@@ -1521,7 +1520,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Setzer"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
 		},
 	},
 	{
@@ -1529,7 +1527,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Cyan"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
 		},
 	},
 	{
@@ -1537,7 +1534,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Celes"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
 		},
 	},
 	{}
-- 
2.23.0.351.gc4317032e6-goog


-- 
Dmitry
