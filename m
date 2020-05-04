Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643551C36F9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2020 12:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgEDKcK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 May 2020 06:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725928AbgEDKcJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2020 06:32:09 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86736C061A0E
        for <linux-gpio@vger.kernel.org>; Mon,  4 May 2020 03:32:09 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id f3so11719098ioj.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2020 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JwksYlNpZydozK5LKLIBiF0SUJbNvF8oAoIcpUU4EQE=;
        b=XsPIbeUtjhxNmdQUg744n3JLg/9jBB/PipeoeF0hnpbwp5T+kmN8nnfV2x4UCyGb1E
         5fssG1iLhKRtZcCdaM6Uwjkv9w03yRlBVPkZtLGjo0e0GtK51aQkpcQ/2dX0YnjL2gQf
         at4ehrg+pauiF5XLpXn7yQlBnTQTbR2vGSNDWnXXZ/q1Dg7y4L62vZ2jxXF+7zkseDfx
         +fw7czusnQnWCUz1NiGSHCogkWXcoU5ouvkRv2Ps+2j8+0H1Bp+4oQGENIlASN1Iayon
         x+AZSMMo/oE/MsOG3P4uCd8OIDU3kKNMVPVFgB1VHYMmM6HAyfFuDdq/zuhnBEQ/4j9m
         b/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JwksYlNpZydozK5LKLIBiF0SUJbNvF8oAoIcpUU4EQE=;
        b=LG5iNaoi1TtIeb0DMSy3JiuMPcBFs3k9yle80OEuSLLBWP7ShKZeW9cB43uSvp12cJ
         D123bb4GX0UmFZkVO9xiNShpqcC1EE7BJ2wXU7IzVoMQyxBmeAJQ7A+ITRCDfmNfwGxE
         /rbYfhmmlXTTmlVwi44My/2oAxOQgLtzNh0+M5s8TztR1YjBWXWKipt5CmMGXcp51gD6
         dq7BaLcgWEXhZUZvKJOiy7gqLDvg8y/b8vlFPb4ogudBa4KGWlzKXvvhi1cyRkF6cLQl
         rOUl52ou0LAWu0+uZuw0E7x1aLqW2xj+ym9A2BuM/WJlT/ZmcwQvJ7NbBq0IMC4+aZ+m
         AqDQ==
X-Gm-Message-State: AGi0PuYiS1c20U5PWpjglualNvB4oDY/e22uFBuQLFwmSHBmRuNgODB5
        19T5f/8N6VSHePT5YMhrZ3RIOwa6gFrD8eyO5AAT9A==
X-Google-Smtp-Source: APiQypKWREYUQ3eww1nklpai5o6loFengEnsz0RliPJNdoOKrXC9jtayt2F3cvAf2lOpQlE0gQptV5ifb041CbmfoA0=
X-Received: by 2002:a02:5bc9:: with SMTP id g192mr14543987jab.136.1588588328794;
 Mon, 04 May 2020 03:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
 <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
 <CAMRc=MdwSpWkgLTHN+6cOdG7aBAWWYFBC4+tfSNtA2HgX6s_3A@mail.gmail.com>
 <B0E9AFA73AF60B42B6D323E0C4FEB06F01AFAC5A@dor-sms-xch01.digi.com> <20200430145844.GA28588@sol>
In-Reply-To: <20200430145844.GA28588@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 4 May 2020 12:31:57 +0200
Message-ID: <CAMRc=Md5-OgNySDG+XHKow0YSzcZHNtWWPwbmd159fpWL8YAJA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "Bujanda, Hector" <Hector.Bujanda@digi.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 30 kwi 2020 o 16:58 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Thu, Apr 30, 2020 at 01:32:22PM +0000, Bujanda, Hector wrote:
> > Thanks all for your guidance!
> >
> > First saying that this patch request was sent having our platforms in k=
4.14 in the way of upgrading to k5.4.
> > In those versions the commit e588bb1eae31be73fbec2b731be986a7c09635a4 "=
gpio: add new SET_CONFIG ioctl() to gpio chardev" by Kent Gibson was not av=
ailable.
> >
> > I see that you clearly understand the necessity of having a way of conf=
iguring debounce from the userspace.
> > Our platforms make use of hardware debouncing filtering. Up to now we w=
ere using the sysfilesystem to let the user handle gpios (including debounc=
e configuration).
> > We wanted now to get rid of sysfilesystem and start using gpiolib/libgp=
iod.... but configuring debounce is blocking us.
> >
> > Now I clearly see (as pointed by Bartosz Golaszewski) that my suggested=
 GPIO_SET_DEBOUNCE_IOCTL is wrong as it hits the chip file descriptor while=
 'Modifying any config settings can only happen on lines previously request=
