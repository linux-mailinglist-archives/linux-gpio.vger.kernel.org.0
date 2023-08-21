Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 377BA7829DF
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 15:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235196AbjHUNEG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 09:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232866AbjHUNEG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 09:04:06 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2A9E6
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 06:04:04 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d7225259f52so3401570276.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692623043; x=1693227843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fftlaxB/hAY2qV7eGstMIqoqzzhLCuD6MNuSzMJeQ8Q=;
        b=uxHabXuXp1KNAVNO3m4TW3krW7hKeDEIgsHNMRhkluZkuCE7glVzKQTrDLKRiZdt9o
         7iXt0XB065FT5V9zE4KcvFQ3JXP+GzXFoTKtLSuXZKtbExY6exBJJ0tr0fAiWeB0AbiZ
         bw//4cbd8H/i6QCxQYPztItUwbnaTqiOholRPwbWCRxs4IZvXkwUW3zcJ+Nab0Jc//8K
         ITr5jTI4UB/E92ootLJcML4ki3fL8XWUIYt5ZrKlP+xKuoSb47lWikDmwJCkbcF+hfcv
         y3vxcLqXL3FBTwO42d7fkO/pqJmvEc0/bksPDQor39+2FpGk1AjATL0Mz5cwzfdel4BK
         Bddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692623043; x=1693227843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fftlaxB/hAY2qV7eGstMIqoqzzhLCuD6MNuSzMJeQ8Q=;
        b=SRNJ88NBm63iBQaUnsDlCrHAv/wyx2sLxt6rZ+fTqERVfA8zIKngExIkt3Z9m9to7O
         KktHbX7+XIz+O1UZkVDXMmeB08jjfqONW2mR535/nM7gBFgoB6pwebY2H5+jQIm2vebc
         G465Ma1IcYmi1tHSxly2WqcfeFgEk8eTr9/RS+S2m65N+wUTLG4dmdh1rdVG4BAZXtEg
         8e27rRm5f6XsRjUks6nsLbE5fJe/6TBgtuFRzFYXuDP5XaTVCAnSSBCHLjj6milV+C11
         x7zqHu5s/8a2J3LZQy8MTdBgLWhBB9sUcpYruukCNT4jmn7L/x5IiL4BpCobkZZ2Gg30
         f0wQ==
X-Gm-Message-State: AOJu0Yw09biB5Ocm2y+WlxjcSyXjOXhjEyNOPnA2Fbyjoq6K/rcUOojp
        EsUWimhuQ9Fib/DOVaWMKXZUp2ySVwY6cWetLUJzyw==
X-Google-Smtp-Source: AGHT+IF4hK9dTEy+qIC8KIyQfLc1auoMEebGvpJ7FiQxroEgxJgWgjBLCC6gtgisiv3apV0M7Qt2YoGTdUi3bIWiHwU=
X-Received: by 2002:a25:3746:0:b0:d3b:e659:5329 with SMTP id
 e67-20020a253746000000b00d3be6595329mr5894894yba.9.1692623043275; Mon, 21 Aug
 2023 06:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230817184958.25349-1-brgl@bgdev.pl> <20230817184958.25349-5-brgl@bgdev.pl>
 <ZN9IYYgD6q/H3EuG@smile.fi.intel.com> <CAMRc=MfHCz8CfJniDXhuHXovPZ5AvNdTFUT3-LNYM4sQ15d=yA@mail.gmail.com>
In-Reply-To: <CAMRc=MfHCz8CfJniDXhuHXovPZ5AvNdTFUT3-LNYM4sQ15d=yA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Aug 2023 15:03:52 +0200
Message-ID: <CAMRc=MdtEwZKtySM0DXrrQWz+nFDxDZxwXBhWXywctmz8gAX1A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] gpio: cdev: wake up chardev poll() on device unbind
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Mon, Aug 21, 2023 at 2:43=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Fri, Aug 18, 2023 at 12:31=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Aug 17, 2023 at 08:49:56PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Add a notifier block to the gpio_chardev_data structure and register =
it
> > > with the gpio_device's device notifier. Upon reception of an event, w=
ake
> > > up the wait queue so that the user-space be forced out of poll() and =
need
> > > to go into a new system call which will then fail due to the chip bei=
ng
> > > gone.
> >
> > ...
> >
> > > +     struct gpio_chardev_data *cdev =3D container_of(nb,
> > > +                                                   struct gpio_chard=
ev_data,
> > > +                                                   device_unregister=
ed_nb);
> >
> >         struct gpio_chardev_data *cdev =3D
> >                 container_of(nb, struct gpio_chardev_data, device_unreg=
istered_nb);
> >
> > ?
>
> I could live with the other version but sure, why not.
>
> I will send a v3 with a helper wrapper around
> blocking_notifier_call_chain() for more brevity.
>

Scratch that, I need coffee. This was supposed to go under the line
state notifications patch.

Bart
