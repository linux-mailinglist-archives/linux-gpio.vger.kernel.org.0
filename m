Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94BE71320D0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 09:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgAGIAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 03:00:11 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41510 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgAGIAL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 03:00:11 -0500
Received: by mail-ua1-f66.google.com with SMTP id f7so18141549uaa.8;
        Tue, 07 Jan 2020 00:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G49jRNz3gZEEfFLdDkAYLnHIdkVGIsHq5slg+jNpVFc=;
        b=mbpt0NSmw9B4UnQCxMDWyWwCwou7ce/Q5pH2J67R1Le24dJLYeLjM0AFKewcLYMfru
         kfVCdLqV2mMV0rXtzvr1tdZ0S38npKmzHwJVZkBfxjyzxD1yzC3bdvow9qiPPX4BwH7G
         4IgjZ3Ela4grO3LRJkMkKmwgmdTlMKTJyoS4BpuZMvL5loQ4aN0uqDqYR0kO/2rPDOPe
         y367TGes9sz6fMPzphCCnPAnAgkLT2Op62JT2cLZPi3q9zUlrJEngs9tHb3RqMQkBJtF
         b5Bzm8X0seVgVRQ7iDi8I3+qz/GhlyyiQJalk4xSf1IA/IdBzqLDzs2rHGKlg3mmsBmx
         2qBA==
X-Gm-Message-State: APjAAAVz/onlkSWTHPdIGr56p1EY+Gc1kpSn7n6FnPREeG04gnFa2vOX
        6Yf9rylesq5SwyZ9CMMicC6QA2yjlfkw+8u1xaFAd7N5
X-Google-Smtp-Source: APXvYqwQnXa32S88cpjnb3svuNV9ptbTWxgj2NofkIqvD/8kqS/ZPs9hBEPuCGHdaUp3cBLRZNHLHyFoUBcnaWP4Nl8=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr21273637ots.250.1578384008305;
 Tue, 07 Jan 2020 00:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20191230133852.5890-1-geert+renesas@glider.be>
 <20191230133852.5890-3-geert+renesas@glider.be> <41e1c51e-bc17-779e-8c68-bf2e652871eb@gmail.com>
In-Reply-To: <41e1c51e-bc17-779e-8c68-bf2e652871eb@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jan 2020 08:59:57 +0100
Message-ID: <CAMuHMdVO7QvfdOEooJCVHDAwqzbZ_nYnZ6x97qVmFTyS+7kbKA@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Frank,

On Tue, Jan 7, 2020 at 12:34 AM Frank Rowand <frowand.list@gmail.com> wrote:
> On 12/30/19 7:38 AM, Geert Uytterhoeven wrote:
> > As GPIO hogs are configured at GPIO controller initialization time,
> > adding/removing GPIO hogs in DT overlays does not work.
> >
> > Add support for GPIO hogs described in DT overlays by registering an OF
> > reconfiguration notifier, to handle the addition and removal of GPIO hog
> > subnodes to/from a GPIO controller device node.
> >
> > Note that when a GPIO hog device node is being removed, its "gpios"
> > properties is no longer available, so we have to keep track of which
> > node a hog belongs to, which is done by adding a pointer to the hog's
> > device node to struct gpio_desc.
>
> If I have read the patches and the existing overlay source correctly,
> then some observations:
>
> - A gpio hog node added in an overlay will be properly processed.
>
> - A gpio hog node already existing in the live devicetree, but with a
>   non-active status will be properly processed if the status of the
>   gpio hog node is changed to "ok" in the overlay.
>
> - If a gpio hog node already exists in the live devicetree with an
>   active status, then any updated or added properties in that gpio
>   hog node in the overlay will have no effect.
>
>   There is a scenario where the updated property would have an effect:
>   apply a second overlay that sets the status to inactive, then apply
>   a third overlay that sets the status back to active.  This is a
>   rather contrived example and I think it should be documented as
>   not supported and the result undefined.
>
> It would be good to document this explicitly.

I didn't verify this in detail, but I believe the existing overlay
support for platform, i2c, and SPI devices behaves the same.

> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c

> > +static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
> > +                       void *arg)
> > +{
> > +     struct of_reconfig_data *rd = arg;
> > +     struct gpio_chip *chip;
> > +     int ret;
> > +
> > +     switch (of_reconfig_get_state_change(action, arg)) {
> > +     case OF_RECONFIG_CHANGE_ADD:
> > +             if (!of_property_read_bool(rd->dn, "gpio-hog"))
> > +                     return NOTIFY_OK;       /* not for us */
> > +
> > +             if (of_node_test_and_set_flag(rd->dn, OF_POPULATED))
> > +                     return NOTIFY_OK;
>
> I don't think OF_POPULATED could be already set.  It seems to be a
> bug if it is.

For a real gpio-hog it indeed is not.  But this function is called for
every change made to the device tree (add a printk() and look at the
output during boot).  So this serves as a (cheap) line of defense.
The of_find_gpiochip_by_node() call below is more expensive to call.

> > +
> > +             chip = of_find_gpiochip_by_node(rd->dn->parent);
> > +             if (chip == NULL)
> > +                     return NOTIFY_OK;       /* not for us */
>
> If I understand correctly, "not for us" is a misleading comment.
> The notification is for the node rd->dn->parent, but the device
> does not exist, so we can't do the hogging at the moment.  (If the
> device is created later, then the gpio hog child node will exist,
> and the init will "do the right thing" with the hog node -- so
> not a problem.)

This function is called for all additions to the device tree.
So rd->dn->parent may not even be a gpio controller node.
Hence unless this is a gpio controller node for this hog, this
notification is "not for us".

> > +
> > +             ret = of_gpiochip_add_hog(chip, rd->dn);
> > +             if (ret < 0) {
> > +                     pr_err("%s: failed to add hogs for %pOF\n", __func__,
> > +                            rd->dn);
> > +                     of_node_clear_flag(rd->dn, OF_POPULATED);
> > +                     return notifier_from_errno(ret);
> > +             }
> > +             break;
> > +
> > +     case OF_RECONFIG_CHANGE_REMOVE:
> > +             if (!of_node_check_flag(rd->dn, OF_POPULATED))
> > +                     return NOTIFY_OK;       /* already depopulated */
>
> I don't think OF_POPULATED could be already cleared.  It seems to be a
> bug if it is.

Same here. First line of defense.

> > +
> > +             chip = of_find_gpiochip_by_node(rd->dn->parent);
> > +             if (chip == NULL)
> > +                     return NOTIFY_OK;       /* not for us */
>
> Again, a misleading comment.

Same here. rd->dn->parent may be something else.

> > +
> > +             of_gpiochip_remove_hog(chip, rd->dn);
> > +             of_node_clear_flag(rd->dn, OF_POPULATED);
> > +             break;
> > +     }
> > +
> > +     return NOTIFY_OK;
> > +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
