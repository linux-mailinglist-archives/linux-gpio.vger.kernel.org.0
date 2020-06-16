Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1EB1FAB64
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 10:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgFPIhr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 04:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgFPIhq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 04:37:46 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C730C05BD43
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:37:45 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g2so3635625lfb.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RA/a9xgeNIP0kFcRMvVhhdjRGSwULwerogwSj/F+Grs=;
        b=HzPE1gUPc/C6yijBergBKS2BL3NPxjYVkqz5YK+Cp3GLxIQbBpnJUmKfOX8Qnxu/Ev
         xQ4xP7abGcRd0RgEyzqM0HgrgrHjLhWA3J5BcOCKoDg7eZ5YS1BIDe9HRoCTCCGw5h/5
         ZfQC7imXoCRa4KrmcGUZdWnGlzHAf5hMCkedF/OL3lITn44Riia+SNCrn6XoqSBZsoN6
         Se40FgCH6bUFxIDJdr7t04juD9FtznG3+9DoSW0y7VzX5Gm/RJ7yebTjwKc8OEG/4tPW
         DdU0xAlzHcvFO2VIQC/TaqntOAQXeo7faQR5WlLFFdXuYdo328K3ny+FlalgJH++7Hzw
         JDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RA/a9xgeNIP0kFcRMvVhhdjRGSwULwerogwSj/F+Grs=;
        b=uUsHBzi5W0ELuuAVAP555a1n6nbViq60l5K19XDPJU1X6Tfjuo3DuACDlJdNZuizlV
         aUaYzjDsFwufl8/tGg/vS/iPRjDvZqXEHDRaSinAmU5ewzUDK6jenjhcGpwcomWE8ebg
         ch1W5NCIsmfcfOkeQz3S3YHs1kQ9kzBRn0TiRFH9NcbKJ7U2NXUPj9LQoUACy4k3H1eF
         hG2nlqt0gEqyXJCO6B2ibrYevIj1vE88knCFVebC1tkzj0PYYcLmEubkZy2Z0SQZ7Rb0
         m0CexEBc4l49Flbe+w3uBJQHLrYsv+zLwCQUGmJZb8wvjbi+7bTODay/ZGfLAaZZspUD
         aGHA==
X-Gm-Message-State: AOAM531Dp7N7ajzDo7Jg1oq8jp3evmzOcNah+cqq7LZUu5oXGK3mFHfN
        0eTegLH7vHiJQkS7A98PTxpOEBDicskpwANkbOuuKw==
X-Google-Smtp-Source: ABdhPJzzerD6xw0Kzs6JVDyTlC9tslnjITcT/1ov4XlDMrheqCSkjc7GIsa5Ps5UpaZ9lk0NPOIH5V95vNTTkup8gLg=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr1144061lfn.21.1592296663758;
 Tue, 16 Jun 2020 01:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200609235135.10414-1-warthog618@gmail.com>
In-Reply-To: <20200609235135.10414-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Jun 2020 10:37:32 +0200
Message-ID: <CACRpkdZ9to8LRMFiGNW5gd-v901j2AsKDWKojw=f4dRaJSm4kQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: split character device into gpiolib-cdev
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 10, 2020 at 1:52 AM Kent Gibson <warthog618@gmail.com> wrote:

> Split the cdev specific functionality out of gpiolib.c and into
> gpiolib-cdev.c. This improves the readability and maintainability of both
> the cdev and core gpiolib code.
>
> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> ---
>
> Changes in v3:
>  - updated the gpiolib-cdev.c file comment.
>  - rebased to latest gpio/devel (no changes impacted this patch)
>  - dropped the patch commentary as the points mentioned are mostly
>   resolved - there still remain a couple of commits in gpio/fixes that will
>   conflict...

I rebased my GPIO tree on v5.8-rc1 and the old version of the patch did
not apply and neither did this, could you rebase this patch so I can
apply it? Sorry for the moving target, the merge window times are
a bit bumpy. :/

Yours,
Linus Walleij
