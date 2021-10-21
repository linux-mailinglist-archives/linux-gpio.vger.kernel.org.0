Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31B2435E78
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 11:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhJUKBg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 06:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhJUKBg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 06:01:36 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4601AC06161C;
        Thu, 21 Oct 2021 02:59:20 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w14so456452edv.11;
        Thu, 21 Oct 2021 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f1lAHZpbTINEGGOzg3KvBrzQHfCd9hUnr+Z5eklsu4I=;
        b=cFFPatN176idTJdu0RK5l+kgO+3oCC5KaWLjea3KK5xjWay26jR7SEKg+PSa/La44d
         RHlgGG86uVG48vXTwBYdRy/JDoMbGoxGz/VcgV+6hsyKfySMymh2V96Lmcr7s5HHzqQo
         BxKzexJQbqOgYTZrpyb6DYYHgJ+WTL4wgijIM/J3VVRqnKyvl1CevIaf6oyJ+jpvgYMz
         kektjeiL9LDJUTuWPVhsMibZT8ZwQrliI0QwsudkrLnqw/Y15n3d+eZ4wjGFfGUVD1pk
         ODw6DVhJuOoWFp1uKqszNKrOjO2ZraNxYJfPxY5Qu2NY2F1bMzkWVShW1RtGX+vdn851
         AL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f1lAHZpbTINEGGOzg3KvBrzQHfCd9hUnr+Z5eklsu4I=;
        b=XSTzmwjJJH2HBJwWLwIcZNGgY1VSXsNFqFwm5M1q/6c6c1lLb0tW8bJML0OssZfUyw
         SIvUXmdJBjHRPBZPb2LsCkUGAJE+5XoR8oyNAzYrCMTd7wf9VHwALQ6x1+3B24letw8X
         GCqCSgT1fe1pFvsvl17eMAzqq3LzN6vk7Z5tLUrFwYHIblfvyPXAX6UwJIGTSynfz6wu
         kNIE629Mk+Os7TCD+2qbrmbWuO4OgNsqRvwpHprEeitCKlr/ShcSwb0LJr2eZAqUePvN
         8QbUFChHpTxseePmhL9qdtVTcSG5bubQNMRRb+5e9ruyQwt0+6PJPJR4as067etibpjQ
         ZFhw==
X-Gm-Message-State: AOAM530Mp3Q4ulHfGtdjA2N64Z4UBHUYsi+EKRnKzgGJ7xohC0Xg/8Ko
        fP/uGNIFkQCzWCpmBNzcLZ1PXAA/Oy9a+yDBSLv6KkVg9avpiQ==
X-Google-Smtp-Source: ABdhPJyDCgSTt3/IAgVwU9WSF3RqG/zAQBAURKsmJcGNhL738ts5nX0FRkRfgucOXR1U7//HXc+3nGoarGxBgTv5X38=
X-Received: by 2002:aa7:c0d2:: with SMTP id j18mr6461565edp.107.1634810358797;
 Thu, 21 Oct 2021 02:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <8ca87330fd348fc5199ad08904ec90cc6a91a1bf.1634723848.git.viresh.kumar@linaro.org>
 <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com>
 <20211021043443.snhqpac5ofmxfb7k@vireshk-i7> <CAHp75VdKn7Sze9HxN0gBgbuQS2K6oB+SQsufw576Rkfg4-osOw@mail.gmail.com>
 <20211021095229.lqeb7dtxv4ix2vc5@vireshk-i7>
In-Reply-To: <20211021095229.lqeb7dtxv4ix2vc5@vireshk-i7>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 21 Oct 2021 12:58:25 +0300
Message-ID: <CAHp75VcBowxFoseXKwU2VjNcu75ttvHW_sno9MihHL88+oP1ew@mail.gmail.com>
Subject: Re: [PATCH V6] gpio: virtio: Add IRQ support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 21, 2021 at 12:52 PM Viresh Kumar <viresh.kumar@linaro.org> wro=
te:
> On 21-10-21, 12:42, Andy Shevchenko wrote:
> > On Thu, Oct 21, 2021 at 7:34 AM Viresh Kumar <viresh.kumar@linaro.org> =
wrote:
> > > On 20-10-21, 18:10, Andy Shevchenko wrote:

...

> > > > >  struct virtio_gpio_config {
> > > > >         __le16 ngpio;
> > > > >         __u8 padding[2];
> > > > > @@ -44,4 +56,17 @@ struct virtio_gpio_response_get_names {
> > > > >         __u8 value[];
> > > > >  };
> > > > >
> > > > > +/* Virtio GPIO IRQ Request / Response */
> > > > > +struct virtio_gpio_irq_request {
> > > > > +       __le16 gpio;
> > > > > +};
> > > > > +
> > > > > +struct virtio_gpio_irq_response {
> > > > > +       __u8 status;
> > > > > +};
> > > > >
> > > > I=E2=80=99m wondering if those above should be packed.
> > >
> > > You are talking about the newly added ones or the ones before ?
> > >
> > > In any case, they are all already packed (i.e. they have explicit
> > > padding wherever required) and properly aligned. Compiler won't add
> > > any other padding to them.
> >
> > Is it only for 64-bit to 64-bit communications?
>
> That's what I have been looking at.
>
> > If there is a possibility to have 32-bit to 64-bit or vice versa
> > communication you have a problem.
>
> This should work as well.
>
> The structure will get aligned to the size of largest element and each
> element will be aligned to itself. I don't see how this will break
> even in case of 32/64 bit communication.

I admit I haven't looked into the specification, but in the past we
had had quite an issue exactly in GPIO on kernel side because of this
kind of design mistake. The problem here if in the future one wants to
supply more than one item at a time, it will be not possible with this
interface. Yes, I understand that in current design it's rather missed
scalability, but hey, I believe in the future we may need
performance-wise calls.

--=20
With Best Regards,
Andy Shevchenko
