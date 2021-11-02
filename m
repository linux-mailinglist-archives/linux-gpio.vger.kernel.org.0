Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2708D443370
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbhKBQqx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234719AbhKBQqs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:46:48 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BDDC061239;
        Tue,  2 Nov 2021 09:12:07 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z20so78247790edc.13;
        Tue, 02 Nov 2021 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6oChZexBEmg8WI6ndsB5CJakRHDalhGMyW/tZtwb938=;
        b=CSQu+c6XJ4HC0m0lZYLU7Mx4nM7OgTqV9JwueDBcTBjvnKXGS+F/DYFBFwDLSMzt4Y
         9JL1FX5cXyElKUOQ+K9kFe8NXCv+FzZBwdEGRL+e14D3d2xFunWrjGfqLS9u10vYGRJ0
         huFtRvcf08YqwDCV49oAa0YaQKaVWK4pL1WDggTYR59IvC9icz9GzW+mVza4dq38glsB
         374ooxSyPWUWvMl9Kc6z6gNfoudslieJYCaCRruwcGUkYUqYi6encphKnzgYj4Fb44hh
         KRF0CaLF//10/he2VKMEhIx/xnRHq26zpHYt0UT6cUxv2drM/v6mi1OLdUxcaTwnBFNH
         BtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6oChZexBEmg8WI6ndsB5CJakRHDalhGMyW/tZtwb938=;
        b=WWhwh8AVRc9oysj+RfASgc2yI26NWqgglU8hIg526S3YKZgM8YqjrsmeSQsOUUKXzN
         pLXv7W2PtuPuBv1EUW1rzoabcuJz0EqIoHxHru1defWG8R6Wx2BY8pRU1+RQe9PqZPpe
         OWv1IS6njV7P2BurCxyh0QJobd8lgH7VtnfHlvOp6NUKdC0N8B605cEHS2ohVLLyBNia
         KlE6FIcfxMrIiUBlKDhcfTV8YlKT/ey4zKiQNWEDEQ9JSYJmxlvfPGPslrfdA5Y/hFRk
         FLEKz6QsSqdeEIT6NHie8OFuHXMCqWdKoE1hsBhGkUNMdpaKNwF4CkltutvetivYGmqt
         cHpA==
X-Gm-Message-State: AOAM533gXx03K/B5udQEx6hwIBDy211f4gMeyuYEu6WpWrB383fW6Cpj
        R70Id6cu898LcjX7/WyM1gE=
X-Google-Smtp-Source: ABdhPJzCcM1ilYetQYchEbynzYayVj4dcnnIvN2Lr2gg/jgfWC+GfAtxp+cw9X1a2VGUZ28otSthzw==
X-Received: by 2002:a17:906:6403:: with SMTP id d3mr44714597ejm.37.1635869526247;
        Tue, 02 Nov 2021 09:12:06 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:12:05 -0700 (PDT)
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
Subject: [PATCH v3 14/16] serial: 8250_dw: Add StarFive JH7100 quirk
Date:   Tue,  2 Nov 2021 17:11:23 +0100
Message-Id: <20211102161125.1144023-15-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On the StarFive JH7100 RISC-V SoC the UART core clocks can't be set to
exactly 16 * 115200Hz and many other common bitrates. Trying this will
only result in a higher input clock, but low enough that the UART's
internal divisor can't come close enough to the baud rate target.
So rather than try to set the input clock it's better to skip the
clk_set_rate call and rely solely on the UART's internal divisor.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/tty/serial/8250/8250_dw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 53f57c3b9f42..1769808031c5 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -414,6 +414,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 
 		if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
 			p->serial_out = dw8250_serial_out38x;
+		if (of_device_is_compatible(np, "starfive,jh7100-uart"))
+			p->set_termios = dw8250_do_set_termios;
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
 		p->iotype = UPIO_MEM32;
@@ -696,6 +698,7 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "cavium,octeon-3860-uart" },
 	{ .compatible = "marvell,armada-38x-uart" },
 	{ .compatible = "renesas,rzn1-uart" },
+	{ .compatible = "starfive,jh7100-uart" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
-- 
2.33.1

