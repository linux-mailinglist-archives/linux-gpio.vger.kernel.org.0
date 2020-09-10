Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573D8263B34
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 05:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIJDL5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 23:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgIJDLt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 23:11:49 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8395C061573;
        Wed,  9 Sep 2020 20:11:47 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id e23so6539535eja.3;
        Wed, 09 Sep 2020 20:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vnsPAvTYp81efO0ntlVmzSB6WJb7O61LqafGweeme7c=;
        b=R1iAcVR7DzqA6thGbq8lrg8QhJQZk01IfgZdHfto5SE22j435PzdXda9RLco7nODgP
         B2hIkdQ4WolOIB+1xpV7N4N1C6wA7Tks7tapKRLzjhL6xHp0LClELtq3VD3DE3ruqZFE
         u/mEDu9uIdeTJsIPyJk843xZMgDUb0VhaiFOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnsPAvTYp81efO0ntlVmzSB6WJb7O61LqafGweeme7c=;
        b=oiwftoEakX39IbyryRWm0mHnYGtfYciCBHyiK1QODcEJ3AFxM4+KlEV60gqIGzIqEC
         d94e2XyKqg9RV67++/EU1ZYDL7l5lgO7OlB/8ZvU/Pxt2CEYYWJ8VS0LweTjOgI/c/zB
         D5jiFnwQTFZcIyrtaQvl3mt1A/N7h6RkBpd9FUEIK+JwKhEutufSphKDjQOSlyv7aq/M
         dLOvM+r8OIYhI0Ot6/U21+fYGeOwC02IJLeGoGvI02UeCxRiAVmJuAFdjylOjp+SVOTg
         hegb/vEFevi/yScEgvO2P5woBchDTtkmi9VMGPYn4q/jUbhT5Cyte2TT9d4zrCzx9RSP
         qcMQ==
X-Gm-Message-State: AOAM533W8ZmjCra3W1VkxI9frf1RXBDd0PcBuHVwBgojBuHB0OAt/+yV
        iM/9I2K3PravPtJEwddPJM8LvGCOP2yRywr2naOlMfenfTE=
X-Google-Smtp-Source: ABdhPJyq/aCVocOva4+j0Z7QPbG7fpv24ElCqKXoy5FUY6VcQC3Hi3z9mllEA0TO3Xo1UEcHXilq4gpvr5jSZJbOqNc=
X-Received: by 2002:a17:906:b6d5:: with SMTP id ec21mr6412453ejb.396.1599707506614;
 Wed, 09 Sep 2020 20:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200910025631.2996342-1-andrew@aj.id.au> <20200910025631.2996342-2-andrew@aj.id.au>
In-Reply-To: <20200910025631.2996342-2-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Sep 2020 03:11:33 +0000
Message-ID: <CACPK8XePJtLq7pJ3-dYL+Ac1Q2Z5sQQ=qc5gYNsGM2zkXPyFmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: aspeed: Format pinconf debug consistent
 with pinmux
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        johnny_huang@aspeedtech.com,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Sep 2020 at 02:57, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> When displaying which pinconf register and field is being touched,
> format the field mask so that it's consistent with the way the pinmux
> portion formats the mask.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> In v2: Format val with %X as suggested by Joel

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 53f3f8aec695..2e0260c1a57c 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -539,9 +539,9 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
>                 if (rc < 0)
>                         return rc;
>
> -               pr_debug("%s: Set SCU%02X[%lu]=%d for param %d(=%d) on pin %d\n",
> -                               __func__, pconf->reg, __ffs(pconf->mask),
> -                               pmap->val, param, arg, offset);
> +               pr_debug("%s: Set SCU%02X[0x%08X]=0x%X for param %d(=%d) on pin %d\n",
> +                               __func__, pconf->reg, pconf->mask,
> +                               val, param, arg, offset);
>         }
>
>         return 0;
> --
> 2.25.1
>
