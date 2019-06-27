Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9016A579FA
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 05:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfF0Das (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 23:30:48 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:41054 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfF0Das (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 23:30:48 -0400
Received: by mail-qk1-f193.google.com with SMTP id c11so530444qkk.8;
        Wed, 26 Jun 2019 20:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PH4AXqM58x9vuCT5X/Gjbq2w5DxoKAA6BzmWgUbnGec=;
        b=HhoUPy+/s+uM198lB0sSRK5RzLmFemtOSgwIVThA4XV/JBpMKO7XSJKKiUEjIoMHYI
         cPFhuenDq2eWZI4Nc/J+ol5jiFNl/EJgg+gsRQawWfY78OzG23qrGq4pjTadJccD7LoB
         Zs00YKlSYCsPNNJISz1TfBni2Pugj6cU1yg1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PH4AXqM58x9vuCT5X/Gjbq2w5DxoKAA6BzmWgUbnGec=;
        b=PDUJ8k+DZWgK+wdRdDrlm58D+KUfpuw5lF0HgitE4SSqIvcNABRv6Aq9f7CKHTB1dS
         lpAmoEyxh14Yujtm71USzHkotxLjN1bxOTe1dHOSis9ZKdr2xuuALthd5AJd6VMtAyqk
         ND0yWJvJOTxItVUS8Di3UTTAMUFwuZfgCujzteVL3hfiEkZzSGTKyNDnDZxk+FJFXW6N
         8Uo9Gy6SATuO7UAl8uV4YMPXtwYzCLEpKrOy6RZ7VoCHqvcU+Q0G0nvRZ3ueFuboiXY2
         kXyX8d8mpigvyyr0G6wpxP/1kfyMGEyx6X+Mwwu50gouO9s2a1PBnOmKbxfkuSSjZ2P+
         VhRA==
X-Gm-Message-State: APjAAAVrXFHzeQC5lN0FH6sG/jf1nBXoBKcsTw9iuIcwE5ocAutkzdwW
        JWnAH6rXMI+jPkDQQQ7MC5pxuIAyLD/4RjCF3uLlbtwV
X-Google-Smtp-Source: APXvYqzytvrGwxA5InkHOne1NbDI8ndj6XRhPb/DQ8p6hv1uX1zDjyqrKfJPGYZgR1BJKTI5rjNaxEJb8lx/mqSfFe4=
X-Received: by 2002:ae9:f010:: with SMTP id l16mr1341881qkg.292.1561606246697;
 Wed, 26 Jun 2019 20:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au> <20190626071430.28556-6-andrew@aj.id.au>
In-Reply-To: <20190626071430.28556-6-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 27 Jun 2019 03:30:35 +0000
Message-ID: <CACPK8XcPxJAOBAnKMKxtiG4Fkz8BPf8KtW1Kc3A9tU_emQviVg@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: aspeed: Correct comment that is no longer true
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
> We have handled the GFX register case for quite some time now.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> index 4b06ddbc6aec..c5918c4a087c 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> @@ -240,8 +240,7 @@
>   * opposed to naming them e.g. PINMUX_CTRL_[0-9]). Further, signal expressions
>   * reference registers beyond those dedicated to pinmux, such as the system
>   * reset control and MAC clock configuration registers. The AST2500 goes a step

AST2600 too?

Acked-by: Joel Stanley <joel@jms.id.au>

> - * further and references registers in the graphics IP block, but that isn't
> - * handled yet.
> + * further and references registers in the graphics IP block.
>   */
>  #define SCU2C           0x2C /* Misc. Control Register */
>  #define SCU3C           0x3C /* System Reset Control/Status Register */
> --
> 2.20.1
>
