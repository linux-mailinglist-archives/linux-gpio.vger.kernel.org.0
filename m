Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C43CD8E87C
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 11:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730915AbfHOJoe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 05:44:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42152 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfHOJoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 05:44:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id l14so1697113ljj.9
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zVViL1XgqHp7M9lme5Kz3G83dTHvuIv0xjCWlHINQ2M=;
        b=sPWwf/e8SaUdyWodO+SKVC6mpDgq9KXONxYEUSEg+AaL4Z/Afo2b9X2PICjrtmLQHY
         Ly5/hCN3hzJlDfIg4QbZ5FhSpny9an25jvNX8vJDdfwOu38L+giCXj3hUpnmlfDbTmgF
         /HNDNTgR8bZvW+f5DoNWhVsvOTHU+mw36q9XV3J16bQW0Z2vFasQG0AwmdXTGrKrwpag
         CgSgguucbi9g5TIOHReiUneL63Nr0zKIWG7Sf/sC7ng3RCAg3eYGGQajA8JoUMDF7ZVR
         nqH3fVo53h8MT9BsmV8h/73if4X8pxFXGlJvBI4Br6dHVJul4uQshS779psb3yKPV1Hv
         PFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zVViL1XgqHp7M9lme5Kz3G83dTHvuIv0xjCWlHINQ2M=;
        b=bf2wFYsPZLS1YUZDwkCIINK1rXiuoIgqHmGL4YuSsJPD/5c3KJ7pYCnJQfPKDHXnoI
         YzOTDJY6E74k/zlwmUciSrcRKBUTQ9XcL8PCerjRAyMiA2ll3LntcLs1CQajT4QMzS8C
         NNci/ZPirK1SjK/WtzFzIrVTG2lQjFO1aYDznZ1pl2JhHlkJmCpVLXz7kq62QhH2cZgZ
         On+RTMfu5eaNk9pDUamMsncim+2DwDOSP2/l41o4+nFTJnPNxH+cOfz0yYzI2Op+YMvz
         XhUqwCtQ0I5+1d4kYM0SpKf4sxoAp8OO5KxZ0y51Xo7Y1PrnPpoHyywkPs3YzF+YOFFU
         il0w==
X-Gm-Message-State: APjAAAUlCFxnXg8aNtI5VMY6gGal1HsvFujs+X7L/YzFzGz3w8LZpXD2
        BGqOS6akQWaDKlxgOkarxeaioq0bc0E3mG6g08+tx+OsQvM=
X-Google-Smtp-Source: APXvYqx4kUUzJzn+bO3SE9xy3kp49njXjmI1KvCyFfMqdhmc8UIrRDyA8sjbNbStWoE6qrQZPZclwlaLM54oG3NUtWc=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr2227564ljo.69.1565862272633;
 Thu, 15 Aug 2019 02:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190815085341.28088-1-sr@denx.de>
In-Reply-To: <20190815085341.28088-1-sr@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 11:44:21 +0200
Message-ID: <CACRpkdaOjfg3gsf+Ybp0+3cE_op6dTRexWhZq2KVdcS85g8vhQ@mail.gmail.com>
Subject: Re: [PATCH v2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
To:     Stefan Roese <sr@denx.de>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 15, 2019 at 10:53 AM Stefan Roese <sr@denx.de> wrote:

> This patch fixes a backward compatibility issue, when boards use the
> old style GPIO suffix "-gpio" instead of the new "-gpios". This
> potential problem has been introduced by commit d99482673f95 ("serial:
> mctrl_gpio: Check if GPIO property exisits before requesting it").
>
> This patch now fixes this issue by using gpiod_count() which iterates
> over all supported GPIO suffixes (thanks to Linus for suggesting this).
>
> With this change, the local string is not needed any more. This way
> we can remove the allocation in the loop.
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Pavel Machek <pavel@denx.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2
> - Use gpiod_count() to check if the GPIO exists (Linus)
> - Remove the now unnecessary malloc in the loop (kasprintf)

Pretty neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
