Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBB7386F0D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 03:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240804AbhERBVU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 21:21:20 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:44638 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240845AbhERBVQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 21:21:16 -0400
Received: by mail-ot1-f49.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so7236796otp.11;
        Mon, 17 May 2021 18:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lQyD2GWtj103+jAsSAlVSEacTextBV6NwaSeCGgoqTE=;
        b=Vb6Wgub8VgkI7us15uf8tJbJ22UASKWfBhb3zs665nT6RrXo6FFC7zBdI9gy7J80HB
         jp11NWfwqI1cNGtFWwHywHFc0F6xj18sBtcmP79Av+wDNl6vWJmM+cxpy7jZB8EU0aO6
         +/+cFjYSI2s/pZGR30XmcJEjZDdQ0JYj3fqRC3kRuaWatzXZPfjqjF8CdMAHvu3RJAvt
         Z1cYJitw9JDm3ad90vjW+QcPSu4v6hiEb0XC7GmXvuLyOyEy7YgwWfa2R/ct7LrAz24h
         UmkiT5nnfHB1OodN6h/xwrRoxYhfiJZN32yHyfNpn8AH6pgu0ira5yKrbF/aoK8GQR0d
         JQ5A==
X-Gm-Message-State: AOAM532wKpu/zYCGOelaVrygQi9bBY1SJkpBaipj+cpl2wZP8ytUGmia
        14boG/H6ipfrlfaJHxJpyg==
X-Google-Smtp-Source: ABdhPJx3Cah7HBLH1rOuCHWlRTVK4JcqnkhRVjkCNHaZzTuPfUQzoGwRf3xkCX3W34RT/ftSRl5ITA==
X-Received: by 2002:a05:6830:16c4:: with SMTP id l4mr2089684otr.93.1621300798603;
        Mon, 17 May 2021 18:19:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a12sm3468072oti.12.2021.05.17.18.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:19:58 -0700 (PDT)
Received: (nullmailer pid 3587505 invoked by uid 1000);
        Tue, 18 May 2021 01:19:57 -0000
Date:   Mon, 17 May 2021 20:19:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        john@phrozen.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: gpio: stp: add gphy3 and gphy4
 properties
Message-ID: <20210518011957.GA3586154@robh.at.kernel.org>
References: <20210513210340.10466-1-olek2@wp.pl>
 <20210513210340.10466-2-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513210340.10466-2-olek2@wp.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 13, 2021 at 11:03:40PM +0200, Aleksander Jan Bajkowski wrote:
> The xRX300 family has 3 and the xRX330 has 4 gphs. They can also control
> some pins of the gpio cascade. This patch documents the missing properties.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../devicetree/bindings/gpio/gpio-stp-xway.yaml  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
> index a36acc98898c..beb755edf639 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
> @@ -84,6 +84,22 @@ properties:
>      minimum: 0x0
>      maximum: 0x7
>  
> +  lantiq,phy3:
> +    description:
> +      The gphy3 core can control 3 bits of the gpio cascade. Available on
> +      the xRX300 and xRX330 family.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x0
> +    maximum: 0x7
> +
> +  lantiq,phy4:

You could make these a pattern under patternProperties instead.

> +    description:
> +      The gphy4 core can control 3 bits of the gpio cascade. Available on
> +      the xRX330 family.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x0
> +    maximum: 0x7
> +
>    lantiq,rising:
>      description:
>        Use rising instead of falling edge for the shift register.
> -- 
> 2.30.2
> 
