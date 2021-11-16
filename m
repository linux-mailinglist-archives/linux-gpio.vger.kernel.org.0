Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BED453526
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238159AbhKPPIl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237858AbhKPPHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:07:17 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B9DC06122A;
        Tue, 16 Nov 2021 07:02:24 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id e3so52796349edu.4;
        Tue, 16 Nov 2021 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pprlQQrC3e4SR43dlURXybUN17p6YfB+zpLDI5SbPMo=;
        b=Ihg2ksTlUfZMj2Xi4GUUAqtc7R5Kf8Oh833r/M1+6NwUDNPDVkV1IvkoyzvaoJkOGH
         7htZt2TN4YvCdsRRa8dcj+9eKk7xFFjWu8eELhNsLqGAIWsw4XUcRfaxyoV3b50YIZHP
         ovXfZgvJlvgrENvNoLGBRBH4IfByp2ZKKyZcQJjWsTRRmDmGJreHltD6pAsKIc5ynfhn
         yYejvbFEQ3LLeC2b9jew0MOLPsnTqpvnJiumS1Fizq4jrJun8MKf4fDGSgiHVeK+Yy1q
         jScCO+SFRuLjY8dcw99PH5yAkjhCWlTQSLqwfdu3q3HT08nFkn13pi36jK1G2Ft0MPxd
         FHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=pprlQQrC3e4SR43dlURXybUN17p6YfB+zpLDI5SbPMo=;
        b=fAQ/tAO7+02fteC/ICa8sUxNZ57ASFqhhysvCB4cb/s2vN0P5pPq6CwEPq7YBQfPPv
         biKCFKW9gDagE3wBV6PSxUjHLqaZmtL3QriXwwk70ryzlt9GDUNFNEYfdNbFYohiqRqq
         fvXqNe78Q/Du/OAIMCqpCiqPNmwBmBRuPaRAj6QluXR6YXJy+t0YZQqIe5nJMzBj5yYC
         1xrm652/2w/t63lfi449rct0kqBXsHyYxeAzbwGVjiRimrEAw2hqwyvLmzoXF5RoJDTY
         Pfce6oGWMyyoYyb8ZMuK8HG/pDsilOX+8CKu29/KMLf+hehtqbT8aIgYH/lAH4/TO/hI
         X7IQ==
X-Gm-Message-State: AOAM531jCNsJ8zbcYCpo9B95vHF7t3rFbNTu/6bwoJXabWj1x6z6UL7R
        ScIJO//pHK0AZxRXQ/ub2qs=
X-Google-Smtp-Source: ABdhPJwRgX8E9uRvMmlHIDeM54xPkwChrHpz2rq7KpOqT3ij+uMWBF5Hl3T5cQbXnKSNpsSqfkll0w==
X-Received: by 2002:a17:906:b51:: with SMTP id v17mr11014072ejg.262.1637074940749;
        Tue, 16 Nov 2021 07:02:20 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:02:20 -0800 (PST)
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
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 14/16] serial: 8250_dw: Add StarFive JH7100 quirk
Date:   Tue, 16 Nov 2021 16:01:17 +0100
Message-Id: <20211116150119.2171-15-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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

