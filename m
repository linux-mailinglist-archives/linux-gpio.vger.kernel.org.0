Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97B62A7ACD
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbgKEJnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgKEJnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:43:02 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A467C0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:43:02 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id o20so833024eds.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DeOBs8//T4JC8W2v/41RF/aONDtKGyNLXtxBMCRNHss=;
        b=CyY1MxxZtzoUExDGbmpfCTNbv0CVGls7p0kDIFJHKIwdCk8Bd4QEzlmsBdJkefe5kF
         bDVViaItqLXwHDLbA+q9Fr5dnVgW/1XDyTeTaEGjy3Dr6pOaBaYVENiOk6ilsVbG0/HL
         xeFbvtqJO3blOzIuCgaSSkafRYQolKoH227e+GB3iGCLhm5zzOLXRXW5GdbDuLploRFF
         FqXsj+CadpLYKdBoFr13XOn5hQRujYHvQqPzQkdCdrmCwaKQKlw9Ba8ZQB5ctigIBhSw
         tB7ZNrEGerTHA3/IxDKAXDu6f3oUcxTz8A/mJaAdvwYjPMhFzhGJbODSNOIOvro3aJbF
         ipug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DeOBs8//T4JC8W2v/41RF/aONDtKGyNLXtxBMCRNHss=;
        b=m5revKzHUuO5UUEVoKVbb/vBoCU2Z0bbwQDjTM1NfxUi2gGy2pxCfgUW6lVc5NJaTu
         dhLDqp9k++boFxFgicq4Wo+j17w8yEjHLjCGCFGiupnNR7LZdMZ46ZxwWqL8vuhb4/e2
         p8jJMmEtWNxxFsU/uavK9L7+4CP9Ak4pcwVGshfNJ7DEbGXGfdIg+EmtLj2B9QtZKfGM
         4zBSfckpMpwFBgr1CZ+XHH60UOEHyMcxrN5B5AOes+LLaV7ATxnB0Oy0sNpul6ozdCtP
         +gYtArxRaKiYUd2n+ipQftGCJM2VE+UNyACqVM/el+VLSGArP1txudjGdP31LGkoZNIT
         aPlA==
X-Gm-Message-State: AOAM532njUXmBTf+Y0x5WJI3bkMDR/uAp7f7wfIkeXSfPYT1d650e4n/
        8HfzAEh8zjv2H4U1TmQ3Hg1ynPQqrd4nYMhWt1JVKg==
X-Google-Smtp-Source: ABdhPJybud6FTPvTcrbvBWnuDfmJGrn2QRie046seVglh3JPax7rANBITFnA8FFir54MK6PUKO/kndp9C8T8y77d14o=
X-Received: by 2002:a50:e442:: with SMTP id e2mr1738064edm.186.1604569380861;
 Thu, 05 Nov 2020 01:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20201104103938.1286-1-nsaenzjulienne@suse.de> <20201104103938.1286-2-nsaenzjulienne@suse.de>
 <CAMpxmJWJRcQQiLitJCLWKmhQVQWr3bMDY=td5FEn5uy2YZfwkA@mail.gmail.com> <47eaba0bc71c6e23bff87b8a01cebf0c6d12efd0.camel@suse.de>
In-Reply-To: <47eaba0bc71c6e23bff87b8a01cebf0c6d12efd0.camel@suse.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 5 Nov 2020 10:42:50 +0100
Message-ID: <CAMpxmJUZ23uYM3+_L2XvTXzvA48JWrxrhZaLnGAxTpJjFiERRA@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] firmware: raspberrypi: Introduce devm_rpi_firmware_get()
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-pwm@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>, wahrenst@gmx.net,
        Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 10:28 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Bartosz, thanks for the review.
>
> On Thu, 2020-11-05 at 10:13 +0100, Bartosz Golaszewski wrote:
> > > +/**
> > > + * devm_rpi_firmware_get - Get pointer to rpi_firmware structure.
> > > + * @firmware_node:    Pointer to the firmware Device Tree node.
> > > + *
> > > + * Returns NULL is the firmware device is not ready.
> > > + */
> > > +struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
> > > +                                          struct device_node *firmware_node)
> > > +{
> > > +       struct platform_device *pdev = of_find_device_by_node(firmware_node);
> > > +       struct rpi_firmware *fw;
> > > +
> > > +       if (!pdev)
> > > +               return NULL;
> > > +
> > > +       fw = platform_get_drvdata(pdev);
> > > +       if (!fw)
> > > +               return NULL;
> > > +
> > > +       if (!refcount_inc_not_zero(&fw->consumers))
> > > +               return NULL;
> > > +
> > > +       if (devm_add_action_or_reset(dev, rpi_firmware_put, fw))
> > > +               return NULL;
> > > +
> > > +       return fw;
> > > +}
> > > +EXPORT_SYMBOL_GPL(devm_rpi_firmware_get);
> >
> > Usually I'd expect the devres variant to simply call
> > rpi_firmware_get() and then schedule a release callback which would
> > call whatever function is the release counterpart for it currently.
> > Devres actions are for drivers which want to schedule some more
> > unusual tasks at driver detach. Any reason for designing it this way?
>
> Yes, see patch #8 where I get rid of rpi_firmware_get() altogether after
> converting all users to devres. Since there is no use for the vanilla version
> of the function anymore, I figured it'd be better to merge everything into
> devm_rpi_firmware_get(). That said it's not something I have strong feelings
> about.
>

I see. So the previous version didn't really have any reference
counting and it leaked the reference returned by
of_find_device_by_node(), got it. Could you just clarify for me the
logic behind the wait_queue in rpi_firmware_remove()? If the firmware
driver gets detached and remove() stops on the wait_queue - it will be
stuck until the last user releases the firmware. I'm not sure this is
correct. I'd prefer to see a kref with a release callback and remove
would simply decrease the kref and return. Each user would do the same
and then after the last user is detached the firmware would be
destroyed.

Don't we really have some centralized firmware subsystem that would handle this?

Bartosz
