Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A856BB0AE5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730419AbfILJFh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:05:37 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37288 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730327AbfILJFh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:05:37 -0400
Received: by mail-lj1-f195.google.com with SMTP id y5so12027414lji.4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yO0Ugz+vt5CON7QrbS17pn/9PoZbjOpwqpjgIPuPJBI=;
        b=JJf5Um2xcF6I4Vn5Xtmtb4fAN1rtfg7aG42sxpsldtz+GgKvxTp9tTKa3VkZPvd9EY
         dNzJ9xxQyS5kWB6EYiK9A9y/XxTEbxHF+zBJb89n6dDM57nEbNVKR4rsAIl5lf8Vhag+
         TclfJV07yTOh8AcC1ggO1+zr5+Myc0FLWvLQnhvWQE30mYuP0yE+rULvwCNU9ShRD18t
         Ncf+uKf0LjKen0Acg8JxoedVHusi+NQfZzIwwkPo4tfApHhpJzwol/5ei1Ca5GtDRVn0
         itrKDGPC4kbBoCIDKzKKGKr2LcuCjbM5hHFqKkGEVt56HMsRvQ2UcuurPsCGdFd9ll7C
         b6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yO0Ugz+vt5CON7QrbS17pn/9PoZbjOpwqpjgIPuPJBI=;
        b=b7lwTYofUDaUbeIhTHSVu8JEnJBC3Z0lkojCbue0SA8HPJUvFBlbS5i7vQQkRn2Bk8
         8Es4Nr9yZhmmdL57MdJQ1oQQU+UUEjZ1L1/lXEg2R/SOF1Y+dAWvgTl9Qkhl5PS1yPLQ
         SmGZ2gr2012Lzmm53BiynBKah+vJQdMz4SXzleWYCbYY617iJhHzc9dWp4qD1+/wiBPs
         KSoB2F7m/ev+SQumfW8FnK15BAdiqS9JrTE7PS9azwDW5v/g2aokG2UqaPYQg4T12vVM
         hYhS8UwWixJg32el70Wlb9qCHMzTAeQwSv+XvHjndZ9o1pWvcT5IYO3rZ+mge8IE1rbt
         9kXA==
X-Gm-Message-State: APjAAAXiarUc2VDCDuXSbELwTdVWkoikFp9dFjh199BChg2QecaNfSWU
        LDXTQBKYM496cxMs1U1IMothPcIAdmVBH9ExQAI09hNDtOLJIA==
X-Google-Smtp-Source: APXvYqxXstkfuaWL/WFUhn1/bUVAnAuPusgloIUG5UcV8mlZwjnAkzyfflZWQZ9rXkXh1oQu49x02P3fCMOERZMIJrI=
X-Received: by 2002:a2e:654a:: with SMTP id z71mr26065109ljb.37.1568279134855;
 Thu, 12 Sep 2019 02:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190909105919.30418-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20190909105919.30418-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:05:23 +0100
Message-ID: <CACRpkdZTzYtxjmiEnbvSn0-WQtxADLrxJGb_Q83gtRFhcShRiQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: define gpio-init nodes to initialize pins
 similar to hogs
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 9, 2019 at 11:59 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> Sometimes it is handy to be able to easily define a "safe" state for a
> GPIO. This might for example be used to ensure that an ethernet phy is
> properly reset during startup or just that all pins have a defined state
> to minimize leakage current. As such a pin must be requestable (and
> changable) by a device driver, a gpio-hog cannot be used.
>
> So define a GPIO initializer with a syntax identical to a GPIO hog just
> using "gpio-init" as identifier instead of "gpio-hog".
>
> The usage I have in mind (and also implemented in a custom patch stack
> on top of barebox already) is targeting the bootloader and not
> necessarily Linux as such an boot-up initialisation should be done as
> early as possible.
>
> Not-yet-signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix=
.de>
> ---
> Hello,
>
> maybe it also makes sense to use "gpio-safe"? Maybe it (then) makes
> sense to reset the gpio in the indicated state after it is released?
>
> Also it might be beneficial to make the wording more explicit in the
> description and for example tell that only one of gpio-hog and gpio-init
> must be provided.

It's no secret that I am in favor of this approach, as I like consistency
with the hogs.

The DT people have been against, as they prefer something like an
initial array of values akin to gpio-names IIRC. But this is a good
time for them to speak up.

Yours,
Linus Walleij
