Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F229132328
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgAGKE0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:04:26 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42978 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbgAGKE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:04:26 -0500
Received: by mail-lf1-f68.google.com with SMTP id y19so38420566lfl.9
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IaT+HGrfAbav44v71XZlSNd1URgNRj4zIy7n7ZKUqH4=;
        b=C/TMqDRfkoUuJ0f7T7D+O5oR+b6o4w0FNo/T1F+R1AHCSi74QZrP0ulqX/mlk/yMb3
         CgBbnBDXHH3RQbFfjeIBmDCMxBgBJoWMyfSinbTkTKu7+eAqlL4UQ+G6Qu9e8sGULoAW
         scPPSgM5ky8Dgu+u+57Yj0r+9bLeLU5VTQ5mngb2qRSIofjffwJo8cHE39XF1zC55KbR
         sBdWKaMBlfnmYRjXkQ6NzWwAl4XoASa4PfrvonyU+r6J1Kj88we/W4tZT4yErxsOgisP
         oDj7YGWcd/AGmfR3FZQWc7Lz9Z+TBcTUrOnS7BUoLmif98Q98aJ28tRnBC4luasznBue
         V+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IaT+HGrfAbav44v71XZlSNd1URgNRj4zIy7n7ZKUqH4=;
        b=BkNjlQg7k81oZqQCEgmYE+El0qKgomOCRgEAIHmSOo18o/ztnnIsekpfgZUA6B8XF9
         vRbinyYejsdpPNBMB6oW4wRJCR46xSEhNuQn0jDdKIdVHV7qX/XJjCTI/P3OnWFXwUip
         df01fBPJVtftWXaeOx2eJoN9Ah+M+F0Ss1+B5WN/eUMJvNMQSSOneXbCUO6mmdVSGFk2
         aBAmCimH7rpZlAXeMTP2If1exQqLUoVaxPEpBlEwu7Ju+J3CYVqxZ7hDJO6goF8CKszW
         KtpgieddT1BscG68BszAwld3lAGz/KUv+hahNiGDUgHko2CPnf38quSA1Uy3ojk0A7JR
         kVQA==
X-Gm-Message-State: APjAAAUgCNlCOX0URUP80Ln2l6OkbjhECLAdTEdWdCnjZPuOAYelx72u
        eU3Iafw2PoQ4WB7BwSsAuixwbFLyohUSgSWYFzFhhw==
X-Google-Smtp-Source: APXvYqzIqvdiEJyuN737lKRaPRJmxancOJCuQ7zjFMf8BOpiiEvcoUI8UR/icK9L/Hp7tnD+upUM0vg9QbSylxpdyTQ=
X-Received: by 2002:a19:2389:: with SMTP id j131mr56672702lfj.86.1578391464246;
 Tue, 07 Jan 2020 02:04:24 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-5-brgl@bgdev.pl>
In-Reply-To: <20191224120709.18247-5-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:04:13 +0100
Message-ID: <CACRpkdb7Hvn6pYF_3W9tUQfbZ8NJBTymeHFgrgNi+tKLa6YTgA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] gpiolib: use gpiochip_get_desc() in linehandle_create()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 1:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Unduplicate the ngpio check by simply calling gpiochip_get_desc() and
> checking its return value.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
