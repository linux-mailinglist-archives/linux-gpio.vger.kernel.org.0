Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77CAB173875
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 14:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgB1Ng0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 08:36:26 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39931 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgB1NgZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 08:36:25 -0500
Received: by mail-lj1-f193.google.com with SMTP id o15so3348684ljg.6
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=PjM/hgtHoBl4bAsCN0fGLfc9vPVEJId2LvZd0bmIOgA=;
        b=E42FALkmg1oBEFwoYmeIruDHjHIKf/NO6bpK/7HrnSvryt/yPnlecSSXqn5DbjUdVD
         YbR0Aokkm6IPrDD5kZUpSLi0itMwFw2H7P6Wk8faWhMDpAK+i8NDFSee0ieykpgt2oJh
         f+kJbqwuGJbkYVZP7WcRt1/w6c06DzJdxeIpGdqIChOBEpVeHcYverU/76U8cVUMz4WH
         GUgEkfSQviucZK4fNg7QwhalRWhNwnfO3LNGbXRgpPomsPs59GGIifjPVUjMezlpUj+s
         L3jEML8ZKr+OR1xA/rt4qL3yxwCpephnA8evJUuvobIpytMTz4GEHqei0e4kyX9lEJjk
         gnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=PjM/hgtHoBl4bAsCN0fGLfc9vPVEJId2LvZd0bmIOgA=;
        b=f3OEnfJ0FHHEewGc2DzmHa8Rmj+F1/kOHVZlgXyl/TFHmfMPJ3jDqOih48KH94C+8W
         9vaWhg6p13TkxN0yJaMX2Xf8VMY6uo2iqZ9Tu/22BKaUtHoF3bku1DOI3OcnupmQ7dKq
         RbqSO/4Br6DRYOtZelrT0l/Anr+oPltQl69JrushkfP1UvzwSIs4vPerjqJkyoJ2k/GB
         Y34KkSC4gfUnGZqAPgTIBAwr9lxg/h4h3WF7jlXqCVhGl7WquxGBsnjP7+IxG2PnpYvx
         7zgU8jzqEsjcGdU3ISY9PraStvYs2DXsctYOSbwYmAVUPkyNmvGz8TAN2+0AURV0Bwzk
         PiQA==
X-Gm-Message-State: ANhLgQ0Pdhq7BkHbO5NtZGxUkItAc0iCjgupmCqSImd+feHkG8fQM1wg
        vae13uMcqzyrGJcQhJzCAkAeIsXe1yHzfiBycr0z4w==
X-Google-Smtp-Source: ADFU+vvyMbtXQ3rc+nEgLFFbcAtBPxVC3Z9S8tNB5OL+ChmPdvbPhfhkAdeT2OSGW2pLgWvfYmxjrzmchhIn1KUdCiw=
X-Received: by 2002:a05:651c:2049:: with SMTP id t9mr2739165ljo.39.1582896982829;
 Fri, 28 Feb 2020 05:36:22 -0800 (PST)
MIME-Version: 1.0
References: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
 <20200228123910.hbf2bnk3w2dbishr@M43218.corp.atmel.com>
In-Reply-To: <20200228123910.hbf2bnk3w2dbishr@M43218.corp.atmel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 14:36:11 +0100
Message-ID: <CACRpkdYKemE6+OkWOWqOAqzaVEDNE9id+P_XRFaNzWs8N6c7mw@mail.gmail.com>
Subject: Re: GPIOs not correctly exported via sysfs on ATSAMA5D2
To:     Romain Izard <romain.izard.pro@gmail.com>,
        Linux GPIO List <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 28, 2020 at 1:39 PM Ludovic Desroches
<ludovic.desroches@microchip.com> wrote:

> The AT91 PIO4 pinctrl driver doesn't implement gpio_request_enable()
> contrary to the AT91 PIO pinctrl driver. If we implement it, then you
> would be able to change the pin muxing and configuration from the sysfs.
> The issue is nothing prevent you do this and so to possibly break a
> device.
>
> There is the strict pinmux_ops property which prevents from this
> situation. The side effect is that we must not declare a pinmux/conf for
> a GPIO so all the DT files have to been updated. That's not a big deal,
> the problem is, at that time, the GPIO subsystem didn't allow to set the
> bias for instance. It may have changed but not sure it covers all the
> possible configurations we have from the pinmuxing subsystem.

Yes and Russell also points very clearly to the root of the problem:

- Some pin multiplexers are non-strict meaning a line can be used
  for say GPIO and something else (such as SDIO) at the same time.
  Usually this is an observation from electronics, such that the GPIO
  input register will always report the logical state on the line whether
  it is in "gpio mode" or something else, making it possible to snoop
  the line, or, as in the I2C case, it is perfectly fine to, without glitches,
  pull the line out of other use cases and into the GPIO realm and do
  GPIO things such as bus recovery actively driving the line despite
  it being connected in the mux to SDIO or I2C at the same time.

- At the same time some system designers and driver authors are
  driven by the ambition to create a system that is simple, has no
  exceptions and has a clear separation of concerns, making it
  impossible for the user - even a kernel developer or real savvy
  hacker playing around with the deprecated sysfs ABI - to shoot
  themselves in the foot. These are ambitious and admirable people
  that want to protect their users and make it easy to do the right
  thing. So they sort everything out and flag their pin multiplexers
  as "strict", allowing only one use case at the time: this device is
  either I2C or SDIO.

Personally I am not flagging any of my drivers strict because I'm
just a pragmatist and don't use the system architect type of reasoning
much in what I do. But it is admittedly a matter of taste. The flag
"strict" tells you something about the driver author's values and
ambition.

If we get to cases where the user is getting hurt by the strictness
rather than enjoying the protection it provides, such as being unable
to do I2C recovery, it may be reasonable to drop the strict setting
and just fail the ambition to separate the concerns, as clearly the
system architecture wasn't perfect in the first place, and trying to
be strict in the mux is going to be a bit like polishing dirt.

This case however looks a bit like tinkering, bring-up and hacking,
and as such it might be expected that the user hack around a bit
and recompile the kernel and device tree etc?

Yours,
Linus Walleij
