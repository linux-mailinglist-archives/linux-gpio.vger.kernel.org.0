Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0549C3A3515
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 22:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFJUtW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 16:49:22 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:35677 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhFJUtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 16:49:22 -0400
Received: by mail-lj1-f169.google.com with SMTP id n17so6750595ljg.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 13:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P3feXPo8hgD2FD68i8SPgVY8I4kuiJLBZN2g8qdSekM=;
        b=yY+WLokJziltoHJ9f3XgfvwE/LSudYOXHFaEMxWzIlSAyHQ4l4493Euz5Bx9wQPb7a
         jpyTB8qdbkY1dJd4TqfOgK+VuvohCE29cXAbv6BGujgKABmWag8PeU0649zqKmpPK+d3
         L3YeQfMXlzWmcQPkHTiWmDTr2Ly+swbU10hGAGB5DlKfZSPjiUa/medL+veah9aYlzKz
         HWakmG2quynID1DJ+/m3r5Vq1EEnUjoQA2Ht+5jxdI5W6AowYsdQm9TP/2CtP0evZfaU
         1pJBZ9tM9E79EbjLcTa47JCMa41g7dXjg6ykRGszpx/NJB5cC9Ep31xpV808Li2sJr9h
         U89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P3feXPo8hgD2FD68i8SPgVY8I4kuiJLBZN2g8qdSekM=;
        b=nr6XB9+s7FfnbqbjoImabwOVRcXM/iu1kEgVMxn5cC41rOPV2qjmtuR58vTe4WrWgB
         apRsu7aPXm7o7X/L40YcSOYZgRu9ZId7p/qa0wXSW6jpD0BDqPCO82lIHF6n0xN71caZ
         kLuBAeBmP7ZfaHKdw/r1XnrxmSe/nqla8nNyBnaXzxzvTUNIqVP1wji2qKFIwxyBCSC/
         3IcicCulGQuG2TS3pMkSFmkZReEiRPvfdmMmWC9zvFPzLQccykjopN++n7+5rhdOba/6
         pMy4PqOuE9eRYqCrVmZ4C1PhnwPbSewKhwjYwBaNczslUm8KlJKOdfaaw9nkcR07IY+x
         vpyA==
X-Gm-Message-State: AOAM533KM8TmJEALWa2jBEIxeNWdRXYqWJxoUCZ1jJK20jrBtXvskCgH
        RGg+P1aZJdCdPIElJOMBi8lZ1r+6LuA76O18DZzKBQ==
X-Google-Smtp-Source: ABdhPJxNKGpZ/jjSlWl2zoMMOz8tNxjDSR41dSYXKzHTgV7+ERxWWp9zJMl7Q6uw/IGcGvfEK0j0qWyEO2QHKxTxfVQ=
X-Received: by 2002:a05:651c:1411:: with SMTP id u17mr327855lje.438.1623357976125;
 Thu, 10 Jun 2021 13:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
In-Reply-To: <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Jun 2021 22:46:04 +0200
Message-ID: <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Viresh!

thanks for working on this, it's a really interesting driver.

My first question is conceptual:

We previously have Geerts driver for virtualization:
drivers/gpio/gpio-aggregator.c

The idea with the aggregator is that a host script sets up a
unique gpiochip for the virtualized instance using some poking
in sysfs and pass that to the virtual machine.
So this is Linux acting as virtualization host by definition.

I think virtio is more abstract and intended for the usecase
where the hypervisor is not Linux, so this should be mentioned
in the commit, possibly also in Kconfig so users immediately
know what usecases the two different drivers are for.

Possibly both could be used: aggregator to pick out the GPIOs
you want into a synthetic GPIO chip, and the actual talk
between the hypervisor/host and the guest using virtio, even
with linux-on-linux.

Yet another usecase would be to jit this with remoteproc/rpmsg
and let a specific signal processor or real-time executive on
another CPU with a few GPIOs around present these to
Linux using this mechanism. Well that would certainly interest
Bjorn and other rpmsg stakeholders, so they should have
a look so that this provides what they need they day they
need it. (CCed Bjorn and also Google who may want this for
their Android emulators.)

On Thu, Jun 10, 2021 at 2:16 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> +static const char **parse_gpio_names(struct virtio_device *vdev,
> +                              struct virtio_gpio_config *config)

I really like this end-to-end plug-and-play that even provides
the names over virtio.

I think my patch to the gpiolib to make it mandatory for names to
be unique per-chip made it in, but please make that part of the spec
so that we don't get the problem with non-unique names here.

I suppose the spec can be augmented later to also accept config
settings like open drain pull up/down etc but no need to specify
more than the basic for now.

But to be able to add more in the future, the client needs some
kind of query mechanism or version number so the driver can
adapt and not announce something the underlying virtio device
cannot do. Do we have this? A bitmask for features, a version
number that increase monotonically for new features to be
presented or similar?

Because otherwise we have to bump this:
+#define VIRTIO_ID_GPIO                 41 /* virtio GPIO */

every time we add something new (and we will).

Yours,
Linus Walleij
