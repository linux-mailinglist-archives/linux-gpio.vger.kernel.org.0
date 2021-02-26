Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1216F3269BA
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Feb 2021 22:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhBZVzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Feb 2021 16:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhBZVz3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2021 16:55:29 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A162C061574
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2021 13:54:49 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id c131so10349758ybf.7
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2021 13:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TFSTMI7ryRQxrtNhAxWEs+B7yYWo+lfhTGjsQMzxFP0=;
        b=B2/1Ao0Q94/ecvoT23XORi65LbOEqxem34O8qEn3v46TLm2Ufh9AdpQbNu+gShymBd
         DqIm9AAup8V+OjHchs3y6+rxGQSqBuABAUg4mG2ScHu3nET0vqJ8BMWVKW6uiXwEOteE
         Mmw42Oio2H0wehbJJW+QKGQvm/2ZYS7a5bHeZszvWKHaBmlSAF1auXBKvMVbJRJQl81t
         GgiVrduLaMAOr+1DiIRKorkLCL3+i103bj/T8MoeyOvjRgHaI/0k4q/1uzm1lRCcfBww
         2Rm9GI+ze0e013ITgqQCX4k1woIbe+MMWKzmEK1RrcibY18l48TKrnsbjW5Mqerj+x8A
         nwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TFSTMI7ryRQxrtNhAxWEs+B7yYWo+lfhTGjsQMzxFP0=;
        b=NKhwWXN+BQtzDxNvQyxBvKuB9wlJWYCOXE1zI6FtlDzM2Y8Tbdh1lE7lYq6yDCo3F9
         dGum02WZiG/9glrUr+AZ+OpOhipFazaB4NBM1+rckFoDdjMIGNs3dxJ4SXfcFkh9ZA94
         9euX6u58haJnx3Qw1CVQDLCEZNzUJeapHzg/mpp/0kWXlEdD0EBmn5Oe2ncDiSyNhvfY
         WSnFYkNn5znRQNr5WMpqgcNrjoDP3wtMs+D9o4e7OzRcQIUFU+YuqAW+sUaELvRgm6xk
         YYxy+H0HWRZwVDmGQGdLwqrmt6sqo2j37xPYOlm3edhxpXGXdTxMVnMbi+bXvR0VoLxE
         444g==
X-Gm-Message-State: AOAM531OPBXwt2TWT7TWxGC42IZnZAQ/BN770NOHykBym4+Y2ENEo534
        DolzV/7l4pVFgGqyXkrRI12t2Z41Xw6+3jo5b3w1Tw==
X-Google-Smtp-Source: ABdhPJzP8p2qMENfeBoRsfOY6ITy1KLwEoJVReeXV6Va1b5sD8yhyRAUASCl1TzCHhUjBqv393Q5LYqaT9qZ7g+VsHw=
X-Received: by 2002:a05:6902:1025:: with SMTP id x5mr7781569ybt.96.1614376488562;
 Fri, 26 Feb 2021 13:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20210226145246.1171-1-johan@kernel.org> <20210226145246.1171-2-johan@kernel.org>
In-Reply-To: <20210226145246.1171-2-johan@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 26 Feb 2021 13:54:12 -0800
Message-ID: <CAGETcx-4Q+SkdLO-rXE-zt2kdz=J1cnrPjv07mt0KRtCPa_OGg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: fix NULL-deref-on-deregistration regression
To:     Johan Hovold <johan@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 26, 2021 at 6:55 AM Johan Hovold <johan@kernel.org> wrote:
>
> Fix a NULL-pointer deference when deregistering the gpio character
> device that was introduced by the recent stub-driver hack. When the new
> "driver" is unbound as part of deregistration, driver core clears the
> driver-data pointer which is used to retrieve the struct gpio_device in
> its release callback.
>
> Fix this by using container_of() in the release callback as should have
> been done all along.
>
> Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reported-by: syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index adf55db080d8..e1016bc8cf14 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -474,7 +474,7 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
>
>  static void gpiodevice_release(struct device *dev)
>  {
> -       struct gpio_device *gdev = dev_get_drvdata(dev);
> +       struct gpio_device *gdev = container_of(dev, struct gpio_device, dev);

Can you also delete the dev_set_drvdata() in
gpiochip_add_data_with_key() if the drvdata is not used
elsewhere anymore? I skimmed the code and it doesn't look like it, but
I could be wrong.

-Saravana
