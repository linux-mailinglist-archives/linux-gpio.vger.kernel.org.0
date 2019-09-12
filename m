Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C82B0B0C41
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 12:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730987AbfILKHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 06:07:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47641 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730450AbfILKHC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 06:07:02 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1i8M08-0000kf-G0; Thu, 12 Sep 2019 12:06:56 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1i8M07-00077t-7R; Thu, 12 Sep 2019 12:06:55 +0200
Date:   Thu, 12 Sep 2019 12:06:55 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC] gpio: define gpio-init nodes to initialize pins
 similar to hogs
Message-ID: <20190912100655.jucqrh2jaf6vgwm2@pengutronix.de>
References: <20190909105919.30418-1-u.kleine-koenig@pengutronix.de>
 <CACRpkdZTzYtxjmiEnbvSn0-WQtxADLrxJGb_Q83gtRFhcShRiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZTzYtxjmiEnbvSn0-WQtxADLrxJGb_Q83gtRFhcShRiQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 12, 2019 at 10:05:23AM +0100, Linus Walleij wrote:
> On Mon, Sep 9, 2019 at 11:59 AM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> 
> > Sometimes it is handy to be able to easily define a "safe" state for a
> > GPIO. This might for example be used to ensure that an ethernet phy is
> > properly reset during startup or just that all pins have a defined state
> > to minimize leakage current. As such a pin must be requestable (and
> > changable) by a device driver, a gpio-hog cannot be used.
> >
> > So define a GPIO initializer with a syntax identical to a GPIO hog just
> > using "gpio-init" as identifier instead of "gpio-hog".
> >
> > The usage I have in mind (and also implemented in a custom patch stack
> > on top of barebox already) is targeting the bootloader and not
> > necessarily Linux as such an boot-up initialisation should be done as
> > early as possible.
> >
> > Not-yet-signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >
> > maybe it also makes sense to use "gpio-safe"? Maybe it (then) makes
> > sense to reset the gpio in the indicated state after it is released?
> >
> > Also it might be beneficial to make the wording more explicit in the
> > description and for example tell that only one of gpio-hog and gpio-init
> > must be provided.
> 
> It's no secret that I am in favor of this approach, as I like consistency
> with the hogs.
> 
> The DT people have been against, as they prefer something like an
> initial array of values akin to gpio-names IIRC. But this is a good
> time for them to speak up.

To be fair, I added them to Cc:. For the new readers: The diff I
suggested looks as follows (probably whitespace broken as I cut-n-pasted):

> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index a8895d339bfe..5b7883f5520f 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -182,13 +182,16 @@ gpio-controller@00000000 {
>                 "poweroff", "reset";
>  }
> 
> -The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> -providing automatic GPIO request and configuration as part of the
> -gpio-controller's driver probe function.
> +The GPIO chip may contain GPIO hog and init definitions. GPIO hogging is a
> +mechanism providing automatic GPIO request and configuration as part of the
> +gpio-controller's driver probe function. An GPIO initializer is similar but
> +doesn't prevent later requesting and reconfiguration.
> 
>  Each GPIO hog definition is represented as a child node of the GPIO controller.
>  Required properties:
>  - gpio-hog:   A property specifying that this child node represents a GPIO hog.
> +- gpio-init:  A property specifying that this child node represents a GPIO
> +              initializer.
>  - gpios:      Store the GPIO information (id, flags, ...) for each GPIO to
>                affect. Shall contain an integer multiple of the number of cells
>                specified in its parent node (GPIO controller node).

How would this alternate approach look like? Something like:

	gpio-controler@123450 {
		compatible = "..";
		gpio-controller;
		#gpio-cells = <2>;

		init = "", "output-high", "", "input", "", "", "output-low";
	};

? Compared to the solution I suggested (and hogs) this differs as you cannot
pass flags like GPIO_ACTIVE_LOW.

(Sidenode: As

	mygpio {
		gpio-hog;
		gpios = <5 GPIO_ACTIVE_LOW>;
		output-low;
	};

makes AFAIK the output high it would be less surprising if the binding
supported "output-active" and "output-inactive".)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
