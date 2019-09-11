Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9EC4AFDF3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 15:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfIKNpw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 09:45:52 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34686 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbfIKNpw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 09:45:52 -0400
Received: by mail-lf1-f66.google.com with SMTP id r22so5201917lfm.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nP0S20EG8LYe+0hd/5mZu3tMCLe/Md3Azkq9J3MKJKE=;
        b=c/y2pXyG9iAcROZvJYUWXzj08AwzhP+UtUM6Zvf/8ps1wHhTw+scZ4stj//aj35eud
         RL27Bf8D2dJW7JcyiLA/yX5gfNSAhmDOY/1XugvUaPZe8EC6rty0tbvIVKhMaLf1+deA
         /zxHOrlv8g2hF8FmJf9naGJY8vhNwopQr/98tJh0jRzPJAelieRtB7xzpxf2KMwDJNA1
         ntc9M5ItL3dv3Hji1pW11E8+fEfTYqyzZwOI0yrKULS9G5ud4S1a9TlkGLj1+6Y0UN/u
         QKjblsTwYO3m8OoWh7s1DFbOo0levTzp7EH/1G2ufv/5StbeoAOjKtfyVUD4LUcy57gR
         Oraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nP0S20EG8LYe+0hd/5mZu3tMCLe/Md3Azkq9J3MKJKE=;
        b=A8FDO9zAsuPNpkg4CAqTy4b0O6Ir9EI/mRgDFv2SVsjs+nUaYuZ02QJn+qMS2lkTaU
         LDbrls2o5jcw8ewn6QoIvd6+tG44lJPBVBl3Md0ufLxTDzHGgvKmS0zFp99bRlEDI/vf
         BqlCbrNqw65nKKD8QQehiThRON7sFO8b7gGwP3AmyWL50RTIk+R+c88iv71KkranfDeG
         tyLQ+eM/yimqgPNn5o4xvuymp3u83AbvHpP0Mvt8JNFHmg1/jrQ3Nk66f3hZKxSpQgTd
         bAn439pfT8ipBLhd+/o9zf8XEmGvUx5VYSydam3jMsTULYx4lVxw/dEiyj0G6F00ZuqW
         0VEA==
X-Gm-Message-State: APjAAAWdknmzjJFillgo+fO9SrwzriAnkHWrzx2Qg0dFQnUgMqoeVtMf
        sxrHGCpk1LWteiu5z8AwyET21TcRRgNwxfJeTqeLhQ==
X-Google-Smtp-Source: APXvYqyjFpv46U3/SHRumoathl8NLWc2Qs97KoWiUJCJOU9xmtA6GddnV4DQQxnfIrpO4ge71BO6yrhZSpCiBINuM/M=
X-Received: by 2002:ac2:530e:: with SMTP id c14mr23463783lfh.165.1568209550231;
 Wed, 11 Sep 2019 06:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190906084539.21838-1-geert+renesas@glider.be> <20190906084539.21838-2-geert+renesas@glider.be>
In-Reply-To: <20190906084539.21838-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 14:45:38 +0100
Message-ID: <CACRpkdaB_cX3AZiCQVN3=P5C=ffQa1cOZtVx_g4b+ej458P6ow@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: of: Make of_get_named_gpiod_flags() private
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

> Since commit f626d6dfb7098525 ("gpio: of: Break out OF-only code"),
> there are no more users of of_get_named_gpiod_flags() outside
> gpiolib-of.c.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
