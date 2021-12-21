Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41FC47C2BF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Dec 2021 16:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239278AbhLUPXc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 10:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239284AbhLUPXc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Dec 2021 10:23:32 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD38C061401
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 07:23:31 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id m21so26259044edc.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 07:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rxf1NxPSo8s8xHVSSFeYT/Wi9LLJD3nqrr14uMo0HJM=;
        b=Zm4Kr75mSPUtQUO+AhWnCSQqVqlvVgM0PUHxF2hlOuTBkAdOOsA0VdiUotNjeQ9IrA
         7C6wz3tkc+pZbrUAXKhv91WelhZwKBZfG6bEEEbHALh5tZIBvxHc7ZnoFrk11sHyG9BJ
         cCeO8U/UVSoq4mbBVkHvdShdFeDoz4gMRk9btQJLcbKEzAhcIJUfE1R2X5BuHsNN9lqT
         O0U58vdRVkRF7HfiwjWlqZeEfN5FwtP9PuxGOd7OoU7aTNbTNmYG18bE/hIQoG39QQax
         JfiIA+3d0zLFOhS3WIAQV1hqmWgdy/HFU3qfeg8Ht2847Zfy8gx6Cxei5WJNTFQra9VL
         OTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rxf1NxPSo8s8xHVSSFeYT/Wi9LLJD3nqrr14uMo0HJM=;
        b=yGvJHOJHzV1RAfoHN924UkOJru+BbPydiglj5m+ThJuA7FUWnFZTa65x+Jt5ikY6Yd
         20BSRcavrMVdH7dnd4wKDF/zwBN5pRZtNf13U5r5PP+ko9WneL1f1hQlYoVW5SzWLNsU
         h/Mj7FW0cGI7j1hQ6TAMjpFf1+VDpxhMMuyj1dV0XRlLPbBBs8uqibHfdtCrRNvHGBRt
         9g8WWcLKfLggsK317DfYfTNLFiRA7l9mImSunD0ZiVC+B6l6avUxjRZSEn+E3BPEaKjH
         cKBi43aytUrDtqLami52mug4O4fQE143xEhFSEm5NR5Bh6JMWK9bg3gnCjRn+MzB4yOX
         7AKQ==
X-Gm-Message-State: AOAM532HaLurCKswmGhpg0fgzySqgloCAMbfUIxrgQiDqzkPbJ43E4ld
        +TMtYBI9OfsJudh+xJo/X5aA3dN8YkxpDhS4T8AahQ==
X-Google-Smtp-Source: ABdhPJy+jIubI85s8a7viK5tSBmJqnt/uKumtZfv/Qds+UeGfXNu5/xBPFYJoQct46aedNtjT2044XfDnRYU039dp2o=
X-Received: by 2002:a50:e611:: with SMTP id y17mr3845710edm.270.1640100210304;
 Tue, 21 Dec 2021 07:23:30 -0800 (PST)
MIME-Version: 1.0
References: <20211220130656.16900-1-vincent.whitchurch@axis.com>
In-Reply-To: <20211220130656.16900-1-vincent.whitchurch@axis.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 21 Dec 2021 16:23:19 +0100
Message-ID: <CAMRc=Mcdo9WWX7U=AqwTite=JDEkoSCb-Lwwb+h_=vSFrKMmnQ@mail.gmail.com>
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

Applied, thanks!

Bart
