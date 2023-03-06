Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6666AD2E4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 00:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjCFXid (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 18:38:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCFXid (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 18:38:33 -0500
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF09838B63
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 15:38:31 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id ffb50c32-bc77-11ed-abf4-005056bdd08f;
        Tue, 07 Mar 2023 01:38:29 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Tue, 7 Mar 2023 01:38:29 +0200
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 03/13] pinctrl: Add sysfs support
Message-ID: <ZAZ5df3IyJdSe6Rg@surfacebook>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mon, Mar 06, 2023 at 09:00:04AM +0000, Biju Das kirjoitti:
> Add a simple sysfs interface to the generic pinctrl framework
> for configuring pins for output disable operation.
> 
> /sys/class/pinctrl/
>   `-- output-disable/
>       |-- configure    (w/o) ask the kernel to configure a pin group
>                              for output disable operation.
> 
>   echo "<group-name function-name 0 1>" > configure
> 
> The existing "pinmux-functions" debugfs file lists the pin functions
> registered for the pin controller. For example:
> 
>   function 0: usb0, groups = [ usb0 ]
>   function 1: usb1, groups = [ usb1 ]
>   function 2: gpt4-pins, groups = [ gpt4-pins ]
>   function 3: scif0, groups = [ scif0 ]
>   function 4: scif2, groups = [ scif2 ]
>   function 5: spi1, groups = [ spi1 ]
> 
> To configure gpt4-pins for output disable activation by user:
> 
>   echo "gpt4-pins gpt4-pins 0 1" > configure

...

> +static struct attribute *pinctrl_attrs[] = {
> +	&dev_attr_configure.attr,
> +	NULL,

No comma for a terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko


