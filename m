Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E78435E19
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 11:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbhJUJpR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 05:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhJUJpQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 05:45:16 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBC9C06161C;
        Thu, 21 Oct 2021 02:43:01 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y30so1107197edi.0;
        Thu, 21 Oct 2021 02:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7d9A19lddRW8irMmh+Mt66ZHeRLI+KZdHS1ByPMNTZA=;
        b=HeHRHIxxA8UavrLE5b8DPIXOG7Pxxaru8WIwBp2TIKbAw2VV2wvlI2Yy9XpqjeH129
         rHtHfBemKPWFqyVaHvnGyJCNA2GIPUPHGc4YzMg31Gr3HvJ7ecHjxPqF4oTL/JgU1m/a
         2iXbLL5grsqX+d3nM1wO+afmPTR/f0Mxy+q+JFaQWQCLbSu6JvQVsnzXiJCbI/MNNLPo
         0gq9CR39u/GCgVgxpTP5YgQsZrLQFgrsHRw3wYwhQcIDPfFOoQjDgB6JPRANkGQsUoZ9
         XxHti8bRkPTYkZDNHw8KtE8u2vH7FCMgoTx8Igk87tEJ+UG/C4AyHAeYDDC+jRfrXTUv
         rkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7d9A19lddRW8irMmh+Mt66ZHeRLI+KZdHS1ByPMNTZA=;
        b=emzq1HLby3mRr+g38NoTWja8Y8bZr/H+1M32FHBuHMOjQDofBxZAqv1epwxtAv0JWc
         4D8mmxeu4A1F9wLgDXnYKvdUew+zTo/GO8JCl62NzQuLDR0ZQdWIOeQukD+46t8KKh7E
         ZNSXaDrXlLHOACT02iXGRBbP6r7jTgl6wzQJ1q7Q+tlJ50KMGXfZACHqDn6moEZ5iafm
         +TVydyYi5gW55GjEoMDdmDPfvjadTfjculX5xQIkU4PTku5QU5yhIkzOt9QX1ZCtVFF2
         cNbx8jFolVVqz11B0Lz+OxYAVGloKJwWNYln6AaWUGtb6ITE2rBJFXjG3D0WfvPItgIT
         n/OA==
X-Gm-Message-State: AOAM532HVxsB9KVORiwxnQGMfbYWDBt+f0W22cjtrP3R7ZqFE5Qr5wdw
        PKrecQ6Pt1V+WSK7iyKtCsxq807IMDNGwTRsFqjXLBJdW7zh7w==
X-Google-Smtp-Source: ABdhPJx00Jiy0O/uySthYcE3x9sIdkDX1n8r7Bnsji3a+Y4fd2EPOVRK3VPIF267F5EQ+BjxjNEsxoP0r30oQflszrs=
X-Received: by 2002:a17:907:8a27:: with SMTP id sc39mr5961020ejc.567.1634809379628;
 Thu, 21 Oct 2021 02:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <8ca87330fd348fc5199ad08904ec90cc6a91a1bf.1634723848.git.viresh.kumar@linaro.org>
 <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com> <20211021043443.snhqpac5ofmxfb7k@vireshk-i7>
In-Reply-To: <20211021043443.snhqpac5ofmxfb7k@vireshk-i7>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 21 Oct 2021 12:42:05 +0300
Message-ID: <CAHp75VdKn7Sze9HxN0gBgbuQS2K6oB+SQsufw576Rkfg4-osOw@mail.gmail.com>
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

On Thu, Oct 21, 2021 at 7:34 AM Viresh Kumar <viresh.kumar@linaro.org> wrot=
e:
> On 20-10-21, 18:10, Andy Shevchenko wrote:
> > On Wednesday, October 20, 2021, Viresh Kumar <viresh.kumar@linaro.org>
> > wrote:

...

> > > +       case IRQ_TYPE_NONE:
> > > +               type =3D VIRTIO_GPIO_IRQ_TYPE_NONE;
> > > +               break;
> >
> > IIRC you add dead code. IRQ framework never calls this if type is not s=
et.
>
> Yes, but it is allowed to call
>
> irq_set_irq_type(irq, IRQ_TYPE_NONE);
>
> and the irq framework won't disallow it AFAICT.

That's true, but how you may end up in this callback with a such?
What the meaning of that call to the user?

...

> > >  struct virtio_gpio_config {
> > >         __le16 ngpio;
> > >         __u8 padding[2];
> > > @@ -44,4 +56,17 @@ struct virtio_gpio_response_get_names {
> > >         __u8 value[];
> > >  };
> > >
> > > +/* Virtio GPIO IRQ Request / Response */
> > > +struct virtio_gpio_irq_request {
> > > +       __le16 gpio;
> > > +};
> > > +
> > > +struct virtio_gpio_irq_response {
> > > +       __u8 status;
> > > +};
> > >
> > I=E2=80=99m wondering if those above should be packed.
>
> You are talking about the newly added ones or the ones before ?
>
> In any case, they are all already packed (i.e. they have explicit
> padding wherever required) and properly aligned. Compiler won't add
> any other padding to them.

Is it only for 64-bit to 64-bit communications?
If there is a possibility to have 32-bit to 64-bit or vice versa
communication you have a problem.

--=20
With Best Regards,
Andy Shevchenko
