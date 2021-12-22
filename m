Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8672D47D808
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 20:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhLVTyc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 14:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345356AbhLVTyb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 14:54:31 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8844AC061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 11:54:31 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id m21so14083365edc.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 11:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=++M+Ezk6Ui1ccvgPpl1oSE28tZb+7t6AMDOA7MkDmQE=;
        b=njSAwNZILWvEfqHk4VUStzD4HyFnjuwfSZTUf3n/dioEcrRB+ltOThAAl2i0qrzEa/
         /AvG/8ubPrDJb8WTIAMtDyIHj+K3DflDBWr84Zpimym2QQaYZPgci7ThhT+Rnlm+5XFx
         rCwkyDh6YxyJHZwVENSf2hfq3lEe3f+tysihvPwnrCBSb5P8S7WTu+BCuGfVszzVhC9y
         tD82yOdkAKcyv8DCz44aaS7VNooIqX/POqcOQD86Ul37xY/u+ztIgYw/lxPhznHQTpFQ
         SxY3VXnfvv6JcD9Q9UkkxuRt5lcSdTBba/KgAO0oEqUq7i2CEZC7PaUGmfpTraUrtHta
         aX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++M+Ezk6Ui1ccvgPpl1oSE28tZb+7t6AMDOA7MkDmQE=;
        b=LzRedmbtpkNRpCkX3HsBlTUiHnY0IX0s2IaiaIVRDMiB9ZDhqM69lLT6tkP/dRFRi9
         H8Gybuxs6wCAXH/zqFjKu3kbUxN/PlhQ/QUPC5JyyzcrKMQvCeEIJvtEY/X8IxeuMIh9
         xag8FUD9Z5LWNRZgeLWPCWtIuRSGqhTyQBczW0phZ7m7x3JB/bpsjPevtVNFstqzSY+h
         yR+Rx+o8iAOsAHxXAuX++aYlKMecLR+0hmnRvB2EfpMXxNSIp7nQBaDP/2lFFjBpRNOn
         87ix3dKKS3UOiPZK/wYVnC7mc2kYVmCWXQuVuvKGyspBr/nRTTk6pv+x69CZlHUWLx9l
         ULqw==
X-Gm-Message-State: AOAM533sf8fOHYpUAoexqfVvT4HsLcVztLlwUXLLYoWH/9qvayZWLDm5
        H63paG/DITaF5SBGQAiaZZVfe4pOWUBWfmvxyovkICRfNgE=
X-Google-Smtp-Source: ABdhPJyw0L3cEg5D/MXLE4subKNfFXY8q14wRE4hW1ClXpaOZkNmHGmeFM8xdlNK2pEjcSmQ5PDSXkfg64xcvKim9PY=
X-Received: by 2002:a17:907:97cd:: with SMTP id js13mr2338374ejc.497.1640202870107;
 Wed, 22 Dec 2021 11:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20211221190459.GB13192@COLIN-DESKTOP1.localdomain>
 <CAHp75VdGXAxBQqYy9kHrqHYytXeP5ackdZBBUrBVVwt38B=XGA@mail.gmail.com> <20211222192215.GA21356@COLIN-DESKTOP1.localdomain>
In-Reply-To: <20211222192215.GA21356@COLIN-DESKTOP1.localdomain>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Dec 2021 21:52:32 +0200
Message-ID: <CAHp75VeH7POYd8Wj4kzxxtas5=uK6CVcGZMoAk+XXLO_ezfbdA@mail.gmail.com>
Subject: Re: activity status for pinctrl-microchip-sgpio
To:     Colin Foster <colin.foster@in-advantage.com>,
        Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Why not include him as well?
Fixing...

On Wed, Dec 22, 2021 at 9:22 PM Colin Foster
<colin.foster@in-advantage.com> wrote:
>
> On Wed, Dec 22, 2021 at 08:47:25PM +0200, Andy Shevchenko wrote:
> > + Linus and Bart for the starter
>
> Thanks Andy.
>
> Updating this thread with the current information from a side-channel
> email with Lars Povlsen (paraphrased)
>
> >
> > On Wed, Dec 22, 2021 at 5:58 PM Colin Foster
> > <colin.foster@in-advantage.com> wrote:
> > >
> > > Hello,
> > >
> > > I'm taking a look at the pinctrl-microchip-sgpio driver. After
> > > converting it to regmap, it was quite simple to finish support for the
> > > VSC7512 MFD RFCs I've been sending out. As it currently stands, I expect
> > > that patch set to get chopped up and submitted for 5.18 due to
> > > end-of-year schedules.
> > >
> > > I don't know how the other chips that use the sgpio driver operate, but
> > > the primary function as I see it for the VSC7512 is the activity LED. It
> > > seems like that functionality was initially planned by way of:
> > >
> > > static const char * const functions[] = { "gpio" };
> > >
> > > Has there been, or is there expected to be any work to add this
> > > feature? If there is, I'll be able to focus on PCS ports next. If not,
> > > I'll spend some time on activity LED functionality.
>
> Yes, this was the intent. It doesn't seem like there is anyone currently
> trying to implement this right now, so it s probably a good task for me to
> pick up.
>
> > >
> > > Is this a feature that'll be desired for SPARX5 and LUTON? Or just
> > > Ocelot? If it is Ocelot-only it would seem like a flag in sgpio_priv is
> > > necessary. If it is for everything, then extra parameters in
> > > sgpio_properties.regoff[] would seem like the way forward.
>
> Implementing this feature for all products is desired. I will take this
> into consideration during my design.
>
> I'm sure there'll be some optional DT parameters needed - duty cycle,
> blink mode, etc. I'm not sure if starting with "50% duty cycle, 10Hz
> blink rate" is enough for most use-cases.
>
> > >
> > > Thanks,
> > >
> > > Colin Foster
> >
> >
> >
> > --
> > With Best Regards,
> > Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
