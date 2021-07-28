Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDEA3D8EB2
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235204AbhG1NNf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235301AbhG1NNe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:13:34 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71B4C061757
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 06:13:31 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y7so913204eda.5
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=P5D+fkJiHbPC+UmOrX5mf3Uz3yT6Q5RUQ0WhyYwj1ec=;
        b=FVsQMaPq3yNov3YDFEnRoXJUDbF9xgTpSiDgtuPvifvoq12IPfQaA26vmlR/rd/MRK
         GVvMNW+6OngCf3lx43nzytlakRQHO90DT7vW4E7w+3m3CabitrHUnzH01mFw3YAzMdlu
         HkXIYzQ8p6FtQCToVuTNqQkK5+TvcaznckFNlzKJ+SF9xfV+qt4pX1k3Pg2mCFDjPdjW
         CWJsa5WtisCH6wBGGqsYZtgNWwwJHZ91FnrnCOVlrATCwwtJQc7u5PJXwPrBByGdWU6w
         OECFvRS1hlYxIsNDTYeVVw7GOYx7ZE0E6wWv2vJ0yeowED3CqXxNZTM1gFvavjsmH3jI
         83iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=P5D+fkJiHbPC+UmOrX5mf3Uz3yT6Q5RUQ0WhyYwj1ec=;
        b=kQL/bnlKERFZ3qwJTQR0J/3R+PU8uRq1L2ouLS6WCZgl3R6DleqgAHU90bEQcgz0uS
         3jDL8kz42aG1PwIhWezDYQ/xSpiVKFOBeN8KLPvxrpiWTs/mWJ5gbqggvxS8VUnbF0P8
         kirReoGlYCFdBHEFtG/JDyYKGRPAK3U2Dd4KvzpVF/3jyH9D44rI4YKPY5lsykJu978/
         F7SwdVZ43TnZ3rp99/4ll7YG1y/5E0Fuz+k+cMQu8YpKskU1flsqo30tTi+a8c9StDqm
         2lzwa0L1LPivRB/U0juyrTcQVPjXhidaLISl7Xnt9DBQ1kfAbNmKpWCiChco+wHlGBhy
         2CBg==
X-Gm-Message-State: AOAM53261yMArvWXRl12h/P1kvMkv381oU4Pv4pYOpqeXQ0Ml9tXXxG3
        dGQdkG2RBVrC8yuOzuvCJYn9baAXQIHQJw==
X-Google-Smtp-Source: ABdhPJyeOalXo4tLDvbAa74YU2xk3qKPkv6zmAnwyScrIiV6Hb0sYxN75W3miCfdqf3nvBHRXH5Xvg==
X-Received: by 2002:a05:6402:35c8:: with SMTP id z8mr33594714edc.5.1627478010470;
        Wed, 28 Jul 2021 06:13:30 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id p23sm2661250edw.94.2021.07.28.06.13.29
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:13:30 -0700 (PDT)
Date:   Wed, 28 Jul 2021 15:13:28 +0200
From:   Ben Hutchings <ben.hutchings@mind.be>
To:     linux-gpio@vger.kernel.org
Subject: [PATCH libgpiod-v2] gpiomon: Fix format specifier for uint64_t
Message-ID: <20210728131327.GA14442@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

uint64_t might be defined as either unsigned long or unsigned long
long, depending on the architecture.  Values of this type should be
formatted with the specifier PRIu64 rather than "ld".

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 tools/gpiomon.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 2b5966c..df86a46 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -4,6 +4,7 @@
 #include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
+#include <inttypes.h>
 #include <limits.h>
 #include <poll.h>
 #include <signal.h>
@@ -95,10 +96,10 @@ static void event_print_custom(unsigned int offset, uint64_t timeout,
 				fputc('0', stdout);
 			break;
 		case 's':
-			printf("%ld", timeout / 1000000000);
+			printf("%"PRIu64, timeout / 1000000000);
 			break;
 		case 'n':
-			printf("%ld", timeout % 1000000000);
+			printf("%"PRIu64, timeout % 1000000000);
 			break;
 		case '%':
 			fputc('%', stdout);
@@ -129,7 +130,7 @@ static void event_print_human_readable(unsigned int offset,
 	else
 		evname = "FALLING EDGE";
 
-	printf("event: %s offset: %u timestamp: [%8ld.%09ld]\n",
+	printf("event: %s offset: %u timestamp: [%8"PRIu64".%09"PRIu64"]\n",
 	       evname, offset, timeout / 1000000000, timeout % 1000000000);
 }
 
-- 
2.20.1
