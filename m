Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967F029769
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391083AbfEXLia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:38:30 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:42577 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390714AbfEXLi3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:38:29 -0400
Received: by mail-qk1-f193.google.com with SMTP id b18so1012749qkc.9
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0lxiGmWfLgl7C0PUBf51UY66oylRUCwuW2L386gQxFM=;
        b=LUaBU+oQ+7tPBoX/UMmq0HZGaNUxbnS4Li9ZC0bSZJ7gQ9i5S9z2Y2TGSJQ60X+Bki
         37KF1sRvhwYU42JBaxNqk4Eqn1GJayVPYODxe20VQIWSzDpMqbh8MJjp45HbKdJcc1vk
         pnjeuZ5OvGdmGOhbaC44nP2tbXRRQOb1mJWvYKyEjDAEl1Obt6lZ/G7NI6GmNocDUBRK
         2Xr0SjpwW4FnOuCvKUVeEXnWXj740GTgprlcCV47PSyFUBMbMBeFQPZXHLO+psfn24Hu
         NfEsR+Js97tD3PQlVq9YDIiPVtP070m/YuQ6Y40B3Z9p3A1JaaI75CbnbuN8ANVi+udN
         mNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0lxiGmWfLgl7C0PUBf51UY66oylRUCwuW2L386gQxFM=;
        b=aUu7jLR39C/WAM8yV/talIHN71a7K3WX+RINg1/UOArqvi0GaduS6v/yTwMGsAhKiq
         l5T95f4RQckDbTYhapd3H2bsfJKt9rDBgZXA9EcruADHrhsfcjyVEqMRLpC8b0sIS/nb
         8uZZeLZS7iELaDh6Zb1yyq9FRCmeVip0ebuUoyloSYj0qI9kFBtcuMa1ySBwZF1idgvt
         F4trUEYT6mbB2sT6NWfr5vkB1CHDEk2qKaz5qtkz9ZDQq0ysK8uB9a7NfgAStB9o7IKA
         8rmScKapF93Ir1ok68tBMXOHu3WiHboggcD8p8bQA87vW+XNyffHSKqvDrM2+rBjgTPc
         T1Ow==
X-Gm-Message-State: APjAAAUj1jOJh0a69404vqqahm6+/iLj8LB1kzfbKf1rwe2g5aI2DHyJ
        uaSnGK0w54VrdqqS7TujS9m/1aAEt+Qqkgt/XKI4Gg==
X-Google-Smtp-Source: APXvYqwgX2PLA0fSXA7p0azFhUSmOAckdqbzgNqBifI/FEQSkUa/r3EhD7hLuBNm+vM7K0FXzlsJhhdkDC52rf3oPlA=
X-Received: by 2002:a37:b287:: with SMTP id b129mr70960448qkf.20.1558697909058;
 Fri, 24 May 2019 04:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190514005033.15593-1-robh@kernel.org>
In-Reply-To: <20190514005033.15593-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:38:17 +0200
Message-ID: <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Arm PL061 to json-schema
To:     Rob Herring <robh@kernel.org>,
        viresh kumar <viresh.kumar@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 14, 2019 at 2:50 AM Rob Herring <robh@kernel.org> wrote:

> Convert the Arm PL061 GPIO controller binding to json-schema format.
>
> As I'm the author for all but the gpio-ranges line, make the schema dual
> GPL/BSD license.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied. As you know I am already a big fan of this scheme.

> This warns on a few platforms missing clocks, interrupt-controller
> and/or #interrupt-cells. We could not make those required, but really
> they should be IMO. OTOH, it's platforms like Spear and Calxeda which
> aren't too active, so I don't know that we want to fix them.

What works for you works for me.

We could add dummy fixed clocks in the DTS files if
we wanted I suppose. The #interrupt-cells and interrupt-controller
things we can just fix, but I wonder what the maintainers of these
platforms are up to? Isn't Calxeda yours, and could Viresh fix
up the SPEAr?

Yours,
Linus Walleij
