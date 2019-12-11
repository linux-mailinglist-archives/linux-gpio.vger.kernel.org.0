Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9E0C11A667
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfLKJAr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:00:47 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:34425 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfLKJAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:00:46 -0500
Received: by mail-il1-f194.google.com with SMTP id w13so18794118ilo.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2+SYstpsmRi699Er2ILUdweEKga8FQwyz0HU6eHs/8I=;
        b=IwHbmKd13ezqDoJQKy/R4uH/seWKHnooxINFFwbmpezCSMZljv4E3PCroyLKAWIN0f
         sGEIRZgER84lrSw1/zoEEqb7RtskZH042OKXa1zJ4mu9xZ7rF0dHfh7ZoRiY3M2nWut2
         YfRLREnbFrp1LzcjUoDZNPmvTEkm+MZMQD2zun/vCuFa+OSWOWy5xsE671nkA3AGhnzE
         qE2q9UpXoBaLX25CWWGbZc8tp8kVGFtFvDI+bZvgOx5NFhgNytMaCOBf5bxI08Ibzoqb
         aSmZ0SWiqvfvHczdB4CnqJu/KSXEUYQyaMtxeVxxD4wPtdrlvITbaupnu3ZExEUducyE
         Y7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2+SYstpsmRi699Er2ILUdweEKga8FQwyz0HU6eHs/8I=;
        b=DZzKcy1Dqeqvg2BqVCjCatT+eOJdRZyK6+lhYVQTQWpK60eHHwBqE4t/zo4Rjt6Nvj
         EohjdkK+IEsycAW7c2xxhR7y4KrZ1kk3GJfUA+Gel+9uQVfhKbtn+MZZVDhg6YPi4sEH
         qI2YZopR89Nm4Cosew8nIuFMMMep3X/J7JdQsjDaHjpnMoBOSsteWaRIH92eaWAaUUBN
         hf5MwvL16UUorUp3lYiDY7z0YJ9YSWhktwSAeZV85SMEv7OPfi/QXVqv89evDh3ZAyLu
         jDJxgnTnPPhORb4eBBRBfqNbnW1F5YC9LLTV+wWaT3KMwdfe1T1CWLwCypQjWyhzh9KO
         Y8LA==
X-Gm-Message-State: APjAAAUJBF7Jg5IAjMVAffOeEq2U9GKDFuXM9m/1NNUzS67NRQYUyd6v
        86wa5urap8w22ep5Ayn/yLSDNlqdaXOnubNyRa4ffw==
X-Google-Smtp-Source: APXvYqyS8LbG6E9XAOLBdtoQz17koiZIDdSIvdrNjQdPQytPutaWJbkQvz86NlpCKRGX6jndFGkwt+ExRsJ4XqsAthk=
X-Received: by 2002:a92:49d1:: with SMTP id k78mr2145697ilg.6.1576054846070;
 Wed, 11 Dec 2019 01:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20191211004631.8756-1-warthog618@gmail.com>
In-Reply-To: <20191211004631.8756-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 11 Dec 2019 10:00:35 +0100
Message-ID: <CAMRc=Mcr668LQVB5yUBdn523UdV4aYUrSYCg1VEokBTTuNxhdA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio-mockup: Fix usage of new GPIO_LINE_DIRECTION
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 11 gru 2019 o 01:46 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> Restore the external behavior of gpio-mockup to what it was prior to the
> change to using GPIO_LINE_DIRECTION.
>
> Fixes: e42615ec233b ("gpio: Use new GPIO_LINE_DIRECTION")
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Changes v1 -> v2:
>  - add Fixes tag.
>
> Fix a regression introduced in v5.5-rc1.
>
> The change to GPIO_LINE_DIRECTION reversed the polarity of the
> dir field within gpio-mockup.c, but overlooked inverting the value on
> initialization and when returned by gpio_mockup_get_direction.
> The latter is a bug.
> The former is a problem for tests which assume initial conditions,
> specifically the mockup used to initialize chips with all lines as inputs=
.
> That superficially appeared to be the case after the previous patch due
> to the bug in gpio_mockup_get_direction.
>
>  drivers/gpio/gpio-mockup.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>

Applied for fixes.

Thanks!
Bartosz
