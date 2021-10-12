Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8776E42A5F8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237016AbhJLNnq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236854AbhJLNnn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:43:43 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BC7C061570;
        Tue, 12 Oct 2021 06:41:41 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y15so87957799lfk.7;
        Tue, 12 Oct 2021 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OUqIN3jc1B7BdFYR/xAZI4s+PXfJnAOSswOrC3XOxaI=;
        b=JX957KK70swcK0wo0oRZPHmqn1EqjQPunB5Xi190+LnnPvBt5EXaW4WYvIVkRRFQMk
         6vfZmlkECojgEAsIk8I6eTHCHuUZtqNpkzkSbP8NwHyErFVJ0auHbi7s8UbLjNKNowUn
         JnuOAh4FhmZfOJZ7RvEu8DJ6Esxn6VsV9eD8Mpk3FNDhD3GkeGvnt5mfnxwiDHFp4t7i
         ewmICEjsgCu8gXGrABq8+mIFf788Iz6/WgYTtvV2wBgt0v+e+BEnqhZSNJGuTZMt7j19
         s6TlVuSVH8k4POreUux2vCkj+lOSgIWpnV+qYkBbLWcxHS8K9qUe5NnV+/9mdm1GnBkM
         LV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=OUqIN3jc1B7BdFYR/xAZI4s+PXfJnAOSswOrC3XOxaI=;
        b=eTGBa+U5jfGGJC2EiRllI0dalS+h0uxW9jJ1tNQ/t6lCBUSZk095V6Bq9cE9/jVYus
         +FTbJSZbzLupGPUnMIARP1sS71lu2OVzDduPmskrrBb8bWe25QQP6ncK3C0eXAPYXQHc
         mja++oIh1ztPBz5hi2eiExY5mqhdKLzt3XxAEfd/u+kuE9Uexgea9pwFZ0oQ0UyzYoc3
         IVeHBnjFZ8GM8ZA4WQmtPJXtK74zGI0m6DcEwxBx1HCoixx8bC8T9rDLHdvDfthxntYQ
         l2WQ1gJyJ53ucE2PeI4bzjHBB/bbqx5nDuJZw0opm21moeH/4mLUPbKV+VrI3uCJIYC6
         Ov9w==
X-Gm-Message-State: AOAM531aFg5Cx3jbhowF9MhNH3g7/nIJ0jh3CwyG+rGjTvushh+U15gZ
        L3gFuOLUYQo6fnfLsbSZGw8=
X-Google-Smtp-Source: ABdhPJxl+/GExB5aaKfbaejroG2VgMWLxTTJdKqsHEHslti8Xgz78fqrcqYoelG3mgFGK0tT0M9eMQ==
X-Received: by 2002:a05:6512:32c5:: with SMTP id f5mr14915902lfg.340.1634046100219;
        Tue, 12 Oct 2021 06:41:40 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:41:39 -0700 (PDT)
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/16] RISC-V: Add StarFive SoC Kconfig option
Date:   Tue, 12 Oct 2021 15:40:12 +0200
Message-Id: <20211012134027.684712-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add StarFive Kconfig option to select SoC specific and common drivers
required for these SoCs.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 30676ebb16eb..725e9a1b1ab6 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -19,6 +19,14 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config SOC_STARFIVE
+	bool "StarFive SoCs"
+	select SERIAL_8250_DW
+	select SIFIVE_PLIC
+	select PINCTRL
+	help
+	  This enables support for StarFive SoC platform hardware.
+
 config SOC_VIRT
 	bool "QEMU Virt Machine"
 	select CLINT_TIMER if RISCV_M_MODE
-- 
2.33.0

