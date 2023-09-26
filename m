Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2BFF7AEF72
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 17:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235117AbjIZPFL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 11:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235133AbjIZPEx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 11:04:53 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA00F10EF
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 08:04:29 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d8162698f0dso10472534276.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 08:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695740668; x=1696345468; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XkQznAxnykGoHMZeYaAftpnWpVTscvRnJk62iXg78HM=;
        b=mWapybL+1/A3XLRBjQDmHzpK5v3VTC8lDZtmtWEj+ofqk5Wazm/8o2mxEl4Utd4G8V
         +expOdb5lsNySpUW2Yct++3EpdAvHjHoOnJeKIxW5j0Jms1ciMYBX1HWF/LFT8SLt+do
         SDrCrSSJs5sTGuMlLyhvVS9Pc6XoSA1d50mSSlsZQYKGZ6nBLO50UUZ+odkapIbXKwO/
         5vRCaQIHW+AFleevxdX8mHqQb5JPRO3CpvGgFJ4Wnn1Tj54dYuHEbhC3181SSEQPvS/B
         Ug92D2pQQa69E/Bb+l5ieiHDkUNZSQrepXwNY4vmnGyuv9uJydhI1ql/yItkiz4hiO1g
         0+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740668; x=1696345468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkQznAxnykGoHMZeYaAftpnWpVTscvRnJk62iXg78HM=;
        b=Vwb+Pega2DK0ghwcw9tHw4zhSkHbXO1EkUTxg5i2WaOWsrI6elzY3dkT4eVlJhdPi0
         54TEJ5VcIT7HuT3tPHH1U9Lq+5HoNnRPKcuh4vj+yw6pXJ7ozdsA7lRB668FKoGS3BX7
         MIfEkkv5N0dj6uPoaAqh7ecMzxKNEwo+YaFQecXKI54N4obwAgS/4luzPLx758kD8wSX
         /nsJtnoqgQ2Mfbn/6dKmaReSEPF8x6X4CR8R+UYAVjlTOsEc+yDzV0du14RaW9qTrOvc
         F7GqsmjoSoxdLHXNzdZOw5E2FL3EcOFj3P5/q4XDa6B+kHcK4B8dJYgYvhxTO/zLj3KT
         4T0A==
X-Gm-Message-State: AOJu0YydBfFWlQBN72yy7rbJo/67Mfad0YKJEl/tCzKtjxATV/xi8vbL
        86ahwuKPv+W5TAxbc3N2o31GRo9khqHvDMUPgD8WoA==
X-Google-Smtp-Source: AGHT+IGROsfk06tbY4aJKZhfnAsRPVgtpSRAqvTPi3Sls9eZA1D2bKhA+BHNmXVH+vsas51sqXcQAJy04/XqDr1WP1M=
X-Received: by 2002:a25:b11c:0:b0:d81:a0c5:f275 with SMTP id
 g28-20020a25b11c000000b00d81a0c5f275mr9271834ybj.15.1695740668497; Tue, 26
 Sep 2023 08:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230925030647.40283-1-andrew@codeconstruct.com.au>
In-Reply-To: <20230925030647.40283-1-andrew@codeconstruct.com.au>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 26 Sep 2023 17:03:52 +0200
Message-ID: <CAPDyKFrFxYxSTa=z2VnCk4m_d-wEgd17wBokzyNCCRLtSUnFKw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: aspeed: Update Andrew's email address
To:     Andrew Jeffery <andrew@codeconstruct.com.au>
Cc:     joel@jms.id.au, andrew@aj.id.au, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 25 Sept 2023 at 05:07, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> I've changed employers, have company email that deals with patch-based
> workflows without too much of a headache, and am trying to steer some
> content out of my personal mail.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

I guess it doesn't really matter what tree this gets funneled through,
so I decided to pick this up via my mmc tree.

So, applied for next, thanks!

Kind regards
Uffe


> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b19995690904..1965cee433b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1963,7 +1963,7 @@ F:        drivers/irqchip/irq-aspeed-i2c-ic.c
>
>  ARM/ASPEED MACHINE SUPPORT
>  M:     Joel Stanley <joel@jms.id.au>
> -R:     Andrew Jeffery <andrew@aj.id.au>
> +R:     Andrew Jeffery <andrew@codeconstruct.com.au>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Supported
> @@ -3058,7 +3058,7 @@ F:        Documentation/devicetree/bindings/peci/peci-aspeed.yaml
>  F:     drivers/peci/controller/peci-aspeed.c
>
>  ASPEED PINCTRL DRIVERS
> -M:     Andrew Jeffery <andrew@aj.id.au>
> +M:     Andrew Jeffery <andrew@codeconstruct.com.au>
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  L:     linux-gpio@vger.kernel.org
> @@ -3075,7 +3075,7 @@ F:        drivers/irqchip/irq-aspeed-scu-ic.c
>  F:     include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
>
>  ASPEED SD/MMC DRIVER
> -M:     Andrew Jeffery <andrew@aj.id.au>
> +M:     Andrew Jeffery <andrew@codeconstruct.com.au>
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  L:     linux-mmc@vger.kernel.org
> --
> 2.39.2
>
