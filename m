Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A07CC565B5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 11:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfFZJeX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 05:34:23 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45758 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfFZJeX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 05:34:23 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so1438499lje.12
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nNULPPo1pytiTnB9LUAO1imuQlcD0ielaxAQ85XBVbE=;
        b=XSKfruIhE5IuNXcdl6XPdBh16DX8xF4TYgEmlxzqL8WuNo5kJXbgHMiuKVqt9AK859
         Y4O4uzGyaGlBFDqz9mxvR3vENa8EnonFWUyep2w3qrjTRpXew2McFObHLzrtmnex3A/i
         gHTpwE8fWEiHjOObkLa0BU1qv7SrFeHuv/HqMBL1EgnLxsfQfgvtcQTpApRz3blwO29V
         kq+cAsRENeBlO8kAPhEirNmswBd520duEmklXOCIbh1U7K2T+1NVFA79XgbW5+KBhQe6
         4Vz2lNHO7G/oUKXJ0Xsgd03ha6NbCI7c50fvB5k/Z34ihklkeFTMXdgPcZdXbou8MU+M
         M0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nNULPPo1pytiTnB9LUAO1imuQlcD0ielaxAQ85XBVbE=;
        b=bCAnIb9hXClhxwIOG4uBaMqawKwOIcAejCsoZ6gXi2MxpjrD911Ekh9JPu3NSlkYlV
         1Je6dc9S6NGOPIroQDOMSXbqXWEtUEzI1g+s0WR7VyTIBjEjsVi6izOS0ilrfmuJu7DK
         QrQufayR7iz5YdByBLONtpdpfz5fKFPNd9IiLLvaSa5NnAf2GkkCrwKbZKp37ITgteQL
         y6pTh3P8c2Sa01iRhfWXdPEsDL2SqxPlkHIvc8ptBPO6x2nl3GZ2XcG05jA2C+TRh4QT
         eOiY+vpxXrOXoYkpqJ78ulUdP/Om0wbtXIIH6AxIQir03q9uIlzKcUSv2d9OuIIHhaE4
         /h8w==
X-Gm-Message-State: APjAAAW0jVc8nlMY8V+emL7jzpiYyJD/FY/BP5hVp55daCZcaj1Dd/c6
        WTo7NdUF0wlS3vo5+irQBxSt1pEd2lw=
X-Google-Smtp-Source: APXvYqybXQ7NOhijs1GgPUzr0xlhe43QY3Xe/PVr6s+3IOsAViKoFViUi+DA51gRRMlVWsUn0cRTaA==
X-Received: by 2002:a2e:9192:: with SMTP id f18mr2298758ljg.52.1561541661333;
        Wed, 26 Jun 2019 02:34:21 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id z6sm2729660lfa.45.2019.06.26.02.34.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 02:34:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guan Xuetao <gxt@pku.edu.cn>
Subject: [PATCH] unicore: Drop pointless include
Date:   Wed, 26 Jun 2019 11:34:18 +0200
Message-Id: <20190626093418.6263-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I can't see why this file includes <linux/gpio.h>, it is not
using any of the interfaces. Lots of things are named "gpio"
in the file but it is an irqchip driver and has nothing to
do with the GPIO interfaces.

Cc: Guan Xuetao <gxt@pku.edu.cn>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/unicore32/kernel/irq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/unicore32/kernel/irq.c b/arch/unicore32/kernel/irq.c
index eb1fd0030359..8385e4fc0ff6 100644
--- a/arch/unicore32/kernel/irq.c
+++ b/arch/unicore32/kernel/irq.c
@@ -24,7 +24,6 @@
 #include <linux/kallsyms.h>
 #include <linux/proc_fs.h>
 #include <linux/syscore_ops.h>
-#include <linux/gpio.h>
 
 #include <mach/hardware.h>
 
-- 
2.20.1

