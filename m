Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4761543695B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbhJURoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbhJURow (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:44:52 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF548C061570;
        Thu, 21 Oct 2021 10:42:34 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id u13so4087608edy.10;
        Thu, 21 Oct 2021 10:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Nc7eYDAVKl1lXgjP3Tic4vXvSlms1XomYDkZojHGsM=;
        b=L76PHccrIcJICu9Yfl04l7xaf6PbHFbYP8OArMjdks2a43UQb9ILNGpqF5t//xn4ty
         wjydOwd41fnx+GDJEHLsoOLsc9sp3VBoUMs8AZFNHSX2U+8v8MiZYWOcnRZG537icPQC
         rcvbxhnNMye/6+BuLdaebOuUU17DLrLN5pa1sdCgsq3G4hmU6p5uSUzMWxFgBcwvAAhl
         xZSaec2bCFxx0mdKR7aaQTPU4NFXEhKrYvqAxUQSJThPSGrhLqtXSqMRfuuXdDKjJdJz
         Z6fV5zwP9UaWg0GObE46Sn31JtyXfggupOzz/Xsz1JExTlvHBXJkFFLELxGbzzHqfn7y
         BWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=3Nc7eYDAVKl1lXgjP3Tic4vXvSlms1XomYDkZojHGsM=;
        b=Zp21vRrcRbunK1ZKtxNLlc8G+uDs66MgXFPn8mAnYVg/eDra0JU/dVif9hshGGJfC6
         6uWIFF/pwpHdifzk0beiRdVcAJRxiOw9C+AstvWLZlrHlVJ5Tx3yNGMkNNRKbckFvIlv
         4QJUIRBMOCG2nStI2/F+rgVQXfSOOLh8yZMWfdeTTyoxaxUd8bnrHrd2ZL+6JAIUmSxZ
         xpiWUraLl60qm1eOeomXv2EzNk/pNwb0d7Yoj/dOzuBuad2u56KfiS7G9LKQ57ZPm78E
         3OP2qIWMS+2rBu6xIVs5He4k+2zTPV2YL+zjeH3G9uJayWQbReGll3R68An4auTIGreb
         /Wvw==
X-Gm-Message-State: AOAM533dKFKrk73kUq7qgyAgjqxP8PDmcIvoBKjgiD0JqWiT+WQqh4Kq
        KpqNAymNFJ0VoAwE4Qn07PM=
X-Google-Smtp-Source: ABdhPJxqA8SrFtSmHrnxkw4ADGVYl+b4TZbNr2qYu32HpC7pqRnMZoxJSJkvN3OXYOa34KR7brCp9Q==
X-Received: by 2002:a17:907:e9f:: with SMTP id ho31mr9171273ejc.156.1634838153407;
        Thu, 21 Oct 2021 10:42:33 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:33 -0700 (PDT)
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
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] RISC-V: Add StarFive SoC Kconfig option
Date:   Thu, 21 Oct 2021 19:42:08 +0200
Message-Id: <20211021174223.43310-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
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

