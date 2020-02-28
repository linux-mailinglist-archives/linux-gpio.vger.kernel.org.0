Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDA21742EE
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 00:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgB1XUz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 18:20:55 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41225 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgB1XUz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 18:20:55 -0500
Received: by mail-lf1-f66.google.com with SMTP id y17so3302356lfe.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 15:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IUCuvsoT8/LPUAazzHuf3BSlY/LuzBm/RZCQW8qkafc=;
        b=AiUb6onFScs/DAQJxoWCQUJu07Ygr0wcS1Pv2MbH6OyAjWjgozRxwf6cNtCwOtlfVR
         StL7/AuHIW0sbWv7NYip4IeQ3WOfVl8K+fzviBHY+O0vwd3X7fxSjz41UytCU5pFjIoA
         Aj9gufEaX3ovYzGXMaPshc1QkuAjwholpDgzRax7GEvEpmZf06tYZ3d9zzaIeuFHWZIm
         j41Pn3Li/q7s/VutdqRXw+8LiL7jgl4AFztDLVpC3ruoqCw4G8iPpD6CP1ybCpQkNhP6
         GQksQkjbHI7sVqDVLH42/NIVMLVijAowK7Z57JkUzabEyP7k8fCQWxnPc8tyA+Bj8Onq
         U+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IUCuvsoT8/LPUAazzHuf3BSlY/LuzBm/RZCQW8qkafc=;
        b=q6nPoTeoR4mQMszfhOjB1v5p8LvhOi3FNxlCyqLewIFGVWFC2lo21ha9MtQG4roxPG
         59QoQfGT8nRwtwSVW9lMPx5wi0RV/gKn1GFGyhFbRat3wLd/67d42tqV5nSfhzo05kM5
         A7ozr2uJkH16GOPAogFWPFd3P/wKSdwWNpQi1bqvM4VgjRTfcd/3n7U+mqNRHJ6GZmqC
         dcy423EBSVsF65RhAPicPJ5M1KvHpP/5LVwW6GMWsuJkzXQu+VeL3uF1Eo6mKakTB/PR
         KWkE+l5rDuV8e/7ADwFtG8ewcAeqjW9YQIN3HaB5L44KoADiwOdXm5UcCuUh56jjbbuy
         lSyQ==
X-Gm-Message-State: ANhLgQ1PIy5k6/+F+3CUBCng2S5PlBxfdQj6KdsW6nQE0qLO7U5H6GB0
        AS92MNnRYQYsOHDO48LYD8mJzhoBReUqvDErnTOAQG7f
X-Google-Smtp-Source: ADFU+vvIU0LlYeHeLDZSjyzG9od8EC9fwjBLEALNd8L/0q/e9uAE6B+ghoG9n8TaFthveqPymw6YMKolM/LvPYLRYQQ=
X-Received: by 2002:a19:110:: with SMTP id 16mr3859186lfb.21.1582932052865;
 Fri, 28 Feb 2020 15:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20200226135323.1840-1-brgl@bgdev.pl>
In-Reply-To: <20200226135323.1840-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 29 Feb 2020 00:20:41 +0100
Message-ID: <CACRpkdY4=bU-gMywttvnRbgu=CG0TtKx5DFiV-Gio5DBDV08-g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix bitmap operations related to line event watching
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 26, 2020 at 2:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> When operating on the bits of watched_lines bitmap, we're using
> desc_to_gpio() which returns the GPIO number from the global numberspace.
> This leads to all sorts of memory corruptions and invalid behavior. We
> should switch to using gpio_chip_hwgpio() instead.
>
> Fixes: 51c1064e82e7 ("gpiolib: add new ioctl() for monitoring changes in line info")
> Reported-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This looks good but where should it be applied?
It fails to apply to my devel branch where this lives.

Yours,
Linus Walleij
