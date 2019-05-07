Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B42815F5B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 10:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfEGI2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 04:28:34 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36225 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfEGI2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 04:28:34 -0400
Received: by mail-lf1-f67.google.com with SMTP id y10so4481533lfl.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2019 01:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N3nyxx0pEmOsS+zHqmF7oYkegGv380k8CuFix8zwyz0=;
        b=eB8NRXo1Gpufo9wldy3D3E5a64sQcycnkuU6IH3anLgsHoYVLX0rLIrk1VHGiGSDr+
         3yQ4kl+adVe7QClG6vpNRRGQJ7aIJxUjfBx6ihHAJU/hRzEUl5slyFVAH1QNhyOBnJf7
         uzUxAjWbfOvA5nSUn1a1pSAMLneLQgNcp80XsPEUhZ4/g23HvHs+258YoGcYAGneuMa4
         byCLgAFTAXdHmwjngv+fXm30peNg4vtF9rIZpa0ftkDd551JL73j3NnDwWmLxOiPYWpJ
         ETq/CGckuDvIGZaxZ4kbMJ/s2mEOrSa5oMnwvMoF6te+ApsTnOdQQacrh66nbWMCpJIv
         PrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N3nyxx0pEmOsS+zHqmF7oYkegGv380k8CuFix8zwyz0=;
        b=grXAL3ENUbs2Of75uTif90IUVfH1O7hFQgaWkRyufgpogsYKx7r+/6EMlQr1A8dWOP
         YaMIcOmrVaJfxoO4JT07NT1hVE/X5MyndAPlLWRq3FlBVXJPvg2PvaCC5iqHgpy4d3O+
         RnHQ0AVl3jz6et2tUBwOGgx0Mav0WKenVIkbz/7/WILnjy+OwU2v1MZwtjeL8BPqM0aZ
         pNAOtbdWtmwukcID9XHbzZmnemVoAJ1NhugTMYGLUFkRlfp6CKckBRf3MhGyZ+88Z0ry
         AMMjZW29DPNO0hljI5EYP/ZCBxFhGeUh+kHQYxjmZXLkYF/Fep8W1uoxru9vQ70vzdyz
         yH4g==
X-Gm-Message-State: APjAAAV/MzfOzrPRt5TmYSPRZvH8vX0nCpAN3sWdis7JiYgA0MAqOUGD
        lvKUWzEGayJ00WgLibtRUBLPYj/t2ZMbF8Mw8FAdpw==
X-Google-Smtp-Source: APXvYqyS5Z7bFjbATubTfNGFtrqtACqvpK82LGIH3A02b0i/z0gEBqTaTWwFC1e4CAjdIxagsknDV9Yj1VMwYXI+yf0=
X-Received: by 2002:a19:2b12:: with SMTP id r18mr6938860lfr.8.1557217711856;
 Tue, 07 May 2019 01:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
 <1557122501-5183-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdZ84hkg_8J+OAYpZD0CFzENkUMeaSZoMyTK+hBdTCKGqA@mail.gmail.com>
 <ca559ed5-69ac-b578-2b82-fc0a4d532d3d@mentor.com> <CACRpkdYJ930fnO5a1HtUzRL5x1qA9cbgvEJb7mnwC=JLQOKXqQ@mail.gmail.com>
 <aaf22e96-a963-0dfc-a377-05383a219d0a@mentor.com>
In-Reply-To: <aaf22e96-a963-0dfc-a377-05383a219d0a@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 May 2019 10:28:19 +0200
Message-ID: <CACRpkdYzOOOT4YVW2HxS99-aoBiAvqOW8XAUjwiF4=8g=MCizg@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 6, 2019 at 11:15 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:

> Again I wanted to highlight that the intention of the patch was to make it generic
> and avoid changes in userspace for different hardware samples. (i.e  Some pins in
> hardware be configured as active low, this can vary between hardware samples

First, can you explain what you mean by that? Is it that you mean to use the
kernel gpiolib for prototyping, so we are not talking about production
systems, such as any kind of product coming off a factory line?

In that case I think it is in the maker-prototyping charter, which means
it is actually appropriate for having that configuration in userspace,
since it is a one-off. It will not have any generic use. The kernel is
generally for reusable stuff.

Second, I question the use of a property on the gpio chip for this. I
highly doubt
that the silicon chip will be manufactured with some random inverters
on some lines depending on which silicon sample we are using.
(Correct me if I'm wrong.)

What I think is happening is that you are using different PCBs or
wiremeshes and you have inverters outside the gpio chip.
That should not be a property of the gpio chip.

In this case what you need is either encode it on the consumer side
as we already do, or start to model inverters in the device tree
to properly describe the hardware, so we have a hierarchy of
gpio lines:

gpio0: gpio {
   compatible = "foo,chip";
   gpio-controller;
   (...)
};

inv0: inverter {
    compatible = "inverter";
    gpio-controller;
    gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
};

consumer {
   compatible = "bar";
   gpios = <&inv0 0 GPIO_ACTIVE_HIGH>;
};

This is a rough sketch, it would need some elaborate thinking
and DT-bindings and changes in gpiolib to deal with those
inverters as gpiochips.

It is a better model of what is really happening: altering the
polarity on the gpiochip is wrong since the signal out from
the chip is actually the same, and altering the consumer flag
as we do today is also wrong because the component does
have a very specific polarity.

We have several boards like this already, but they all just
summarize the inversions happening between the gpio chip
and the consumer and put the resulting flag in the consumer
polarity flag, so no explicit inverters in the device tree so far.
This is a simplification of the actual electronics, but the goal
with those device trees is running systems, not perfect
abstraction of hardware in the device tree.

However your usecase might warrant an introduction of
this inverter concept, if it is like you say that you get new stuff
every week that need testing and you like to use the DT to
help with this. Again, this is under the assumption that you
are actually not changing the GPIO chip, just the PCB.

But I think real inverter nodes is what you should use if this
is your usecase.

>. User application uses gpio-line-name property to map pins
> and port, this helps the application to handle pin change
> from hardware sample to sample.

I'm happy you can use this :)
I worked a lot to make that available.

> As of now there is no
> configuration available for user space applications for polarity.)

I think GPIOHANDLE_REQUEST_ACTIVE_LOW does
that? Is there some misunderstanding?

> I also wanted to know if there are any security concerns with
> the patch sent.

None that I can think of. Security concerns on a one-off
test rig should not be a big issue anyways.

Linus Walleij
