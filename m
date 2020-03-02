Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7240C175645
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 09:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgCBIrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 03:47:31 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57127 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbgCBIrb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 03:47:31 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j8gjZ-0000kI-Rz; Mon, 02 Mar 2020 09:47:29 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j8gjY-0002Mv-G8; Mon, 02 Mar 2020 09:47:28 +0100
Date:   Mon, 2 Mar 2020 09:47:28 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Romain Izard <romain.izard.pro@gmail.com>,
        Linux GPIO List <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: GPIOs not correctly exported via sysfs on ATSAMA5D2
Message-ID: <20200302084728.n7rblgkqlfiscjgx@pengutronix.de>
References: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
 <20200228123910.hbf2bnk3w2dbishr@M43218.corp.atmel.com>
 <CACRpkdYKemE6+OkWOWqOAqzaVEDNE9id+P_XRFaNzWs8N6c7mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYKemE6+OkWOWqOAqzaVEDNE9id+P_XRFaNzWs8N6c7mw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 28, 2020 at 02:36:11PM +0100, Linus Walleij wrote:
> On Fri, Feb 28, 2020 at 1:39 PM Ludovic Desroches
> <ludovic.desroches@microchip.com> wrote:
> 
> > The AT91 PIO4 pinctrl driver doesn't implement gpio_request_enable()
> > contrary to the AT91 PIO pinctrl driver. If we implement it, then you
> > would be able to change the pin muxing and configuration from the sysfs.
> > The issue is nothing prevent you do this and so to possibly break a
> > device.
> >
> > There is the strict pinmux_ops property which prevents from this
> > situation. The side effect is that we must not declare a pinmux/conf for
> > a GPIO so all the DT files have to been updated. That's not a big deal,
> > the problem is, at that time, the GPIO subsystem didn't allow to set the
> > bias for instance. It may have changed but not sure it covers all the
> > possible configurations we have from the pinmuxing subsystem.
> 
> Yes and Russell also points very clearly to the root of the problem:
> 
> - Some pin multiplexers are non-strict meaning a line can be used
>   for say GPIO and something else (such as SDIO) at the same time.
>   Usually this is an observation from electronics, such that the GPIO
>   input register will always report the logical state on the line whether
>   it is in "gpio mode" or something else, making it possible to snoop
>   the line, or, as in the I2C case, it is perfectly fine to, without glitches,
>   pull the line out of other use cases and into the GPIO realm and do
>   GPIO things such as bus recovery actively driving the line despite
>   it being connected in the mux to SDIO or I2C at the same time.
> 
> - At the same time some system designers and driver authors are
>   driven by the ambition to create a system that is simple, has no
>   exceptions and has a clear separation of concerns, making it
>   impossible for the user - even a kernel developer or real savvy
>   hacker playing around with the deprecated sysfs ABI - to shoot
>   themselves in the foot. These are ambitious and admirable people
>   that want to protect their users and make it easy to do the right
>   thing. So they sort everything out and flag their pin multiplexers
>   as "strict", allowing only one use case at the time: this device is
>   either I2C or SDIO.
> 
> Personally I am not flagging any of my drivers strict because I'm
> just a pragmatist and don't use the system architect type of reasoning
> much in what I do. But it is admittedly a matter of taste. The flag
> "strict" tells you something about the driver author's values and
> ambition.

This points out another problem: Drivers behave differently in an area
where there is no technical need. So people are surprised which is a bad
thing. For me giving a gpio/pinctrl driver maintainer the freedom to
label the device as "strict" or not is similar to putting policy in the
kernel which is frowed for.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
