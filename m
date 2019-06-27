Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33EB157A09
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 05:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfF0Ddj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 23:33:39 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46868 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbfF0Ddj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 23:33:39 -0400
Received: by mail-qk1-f193.google.com with SMTP id x18so511456qkn.13;
        Wed, 26 Jun 2019 20:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2KVsZBY5LFFo4gY6VFlLWm4C7+0s80NQB68c0PwknKs=;
        b=CIH3DEPisvLbPTZi3wGI1i0TO6B3EfYZ4CM7za6PasawEQwEPzSBOS2EYItAnRotMN
         nOB68MyZj2/cOYouVjFwjG2GMNoScQjVrcU9FtqqisfIN3GYQi/GI6j2w7t0LZspAEZY
         OxPlsgmasoWbTm8XsFglyvqYvmDiZcPezKJzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KVsZBY5LFFo4gY6VFlLWm4C7+0s80NQB68c0PwknKs=;
        b=AbMniBJ9iQh1Fw9qHz3xZngiBfF0Buo1KA7s04fv0y0ZT0D+Pk7Xwab2kUAot+ITCD
         ERkh+qGTZrqndiKaqxEwYvi2p3d7UlPW3G2TOhmXyIH82Dmpd20fK8fvmiRftbzbB9GL
         Lv50ye6HpkqpfeAufx08sK3gKqvAegyWsj14Lgg9qzAQFrgpL5JgYi8SlKHLrEZwfITM
         HK7xLM0ZT3HB6IBJzgV9ajxjdHlxgFmQpr0huKOPxrsbnyX47trsTU6kV5VJFmyUCavd
         o4Ov2jOS7uhLUEov4kdIzRrRyHNujhF1GDOVbvD55zfOMnPt7MRweCa5/AQiJ6JR8dW2
         +fOQ==
X-Gm-Message-State: APjAAAWjUUh5Srcct4A7Q9TFkzORRV8W8HX9xsMeGejg1UH5a/gPI3Zx
        H+entpxFkF3TsJbFMTu57+YwEb+yqhvn3E5ucv0=
X-Google-Smtp-Source: APXvYqwXbb3SH4AresCUU4pzniix+MHNP2zt84LdWlLd+3IFX0N+wQdttTRFErJ2Y5pcpv3VABkcH8J/i1o8Fv56cF4=
X-Received: by 2002:a05:620a:1113:: with SMTP id o19mr1389916qkk.330.1561606418450;
 Wed, 26 Jun 2019 20:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au> <20190626071430.28556-7-andrew@aj.id.au>
In-Reply-To: <20190626071430.28556-7-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 27 Jun 2019 03:33:26 +0000
Message-ID: <CACPK8Xf2xvQAm8sad-xTt_yNO0-ed+PG8mVDujS8EsXzZw4J0A@mail.gmail.com>
Subject: Re: [PATCH 6/8] pinctrl: aspeed: Clarify comment about strapping W1C
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-gpio@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 26 Jun 2019 at 07:16, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Writes of 1 to SCU7C clear set bits in SCU70, the hardware strapping
> register. The information was correct if you squinted while reading, but
> hopefully switching the order of the registers as listed conveys it
> better.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 4c775b8ffdc4..b510bb475851 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -209,7 +209,7 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>                 if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
>                         continue;
>
> -               /* On AST2500, Set bits in SCU7C are cleared from SCU70 */
> +               /* On AST2500, Set bits in SCU70 are cleared from SCU7C */
>                 if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
>                         unsigned int rev_id;
>
> --
> 2.20.1
>
