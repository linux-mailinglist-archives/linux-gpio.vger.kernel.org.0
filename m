Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04FFF63423D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 18:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233800AbiKVRM5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 12:12:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbiKVRMy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 12:12:54 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DA8186FA
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 09:12:50 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o30so11216551wms.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2022 09:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uAwjzuuh2+mMpfBBHalOJBxdIdbYzXgd2pRioPsq7ss=;
        b=Rgwk8vzvn5v9XdTvTpie/M/1D0AbMWXl6j5Y7J5T2O2OG/PL39Qp1dsCEvuDG50BqQ
         7HhSNjtu+gB278Y/VkpACi3b0J4bR4/ecLXkVv7+TG/HIMRaFhu5J8MVNkbq5MpFcU/X
         j3YPqQYT271IKGfa+Kyx1RjzBlYVvC8MyWhzDZG/BIA2n2bBM7QahhybOzd2MQBa7s21
         Zn7UgMHM1kM1NnSkaw5xyVyrhUt33LfMDS6KWfXA+f0k3yQQCEu7V1/RhFxfARjIEWi4
         LUulDDS898AvfYVn5XfQTVWPVsbRYBcGG0gIajxnkaH4IdtEv9CGiN6/3GhpGI9FXCvX
         UruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAwjzuuh2+mMpfBBHalOJBxdIdbYzXgd2pRioPsq7ss=;
        b=aXc1igEWYQJfBC8IaSHuHGHfp57LU+AuKXK8Wh4Y4YvqLNnhJOdbf2qFoa4zBG1wCn
         F+EMPCYsbhc/JXRyEO+QeZ3sAhNDH/tPcwtQ7Q8YFna3Jr4Xy95xOHP72BVqWJ27oyP3
         29ODmiS8tibvOy56dQXHVZwcA24VAXsqh4GRj3EKQHKWV0kkpqrZALGUFhB+Ngp1eUJd
         eVenDdxW+KBUQufUa4kO4C4vn5abktmKFpg50uGcRNnxl5I95qcTjJofl/kuiDsMrhLw
         /VUPL+A5PsONrN4gX1Pz0enfI+pHhAgJ/9wl5f361LU9Bn/jshM72l53mLLqARNX6DtM
         jDjA==
X-Gm-Message-State: ANoB5plBD1eSm5swmZVyggxq46DjfJzCbQ1UVqGXCm9UCq9peiOg9K3J
        63p9WibZW5TvkoOP153C3VFcIg==
X-Google-Smtp-Source: AA0mqf43+ypKMflu4buKAvtCvnPOdE8nraEMhIjYnM6sO2l04zcx0GPg6a9VpQnBW2tEYgW1muYfcw==
X-Received: by 2002:a05:600c:a51:b0:3cf:8df5:68dc with SMTP id c17-20020a05600c0a5100b003cf8df568dcmr16349261wmq.15.1669137169009;
        Tue, 22 Nov 2022 09:12:49 -0800 (PST)
Received: from blmsp ([2001:4091:a245:8035:e075:8def:4647:9f37])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c468f00b003cfd10a33afsm22860532wmo.11.2022.11.22.09.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 09:12:48 -0800 (PST)
Date:   Tue, 22 Nov 2022 18:12:47 +0100
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Markus Mirevik <markus.mirevik@dpsolutions.se>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: GPIO level IRQ fires twice each time.
Message-ID: <20221122171247.wcf6qetxxd2ucjcn@blmsp>
References: <HE1PR04MB3100579720F6EBBD634C99EEE65B9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <20220122235959.GA10737@sol>
 <HE1PR04MB310027275C077FFA647E93CAE65E9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <ea65d00c-b2d8-3be5-51d9-05c4dc1616c4@metafoo.de>
 <1c646fb4-16d5-bf93-cb7d-12683a428893@metafoo.de>
 <61b715ca-075f-0f93-1c0f-a256ceb2b057@ti.com>
 <HE1PR04MB3100764AD4686D6E748A9BFEE6EF9@HE1PR04MB3100.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HE1PR04MB3100764AD4686D6E748A9BFEE6EF9@HE1PR04MB3100.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi everyone,

