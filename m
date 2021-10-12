Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0DD42A638
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237083AbhJLNoe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237234AbhJLNoV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:44:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AFCC061776;
        Tue, 12 Oct 2021 06:42:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i24so86003798lfj.13;
        Tue, 12 Oct 2021 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LvxmJqCnzTrLj1Lk8VsTVozn/1nTi8+XXqTdTbOzc7E=;
        b=gyS8mK9BeY9rImNNHupqoTLQ//AjDrjAg6RzBzZZlvCkN4qYhU9QtyfX3c8vv6Uh69
         HS58i1QObwOgsJPzeXA+F6CKpzOdn+Vwtjea9nSfisXp4sNLWoapXR9EZITycET/66E0
         uZNJAKSyg56wzyusFKZRMWZL6gk1p/U8L5UnHo9dO+DubBVzrsztu03Xp5WWkfUsHcyw
         zLgg9NQKkhQWMj33zIVse7FZvVHf4cIm4LDJQidZNjuIRYUqUx2tPcKFyN6goGOuNSlY
         9TOx4Egzz5w2rQBxf2JKP5XoMRktlPLQ4GBYOHEOt0FIDRGyNG9QeqEINuvLUMlIh9uw
         nZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=LvxmJqCnzTrLj1Lk8VsTVozn/1nTi8+XXqTdTbOzc7E=;
        b=RJoky+m7uYnB8vKGq1y7MMZoqeGJXVHIqF/UOgQ+rS7Tx3fPMOHWpaFmUU+3oBcjZ+
         COhSlzIiUcAibd6Ig6OXoW9f2OmFQB/1dLJ8Ne0GLFjJtVlwi8iHFpdsB67iPjcTEYoz
         AgCHgJLxsCiTv4Ga/sbCdn6LU/Wi9htRaQ1Dm4eN/pGa9AsW3kxnUVve/3UGvEZaEyZI
         NsjPAvX3rEnIAKTFH3ABMDo+Of9nrjdQx5TdKwAnnyjUQP3YTZ4lQ6BkrxYK0vCU/d12
         qr4iDfBOoGL+5/tZc8CHOe0MPWjFMIEO5Jp7odHbq5f8V4BJgVm6CDKd33urZRQYq6zv
         f+Tg==
X-Gm-Message-State: AOAM531ymb87takEWkpPB8EKLUO2I7Jh2uZgokkm0JYu4S8LYojYJ5bH
        gcmWB84I+v18AViDChCPEA0=
X-Google-Smtp-Source: ABdhPJwMquktNt2X9WrmpAzx7SS52yV8JYLyAzxa4lRbFyIoobAtJtzqqhKD2ufoWHalRzQYNF+Jxg==
X-Received: by 2002:a19:6742:: with SMTP id e2mr4264528lfj.568.1634046137382;
        Tue, 12 Oct 2021 06:42:17 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:42:16 -0700 (PDT)
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
Subject: [PATCH v1 14/16] serial: 8250_dw: Add skip_clk_set_rate quirk
Date:   Tue, 12 Oct 2021 15:40:25 +0200
Message-Id: <20211012134027.684712-15-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On the StarFive JH7100 SoC the uart core clocks can't be set to exactly
16 * 115200Hz and many other common bitrates. Trying this will only
result in a higher input clock, but low enough that the uart's internal
divisor can't come close enough to the baud rate target. So rather than
try to set the input clock it's better to rely solely on the uart's
internal divisor.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/tty/serial/8250/8250_dw.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a3a0154da567..dee26c0909fd 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -51,6 +51,7 @@ struct dw8250_data {
 
 	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
+	unsigned int		skip_clk_set_rate:1;
 };
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
@@ -334,21 +335,23 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	long rate;
 	int ret;
 
-	clk_disable_unprepare(d->clk);
-	rate = clk_round_rate(d->clk, newrate);
-	if (rate > 0) {
-		/*
-		 * Premilinary set the uartclk to the new clock rate so the
-		 * clock update event handler caused by the clk_set_rate()
-		 * calling wouldn't actually update the UART divisor since
-		 * we about to do this anyway.
-		 */
-		swap(p->uartclk, rate);
-		ret = clk_set_rate(d->clk, newrate);
-		if (ret)
+	if (!d->skip_clk_set_rate) {
+		clk_disable_unprepare(d->clk);
+		rate = clk_round_rate(d->clk, newrate);
+		if (rate > 0) {
+			/*
+			 * Premilinary set the uartclk to the new clock rate so
+			 * the clock update event handler caused by the
+			 * clk_set_rate() calling wouldn't actually update the
+			 * UART divisor since we about to do this anyway.
+			 */
 			swap(p->uartclk, rate);
+			ret = clk_set_rate(d->clk, newrate);
+			if (ret)
+				swap(p->uartclk, rate);
+		}
+		clk_prepare_enable(d->clk);
 	}
-	clk_prepare_enable(d->clk);
 
 	p->status &= ~UPSTAT_AUTOCTS;
 	if (termios->c_cflag & CRTSCTS)
@@ -418,6 +421,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		}
 		if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
 			p->serial_out = dw8250_serial_out38x;
+		if (of_device_is_compatible(np, "starfive,jh7100-uart"))
+			data->skip_clk_set_rate = true;
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
 		p->iotype = UPIO_MEM32;
@@ -700,6 +705,7 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "cavium,octeon-3860-uart" },
 	{ .compatible = "marvell,armada-38x-uart" },
 	{ .compatible = "renesas,rzn1-uart" },
+	{ .compatible = "starfive,jh7100-uart" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
-- 
2.33.0

