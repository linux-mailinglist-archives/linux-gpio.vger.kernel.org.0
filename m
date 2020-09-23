Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2CA2761EF
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 22:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgIWUW2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 16:22:28 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44475 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIWUW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 16:22:28 -0400
Received: by mail-io1-f65.google.com with SMTP id g128so850524iof.11;
        Wed, 23 Sep 2020 13:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cz+zFoKWLDaE+9iIi+TVpdzgCdv9jCrJPLC86d2DUb8=;
        b=gjwnN4fqhMigXypznLk1VJDFUJpEmvP1eQoNnq1In0BZ4sLOFBVlMDwYCd8FCbsoF6
         d2MoSgG/Se65nWoFhV/87IyV8VaQKX7O0rB1tl9M1lxSBsJm+e609epacsdzQrJYRYJ8
         Ee9vHhRer4qGnODszbf9/LC6snsAodGqOd5FBs38IdFL78sxVS5F8YK2zZVbZDYGTtvx
         g2jEN1QlDbQwTXLBcKDvjSlpBDQaJZ7TmSwNETjBiNGAtrfGEAvBKL2NtF4fwd25oRUB
         gDNLxfmOX6ajK1HNEL1mcf+1ZIQAHNJdYyZ/wus3fULiLYjw3qaoPVyGMPcrOVa3JiAG
         5m2A==
X-Gm-Message-State: AOAM530DN5QK4jdGR9GzNffTV/32CCmLe/4yry3LeqdU+4Uj9h8ZCaJA
        mMAs/3M/U2zlQlqXPJ1egQ==
X-Google-Smtp-Source: ABdhPJyvVcr7IHf5wgJNYptsN9XO77Bkci1w2/cpZWcjIgF7JLbsFD0t0XMaijYN7BJL5Y6jTKPASQ==
X-Received: by 2002:a05:6638:25d0:: with SMTP id u16mr1013274jat.0.1600892547474;
        Wed, 23 Sep 2020 13:22:27 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id f4sm350567ils.51.2020.09.23.13.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:22:26 -0700 (PDT)
Received: (nullmailer pid 1238341 invoked by uid 1000);
        Wed, 23 Sep 2020 20:22:25 -0000
Date:   Wed, 23 Sep 2020 14:22:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: at91-pio4: add
 microchip,sama7g5
Message-ID: <20200923202225.GA1238284@bogus>
References: <20200917131257.273882-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917131257.273882-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 17 Sep 2020 16:12:56 +0300, Eugen Hristev wrote:
> Add compatible string for microchip sama7g5 SoC.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
