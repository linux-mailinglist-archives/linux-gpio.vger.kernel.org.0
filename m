Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0BF47AF33
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 16:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239357AbhLTPKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 10:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239741AbhLTPJZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Dec 2021 10:09:25 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF8DC079799
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 06:55:08 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id x15so39476603edv.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 06:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tdE+T3aPoNGPg8ELi+8IVN1k//5ir0X0ohyUgltkbRw=;
        b=Nb2TllzUXYVXEw9dqWf1y4jFHfwAIx8Byw/e52kLdrpLA6yqUiaeF2SehGvQZOCOzp
         JHsotCsFQGEah58nSPzrcFwNexy1c1zSnRf5w1+uiFHkTTZwRVX7/v5gSR08rNxrPLp3
         /IjuqCAbOWDqGJVuUt14YRi+DLw7MNt8t1tYc445UAQN5Gdo9xSPTuBGJrtdD9+11pW3
         fX/ijsxBWl4NcRLG9Dtl+b3fYv7UWbPBnniDn+P5kSu9l7LLrBVR0DsAe0g8AiDYWXIa
         Iqun1+ti0p5uR5Evw/NtBtQOjhwYpP9xsYLZx6dxnOc6diYqzym13S+t+mEydh1fkYGC
         zwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tdE+T3aPoNGPg8ELi+8IVN1k//5ir0X0ohyUgltkbRw=;
        b=PEQHRV+msrASrscJY0E61RIID7GdP2NyBMyAXn4NmoV9pSbSow0YyA13QfoZMAIPGz
         O4R3plkNGN+gkxU1DtVhEr+ZdGPJf7Ob7Cgz9Y06gl+TS2t7IG5Ii+QNSZZdePoTLB2h
         g6pn9SpfRFl8Z9jDZAhO/uMeA9rFqzh7WkvUsvnb+HRcVdx2o+yTULGYCKwr15zl44Y1
         Y6z3hwb2ohNCKkAZvXHuLK3jSUW6MRHHp6KFCSQwGBObMOyCVDnmscNsxz7X2ohq470t
         uvXC51ev4k++V94nzg9KIJPVvHwDtTET5RlzvVKbcOHcSp1U2os9T1sx3+9vbCDslWmz
         cvOQ==
X-Gm-Message-State: AOAM530cSgc6gfCOz6YwzgQrrWUa1VM9jeyfervc+qJ83EPZVRAq9nLG
        K9w4D1Oc0Jv87vtG4CBP9pL3PUvTLDShM7FG2UtffQ==
X-Google-Smtp-Source: ABdhPJxoWrYUKazioQqsvjf7ytmFNN+yKdjGGZpYezKULEb8U/6B38TWYAZ17Xk5+OZe0lgIMwn4DkfSd9x9u723RtY=
X-Received: by 2002:a50:e611:: with SMTP id y17mr16436969edm.270.1640012107378;
 Mon, 20 Dec 2021 06:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20211220130656.16900-1-vincent.whitchurch@axis.com>
In-Reply-To: <20211220130656.16900-1-vincent.whitchurch@axis.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Dec 2021 15:54:56 +0100
Message-ID: <CAMRc=MeEnSvSxQe-DdLSujSLpzxa-bacJ590BW+tt8awAJq3_w@mail.gmail.com>
Subject: Re: [PATCH] gpio: virtio: remove timeout
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, kernel@axis.com,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 20, 2021 at 2:07 PM Vincent Whitchurch
<vincent.whitchurch@axis.com> wrote:
>
> The driver imposes an arbitrary one second timeout on virtio requests,
> but the specification doesn't prevent the virtio device from taking
> longer to process requests, so remove this timeout to support all
> systems and device implementations.
>
> Fixes: 3a29355a22c0275fe86 ("gpio: Add virtio-gpio driver")
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  drivers/gpio/gpio-virtio.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index 84f96b78f32a..9f4941bc5760 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -100,11 +100,7 @@ static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
>         virtqueue_kick(vgpio->request_vq);
>         mutex_unlock(&vgpio->lock);
>
> -       if (!wait_for_completion_timeout(&line->completion, HZ)) {
> -               dev_err(dev, "GPIO operation timed out\n");
> -               ret = -ETIMEDOUT;
> -               goto out;
> -       }
> +       wait_for_completion(&line->completion);
>
>         if (unlikely(res->status != VIRTIO_GPIO_STATUS_OK)) {
>                 dev_err(dev, "GPIO request failed: %d\n", gpio);
> --
> 2.33.1
>

My knowledge of virtio is limited, I hope this is not a stupid question.

Does this mean the operation can get stuck indefinitely?

Bart
