Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6A1AFDF7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 15:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfIKNqk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 09:46:40 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43517 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfIKNqk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 09:46:40 -0400
Received: by mail-lf1-f67.google.com with SMTP id u3so1383811lfl.10
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4sB+wuvpg6HOuULqW0CTyLMZAayjlo9Avh7ZcIfH02I=;
        b=f7WAc4eVUllG0HyD3MOg19lLppTzVl6OteOiVGlOanE6XyIj3qnlmvqoBN987zeZrw
         S0IAcgva40wvfsDFvM3iBU+YJHXlQJ3lZG51L+Mi5m2SR+hu8e0jyXEHnLLybleugw05
         ZF0/LzCcyey2fwAHdDqpbTR0gDZ/J9BymPONwPVtMrKQxHhsT/t4Lriy+q4xMRdFPeW0
         OLC2m/IW0I59dAFAHxL2YvisRwdW6sCDWuapamoz7H6mHjZ6Qv6bBFOfo99aJWCAyWTc
         m9m9WN45I21+hrEqrAa7ziveIW9c5R1rDsjJVUPr93xOMiM0odNzmnjfiB49EaR7aUTq
         q6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4sB+wuvpg6HOuULqW0CTyLMZAayjlo9Avh7ZcIfH02I=;
        b=YaWZx5/+xdx1tQvcIQmY6jQffo7hTFhyeLhxE7cQhjCrIZ8uMco0BCRQjeQEmXWhrF
         Dgh5V2WGu2lmlLtD1XpA+HdpVQsbGW2aPIlas8CENijmbDMz9XEXpB1iGEs4tA3hhi20
         DzqqjEkifH69i9xeykY3R+STHjYw/8SrmTRsNVizCjEcJqlwokdZO9nw1e+FVmXcaxFy
         X9EgFeUfiN9SneEvS4yWW35c2VvHSX94MhoQPmD2Y/2Wx35oIox3TReU6U7ymrojeyx/
         zMllClNI24bEbx3VmLvMFXwIiTiZdkje9ttsU9dwjczOkD4O3fk97cgKdQj+v7opEnRs
         zwqQ==
X-Gm-Message-State: APjAAAUglOOkumfQ8bna3U8LA6v/ARxPn/ZA09xlbqfDAaeujz8lJYHE
        TUQk+AFh8tDlZIAaigIt35tmxbmGmv4afD9IoxOxTA==
X-Google-Smtp-Source: APXvYqyF6iui8XzJs63N8SI1PpU/RSrw6A/JpJKJvAWmEDeGqssvUwnipJOZ4/itbd3e1Uyp9EoF+YH4+XRnfLSl9JE=
X-Received: by 2002:a19:117:: with SMTP id 23mr24532313lfb.115.1568209598170;
 Wed, 11 Sep 2019 06:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190906084539.21838-1-geert+renesas@glider.be> <20190906084539.21838-3-geert+renesas@glider.be>
In-Reply-To: <20190906084539.21838-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 14:46:26 +0100
Message-ID: <CACRpkdaOu2mVGS13MpQQ-OJ71W0qR4oTvE9T4+=BKch4+Vdf1A@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: of: Make of_gpio_simple_xlate() private
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 9:45 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Since commit 9a95e8d25a140ba9 ("gpio: remove etraxfs driver"), there are
> no more users of of_gpio_simple_xlate() outside gpiolib-of.c.
> All GPIO drivers that need it now rely on of_gpiochip_add() setting it
> up as the default translate function.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
