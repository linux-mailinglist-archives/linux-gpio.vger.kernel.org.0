Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65FF762BC1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 00:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbfGHWgp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 18:36:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:60662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728331AbfGHWgm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jul 2019 18:36:42 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D993C2171F;
        Mon,  8 Jul 2019 22:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562625401;
        bh=etQZxdD3jWFIiCxrDW0HQwr5UqBYy63rTWHPnocVmu4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BgWdhM6si1+2SOjmlc2UNExPoZL6SZ23FdT2Ttm4VNDRyA4emXndsMAJw9hhWPpqH
         X2c3w819OKT0rg+KKTO2B6GrZESOZH45oF8Y86patOlvFzwoRhODiJVODg0h82l3K1
         c6zVPzhqQF6EJt+n66WzJwzVglvg0NkqyG133rTw=
Received: by mail-qk1-f178.google.com with SMTP id g18so14604416qkl.3;
        Mon, 08 Jul 2019 15:36:40 -0700 (PDT)
X-Gm-Message-State: APjAAAXZqDeUwUyqSMcfympX9UI6YZH9uwguC6Q10jJPOJU5h/2rZKKl
        bMwq7yTbxJrFwzAbJaV593zVSmKOV62PCpk5Jw==
X-Google-Smtp-Source: APXvYqwvtLTmIrH/mZK3DlmCt9rMsWjVnFKMZZK8zbC/QWKJ4wGC/qrPDbXUVjjOfj81Ygpndm1RRGGampcUfPrxjPg=
X-Received: by 2002:a37:a010:: with SMTP id j16mr16508145qke.152.1562625400068;
 Mon, 08 Jul 2019 15:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 8 Jul 2019 16:36:27 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
Message-ID: <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 28, 2019 at 3:31 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:
>
> Document the device tree binding for the inverter gpio
> controller to configure the polarity of the gpio pins
> used by the consumers.
>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> ---
>  .../devicetree/bindings/gpio/gpio-inverter.txt     | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-inverter.txt b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> new file mode 100644
> index 0000000..8bb6b2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> @@ -0,0 +1,29 @@
> +GPIO-INVERTER
> +======
> +This binding defines the gpio-inverter. The gpio-inverter is a driver that
> +allows to properly describe the gpio polarities on the hardware.

I don't understand. Please explain this in terms of the hardware, not a driver.

Rob