ed too in user-space'.
> >
> > I agree with all that a flag is needed to allow configuring debounce to=
 '0' which has always meant disabling it.
> >
> > Also agree with 'Kent Gibson' suggestion of  'You might want to add a f=
lag to the GPIOLINE_FLAGs to indicate if debounce is set'.
> >
> > I have my doubts if it is compulsory to extend debounce configuration t=
o the gpioevent_requests since the debounce value configured by a user is n=
ormally linked to a hardware noise in a line; and that does not change from=
 one gpioevent_requests to another. So I think this configuration would be =
useful but not compulsory.
> >
>
> Just to clarify on this point, the reason the SET_CONFIG would have to
> be extended to events is not to alter the debounce on the fly but to set
> it at all.  Lines are requested as either handles (for outputs or polled =
inputs)
> or events (for asynchronous edge events on inputs). We cannot extend
> either the handle or event request ioctls themselves as there is no provi=
sion
> in their data structures for future expansion.  There is in the
> SET_CONFIG ioctl - but that doesn't apply to event requests yet...
>

Indeed. And as I was thinking about it over the weekend I realized
that exposing a setter for a config option that's not settable at
request-time seems wrong. Together with the lineevent structure which
doesn't work on 64-bit kernel with 32-bit user-space this all makes me
think we should design v2 of several of the ioctl() calls with more
care.

>
> > I agree with Linus Walleij that 'there is a serious user-facing problem=
 here though, because not all GPIO controllers supports debounce'.
> > Our platforms have native freescale/NXP gpiochips not supporting hardwa=
re debounce and our own gpiochips having hardware debounce.
> > We have also noticed that 'drivers/input/keyboard/gpio_keys.c contains =
generic debounce code using kernel timers if the GPIO driver cannot provide=
 debouncing'. That feature is not of our interest (because of having hardwa=
re debounce filters) but it would clearly be a very good overall functional=
ity.
> >
> > Having said all above, I wonder how you want to proceed.
> > Our current development in k5.4 and libgpiod1.4.1 is much behind master=
... what makes collaboration (and reusability) a bit more complex.
> > Also I see the implementation requires a bigger picture than I initiall=
y expected.
> > So I wonder if you want me to do the initial steps of the development (=
what I foresee will require some back and forth) or you prefer implementing=
 all pieces.
> >
>
> I totally agree with you on the widening scope.
>
> Bart - how do you want to go forward with this?  I'm available to work
> on it, in part or full.
>

Personally I'm super busy with my actual job and adding support for
line watch ioctl() to libgpiod ATM. I can't really spare any time on
this. I have some crazy ideas: like storing the debounce time in the
16 most significant bits of the flags field but this is just papering
over bad ABI.

Ideally we'd have to introduce new versions of gpioevent_request,
gpioline_request, gpioline_info and gpioevent_data structs - this time
with enough additional padding and no alignment issues. Then we could
add the debounce properly.

This would of course add a lot of cruft to the uAPI code. I'd start by
moving it out of drivers/gpio/gpiolib.c into a new file:
drivers/gpio/gpiolib-cdev.c. This way we'd have everything related to
the character device in one place. It would make it easier to: a) add
a config option for disabling it entirely and b) add a config option
to disable the v1 of the ioctl()s.

I also Cc'ed Andy who may have some better ideas.

Linus: about the software-debounce you mentioned: do you think it
somehow plugs the hole we identified here?

Bart
