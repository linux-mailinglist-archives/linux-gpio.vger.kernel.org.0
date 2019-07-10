Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D67B64449
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 11:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfGJJVo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jul 2019 05:21:44 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34604 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfGJJVn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jul 2019 05:21:43 -0400
Received: by mail-lf1-f66.google.com with SMTP id b29so1103366lfq.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2019 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dUlokGp/KL+rm7zIFZwyZaj687yjExkx7G3CCtG1RyY=;
        b=lXjUjM/hRPl5vMP/STv3Of3RZWbgJqhaLjopPiE0m16FSLH/Yg/52kpmpXaBuJElyC
         POYcEhK+WE7sWrEePHJfn+3wlJQzDso2tOY4h3p6Uc4G9ueRBAiu/D8uaMeJ8gk6+eUY
         MlE1D7sJY3WXVNRrmfz6E5X9XtOLa1QcUxxoVYMwZxIPKIXKBJicFGoLGAP/vYHEYh0Z
         raiQCyHJvmCjIkwL/kpmbTZsqaahdSavKqyW9R3PsNzdEgT1+i9xD2jtLpM4m0LAadL1
         Wa6dkQB+hSW35l3A8e1TeAWrDlTxu0aTCn0jGKwaYDO01waTH7fvQy9NQ0W3HeJuSGxb
         J8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dUlokGp/KL+rm7zIFZwyZaj687yjExkx7G3CCtG1RyY=;
        b=maYALJ8/4FPaOV1s6aVaet6OxWc/EdDvgJRaaZHZ9aR/ytMCGNsSe0bvVqyaw+C4Oc
         0cAfbvj+K/6xMhPBiCHfEFA+eZI8vYsbZXrHDA/fTHEyvIqPznIEj3x/jADCPcTHWIp4
         jIryNygtz+WREGMg3N5igCO+x6fwJG7DeA7NfvZo+ZJYC6aP7KQzIGBqjbAe6PcQ4faq
         GFpTFModTwCWpH0ng/YOGYXXokad1j4HnHb1NIT+lLQKFF4CMqwGOfJbhxybaPNiOlIp
         tdS6W2+SUpXwmsCZB/HTopuN9h+mK48YerjyVfoMMK3LN/8ZY5ci+GICnLjiLyVfsgN2
         g9jA==
X-Gm-Message-State: APjAAAVxymADdAe3soJdyDesIKBnmbotGze11NeQNDIz64D/+Er5uF72
        FV8VBUHvQ21LzaIMs8WUa8wglwgX1dtPrCSdGJjWC1vc
X-Google-Smtp-Source: APXvYqw0wyUXmLiGLOCwP9mj+HVQe7W/60r3zFp1JV6/XEcKBUO5T07Si2wJMQC0S1u8DPQ9y9TlzLqeoOqnp6gCyt4=
X-Received: by 2002:a19:7616:: with SMTP id c22mr5698967lff.115.1562750501769;
 Wed, 10 Jul 2019 02:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190710032216.4088-1-andrew@aj.id.au>
In-Reply-To: <20190710032216.4088-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jul 2019 11:21:30 +0200
Message-ID: <CACRpkdZXdOADDYkKfqSq8iDosw60U2XeHmFpRBuDKo_t-4XVZA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Strip moved macros and structs from
 private header
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 10, 2019 at 5:22 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Further cleanup from the SPDX fixup fallout for the recent ASPEED
> series. aspeed_g4_defconfig, aspeed_g5_defconfig and multi_v5_defconfig
> now compile. Smoke tested the g4 and g5 kernels under QEMU's
> palmetto-bmc and romulus-bmc machines respectively.
>
> Fixes: 35d8510ea3ad ("pinctrl: aspeed: Fix missed include")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>
> Sorry Linus, I guess I should have just sent the fixup patch rather than
> waiting for your response about which way to handle the break. That way I would
> have actually fixed the problem rather than just eyeballing it and making
> half-baked suggestions.
>
> The content stripped in this patch was moved to aspeed-pinmux.h, so with
> 35d8510ea3ad ("pinctrl: aspeed: Fix missed include") we hit
> duplicate-declaration problems. Trivially resolved by removing the moved
> content.

I applied it and now it compiles so I'm happy :)

There was inevitably going to be some fallout from the SPDX stuff
in this merge window, but tglx has me convinced that it is worth
the effort and merge mess, so we just hash it out and carry on.

Yours,
Linus Walleij
