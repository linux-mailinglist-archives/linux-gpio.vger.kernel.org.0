Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A51F97978C3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 18:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241883AbjIGQyi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 12:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244579AbjIGQyi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 12:54:38 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBA8199F
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 09:54:01 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1ccc0d2e697so827657fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694105581; x=1694710381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYCw6MjcMH0VBXX64k2n7JI1Ap28j06fLMRRfYT33EM=;
        b=lsVW64goHwNjHdC31bzgoQV59Y6gK6jXLTWBiHiyGYZoUFZjUfVeACJ69pgJyfNRsv
         z4Tl9BAHtdE8Vr+16o89JJpaWYuOqY+KaK95sRx9qWKEoCDEq6kuJiNauQwDOxee7lwb
         d69ocjlSCyFdMShgFMfDDEhhtPLXmv1X2Uhzwqj7Z23xuqs17TQuvySz2APV+v2E6POK
         XF4v4N8aGz/mz4VrGWxqZqL3S9NwYX4LrhuqMV4n/TjxV5wJea5wimkLJ862rmBqV0CI
         oaF+3Xks1XXcxR2zjVhQDdgv66GWvUHKpNV4HkHKWI/vWuEDQ38fOQJM3wi8cKUfzs/Z
         7XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694105581; x=1694710381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYCw6MjcMH0VBXX64k2n7JI1Ap28j06fLMRRfYT33EM=;
        b=LohsDwI7lJ5uA35Qnpf4jbMkDnZawK2evcTMU57rS67mCbfVgO0fgIC843pO/uOGdA
         kEgzQPFfrdMqZCymC8ME6xqm6/RfiZM7b/D32W+AggApZnNKFngRfbv7p9OmBQ4MvaRA
         Z887n5UylXqnRKasgIXVaYwk81AeiToGxqGNNRtv08EEVTiJOOrRkQvKO2gSKJFD91sP
         CrPpk+6GkObn4H1OgOAQDhbbPupyCaUnvnDon/c/FjTNoFaQSuZylyM73HzW9iMwDMYg
         OUZBwhohoBt3KPKDWLF5MZvR2ckm3fs3SbXSwK52m987iXBfHEQoNFzg+9ME9WMuAEpm
         Yn5w==
X-Gm-Message-State: AOJu0YwVFbOoe6wi7N5K2knEP5VTEX3AyYKU4+E/cJLy4RVVkEdwg19q
        IRL9kESXn2bxJmOhT9syDmVyGhpumy6Cpg5kqKhkWDBYTgEgVcya
X-Google-Smtp-Source: AGHT+IEKK3pIZHt2QRqcId7nWRc2DLGZhZ7BIVl+nPAXJnwX2Sf45+9R0pQFVmMx9pkduIAsjCSxAhDM52WNmcfhZPQ=
X-Received: by 2002:a67:fa11:0:b0:44d:6290:e422 with SMTP id
 i17-20020a67fa11000000b0044d6290e422mr4850316vsq.35.1694073434785; Thu, 07
 Sep 2023 00:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-8-brgl@bgdev.pl>
 <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
In-Reply-To: <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Sep 2023 09:57:03 +0200
Message-ID: <CAMRc=McSBBeHi5jDVYOF6s1etfQzYRNLo25LeY+DWG_2tEf7=w@mail.gmail.com>
Subject: Re: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 7, 2023 at 9:17=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Let's start adding getters for the opaque struct gpio_device. Start wit=
h
> > a function allowing to retrieve the base GPIO number.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I guess you have a solid usecase for drivers needing to do this
> crazy thing, because I suppose you feel as much as me that
> this should rather be gpiolib-internal and confined to
> drivers/gpio/gpiolib.h?
>
> If you add a valid reason for making this globally visible outside
> of drivers/[gpio|pinctrl] to the commit message I guess I can live
> with it because we need to think of the bigger picture:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> It brings to mind the now confusing "base" inside of
> struct gpio_chip. We all know it should go away, but since it
> is never used during the lifetime of the gpio_chip - or SHOULD
> never be used - it should rather be an argument to
> [devm_]gpiochip_add_data( .... int base);...
>
> Maybe something we should add to our TODO file.
>
> Yours,
> Linus Walleij

For this series it's the HTE driver that uses it and I don't have a
good idea about how to change it. Dipen?

I would also love to make pinctrl not use the internal GPIOLIB header
so it'll be another user, unless you can figure out a way to not use
gc->base? :)

I think we're stuck with it for now.

Bart
