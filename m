Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237B54534EC
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237934AbhKPPHg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:07:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237752AbhKPPGt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:06:49 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5641FC06120D;
        Tue, 16 Nov 2021 07:01:42 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id r11so25340077edd.9;
        Tue, 16 Nov 2021 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oPNzD5bnl2PSjk+0YD7yG3K2QwDiM6PZuu4dMQq39/o=;
        b=cnr4Q5xPkbuPm3TLXjaJ2pjkvnzKkt4NU88x+/c491rS++FKb3RZqLNVQvu9n/yjV3
         VK7ZtdcidYz39YXHe0ocRxUBjD0lICRI7sxrE812hF0ClH70z0z8ykOKGYwIXab4aze5
         o1pMSu2zgPs49PISgb1lSONbbu1Xdpyc9GRhpt1VYBWmNIpHXwIBdSjWuulEIxIdAvnl
         nC3mmLl8+1ShbIvWw72ZcCsnqEq5WEqK/+wr4sTsw895EkLFqdTZGG2ygm0D94ofWEmj
         XVfERyEpa2EyfXw8bCxEm+hEYdusum2J8aqoba234GJkRn+U7N7BRX9II7ny0zk75MHW
         uNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=oPNzD5bnl2PSjk+0YD7yG3K2QwDiM6PZuu4dMQq39/o=;
        b=kmiuZB3nRTtNrp2SWOiALeOSx8BRT/eqDWmeTEd9YcCql4bpKdgQEeW8ufUGw41T0v
         c/+iRT9WO/LIkbtybmZ8DfHRDjLVWUmknT3EaOsRe7CH9qzJqCykiUWwIArT+ZbKpK5N
         BmyNxfbdM+rcUmFMSPeUnQPBFj43dGIuHvb5OgPrEeffM6u3IFMrQXyKiET7W6f6Mg10
         tgjNH99hxhtOlMwjC5kWu5QndP736JzTcoY82spplahpXeIN4msOOWODYxVG4n79Bvai
         Aqpao/PIb+m73/4z4KvM3Y/vm0W8kMPDpn2wmeXWPEXk5Brm0h6vNeG9KtlomIUYLpr0
         iNqQ==
X-Gm-Message-State: AOAM532/IXjiEE/onNHzBmkEigJJX6d7gJO3FwvSjP1s9PA/uvGOn1Eg
        UBZ/riRPipG9sCkcAbdX2pA=
X-Google-Smtp-Source: ABdhPJx8vnoNqgZ/tAcT6WqmQrmmONNtGYsmXPHCLuY8u/9mSGV/N1UqNxsymAeGHieq0Ft7UMkVDQ==
X-Received: by 2002:a05:6402:27d3:: with SMTP id c19mr4587398ede.390.1637074899238;
        Tue, 16 Nov 2021 07:01:39 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:01:38 -0800 (PST)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/16] RISC-V: Add StarFive SoC Kconfig option
Date:   Tue, 16 Nov 2021 16:01:04 +0100
Message-Id: <20211116150119.2171-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add StarFive Kconfig option to select SoC specific and common drivers
required for these SoCs. Select subsystems required to boot so the
required drivers gets enabled by default.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 30676ebb16eb..6ec44a22278a 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -19,6 +19,14 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config SOC_STARFIVE
+	bool "StarFive SoCs"
+	select PINCTRL
+	select RESET_CONTROLLER
+	select SIFIVE_PLIC
+	help
+	  This enables support for StarFive SoC platform hardware.
+
 config SOC_VIRT
 	bool "QEMU Virt Machine"
 	select CLINT_TIMER if RISCV_M_MODE
-- 
2.33.1