On Thu, Apr 14, 2022 at 08:39:21AM +0000, Markus Mirevik wrote:
> Hi Grygorii
> 
> > On 24/01/2022 09:58, Lars-Peter Clausen wrote:
> > > On 1/24/22 08:56, Lars-Peter Clausen wrote:
> > >> On 1/24/22 08:12, Markus Mirevik wrote:
> > >>>> On Fri, Jan 21, 2022 at 09:03:43AM +0000, Markus Mirevik wrote:
> > >>>>> I have a problem with a custom bord based on SoC am335x and a
> > >>>>> driver
> > >>>> utilizing a GPIO line for interrupts.
> > >>>>> I have two mcp2518fd chip connected on one SPI line and everything
> > >>>> works, but it's hogs a lot of CPU.
> > >>>>> In the current setup only one chip is connected and it only receives
> > packets.
> > >>>>>
> > >>>>> The mcp2518fd is connected with 2 interrupt lines one "main" and
> > >>>>> one for
> > >>>> rx frames.
> > >>>>> The problem is that for every frame received the interrupt handler
> > >>>>> is run
> > >>>> twice, which is kind of expensive since it's a SPI call to the chip
> > >>>> to check interrupt registers.
> > >>>>> To me it looks like the interrupt is fired again as soon as it's unmasked.
> > >>>> Either because it's queued? or maybe not cleared internally?
> > >>>>> I have scoped the interrupt signal and its real good without any
> > glitches.
> > >>>>>
> > >>>>> I'm currently running a yocto build:
> > >>>>> Linux botekcc 5.10.79-yocto-tiny #1 SMP Tue Nov 16 03:57:43 UTC
> > >>>>> 2021 armv7l armv7l armv7l GNU/Linux
> > >>>>>
> > >>>>> But the mcp251xfd driver is from net-next/master
> > >>>>>
> > >>>>> mcp251xfd_irq is the irqhandler for the mcp2518fd and is added like
> > this:
> > >>>>> err = request_threaded_irq(spi->irq, NULL, mcp251xfd_irq,
> > >>>>>                                     IRQF_SHARED | IRQF_ONESHOT,
> > >>>>> dev_name(&spi->dev), priv);
> > >>>>>
> > >>>> You haven't set a IRQF_TRIGGER flag, so you are getting the
> > >>>> "as-already- configured" behaviour, which on your setup is both
> > edges?
> > >>>> Try adding IRQF_TRIGGER_RISING, IRQF_TRIGGER_FALLING,
> > >>>> IRQF_TRIGGER_HIGH or IRQF_TRIGGER_LOW, as appropriate to your
> > use
> > >>>> case, to your flags.
> > >>>>
> > >>>> Cheers,
> > >>>> Kent.
> > >>> I have tried with the IRQF_TRIGGGER_LOW flag as well. With same
> > result. i.e the interrupt is fired again as soon as the handler is ready. Even if
> > the interrupt line is deactivated.
> > >>> However if I change the trigger to edge falling the interrupt will only fire
> > once. But his will inevitably lead to a missed edge eventually.
> > >>
> > >> Depending on how the mcp2518 GPIO controller works internally its
> > >> driver might have to use the handle_fasteoi_irq() flow to avoid this.
> > >> It is not uncommon to have hardware which needs a level IRQ acked
> > >> after the interrupt handler has run, rather than before like the
> > >> handle_level_irq() does. E.g.
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co
> > >> mmit/drivers/gpio/gpio-
> > zynq.c?id=6dd859508336f0fd078fd62f3b9fe42a32aa
> > >> 38e2
> > >>
> > >> - Lars
> > >>
> > > Sorry, I meant `Depending on how the am335x interrupt controller
> > > works...`
> > >
> > 
> > 
> > Could  you try to test below diff (may not be applied cleanly):
> > 
> > diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c index
> > 2a4a11634dd1..41ec54c3609f 100644
> > --- a/drivers/gpio/gpio-omap.c
> > +++ b/drivers/gpio/gpio-omap.c
> > @@ -896,6 +896,8 @@ static void omap_gpio_unmask_irq(struct irq_data
> > *d)
> >          raw_spin_lock_irqsave(&bank->lock, flags);
> >          omap_set_gpio_irqenable(bank, offset, 1);
> > 
> > +       if (trigger)
> > +               omap_set_gpio_triggering(bank, offset, trigger);
> >          /*
> >           * For level-triggered GPIOs, clearing must be done after the source
> >           * is cleared, thus after the handler has run. OMAP4 needs this done
> > @@ -905,9 +907,6 @@ static void omap_gpio_unmask_irq(struct irq_data
> > *d)
> >              trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
> >                  omap_clear_gpio_irqstatus(bank, offset);
> > 
> > -       if (trigger)
> > -               omap_set_gpio_triggering(bank, offset, trigger);
> > -
> >          raw_spin_unlock_irqrestore(&bank->lock, flags);
> >   }
> > 
> > Assumption - clearing IRQ status may require IRQ type configured.
> > 
> 
> I  have moved that part suggested in your diff and it looks like it has solved the problem! 
> 
> The interrupt associated with the GPIO module still fires twice
> 
> (cat /proc/interrupts)
> 19:     147227      INTC  96 Level     44e07000.gpio
> 
> But the interrupt in the mcp251xfd driver is only fired once. 
> 
> 64:      76673  44e07000.gpio  22 Level     spi1.1
> 
> And since it's the spi call that worries me the most I think this is fine. 
> Thank you!!

I just found this thread searching for the exact same issue, and the
patch works for me as well. Is there a patch somewhere already? Checking
6.1-rc it doesn't seem to have been submitted?

I am not familiar with the gpio-omap driver at the moment, so can we
submit this patch or is it just a hack?

Best,
Markus
