Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A37879E7B8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 14:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237918AbjIMMOj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 08:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240258AbjIMMOi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 08:14:38 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786FD19B6
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 05:14:34 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-450f8f1368cso152495137.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694607273; x=1695212073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNH09RVKlzC6zbBS1OPGS8SNq+HiOlHRmJhvVqI7zwg=;
        b=ZkeSEMlcMrwpSzjBmdee+vqYsvFdj0OTAD6PigY6AFv/bvTDqDAgJLzJWhoGw62okY
         FxMtFpDLJte+1fJhuwN7WQtbJID8U0rVr3HVbTODVaE/h7g9MD+M1NyCPyMcrtuvZvhW
         OBQiYdqQepk7bxUev93JWYzuiankVbM4yOC1pKXIwQvrVhkr8SxZxHWUtAHXhX7i3Gsc
         EVkNOoAwR1cNkVqbbZlos9HP/QJQczTKkExPQJtGrAN59GtIffQN11XbpGdJm0VHG82J
         XjkVJmgRjsPd+iVGkMuZb1dL7Cbev7AmdeWVSnHxB9/8h7RcmA3776xhSPiH7dHldEJK
         hVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694607273; x=1695212073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNH09RVKlzC6zbBS1OPGS8SNq+HiOlHRmJhvVqI7zwg=;
        b=eRVEMoQeGhiRaXPL+qBdSVzR9L5MxCQKPMpMwH+72KgxsO0hbSOfwMZ/FrmN1KVfta
         6GEQpzhdhNhFSp8wl7HXbfZ3wtNQPezLs6IMywmRXX1cQXu9VSG5FUnGzZCPV5X5i15S
         W40G7w+LgzCaTXQOywM0l0qIGqq3sZi1T1vTVAtWkEmiCIXeThrIULBQBAWhJ5pNrh9l
         6rTQVR2XHNXw/zBxR5JLuUyM+yPv6Zjcbpw8DdUJGv+wIKGMN6s/uHX626pvpoPDWrQG
         q5eG7DheHtCsFDYfckCIY1dEfCBi/VZDxZKCo+a7IappoUK0QauWLvcYPYnHzBXFCxGF
         3Beg==
X-Gm-Message-State: AOJu0YyqUDrq9ROBDCnxMJ8Lo9Z0y9dUKjpg1FEf0UE4hp9HRXvDWJJG
        qnZ6zGUZ3xb50Q2y9bYkeA5PLQ3wh87Z7OKyDYaY5A==
X-Google-Smtp-Source: AGHT+IFB9MOD674QBFW3BfC7iwHqqcvuHPxTky7cci63LpW4Yt3DGOQ2wqX59JgllurgFttARD5PWXvOXY7uvJm1flY=
X-Received: by 2002:a05:6102:301b:b0:44e:9113:ac58 with SMTP id
 s27-20020a056102301b00b0044e9113ac58mr1717040vsa.6.1694607273451; Wed, 13 Sep
 2023 05:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230912094519.22769-1-brgl@bgdev.pl> <5877cd0d-7a39-806a-e8f8-ef0c3c22dae3@linux.alibaba.com>
In-Reply-To: <5877cd0d-7a39-806a-e8f8-ef0c3c22dae3@linux.alibaba.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Sep 2023 14:14:22 +0200
Message-ID: <CAMRc=MdK9637mtuE=4fdMCWtNx6=oZcm6KfEyTZfktceDisENw@mail.gmail.com>
Subject: Re: [RFT PATCH 1/3] gpio: eic-sprd: unregister from the irq notifier
 on remove()
To:     Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 12, 2023 at 1:02=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 9/12/2023 5:45 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This is a tristate module, it can be unloaded. We need to cleanup prope=
rly
> > and unregister from the interrupt notifier on driver detach.
> >
> > Fixes: b32415652a4d ("gpio: eic-sprd: use atomic notifiers to notify al=
l chips about irqs")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> LGTM.
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>

Thanks, queued patches 1 and 2.

Bart

> > ---
> >   drivers/gpio/gpio-eic-sprd.c | 19 +++++++++++++++++--
> >   1 file changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.=
c
> > index 21a1afe358d6..9b2f9ccf8d77 100644
> > --- a/drivers/gpio/gpio-eic-sprd.c
> > +++ b/drivers/gpio/gpio-eic-sprd.c
> > @@ -580,6 +580,14 @@ static const struct irq_chip sprd_eic_irq =3D {
> >       .flags          =3D IRQCHIP_SKIP_SET_WAKE | IRQCHIP_IMMUTABLE,
> >       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> >   };
> > +
> > +static void sprd_eic_unregister_notifier(void *data)
> > +{
> > +     struct notifier_block *nb =3D data;
> > +
> > +     atomic_notifier_chain_unregister(&sprd_eic_irq_notifier, nb);
> > +}
> > +
> >   static int sprd_eic_probe(struct platform_device *pdev)
> >   {
> >       const struct sprd_eic_variant_data *pdata;
> > @@ -658,8 +666,15 @@ static int sprd_eic_probe(struct platform_device *=
pdev)
> >       }
> >
> >       sprd_eic->irq_nb.notifier_call =3D sprd_eic_irq_notify;
> > -     return atomic_notifier_chain_register(&sprd_eic_irq_notifier,
> > -                                           &sprd_eic->irq_nb);
> > +     ret =3D atomic_notifier_chain_register(&sprd_eic_irq_notifier,
> > +                                          &sprd_eic->irq_nb);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "Failed to register with the interru=
pt notifier");
> > +
> > +     return devm_add_action_or_reset(&pdev->dev,
> > +                                     sprd_eic_unregister_notifier,
> > +                                     &sprd_eic->irq_nb);
> >   }
> >
> >   static const struct of_device_id sprd_eic_of_match[] =3D {
