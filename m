Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8785A4189E2
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Sep 2021 17:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhIZPPM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Sep 2021 11:15:12 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:41630 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbhIZPOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Sep 2021 11:14:52 -0400
Received: by mail-ua1-f50.google.com with SMTP id b34so380739uad.8;
        Sun, 26 Sep 2021 08:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=0V1X+TMseYBMvm/DF9alw3k8+Ejem9OqY7mmxwIgxzE=;
        b=VNSNn9bxBBuPhnCjPDTsIpfBz2qOx6Y9jOiHOiGIFYmV2ebnzqhH7SGrG+8aCIbNnj
         619ygMgMVrrW5AmjEs6ut5vEnGTwTzbZF1FhClUT/MElBavYyZqkwzC/A43S05kWB8lX
         V1QjrYSNWTDpGxsf+VceVFPmTb7fPgHhbsNd936J+j+dW+RZqxemLaj3JQu+2Rhupxf7
         cNfFWtlJWFCcBsHf/9T9uNyWlQHU9EFNRsDgpLyai92EYQpBLM95ePQCvngwWuKj6/JE
         3S2mgdY5GHMjeoFvgWebvGWNUrBIXlYR16d3FXaPIfEu2KgCWdKGLI1B5zFd4Eqxs4Kq
         qRag==
X-Gm-Message-State: AOAM5303argO4xG6AySyWdlrgcNFDlc87Xw5dVHme7thk2ylzNuPrGdz
        ZvHmkh3ncpv6/JccMquIwsK5vTwNfhllqQ==
X-Google-Smtp-Source: ABdhPJxgA8Szm5/laZMEtap4Gl7J+/jsbZwDmwhgDeDI997N0k3IUKeZKx8RD3oQFqSO+RRdwzxcLQ==
X-Received: by 2002:ab0:6f08:: with SMTP id r8mr16959584uah.51.1632669194889;
        Sun, 26 Sep 2021 08:13:14 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id t76sm824440vkt.0.2021.09.26.08.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Sep 2021 08:13:14 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id z62so15338273vsz.9;
        Sun, 26 Sep 2021 08:13:14 -0700 (PDT)
X-Received: by 2002:a05:6102:241:: with SMTP id a1mr9257116vsq.28.1632669194030;
 Sun, 26 Sep 2021 08:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210924071614.868307-1-maxime@cerno.tech>
In-Reply-To: <20210924071614.868307-1-maxime@cerno.tech>
Reply-To: wens@csie.org
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Sun, 26 Sep 2021 23:13:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v66mmmiEBobPRHufNniXyuyb+b5M+wDYCEGsFdfAAAa2pA@mail.gmail.com>
Message-ID: <CAGb2v66mmmiEBobPRHufNniXyuyb+b5M+wDYCEGsFdfAAAa2pA@mail.gmail.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-sunxi@lists.linux.dev,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 24, 2021 at 3:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> thanks to its device tree binding.
>
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chen-Yu Tsai <wens@csie.org>
