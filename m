Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203FC7CC6D5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 16:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbjJQOw7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 10:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235116AbjJQOwx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 10:52:53 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068975BAD
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 07:51:16 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49abb53648aso1695967e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697554274; x=1698159074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5z2VQERwTnHSvknuk1StgxnUpwCYFIbvu15sN77nf8=;
        b=ExI/2OghZTU9pTVV/9CR3BC7+9IYLeHgKYDhyi7JBD+SX/jKyTVIq/9i1kYsNpeZv1
         c2ZLeybdo1fjGNQGcwhfhpU25eQtF9mMOrZJ8SIrlHAmgacohP3Pa6Hlqa+H/4xD+RTW
         vwe4Dzetgsap+NW9kRDlN7C1a77mLL84hkwyRajoHzkFfq5f+zBoh14dE9tQj8W3GobW
         rIj+ycCnTJa2IooVR3oGKbA0G7iWO7LstP0EIiHzi2Uf+rWMvzqLDRaCMV8YXoMQbhOn
         k8MEmhpLR30oNOGFyUTkiAs9VDy+ylDEdc2IDaV9QlA6kpMkM+ES71VyQvFaUP8AAq5f
         REEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697554274; x=1698159074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5z2VQERwTnHSvknuk1StgxnUpwCYFIbvu15sN77nf8=;
        b=vVecAwTzTy1bYxw/H4ZljyA74RPSNwNbgGKHPRE8HPMOagjFG6joAfHVT/t8N1bcFn
         xmJa+egf3qcpVCOpvVOMaWllnsDVLd7yJ6RcefDBMobcskPrqvTNVtHLiByeh7b19IUs
         MGJITx9jMM4HT5WSNWcoEtUzh+q0oLAUcmnXSQFBWXv3d4PPymRjakBcxFhPcRwyj5AH
         NCoe/4X419+Qp9LJUUCmj5bM+gm+vRg7V9l5sW202BPrctRZfKdHDUHpdX/0UZZpmcca
         N57q1NkiR85hJZbQELD/9lWD3qXsv+i3TRTiAb/XAWJR1fwhDk2SMf1TjyofON0J2U6w
         p/Dw==
X-Gm-Message-State: AOJu0Yxx51wLIgKeelnDz64WJiRlVF2NiBzBfozNY2190ekng0dRaodO
        u6DcEvJ6xVcHeAQ3lPhbJCRx3xW/o0vbvuUTbMlSPA==
X-Google-Smtp-Source: AGHT+IFFPrIjuefWAoeXE7go+vf4kjVm1qdFs1yYBsBZd3y39xkFMYkhc2D3dpLUSosB32vra9pyqU0YRgTDlXfGs3U=
X-Received: by 2002:a05:6122:182a:b0:49d:f67:208 with SMTP id
 ay42-20020a056122182a00b0049d0f670208mr2648080vkb.1.1697554273799; Tue, 17
 Oct 2023 07:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231017120431.68847-1-brgl@bgdev.pl> <20231017120431.68847-55-brgl@bgdev.pl>
 <ZS6BAkfFeA+6GYfz@smile.fi.intel.com> <CACMJSesgT-a8krB8gvf0gJ-C+p6s1TdRcE6W_42CxR9bDvrGHg@mail.gmail.com>
 <ZS6CGcRPNzkCdnoD@smile.fi.intel.com> <CAMRc=MdbYN+ropwecPbTptV7KEt-0NdWOHn1Uq_2dgWcPv-D=A@mail.gmail.com>
 <ZS6JNXWPkDW+aoYs@smile.fi.intel.com>
In-Reply-To: <ZS6JNXWPkDW+aoYs@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Oct 2023 16:51:02 +0200
Message-ID: <CAMRc=MeXJiLoHJBR4zK7q6rY1cbBwyiAQWUNxLtfZzPDDkC+vw@mail.gmail.com>
Subject: Re: [PATCH v3 54/73] pinctrl: intel: drop the wrappers around pinctrl_gpio_direction_input()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 17, 2023 at 3:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 17, 2023 at 02:55:07PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 17, 2023 at 2:46=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Tue, Oct 17, 2023 at 02:44:25PM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, 17 Oct 2023 at 14:41, Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > On Tue, Oct 17, 2023 at 02:04:12PM +0200, Bartosz Golaszewski wro=
te:
> > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > >
> > > > > > pinctrl_gpio_direction_input() now has the same signature as th=
e
> > > > > > wrappers around it so we can drop them.
> > > > >
> > > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > >
> > > > > Now, for the sake of symmetry can you add (at least to the all
> > > > > Intel drivers you modified in this series) the following:
> > > >
> > > > Good idea but this is v6.8 material, I don't want to extend this
> > > > series anymore at this point.
> > >
> > > Then let's postpone at least Intel and Cypress patches after v6.8-rc1=
 is out.
> >
> > But then we'd have to postpone the renaming and we'd be stuck with
> > both variants in the tree. This is suboptimal. We'd also have this
> > huge series spanning two subsystems for 3 months during the v6.8
> > release cycle in the tree causing conflicts and other issues.
>
> I don't see how this is related. What I'm talking is only related to drop=
ping
> the wrappers in the drivers _after_ whatever you do with generic APIs.

Ah, I misunderstood you. Ok, I'll drop them from the tree.

Bart
