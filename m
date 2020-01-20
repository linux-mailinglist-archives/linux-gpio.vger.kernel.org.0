Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90084142C0A
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 14:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgATN0P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 08:26:15 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:54619 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgATN0P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 08:26:15 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 805063C04C1;
        Mon, 20 Jan 2020 14:26:12 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0WEtl-NDxPMY; Mon, 20 Jan 2020 14:26:07 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 5FC4E3C00C5;
        Mon, 20 Jan 2020 14:26:07 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 20 Jan
 2020 14:26:07 +0100
Date:   Mon, 20 Jan 2020 14:26:07 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v4 0/5] gpio: Add GPIO Aggregator
Message-ID: <20200120132607.GB24951@lxhi-065.adit-jv.com>
References: <20200115181523.23556-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200115181523.23556-1-geert+renesas@glider.be>
X-Originating-IP: [10.72.93.66]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Wed, Jan 15, 2020 at 07:15:18PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> GPIO controllers are exported to userspace using /dev/gpiochip*
> character devices.  Access control to these devices is provided by
> standard UNIX file system permissions, on an all-or-nothing basis:
> either a GPIO controller is accessible for a user, or it is not.
> Currently no mechanism exists to control access to individual GPIOs.
> 
> Hence this adds a GPIO driver to aggregate existing GPIOs, and expose
> them as a new gpiochip.  This is useful for implementing access control,
> and assigning a set of GPIOs to a specific user.  Furthermore, this
> simplifies and hardens exporting GPIOs to a virtual machine, as the VM
> can just grab the full GPIO controller, and no longer needs to care
> about which GPIOs to grab and which not, reducing the attack surface.
> 
> Recently, other use cases have been discovered[1]:
>   - Describing simple GPIO-operated devices in DT, and using the GPIO
>     Aggregator as a generic GPIO driver for userspace, which is useful
>     for industrial control.

As per comments and test results in [*] (accidentally attached to v3):

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

[*] https://lore.kernel.org/linux-renesas-soc/20200120121439.GA24951@lxhi-065.adit-jv.com/
    ("Re: [PATCH v3 0/7] gpio: Add GPIO Aggregator/Repeater")

-- 
Best Regards,
Eugeniu Rosca
