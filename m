Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9A269F6B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 01:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731734AbfGOXRG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 19:17:06 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43810 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731058AbfGOXRG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jul 2019 19:17:06 -0400
Received: by mail-qt1-f193.google.com with SMTP id w17so17510614qto.10;
        Mon, 15 Jul 2019 16:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pTNuKPARTwySyUt6RIFwHeD+C8HBpvsST+SWVc23gcE=;
        b=NciHeA2We081hI3Qkgy7AsZ4nH44Dn6IxDoqldO6ifze6wPVXdFKbE8AM5STJCFvLJ
         zAzk1MW5K+j1l8Hw0gXSwU/9hPTUGMVRTKzA8V0temLm9qvAZdpESJ2GASDYsk/AcpMS
         ueOHQEI6JDttZMhdVRPWTHypHdvviexml1ykc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pTNuKPARTwySyUt6RIFwHeD+C8HBpvsST+SWVc23gcE=;
        b=NzQTGoFAHdVP2rTxjIVmrFj0LYhavgfuNuoX/R1oxdJe411D4ozjJeaPmZO6JhK4Km
         MpuqbMBQLCfxFiEgD13TFMfWUUY1uWQmVGZeq/4V8IbPGGScvx6yjyD+hI2OZx7wIjHC
         jZxY3sh3INIH3ZqbBK08dE88m/BNCJE5PACC1Ks/Mb50O0hKUfgbig6q5RxaE+8Y2Qfa
         pKaSA6knPXXviuckamYb64NqbpAjZ7lofqpGmVSfoRY2ix1vnSR3kALnmvaZ+r8RzJYg
         MVkaMK8CUCsRG0vhvhngjaXmpyWt4aGjuGuWOJTJkkzPqPeBq6DmUDkNs57OnNgrV6E5
         wZ/g==
X-Gm-Message-State: APjAAAVZ+mP42j6m6FZWOZ4tYPipbT3U0L9E2Trs3uJ2OkPTB72MK4m2
        jCRelI6xUvCJBlswHQYW0nqGy3AkNy/d+FHs3zQ=
X-Google-Smtp-Source: APXvYqxJc0v4ISkcLVlzLQuZxh/PhnbAl/t86nXT4ZSfAmxjOFMBAbcwYkAY/GLZVXs2nz+WYpc9JkkiXxXZDyNlGzw=
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr20058126qta.169.1563232625324;
 Mon, 15 Jul 2019 16:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190715223725.12924-1-robh@kernel.org>
In-Reply-To: <20190715223725.12924-1-robh@kernel.org>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 15 Jul 2019 23:16:54 +0000
Message-ID: <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Fix 'compatible' schema errors
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 15 Jul 2019 at 22:37, Rob Herring <robh@kernel.org> wrote:
>
> The Aspeed pinctl schema have errors in the 'compatible' schema:
>
> Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
> properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
> Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
> properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements
>
> Flow style sequences have to be quoted if the vales contain ','. Fix
> this by using the more common one line per entry formatting.

>
>  properties:
>    compatible:
> -    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
> +    enum:
> +      - aspeed,ast2400-pinctrl
> +      - aspeed,g4-pinctrl

Thanks for the fix. However, we've standardised on the first form for
all of our device trees, so we can drop the second compatible string
from the bindings.

I think Andrew already has a patch cooking to do this.

Cheers,

Joel
