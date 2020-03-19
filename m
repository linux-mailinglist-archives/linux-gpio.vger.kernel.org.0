Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7370818C1F8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 21:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgCSUz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 16:55:56 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34336 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgCSUz4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 16:55:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id s13so4162094ljm.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2020 13:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=4LVcNsetpkvMaOaEOSO/3EjRKHYLp8VED4Jf+MqhjiA=;
        b=pwdmw4K3pYYDED1XgBEmBvdEURFAWAjGEYflQRe9HK/+VKUk/t+6LRgIpwjnhNAb42
         qxtR3a49no36XgVkf5W01njNmn3lvszfFUueEB7nNve/UN3BqDWrZlQeJujTpbN8q3K1
         IyZio98fOVuTTDkVwcZ5d6honINdl3zbCE8L/YGji4qDWqaO432CCo/H+GBO4WFmZiOj
         NpmK37B5yHS80psYh2XGuoP0RFtTHBJqSvDYMX/Abo2Rx9ouwJESADNwC31/74MOvhQj
         OOuODADRLYOeMW+VnemMiJabqY73x9OKdhs1d4BGiTk5Qy+dMwPK7XOLHJtJdeKVw4wo
         183w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=4LVcNsetpkvMaOaEOSO/3EjRKHYLp8VED4Jf+MqhjiA=;
        b=VzE9s0yEsWWKrsrcV7Vw8lSgZE/BRorz9wNjUV5HaaI1xUQ+Yccyr21DJpUtx6n500
         3VF/RQXmO2qOtID189nxR/yYwXYPk0fr+6mJfEqsMGJNMKc81v41rObJ7CjoT0ZBg25x
         u7xcnvTKpvSIfEso1ba1o3N3ui8awgkd/jhlUjeAGk/l3YYoViCqxeHlgVQyxs+BuQm+
         EgXROJTgW5y/Qmk2HpJ0S62/SNrX84A3o7u96W9Yh/37il8jsnYuVteCrDFBDfhObAn8
         B95vJESvhSvifUgKThUBZxsuatdBsQo6W2cW1bhJ/nZvoAuewLyTn4wHCnwsbK6fslPT
         cjIA==
X-Gm-Message-State: ANhLgQ30RXBaIOCLsfW8cSfi7cnmow0uOJGRX6jDNe+sjC/QTjtvThbM
        9cXZEH44H/rRPsGMvYiDepZ8xz0Z
X-Google-Smtp-Source: ADFU+vtVFEPNA7j8xxHRcaPdmJuSHNtxBPKaJ4S7Pj13laSWVW+FleeSM8ZUGyyDc+Nbn/viqIpvxA==
X-Received: by 2002:a2e:b792:: with SMTP id n18mr3379082ljo.268.1584651354474;
        Thu, 19 Mar 2020 13:55:54 -0700 (PDT)
Received: from kbp1-lhp-F54859 ([77.47.205.181])
        by smtp.gmail.com with ESMTPSA id r23sm2114476lfi.89.2020.03.19.13.55.53
        for <linux-gpio@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 19 Mar 2020 13:55:54 -0700 (PDT)
Date:   Thu, 19 Mar 2020 22:55:53 +0200
From:   Mykyta Poturai <mykyta.poturai@gmail.com>
To:     linux-gpio@vger.kernel.org
Subject: [PATCH] Fix typo in gpio-utils
Message-ID: <20200319205553.GA9893@kbp1-lhp-F54859>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Mykyta Poturai <mykyta.poturai@gmail.com>
---
 tools/gpio/gpio-utils.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 53470de..0600378 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -17,7 +17,7 @@
 #include <linux/gpio.h>
 #include "gpio-utils.h"
 
-#define COMSUMER "gpio-utils"
+#define CONSUMER "gpio-utils"
 
 /**
  * doc: Operation of gpio
@@ -209,7 +209,7 @@ int gpiotools_gets(const char *device_name, unsigned int *lines,
 
 	ret = gpiotools_request_linehandle(device_name, lines, nlines,
 					   GPIOHANDLE_REQUEST_INPUT, data,
-					   COMSUMER);
+					   CONSUMER);
 	if (ret < 0)
 		return ret;
 
@@ -259,7 +259,7 @@ int gpiotools_sets(const char *device_name, unsigned int *lines,
 
 	ret = gpiotools_request_linehandle(device_name, lines, nlines,
 					   GPIOHANDLE_REQUEST_OUTPUT, data,
-					   COMSUMER);
+					   CONSUMER);
 	if (ret < 0)
 		return ret;
 
-- 
2.7.4

