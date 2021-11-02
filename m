Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4796544335C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234809AbhKBQqt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbhKBQqs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:46:48 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6D4C06120E;
        Tue,  2 Nov 2021 09:11:50 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id w15so77757457edc.9;
        Tue, 02 Nov 2021 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z3xrx/IjdMfQoBfwXaJgW39HMolJDiqcY4GCUL8qxe8=;
        b=LXfIj2Z4WMpkea3nWTzGuHn0zasNZNcX6P8os0+i7/c8qIqUf70qkE7Sr9Q71TFqH0
         9ALKQHimQY1zh4nvtz9/cS4r8YVjSqpSXxs7QgJLp62R4y3sOtwktYJcWvv6rf7cEJy+
         cfd5nNe3YVCDpex4j3yvh+cn5FAU6Z7s+sZnUcBV8uuNRqeShzTEXw4o3dT4f0RJjJa3
         IDrVpFek1tD7RqJljLFWlavIQO0YrcSKAdqumdtbq6bBLRR//0v1pypI9dgCP+RSt0CH
         RSyeOuGxrnfyZFLAuzEO6lOyaKxLMIuKrQ+NLAK5YRddACJC/DfauhpxIRchJqU/Ma4B
         D/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=z3xrx/IjdMfQoBfwXaJgW39HMolJDiqcY4GCUL8qxe8=;
        b=MJYz2Oz2igjCSdxfjTp+DuHCSZC/ELOcPu68rwa9oe8g9uYH49CeoI0KKMVYwbCEeK
         76ykioMVxqcv1hwMg8OzZ8Nv2Hhp/VNiFL6vlUSvceJXuj0u92Wh0oD2YmjsrLkTdSoJ
         3jSWASc8r0FoPT3UiKgsBl8pbS9qM24lDPmCqZnDGuBjalfFW9Q/Bu9pgVo1MyObbZ0P
         Cn5oejreqVDK2EVDjBg5wBENW1qMaGQ0n+s0WvkKDGxTf99kb17HadCWBGiE5vN4AFoY
         nwfcpQP0KuhlZOh9/UIs8reI8biBuE+Y5mWHqDQ+uHgCAEFcOXfMIUsiW0CEwGs0uQ6g
         ecOQ==
X-Gm-Message-State: AOAM532RxXTkrRchkgsY3mAgzzqhimjZMEpUVpDRqtQZPYbSBzIe2H0q
        4vaaSSvE8rRGxkcjmly+sMU=
X-Google-Smtp-Source: ABdhPJyovKza913KPMbj0Md2JTDAPXlRSDUZ9UAcHWnMSQ/TZMe5pgyFBG1YPDmyjHNj+AmITMpPPQ==
X-Received: by 2002:a05:6402:da:: with SMTP id i26mr52392928edu.207.1635869507694;
        Tue, 02 Nov 2021 09:11:47 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:11:47 -0700 (PDT)
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
Subject: [PATCH v3 01/16] RISC-V: Add StarFive SoC Kconfig option
Date:   Tue,  2 Nov 2021 17:11:10 +0100
Message-Id: <20211102161125.1144023-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add StarFive Kconfig option to select SoC specific and common drivers
required for these SoCs. Select subsystems required to boot so the
required drivers gets enabled by default.

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

