Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE98E2A6963
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 17:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730797AbgKDQXo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 11:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgKDQXm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 11:23:42 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089FDC0613D4
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 08:23:41 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id o11so11505906ioo.11
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hGHEBXl4t4FlUOwwa4BejHx4CUe078KEVor3Spe3A/A=;
        b=w8JUSM0f32IBh7Zao/5wCL3OiHPwIngBoZ2GJxQSPYZq0asU7S3tNFWo0mRKTKeyfY
         HKoJgFhY7a2evn4vy0/FRsMtjom2TvDCglEMErwZON/rHIrwQHPf+gei8TxuLl1G6SDG
         Xl6ezpaIzTlrBI5bR2ykRN9gO0mCNKKkScbKgMCubuKSc5OgJX0oHpdKWR5w/9mN6n7N
         R2CE4LdMKY6k1bYg60G5tXWDKjSEck+8XYkn6N9BQDIje2VWVvuunk0eHUPxPGJu/kwM
         4F11ToCvtzjM2PL7T4mmVF45zZcxm9SW0ULiYklbRQUjJmeoO4HSJ+dLuLFDTsc7Tk+e
         Qa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hGHEBXl4t4FlUOwwa4BejHx4CUe078KEVor3Spe3A/A=;
        b=J8jTsEW0s8AUQDBeF1X94WUMy+NyY1DKtzUtG983fNgfWVeX+M591yBkPfi1dEut4o
         Y3N982dn4JX8luL5C+ODuxhx0e4IKYzaO7J+4AY1QxxtJq7SUfnpezpaFRBvtMLOhB8z
         AxciwoFvD18ygmSzzjsMWVwv5+iLG1fgvDy/WY46AnfTmHhr/nrfIkS/1XrmwHMr7+1Z
         LP/DD4I4ETBby4ELxJQW4cLl3/t/ca6GurJ3pAi5oChm8n2fldDH2LC1FrL5k/APTrKs
         qWKl6wITw9+Ab5MHm+IT6u4ci3N7hFHZaMIH7wHeeH3pclLW7zAGKcGg+P3UUQ7DN6YC
         jG1A==
X-Gm-Message-State: AOAM531LrmXUtKIlsbkRRZZN9vtdHpKzZkHBWKFkX6BKFQWC8F/p2Rw2
        n0IxJ1J/6AOsz8GKS0sVQh6zJLtkUirc3WiUnuF7CA==
X-Google-Smtp-Source: ABdhPJwLwdwjEMHMoIOS+8+36IQ8PRe/FxcPAomSQgWKr8wj/R+t1Vzk1CF3kz5M6erf73ZQ/czhvyCXu3SJqDnYN+0=
X-Received: by 2002:a6b:8d49:: with SMTP id p70mr784662iod.31.1604507020444;
 Wed, 04 Nov 2020 08:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <CAHp75Vf07dsUXZ8Dr-KY-NFQv+C2QQVEOH_se7vYMT6hdm-U3Q@mail.gmail.com>
 <1fd4d69b-4d64-05e5-45a3-b2182fb2d207@siemens.com> <0ab04241-4756-873b-980a-572b225c16e9@siemens.com>
 <CAHp75VdRNFqDySL6D-7BzBMRu1+aPgeT=kxWtcthYH3pVWRycg@mail.gmail.com>
In-Reply-To: <CAHp75VdRNFqDySL6D-7BzBMRu1+aPgeT=kxWtcthYH3pVWRycg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Nov 2020 17:23:29 +0100
Message-ID: <CAMRc=MfDvtb13NLnwZNPNnP8NtWZRnok-Rd664LviUryqKAJvg@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: exar: refactor the driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 3:51 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Nov 4, 2020 at 3:57 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > On 27.10.20 16:12, Jan Kiszka wrote:
> > > On 26.10.20 15:46, Andy Shevchenko wrote:
> > >> On Mon, Oct 26, 2020 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >>>
> > >>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >>>
> > >>> I just wanted to convert the driver to using simpler IDA API but ended up
> > >>> quickly converting it to using regmap. Unfortunately I don't have the HW
> > >>> to test it so marking the patches that introduce functional change as RFT
> > >>> and Cc'ing the original author.
> > >>
> > >> +Cc: Jan, AFAIR their devices are using Exar UART.
> > >>
> > >
> > > Thanks for CC'ing. I cannot promise testing this soon, but I will try my
> > > best.
> > >
> >
> > Finally tested, unfortunately with bad news:
>
> > Code: Unable to access opcode bytes at RIP 0xffffffd6.
>
> I guess it is due to missed error pointer handling somewhere, as above
> is equal to -ENOMSG.
>

Yeah I'd guess it's the regmap pointer but we do check the return
value of regmap init with IS_ERR(). :/

Bartosz
