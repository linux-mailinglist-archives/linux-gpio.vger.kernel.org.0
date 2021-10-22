Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A404377C0
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 15:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhJVNOl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 09:14:41 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:40386 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhJVNOk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:14:40 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 Oct 2021 09:14:39 EDT
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4HbPjx4cbRz1qwy7;
        Fri, 22 Oct 2021 15:06:13 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4HbPjx1ZvWz1qqkB;
        Fri, 22 Oct 2021 15:06:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 47iEcBUIACYB; Fri, 22 Oct 2021 15:06:11 +0200 (CEST)
X-Auth-Info: pHCxIG/3Fn8LyBofwRXxdTnAKN2ei9mTIkWXITidtoTB3gneygtKBg6A1vL4R5zg
Received: from igel.home (ppp-46-244-166-255.dynamic.mnet-online.de [46.244.166.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 22 Oct 2021 15:06:11 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 914BC2C19B9; Fri, 22 Oct 2021 15:06:10 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
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
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
References: <20211021174223.43310-1-kernel@esmil.dk>
        <20211021174223.43310-10-kernel@esmil.dk>
X-Yow:  ..  Should I get locked in the PRINCIPAL'S OFFICE today --
 or have a VASECTOMY??
Date:   Fri, 22 Oct 2021 15:06:10 +0200
In-Reply-To: <20211021174223.43310-10-kernel@esmil.dk> (Emil Renner Berthing's
        message of "Thu, 21 Oct 2021 19:42:16 +0200")
Message-ID: <8735otjjjx.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Okt 21 2021, Emil Renner Berthing wrote:

> +config RESET_STARFIVE_JH7100
> +	bool "StarFive JH7100 Reset Driver"
> +	depends on SOC_STARFIVE || COMPILE_TEST

Why does it need to depend on SOC_STARFIVE?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
