Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1ED3A3075
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 18:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhFJQZV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 12:25:21 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:44923 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhFJQZU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 12:25:20 -0400
Received: by mail-oi1-f175.google.com with SMTP id a26so2691575oie.11;
        Thu, 10 Jun 2021 09:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ajFMbmV13rSn+GZr+FQLaWoaYSbQZYLeXPdRKVG1MtA=;
        b=m8w40JFynlgkjBnRTvPYZY9Mocg22oJlbrPnS2mBvET1tuITOVOzbfT/yDM9Vn5NkR
         PWyzeWeuZYwAZP/jKGvfqvf5GI+wm/1+bAe+FLiH0Sus2DV78e+EyjXxrtbqOXP+9uii
         89Tv0zUOuY4dchh8HMsGXkvdsVUbsEYg5FkJWI82fW+lfsPRsU0waVkdSn4ELPZ/gJb/
         u6K031JkS4cbkLeo/TTWuvatI8B1aSpl4YzWT/Rvg5nMrhE8QSvqZjyX4vWrrQpfTxw2
         K/7tfaibPrlnRlqWq0WzGfBmWcj/ZS3j5UAaIH6u1lHFgAnD6gfaBLrD/WkMCpNjxuD4
         uyow==
X-Gm-Message-State: AOAM531zmbP4Ph+wmdCGxBfDm5J6CXfE+Joj8m2GSDtb3CBHNLVS2s36
        022LpMD8P4fY16Hrtsex1A==
X-Google-Smtp-Source: ABdhPJw4r/ruF84yQMzuAkmhN9owEOanbliqra7Rbz4SR5J1wnvK6z9pA0sJEYhLuP2q3B5VVOi5pw==
X-Received: by 2002:aca:d485:: with SMTP id l127mr4034718oig.106.1623342203689;
        Thu, 10 Jun 2021 09:23:23 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id x24sm674126otq.34.2021.06.10.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:23:23 -0700 (PDT)
Received: (nullmailer pid 1916785 invoked by uid 1000);
        Thu, 10 Jun 2021 16:23:20 -0000
Date:   Thu, 10 Jun 2021 11:23:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>, Hongweiz@ami.com,
        ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com
Subject: Re: [PATCH v5 02/10] dt-bindings: aspeed-sgpio: Add ast2600 sgpio
 compatibles.
Message-ID: <20210610162320.GA1910317@robh.at.kernel.org>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-3-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608102547.4880-3-steven_lee@aspeedtech.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 08, 2021 at 06:25:37PM +0800, Steven Lee wrote:
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins. Add ast2600-sgpiom0-80 and ast2600-sgpiom-128 compatibles
> and update descriptions to introduce the max number of available gpio
> pins that AST2600 supported.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> index b2ae211411ff..0e42eded3c1e 100644
> --- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> @@ -10,9 +10,10 @@ maintainers:
>    - Andrew Jeffery <andrew@aj.id.au>
>  
>  description:
> -  This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
> -  featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
> -  support the following options
> +  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
> +  AST2600 have two sgpio master one with 128 pins another one with 80 pins,
> +  AST2500/AST2400 have one sgpio master with 80 pins. Each of the Serial
> +  GPIO pins can be programmed to support the following options
>    - Support interrupt option for each input port and various interrupt
>      sensitivity option (level-high, level-low, edge-high, edge-low)
>    - Support reset tolerance option for each output port
> @@ -25,6 +26,8 @@ properties:
>      enum:
>        - aspeed,ast2400-sgpio
>        - aspeed,ast2500-sgpio
> +      - aspeed,ast2600-sgpiom-80
> +      - aspeed,ast2600-sgpiom-128

If the number of GPIOs is the only difference, then I don't think you 
should get rid of ngpios. It's one thing if it varies from one SoC to 
the next, but if something is per instance we should have a property.

Rob
