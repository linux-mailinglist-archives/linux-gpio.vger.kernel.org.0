Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 734DB1573C3
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 12:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgBJL7u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 06:59:50 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36347 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbgBJL7u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 06:59:50 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so6832137ljg.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 03:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N8ri1HdVPDzljdnoSaEAm04oUJIH8kMn84nyxZZBtKo=;
        b=g43EkP4TbcJv19phmkl5303wP1GAzi/ow/vV/dXqWPvtosCf0QlPvzt+zBYAgWAO/N
         dezbjWY0uhR0ryk00PKNWID6U9hNziz6EJGSzHWr2qslYSgJhLeGIp/rksWaMP51gg8R
         LmfI+CzoVVAuvGh1+8uMeIAE1wxkoq47wyRFD2UsgcLWg/cwVZdbZQTQdRRw6g4ANQUc
         HvEIHjbSqWGDgOaglqyuIcjc+kpexvUdNSmmQjto7RdWJiOkKkdyP/F4tP4s73D1zD1C
         qdCU0yC3dR0qbeLBSbwreIEuziNGPmVnNVC48ZizBlsz9kyiJ1M5IPc+H8o/0Ly5ptBw
         D4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N8ri1HdVPDzljdnoSaEAm04oUJIH8kMn84nyxZZBtKo=;
        b=uf47hz5GgrEOGjfw4CR7jroA5S4FB/p0DhOi24KYuq4pkED/Izy7Ejg71WKjgwH0fZ
         JKvG4bc5ThnEFjbsLsMY7M/bL/y+FrJ9MQGOWVtaBI5OFVMX4vLh9mt6aaVCxS8gxVM5
         IZZxaJBOlRfu8ec9Dtypo960UpzKrefVHRavS1awnnCfHcDHCot0Kx2NWHo/HSZiuKQF
         pasMn3MM7uKnVYCDuQ/hNu0Ol/shsikmk0FuGN7QVWnooa4ztOYJ4G83kHz8wFKtRmde
         yVI8eRRIoasM4nJ+/hg3JkmKcC/oNTRnmHFIAtdH7JZr1rnpBkgh4S+cfhIzkEcff0Bo
         lezw==
X-Gm-Message-State: APjAAAU7kotBLMBoMjnW0P2ItbP21BC9Gz8RHgrKNzsz8VSOA+nnmxcG
        HuoV8VzU9lEL2B3WgTVodI9bZkAXUkHlQwzcx/6I4A==
X-Google-Smtp-Source: APXvYqwglVmXCBtqHmbsVj4LnQ6hKh9b/iLCxpT3Sd3eo1f5NK1zSVEncR7qmMFyYJgpThGlN6KNwGwe8ZZpiFsMTec=
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr686115ljo.125.1581335988714;
 Mon, 10 Feb 2020 03:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20200205134336.20197-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200205134336.20197-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Feb 2020 12:59:37 +0100
Message-ID: <CACRpkdZqfz6Dbu879aC=FdQxkZB6E8cYxQvEnTOsfJRjjFeMKg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Avoid kernel.h inclusion where it's possible
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 5, 2020 at 2:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Inclusion of kernel.h increases the mess with the header dependencies.
> Avoid kernel.h inclusion where it's possible.
>
> Besides that, clean up a bit other inclusions inside GPIO subsystem headers.
> It includes:
>  - removal pin control bits (forward declaration and header) from linux/gpio.h
>  - removal of.h from asm-generic/gpio.h
>  - use of explicit headers in gpio/consumer.h
>  - add FIXME note with regard to gpio.h inclusion in of_gpio,h
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: Elaborate changes in the commit message (Bartosz)

Patch applied as clearly the kernel looks better after this patch
than before this patch.

Thanks!
Linus Walleij
