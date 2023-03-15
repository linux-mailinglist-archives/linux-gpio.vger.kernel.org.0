Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1171D6BAC78
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 10:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjCOJpu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 05:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbjCOJpZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 05:45:25 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C3B80936
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 02:44:40 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id t4so1052881vsq.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678873475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOvLakKT9+2TAyCPTEaJvYevbrhH+vEqwUBVj+ptxrU=;
        b=7Iz3DM3Mga9TzTZujMLhDnkwTPGvaeXwx6pCKQaseJ1Gpt2jjPWTLrOOa1Ddpn+hiC
         ba+ouXeDhKbqYRmoeQKO44ngc7SUHFJBLOjJ0S0ZetRmGUZzGn1Mk5CDVc+frpuDEi/t
         zV5ngYAIQiuO2b9gUw/n5pKs9uG4M4eI67QJy9VyF6s+SraHMsU/vuYpLkxhm4+7i3T8
         9VZ17PQERyZxyP/CkSuw3kz6vF1NXJ3Gz1JHBIN3i8uuztdLV6IXguxxLec5Zxu71Vo9
         Y/vkP8JtMLoEIpIyPGAgT74Oy6JfdHW4lPZtr5kZks5QVQwcAeq3DuqFfbWr+8cBKCZE
         CSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678873475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOvLakKT9+2TAyCPTEaJvYevbrhH+vEqwUBVj+ptxrU=;
        b=oTgRYjxbCzDdV3Gxu3ELGYcxFup9JdJlIcSnisXUCDuHEcfvF3CLl8CkREjfxpjOgt
         iMmmh0CQDvf2FMgU9qkJBbynNWVb1iQ7HZYQQwoQMaR54ew4/1N7hvjoVa1UpZa+mPdc
         AmZvd0nJoovQOPHbWs8cgwjO/hQeXw8t7R/Oyo6XCNcikvjq+dNCCkNOsObx7yIpEK7O
         2axxjV/XTJMZ01hzm2+jwP35bo3XHjoVK46GiBkbRZ1NAbHShyPe369HZbKHcIkj2VyC
         TzAhyB2vyZBz+2BjpJoupzH+1nW+oIhpTQM1/pCfxN5dLCU36Yg4v+ChHVixqL5DI1rW
         z6Zg==
X-Gm-Message-State: AO0yUKXDp1HfrhFPk9DgJrvf43JkxYUCTett/XXU2wk/P43uQDS8lcBI
        hCz8YUrpHr8T7+5bSChJ5anPIK5X/DabJltNrOUUlA==
X-Google-Smtp-Source: AK7set/61AMYkN1IcvzWoMbfVQGVWVJ6sXe80yDD2sl8IBIw0pKpIZjfs38pXwO6Fk7CuNio/c4iwV+JAnE9bV44NlQ=
X-Received: by 2002:a67:ea49:0:b0:411:a740:c3ea with SMTP id
 r9-20020a67ea49000000b00411a740c3eamr27072531vso.0.1678873475032; Wed, 15 Mar
 2023 02:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182557.42215-1-andriy.shevchenko@linux.intel.com>
 <20230307182557.42215-4-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdW7JjWvJUtvwJDwWLB5ygPiCRWLNM8E0iyRoD=HbzfVw@mail.gmail.com>
 <ZAoq+yAyPnI4zgto@smile.fi.intel.com> <CAMRc=McQKK2e86m1w7q4ysGCJcSSgDjV-tkAkFa626ko+eTeUA@mail.gmail.com>
 <ZAtiZn+rIaNmYoZs@smile.fi.intel.com>
In-Reply-To: <ZAtiZn+rIaNmYoZs@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Mar 2023 10:44:24 +0100
Message-ID: <CAMRc=McMnbWqAYf024bhaG3OERUzzdzRyp4gj-n20i108L65Jg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpiolib: Move gpiodevice_*() to gpiodev namespace
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 10, 2023 at 6:01=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 10, 2023 at 05:48:39PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Mar 9, 2023 at 7:52=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Mar 08, 2023 at 11:49:53AM +0100, Bartosz Golaszewski wrote:
> > > > On Tue, Mar 7, 2023 at 7:25=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > The functions that operates on the same device object would
> > > > > have the same namespace for better code understanding and
> > > > > maintenance.
>
> ...
>
> > > > > -static void gpiodevice_release(struct device *dev)
> > > > > +static void gpiodev_release(struct device *dev)
> > > > >  {
> > > > >         struct gpio_device *gdev =3D to_gpio_device(dev);
> > > > >         unsigned long flags;
> > > > > @@ -617,7 +617,7 @@ static int gpiochip_setup_dev(struct gpio_dev=
ice *gdev)
> > > > >                 return ret;
> > > > >
> > > > >         /* From this point, the .release() function cleans up gpi=
o_device */
> > > > > -       gdev->dev.release =3D gpiodevice_release;
> > > > > +       gdev->dev.release =3D gpiodev_release;
> > > > >
> > > > >         ret =3D gpiochip_sysfs_register(gdev);
> > > > >         if (ret)
> > >
> > > > But the only other function that's in the gpiodev_ namespace operat=
es
> > > > on struct gpio_device so that change doesn't make much sense to me.
> > >
> > > I'm not sure I understood the comment.
> > > After this change we will have
> > >
> > > static int gpiodev_add_to_list(struct gpio_device *gdev)
> > > static void gpiodev_release(struct device *dev)
> > >
> >
> > Do you want to use the same prefix for both because struct device in
> > the latter is embedded in struct gpio_device in the former?
>
> Yes, the logic to have logically grouped namespace for these APIs.
> Meaning on what they are taking as an effective object to proceed
> with.
>

I don't have a better idea so applied it.

Bart

> > > There are also gpio_device_*() I have noticed, so may be these should=
 be
> > > actually in that namespace?
> > >
> > > And we have
> > >
> > > static int gpiochip_setup_dev(struct gpio_device *gdev)
> > > static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *=
gdev)
> > >
> > > That said, what do you think is the best to make this more consistent=
?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
