Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C12435FA7
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 12:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhJUKuS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 06:50:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:59372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229570AbhJUKuS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Oct 2021 06:50:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FD7461208;
        Thu, 21 Oct 2021 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634813282;
        bh=ftmKtS2bsq2zSure2HQbHHqjeIyXSqI4u6snY7qmG/4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VCHpdxkvA1/+5+357oswtsudvSUqLPsULdFQQccD97VP64Q8kr/JGLt79yFNkUSCD
         H8rfHpw3UoLkvhW5kF/adIyvpyiR4et6KJz36Xti3S8OeyQ1usZ3Sj4IbmS6Vs+6vt
         Xs1ZY94Gb1SIvHGwaG+iwjKYJDp4WslkI7vRgIwInUBJANAi90GA56IkXV8tDUICrg
         48Jc2znswYAfVYKrdmZHD30MDdvehqHczhcmY1ONzm46G0F4prWoI5JDidUon6DkZS
         kK0i6ij25GpvR/P7rwlBlvtRTFfAaV4ueGDvCn57JCvNNLjqjZLIAiV+9YwJMBtufP
         ddd+EFTu9DX2Q==
Received: by mail-wm1-f47.google.com with SMTP id m42so217070wms.2;
        Thu, 21 Oct 2021 03:48:02 -0700 (PDT)
X-Gm-Message-State: AOAM532u/WxEPNk57lepOO/iPcHtDO4n/OCyqr3AO5hPL8Cm0yX6NrUr
        c5Z3TJiviKKLlukxtbAERxPljBg4SkENjRkEJVU=
X-Google-Smtp-Source: ABdhPJx4otVK1NBMU1BYDaKjledezy1hEl+jDxxDEuoXvKjJPlwHlu+YaT25QspQPcVeGwmaw4DT84NrjKxUV7j5nms=
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr19520872wmi.173.1634813280768;
 Thu, 21 Oct 2021 03:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <8ca87330fd348fc5199ad08904ec90cc6a91a1bf.1634723848.git.viresh.kumar@linaro.org>
 <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com>
 <20211021043443.snhqpac5ofmxfb7k@vireshk-i7> <CAHp75VdKn7Sze9HxN0gBgbuQS2K6oB+SQsufw576Rkfg4-osOw@mail.gmail.com>
 <20211021095229.lqeb7dtxv4ix2vc5@vireshk-i7> <CAHp75VcBowxFoseXKwU2VjNcu75ttvHW_sno9MihHL88+oP1ew@mail.gmail.com>
In-Reply-To: <CAHp75VcBowxFoseXKwU2VjNcu75ttvHW_sno9MihHL88+oP1ew@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 21 Oct 2021 12:47:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3nH-ixVhyfjRHyj=GHsJ0HYmRYGhTDGMnmy01sKhSJeQ@mail.gmail.com>
Message-ID: <CAK8P3a3nH-ixVhyfjRHyj=GHsJ0HYmRYGhTDGMnmy01sKhSJeQ@mail.gmail.com>
Subject: Re: [PATCH V6] gpio: virtio: Add IRQ support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 21, 2021 at 11:58 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 12:52 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 21-10-21, 12:42, Andy Shevchenko wrote:
> > > On Thu, Oct 21, 2021 at 7:34 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > On 20-10-21, 18:10, Andy Shevchenko wrote:
> >
> > > If there is a possibility to have 32-bit to 64-bit or vice versa
> > > communication you have a problem.
> >
> > This should work as well.
> >
> > The structure will get aligned to the size of largest element and each
> > element will be aligned to itself. I don't see how this will break
> > even in case of 32/64 bit communication.
>
> I admit I haven't looked into the specification, but in the past we
> had had quite an issue exactly in GPIO on kernel side because of this
> kind of design mistake. The problem here if in the future one wants to
> supply more than one item at a time, it will be not possible with this
> interface. Yes, I understand that in current design it's rather missed
> scalability, but hey, I believe in the future we may need
> performance-wise calls.

In my experience, adding __packed to structures causes more problems
than it solves, please don't do that.

The rules for the virtio structures should be roughly the same that I
documented in Documentation/driver-api/ioctl.rst, and the layout that
Viresh has picked does not suffer from any of the common issues
that are listed there.

       Arnd
