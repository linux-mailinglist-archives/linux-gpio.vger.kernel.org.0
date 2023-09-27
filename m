Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D179E7B05FC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 16:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbjI0OCN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 10:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbjI0OCN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 10:02:13 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA83311D
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 07:02:11 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-59f55c276c3so104289397b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695823331; x=1696428131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBnyuiDOj3yAHdZQ44pdmLniIewRmVISdqXbyoGpKk0=;
        b=TZGhz3D9g85w+FGYnx1rBvQ+Kal7RELhFpKLXL1BCPDdRX/yiDDBhOzZqbQOImw0fX
         YHdADvGt2+kbguBEnlYKB9sNVIx9lelr4QqjDTwqFR+UTn8/79IAu1TRYfWTz7aOpCeB
         hP2H0G0bQQNOcbBX6RpLH9jLtRjy6xSqqFXOYlspmYNNSPmmWhijfR9Nm02QFJWzbCCI
         RuBPdKtbZDYkRg0F8qUqV+Zl1+W7o0wZhwRdNrP7qUw9zpCyT8St/KgmHTwmF7ZCEB8Z
         VCXlkpJPwIcQY1vxt4ZCz6PvRcI9YC6p3bk1A2hFQDRxdgDEeLJZs5ydr6N4Ef8vA+KM
         gK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695823331; x=1696428131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBnyuiDOj3yAHdZQ44pdmLniIewRmVISdqXbyoGpKk0=;
        b=gTK3S+oRR9F4RJ4urKwmPLq7e0jzdgzTvShcqfB9fgBgsvWMykCKZCEexTgD3o85cv
         Je/oA18rrszVawW86Qovl74aTXKl5Yp4jYk8cpag3E9t61QfrzqUof2tA+vXaEQ/u6ZN
         iAGZJ0F8GG6pUnwA34r7zKs/1DJxGj3Q5E8lWUMHo08S6YVMtxdcyeGM+kUczfpQ/2yg
         7XpUtrRtMyI9++cl2mOuvR+K9DZ09/GDxShFcUB5VDSlJVLZ53wPfOuiU7eozeu0O0zr
         1o8ztQsHqzeHljgnpAa1J6nPQiBq5Hg0SPAzofSpnS9CfNLsVkhTiyNQvJ33qqyiND5P
         nzZA==
X-Gm-Message-State: AOJu0YxGt9plfBsI5gwb3/kbjNhkP83VPJ3rBuXekI3NBCnrZBgqv03c
        TIvVUHPiatYurBwfNNhLpJCd+fQA7hCY8rnLQonBJA==
X-Google-Smtp-Source: AGHT+IG3NIoS6t9C0t4P+lYpvc2BAFnmgw/owkIpeAAJonSeGsCHw+DvTSU0bTM47IDgbJEqaN0QxEtIvSU3OMHue9A=
X-Received: by 2002:a05:6902:4f2:b0:d4b:6a0:fe2b with SMTP id
 w18-20020a05690204f200b00d4b06a0fe2bmr2221423ybs.36.1695823330766; Wed, 27
 Sep 2023 07:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230924-pxa-gpio-v1-0-2805b87d8894@skole.hr> <20230924-pxa-gpio-v1-1-2805b87d8894@skole.hr>
 <ZRE3JNVNqFN0knHl@smile.fi.intel.com>
In-Reply-To: <ZRE3JNVNqFN0knHl@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 16:01:58 +0200
Message-ID: <CACRpkdZdSTCeobuFdXNbJcHTKJp1V=t1sfp2tp25Mb0FBh74pA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
To:     Andy Shevchenko <andy@kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Cc:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 25, 2023 at 9:30=E2=80=AFAM Andy Shevchenko <andy@kernel.org> w=
rote:

> > +     if (pxa_ohci->usb_host)
> > +             gpiod_put(pxa_ohci->usb_host);
>
> Linus, Bart, do we have misdesigned _optinal() GPIO APIs?
>
> In GPIOLIB=3Dn, the above requires that redundant check. Shouldn't we rep=
lace
> gpiod_put() stub to be simply no-op?

You mean the WARN_ON(desc) in gpiod_put() in the static inline
stub version?

I thought about it for a bit, drafted a patch removing them, and then
realized the following:

If someone is making the gpiolib optional for a driver, i.e. neither
DEPENDS ON GPIOLIB nor SELECT GPIOLIB, they are a quite
narrow segment. I would say in 9 cases out of 10 or more this is
just a driver that should depend on or select GPIOLIB.

I think such drivers should actually do the NULL checks and not be
too convenient, the reason is readability: someone reading that
driver will be thinking gpios are not optional if they can call
gpiod_set_value(), gpiod_put() etc without any sign that the
desc is optional.

If the driver uses [devm_]gpiod_get_optional() the library is not
using the stubs and does the right thing, and it is clear that
the GPIO is *runtime* optional.

But *compile time* optional, *combined* with runtime optional -
I'm not so happy if we try to avoid warnings around that. I think
it leads to confusing configs and code that looks like gpiolib is
around despite it wasn't selected.

If the code isn't depending on or selecting GPIOLIB and still
use _optional() calls, it better be ready to do some extra checks,
because this is a weird combo, it can't be common.

Could be a documentation update making this clear though.

What do you other people think?

Yours,
Linus Walleij
