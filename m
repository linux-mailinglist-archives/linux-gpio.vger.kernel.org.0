Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70283E578C
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2019 02:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfJZAUb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 20:20:31 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46138 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfJZAUb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 20:20:31 -0400
Received: by mail-oi1-f195.google.com with SMTP id c2so2721536oic.13;
        Fri, 25 Oct 2019 17:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xFaVplPix3RECfmw0mP26wLx1h1GSiIqpWNBxTGaapo=;
        b=AxjjHQ5msHHdkFoPF3zPtrJ9CSTlRyoEVhjaEknKxNqU8DNhiSmj/TEP23XW6uETUr
         1yNDRvp0BEQkQd4a+ft1DOPTGGwSBfxGQVlYs37x4Vic+cx0hRA3nlcvLAUuQotR2N7R
         VcPC5IyIHYlqW7QJOPPtE7HwKOrk5gJsP79oy4kQa5JniDBtCckhw0GsCTuREM3v9Udy
         tL0TcJSNvBcsMkaB1d38PfwY7jlybyylgEuYqqeN7yL6pSDRU7/UjTLT0Oi3sb3OPllo
         1UlaGLcpuuyuW29QcS78SWgxq3znnSreZP6CZ61vgqOJ2ho7jtEw4Q046twydoDm0Z5/
         mINQ==
X-Gm-Message-State: APjAAAXTljrdMeg39U2A6PjIfdcv3jC3Su7EUQqCkINc5hrHmxSJMJ2m
        Ny+yq7krE/hu+LfIeFQ4Pw==
X-Google-Smtp-Source: APXvYqzpqk2Jv5TqpJClrIhi+vYwGvPQet1RBJ9Lrp4ewD+6Q8fdl9123Lp4ED+xjPhOJnmC5HuodQ==
X-Received: by 2002:aca:7543:: with SMTP id q64mr4340495oic.95.1572049230274;
        Fri, 25 Oct 2019 17:20:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t12sm1250767otq.61.2019.10.25.17.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 17:20:29 -0700 (PDT)
Date:   Fri, 25 Oct 2019 19:20:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: sh-pfc: Document r8a77961
 support
Message-ID: <20191026002029.GA11965@bogus>
References: <20191023122955.12420-1-geert+renesas@glider.be>
 <20191023122955.12420-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023122955.12420-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 23 Oct 2019 14:29:53 +0200, Geert Uytterhoeven wrote:
> Add DT binding documentation for the Pin Function Controller in the
> Renesas R-Car M3-W+ (R8A77961) SoC.
> 
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by,
>   - Update R-Car M3-W references.
> ---
>  .../devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt        | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
