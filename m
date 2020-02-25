Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5B416C47A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2020 15:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgBYO4U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Feb 2020 09:56:20 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34486 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730631AbgBYO4U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Feb 2020 09:56:20 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so10006367lfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2020 06:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+GpAzJRi5fq+V1DEo3aOXHOVVWve/xWrCRShqtK0emg=;
        b=i6JtxTyYLLXy7D4wfvSOX3G+LoCOUy/T6dKwVtEN29B5BXvDzlk948k9NXBEsN924w
         /o41ZdqyTnKZWv0kzjZXxaGDpUwhaX/I4aqMGT4mHZf4+FJns+tHhye7E5vS3NCYOfKk
         tjltsRtSQDIRGHJG8mjbxjrDIfBvsPLz6hx6JgB0TT+omdxzZF7d2ivXvst6p9HH7YsW
         nnUPVwbV49vLNA3iDEuuXwYNp0OKZwYUqQxPoupQjeW+ArudhMnlpdljt1rrBnXEzaaG
         PWyg9nrDSg1wxppfMa7YEtO5wELhY1JaBUxHovwIHvq6VHkrZ4Hay9zZZUnptHTgsqRu
         lpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+GpAzJRi5fq+V1DEo3aOXHOVVWve/xWrCRShqtK0emg=;
        b=Iij4+UySer54e6Qu8wTo0BzvZZdQgwcP88vMkwmzksGGsN8Xa/tT8E8S5dbNcOwVg7
         BmQ21j837BtbNQqVFVwRlkPBRMKC7hfIUlApWS8smfyOCqdmja4rB0g26zNqamgSHHZg
         2E6O29zBdInXy99n2ujmB8CpoAJbAcjAT+9H+jmlWAw2/dQoxMTjtaQ9wSACH13y3eWD
         FIHlm20jjrmvdLixQPO9GxxoRYSLim1dPLifbwb7Wlt3EobK087AUx6x3fhWm0bK/VUb
         5b2pVcT31KbZvHcoT+QFiF54+CFoBtlujWwbpray5+h0I/AjRP17H8wl00czxGdqBsmP
         IDzw==
X-Gm-Message-State: APjAAAVm0x2BptmIkWEU6e/fTrpAIAo090MzygecZOw7F9fxt2a/X+AT
        b3nZ6aOPcCPbYKqbn6M5Phc1i2+o6UFyeS0yvgXnqg==
X-Google-Smtp-Source: APXvYqw5Xxu8POQdcmPOX8uhK3vVocRxx6XL8Yt7Tg6wygJI7+sRiMl6PhRKqhj3AF/5i0/ME3YlXA8KIauTi4Pq4U8=
X-Received: by 2002:ac2:5328:: with SMTP id f8mr2488077lfh.47.1582642576908;
 Tue, 25 Feb 2020 06:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20200225093102.10964-1-m.felsch@pengutronix.de>
In-Reply-To: <20200225093102.10964-1-m.felsch@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Feb 2020 15:56:05 +0100
Message-ID: <CACRpkdb2gEuEVK+RT4kY_y5JTctmAHPxsQ=YS1VLLzSwKKzyaw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: export gpiochip_get_desc
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 25, 2020 at 10:31 AM Marco Felsch <m.felsch@pengutronix.de> wrote:

> The function was currently used internal by the gpiolib. Since commit
> 56cc3af4e8c8 ("pinctrl: da9062: add driver support") it is also used by
> drivers so we need to export the symbol.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

OK seems like the best solution right now.

Patch applied!

Yours,
Linus Walleij
