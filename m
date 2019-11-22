Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFB8110728E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 13:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfKVMzt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 07:55:49 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45906 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVMzs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 07:55:48 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so5404926lfa.12
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 04:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wk6tt4pvu+ZfbWYu/PVVeu0E+OQ4R1/xSNXMM/bU9Lw=;
        b=aSzmnfAjW/Sld1A8GmaY9ft05mnl46eBHazEo0IxNFXbfqSoHtzJAqR/KjWfUJTOZT
         63vNmiQEJCiTbYwkMMnapQZ0CWRn1/ZBioLILPzwXpwo+KJU1BdbU5Guu17ED/RbO91Y
         ZrIDQ9/tCxEJLPj9pN2EBouj1rjVXn1M3Yx3hJxKCsQrsYZ6syipL3Gt0tOCLjyhEekU
         VDsvbCQpdzdTiK+XrpO64rZKfv5/Waa9bVEIanN6lpwDIFXdW1hqIU9UShZyjzqJG696
         GxvlR3Qb6tW0rclsJfPIZk+iVoe850/pWaIvV7pl/JWquPXliXkEdJTCCBI2+vfI6Jik
         S06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wk6tt4pvu+ZfbWYu/PVVeu0E+OQ4R1/xSNXMM/bU9Lw=;
        b=iu1HS8+qGMY/3onpc+Qv4Mf9lqAkO+surZs3BOxsMiOqxdTQLiti9076VbhJtnP6BR
         iBpk1vu69A3eKw5jYD1C+ukM2W3grDKPsP3dRAPtmV3s6jEduRpuzGyZ0eHYh6Nc7wAY
         XbrrKJAKo/wXm7QCtPT0OsMxdj57B2UCtg7sndwIb9M8IJoKlTOUGtERfftGt9+zED4e
         IW0UhI4ofOEF3FjlVISWdUpu3LXWKYz45u5mwQqC7DfNH0PbD0BKp0TYKB2nQNscQkEf
         48aOFIXYIuDlhwy8lbvqw1+xQJvETkWOg6WxrygtPB9e3yNVEdvzzak+Em5ZjeFH4oYX
         cZmQ==
X-Gm-Message-State: APjAAAWn7ymi4H/lTHE4CrhwO2fGF2bMfn4Czojaqzvhg+5tO7FpBwYn
        I6O/o4gUmXgnE3H2ajPXtZtL3SXd1DSJt3DU7S02wQ==
X-Google-Smtp-Source: APXvYqyLBqx9aJEJZHJrOVeWIjfpxknwTpqU3jqLGVpk8q264VK7YTN0bIpi+Gk/YANI17fLVJDi0jHVKVodRmu7na4=
X-Received: by 2002:ac2:44d2:: with SMTP id d18mr2251137lfm.5.1574427346899;
 Fri, 22 Nov 2019 04:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20191120154521.16273-1-geert+renesas@glider.be>
In-Reply-To: <20191120154521.16273-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 13:55:34 +0100
Message-ID: <CACRpkdb7Fkrbr=Zu0HPPWmDx4uPPvog7edzddZ2Z7g1E7srYdA@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: Fix bogus reference to gpiod_get_count()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 20, 2019 at 4:45 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The recommended function is called gpiod_count(), not gpiod_get_count().
>
> Fixes: f626d6dfb7098525 ("gpio: of: Break out OF-only code")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij
