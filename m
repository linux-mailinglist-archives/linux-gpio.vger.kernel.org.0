Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A11C09A916
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 09:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388520AbfHWHqh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 03:46:37 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42884 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388503AbfHWHqg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 03:46:36 -0400
Received: by mail-lf1-f65.google.com with SMTP id s19so6449264lfb.9
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WH+BOF/CY4fCONZ+iJSDFuZa8c/iXvPAMfXl02leEtE=;
        b=s0w/8E+WqVnGduw/0CGM8BSkW0zHfz4852n1AMFzhLSJy4/s8X99jUa+asMu84cNrI
         fmIHLLfanHbyTuMLHTMIL9kjJfRQitRKuRNiRgFIQIziILkcRv56ecSxcGFl4ORMw0N/
         OoEBazxPLgjayc9ooogF9pzr8HRQtjns8yNIldMQO/JyIWAVKEcI0i4wgYGZC+1lyTcX
         FQikdDRG2GKksbPzoOfyW760QgdwXm1uwEX7VzANriCYXaCT5ql6HDX9AciBMoDLPc7i
         Hlb7aubeSpnYQR1ychlLiEUy0JmMqHgzxSUO87ehhs0bCd9TxTpU9bVUz/+Foca2daUF
         wa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WH+BOF/CY4fCONZ+iJSDFuZa8c/iXvPAMfXl02leEtE=;
        b=jr0HahrsSjgDdBrl4I0zSTfTaY09MqTRCe800pN905IzVj27+qc1cGggy0EU9grdxa
         cI+AbTHzp84ZhB52TNhZEIgKA1eFpJp0ZUYgC5/uZWa6KlxG059d08/3XFyh3YlsPHAt
         M54FI06z/DVFuN7KGfaueL02XHtpG4zpUArNLzjjWhKSeZj3u2RYii5pX+GVt+QgPXHr
         PTf6z9EBJoXqdF1T5/5VQIUtOsiMc7glnZOTmStchwfe+HxQFit4o9IU9JSQ3rcKJ3pK
         9q/W+f7+jZEq4aOUBcUfW+dbAuKOZHsWTr2IMrV06MnhhkG2wCAPQojzVCjNAfyaGwFH
         Zasg==
X-Gm-Message-State: APjAAAVHC8mB5b+9cz/aNtpUNxwwMW09U42Jfq1PKVsk2/UbUASS09Zx
        S2GCK75eFlhowRHvszN4lcQ48n6PkGKDBlbN9lb6ilpeTec=
X-Google-Smtp-Source: APXvYqyt4z+HfxS2lJQfztxcacTXn6E+m2n9XuteDsM5SUSn+Q1lef8WiqHDw7/uPrin1fccVE1H7MG+jy+sX5/jGWk=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr1978635lfp.61.1566546394623;
 Fri, 23 Aug 2019 00:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190812062729.1892-1-linus.walleij@linaro.org>
In-Reply-To: <20190812062729.1892-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:46:23 +0200
Message-ID: <CACRpkdbBaiVQ+BUNZEYNv6dGZjAbS=eA54dLTQ99Ngvbk7YQ9Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Pass irqchip when adding gpiochip
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Simon Arlott <simon@arlott.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 8:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>
> For chained irqchips this is a pretty straight-forward
> conversion. The BCM2835 has multiple parents so let's
> exploit the new facility in the GPIO_IRQCHIP to actually
> deal with multiple parents.
>
> Cc: Simon Arlott <simon@arlott.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This patch is a bit scary because I haven't tried converting multiple
parents before. Any chance one of you RPi people could give it
a test run, so you don't have to experience testing it in linux-next?

Yours,
Linus Walleij
