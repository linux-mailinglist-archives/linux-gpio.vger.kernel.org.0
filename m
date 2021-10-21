Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BE0435A0B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 06:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhJUEhF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 00:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhJUEhE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 00:37:04 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 620ACC061749
        for <linux-gpio@vger.kernel.org>; Wed, 20 Oct 2021 21:34:49 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id m26so4786845pff.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Oct 2021 21:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=jaiLtlV833/Xq50ZtlkoTbBz4JFSnmlv9NeQfSfgHg4=;
        b=h0F95M0PrLk7D8QgNTB2BqUYk0J4hCY6SU0hpopoSa06OV3nxdYJX/bVam2+2+Lzl5
         p7qONW7e707xdv8XGXGWaUhExXHHlnvrNFFDBvwatduMlZQE47wE4JrSo/z4DMqJrTJP
         iljR1qxZPKcfPDCFIBUW7scAiHAMrb1gpHaaebd9bH6ZhbycqkKNfTZHdH18hMKnUqVr
         WoX5YdCw/UiEuuLbiVP8IvdFzrzLE/0BhhF0ycwlXo/aBB3oIbjikEcZllI3MM7fN3xP
         ZXIMey9d63vQXS++XKqh3fkDwLQ66LYdoAbEXIJdvbofBUyyNZTcC5kR+bIg+09ryaD6
         iKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=jaiLtlV833/Xq50ZtlkoTbBz4JFSnmlv9NeQfSfgHg4=;
        b=hCutTep4antEqFmmoOD2v1Xub7k2s1wJbxtwMwuI5VdU5QNXIyXrfGkptji73ianUQ
         axtZFTX/iVJVNptvlDuvaYeA6ZS1DXE/CwNLlT2pjlj+foN85OTQHLJiLPe8D+zHgciR
         aFkBOqbkFfY1GusnjqUzT27p0i/5WRV92U68xaqKvGtEkwXopt0obS5tBmjGKnwaqBVn
         Wz03d8DDbeFyfmwht/T2nsd2/QjRMC1gIviq34IOHB6HksWeu1ljaR2Rur5ubisJRuqs
         SIrCFGSEPPnDlLSdFMlKFcXKrTJ6JiL6scvgMAeQstD88HqQYNH7Pv9wYFrJvwtY647c
         poxQ==
X-Gm-Message-State: AOAM530D0wczX7RQHz/kokTladhVcbvfcJybUfdSPHcalKXnbNz+2bL0
        +MhmSQ4Sl4C19JJzoSM3UQZN+A==
X-Google-Smtp-Source: ABdhPJxy9sXJSpJeIDOujmjVoM00QXmZAzl/1qhqh2gyKuCmbib7G8Elu0hey3Nb4TAbQDYpK762Pg==
X-Received: by 2002:a62:15c6:0:b0:44c:74b7:14f5 with SMTP id 189-20020a6215c6000000b0044c74b714f5mr2970346pfv.80.1634790888730;
        Wed, 20 Oct 2021 21:34:48 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id x22sm4068322pjd.47.2021.10.20.21.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 21:34:48 -0700 (PDT)
Date:   Thu, 21 Oct 2021 10:04:43 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH V6] gpio: virtio: Add IRQ support
Message-ID: <20211021043443.snhqpac5ofmxfb7k@vireshk-i7>
References: <8ca87330fd348fc5199ad08904ec90cc6a91a1bf.1634723848.git.viresh.kumar@linaro.org>
 <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vctj-v8W+LgdVpYgRVL3fLdcFnOFRFg74LeCc=xLD+w4w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20-10-21, 18:10, Andy Shevchenko wrote:
> On Wednesday, October 20, 2021, Viresh Kumar <viresh.kumar@linaro.org>
> wrote:
> > +static int virtio_gpio_irq_set_type(struct irq_data *d, unsigned int
> > type)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> > +       struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> > +
> > +       switch (type) {
> > +       case IRQ_TYPE_NONE:
> > +               type = VIRTIO_GPIO_IRQ_TYPE_NONE;
> > +               break;
> 
> 
> IIRC you add dead code. IRQ framework never calls this if type is not set.

Yes, but it is allowed to call

irq_set_irq_type(irq, IRQ_TYPE_NONE);

and the irq framework won't disallow it AFAICT.

> > +static void virtio_gpio_event_vq(struct virtqueue *vq)
> > +{

> > +               irq = irq_find_mapping(vgpio->gc.irq.domain, gpio);
> > +               WARN_ON(!irq);
> > +
> > +               ret = generic_handle_irq(irq);
> 
> 
> IIRC there is a new API that basically combines the two above.

generic_handle_domain_irq(), thanks.

> >  struct virtio_gpio_config {
> >         __le16 ngpio;
> >         __u8 padding[2];
> > @@ -44,4 +56,17 @@ struct virtio_gpio_response_get_names {
> >         __u8 value[];
> >  };
> >
> > +/* Virtio GPIO IRQ Request / Response */
> > +struct virtio_gpio_irq_request {
> > +       __le16 gpio;
> > +};
> > +
> > +struct virtio_gpio_irq_response {
> > +       __u8 status;
> > +};
> >
> >
> I’m wondering if those above should be packed.

You are talking about the newly added ones or the ones before ?

In any case, they are all already packed (i.e. they have explicit
padding wherever required) and properly aligned. Compiler won't add
any other padding to them.
 
-- 
viresh
