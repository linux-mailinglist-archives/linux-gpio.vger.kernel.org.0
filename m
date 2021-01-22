Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5BF3003C4
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbhAVNGW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:06:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbhAVNFp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 08:05:45 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BABB3C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:04:47 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m22so7418541lfg.5
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsNBH9oRgbkYhUxKkvYv7L5/XwHmQEBGpccRIWTXPhU=;
        b=WOFAYTJeuB5gDcuLrWr4HVs34OST+NF+82cRELdhETbbyfkghpubWq60mkPIGB4JpQ
         xcTxohmbVg3RUgI7/cRIVItHB0QL+ZTKtc4UsT3TFhg7ht14W4o/WuGny47FY8D4297R
         dhIpKQ6mqMqIArt1wQW07YQGexaEqSHTkeKevQHMY/0TDJSwQTtM1a8plpI5KK8keF2g
         Rm7dW8R7eswUdRLaEvuHfgbXKe0UMlBu/qnupIUN28ujNgA0GRL+9ErGf91zDWJwVYBw
         NzZ8ll/r886MVa+0cR0BLF+StaH1M80/AG7q0/5ZxbiXsLVxRgRfgZdvg9YRO5Lghb1L
         gSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsNBH9oRgbkYhUxKkvYv7L5/XwHmQEBGpccRIWTXPhU=;
        b=T6fEAKBBpr94VwfJDnbKkDCQO+Me/oLvpltpT8yarS+1Fow4lAcwfM767d5LdxG/jJ
         uNhuYi7bg+59pjJb/E8je+81TvjUsTuyGQn8y1uLa+HL8HxccQhQhCSI2PIo3IGlH2R6
         owkmgBZL5YFDJVG9+miRpRys0EV7M29klBBc5zOzJZhJiwC5ue/MlEFnQQUOovMJ10J/
         J4ucNWH9IPcL1y9/i/97zx14Plp2LNoYf6ezZiNORONIBgNvO0miN8WUnDljF6k5BbvZ
         DSRN/Dbst7jlxnBWidxdzo8D8NNWgmgddMEdDo4DYWEKVVmqWFiMZYH5Lfy6+Jef11Xr
         FoCg==
X-Gm-Message-State: AOAM531EhI7TxTnrt7idsBTULhM1D9UdK32OqNSMYd7QKkdFeobJ+R2T
        foMhypx9Giw6AI0CtvAcvhRNBl3LX3i2wp685c/fyQ==
X-Google-Smtp-Source: ABdhPJzNrpK+vKc+gG7Btbu9G51Y0RBZRPCu+sS444qxKNezqNf9d3bY4yPRAUHvvFSNVM754j/LuuWhlxID+lOOGvQ=
X-Received: by 2002:a19:6557:: with SMTP id c23mr2062855lfj.157.1611320686252;
 Fri, 22 Jan 2021 05:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20210116011412.3211292-1-saravanak@google.com>
 <CACRpkdbrkNKdjMk4fmQkfSLNS_O3=Ve0u_ktBGLaP7fWaNMrqA@mail.gmail.com> <CAGETcx8Jp_wCyoLXeMxe+vaqjPO_urHnzS7Vfi=tbKPTKk5v=Q@mail.gmail.com>
In-Reply-To: <CAGETcx8Jp_wCyoLXeMxe+vaqjPO_urHnzS7Vfi=tbKPTKk5v=Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 14:04:35 +0100
Message-ID: <CACRpkdZEMiQnjvgnCdKMw=09S5ZBNfTHv3+YWS_zCHAX4CgNow@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 8:43 PM Saravana Kannan <saravanak@google.com> wrote:

> > They may still have "ports" or "banks" of GPIO that make sense
> > to separate into logical nodes and this is most often why they
> > do this.
> >
> > I bet there are some other oddities as well.
>
> Ah, thanks for the context. But couldn't they just skip the
> "compatible" property in the DT if these individual nodes aren't
> considered separate devices? It's too late for existing DT device
> bindings, but maybe in the future we can ask them to skip the
> "compatible" property if they don't consider the sub nodes to be
> distinct devices?

That makes sense and has been done in other cases.

> > > This patch works around this problem and avoids all the code churn by
> > > simply creating a stub driver to bind to the gpio_device. Since the
> > > gpio_device already points to the GPIO device tree node, this allows all
> > > the consumers to continue probing when the driver follows case 2.
> >
> > That makes sense.
> >
> > > If/when all the old drivers are refactored, we can revert this patch.
> >
> > I have a bad feeling about this.
> >
> > This type of hacks tend to stay around forever.
> >
> > That said I'm not sure this is entirely wrong either, maybe this
> > is business as usual and *should* stay around forever. Haven't
> > made my mind up about that.
>
> Considering your comment about why some (not all) of these nodes
> aren't considered separate devices, looks like this has to stay this
> way forever? I can drop this line in the commit text.

Yep looks like so. I think this patch is sound.

> > You need to put code into drivers/gpio/gpiolib-of.c with stubs
> > for the !OF case in drivers/gpio/gpiolib-of.h so that systems
> > not using device tree can avoid this code path.
>
> It's not clear in the diff due to lack of sufficient context lines,
> but this piece of code is already inside a #ifdef CONFIG_OF_GPIO.
>
> To cover the case where CONFIG_OF_GPIO is enabled but we get here for
> non-DT devices, I just need to add a !fwnode check here. Then stuff
> will automatically NOP out for non-DT devices. Since the
> gdev->dev.of_node is set a few lines above, I think gdev->dev.fwnode
> should also be set close to it (which is what the next few lines do).
> I'll add this additional check to v3.

I dunno about that. If you add more than a few lines of DT-specific
code, I prefer that you put that into gpiolib-of.c to keep things
separate, or we will get a mess with more and more hardware
descriptions.

Things that are agnostic fwnode is fine to have in generic code,
it should be used the same by pretty much anything.

A matter of taste I suppose, so no strong opinion.

> > As discussed in other messages I don't know if this message
> > is aligned with the device tree ontology. The DT people should
> > speak about that.
>
> Considering what you said earlier, I'll just drop this message.

Thanks.

Yours,
Linus Walleij
