Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AC1436983
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbhJURqk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbhJURp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:45:29 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA780C061764;
        Thu, 21 Oct 2021 10:42:52 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w14so4151840edv.11;
        Thu, 21 Oct 2021 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ptUclAnClC/KmmGAr8nhcG6uMjRIYcBreeo6zNMjNJc=;
        b=FiKMgfWfdrsa0xi5VdPw2NT4Bn8OpRhZ+z70WsyehhOS6AA2ALCaezW4CeeQ9qymZP
         C2YvNEttXHPUeTLJhvR/QKgDx3j216qhepTFWRGYbVmoklBqi+W5hSOeXpunSOkrkkE0
         OHwEOgq6u6I5YinCiutlKNLpF6bTRst4ugRzdat/x0d4w2+ARfjaMWOLMDikLTQmXMhs
         5vwiZkC4WnieND7MBasl0SQsyYMvE52NtxK//G5o2vXzS4sI1cEjEuWdnPox3CbHl5Zg
         mpyIdwsTZfmVD05xKP9OLYNthwRrHpcNyd4k5yI/ZMaXspXfSOUl+1AjjBCMUVq+jMCD
         7tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ptUclAnClC/KmmGAr8nhcG6uMjRIYcBreeo6zNMjNJc=;
        b=39AX9b3qQGiqByX0OFY47Sg44XIhS6+9g4dRBVLJ0wQbkJ7WhHwwngSvTPQfCA2cLg
         x5N8/JeohHm/4l+FsubLLTWG1QciniCJqWDISWFjfDGa5oG0gWI1DWW0eVqbgZ5IlIgZ
         tPtEtOSUe8Xm8NJPzzA0a7jEAeWH1XIt9Ab0WXUVqIAlfB7ZSGHWXuKX8/ohfdPn6/Dl
         GvdV9u9ZRCXisHys+UjG2Qyeb71roL6GMopfUyb6I0JRwgxrgFCUykDzBpYvZGgQBKv7
         kdMJRkCB/u2+4HBvLlJIM1EAjQz1H8CS0bJPmTiH30EIQ1irhQJKgn6jRRZiFtHdHbw6
         zebA==
X-Gm-Message-State: AOAM533j3i/5VyzpDW3O69KN6AqnQ2isTP6P3KdZvoez9wDBlPW7yhzy
        jIN9FqilE1935E4ucvHYzZQ=
X-Google-Smtp-Source: ABdhPJxw1sr2kfslrBtVHwBTMLw4gwFvfBhTBLh5oy3bCtzzxStQUaZw8hqDK+w6uOA4Vd/XkfmxzQ==
X-Received: by 2002:aa7:d14b:: with SMTP id r11mr9596878edo.173.1634838171073;
        Thu, 21 Oct 2021 10:42:51 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:50 -0700 (PDT)
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
Subject: [PATCH v2 14/16] serial: 8250_dw: Add skip_clk_set_rate quirk
Date:   Thu, 21 Oct 2021 19:42:21 +0200
Message-Id: <20211021174223.43310-15-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On the StarFive JH7100 SoC the UART core clocks can't be set to exactly
16 * 115200Hz and many other common bitrates. Trying this will only
result in a higher input clock, but low enough that the UART's internal
divisor can't come close enough to the baud rate target. So rather than
try to set the input clock it's better to rely solely on the UART's
internal divisor.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/tty/serial/8250/8250_dw.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 5a2ff843ec5d..729b59b14ff1 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -50,6 +50,7 @@ struct dw8250_data {
 	struct reset_control	*rst;
 
 	unsigned int		skip_autocfg:1;
+	unsigned int		skip_clk_set_rate:1;
 	unsigned int		uart_16550_compatible:1;
 };
 
@@ -326,14 +327,18 @@ dw8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 		pm_runtime_put_sync_suspend(port->dev);
 }
 
-static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
-			       struct ktermios *old)
+static void dw8250_do_clk_set_rate(struct uart_port *p, struct ktermios *termios)
 {
-	unsigned long newrate = tty_termios_baud_rate(termios) * 16;
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
+	unsigned long newrate;
 	long rate;
 	int ret;
 
+	if (d->skip_clk_set_rate)
+		return;
+
+	newrate = tty_termios_baud_rate(termios) * 16;
+
 	clk_disable_unprepare(d->clk);
 	rate = clk_round_rate(d->clk, newrate);
 	if (rate > 0) {
@@ -349,7 +354,12 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 			swap(p->uartclk, rate);
 	}
 	clk_prepare_enable(d->clk);
+}
 
+static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
+			       struct ktermios *old)
+{
+	dw8250_do_clk_set_rate(p, termios);
 	dw8250_do_set_termios(p, termios, old);
 }
 
@@ -417,6 +427,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 
 		if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
 			p->serial_out = dw8250_serial_out38x;
+		if (of_device_is_compatible(np, "starfive,jh7100-uart"))
+			data->skip_clk_set_rate = true;
 
 	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
 		p->iotype = UPIO_MEM32;
@@ -699,6 +711,7 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "cavium,octeon-3860-uart" },
 	{ .compatible = "marvell,armada-38x-uart" },
 	{ .compatible = "renesas,rzn1-uart" },
+	{ .compatible = "starfive,jh7100-uart" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
-- 
2.33.1

