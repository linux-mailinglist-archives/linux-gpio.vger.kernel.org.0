Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9C93EF4D3
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 23:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbhHQVWf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 17:22:35 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:36450 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhHQVWf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 17:22:35 -0400
Received: by mail-oi1-f182.google.com with SMTP id bd1so1246496oib.3;
        Tue, 17 Aug 2021 14:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6L+5wlMt2yzIbfshHduMjrMVAdkTpwetAGTBAeNQdRg=;
        b=jTG3eQr8kJfzQYWwrL73J28Ns/gDtyg91UPXTlnWfcIQyUvZOv4NBaepfXOIweiwvK
         rs0N3cmXURa9qK2ZS5Baw2G6lVl3gx24GdAa+97acu9eUdKPMq52k3LkhLUM3STh1zSX
         jB8gy7bzKgMAPSO0X4/J11JNBaKjktfyzpjSWK2aQmMMEeQwm7LY84jvmLdI7I1zMYP6
         WR0Og32gCgNcPgjzD4O56jzPJH5weLtwoXeBXZOhpoWAfHSkJZh11NqonWUKFIhik/DH
         IITQLTFAoEKvajudDxys71ZNlicllhjt33vBM9vuAGr818s8R4W/xX+AEYod4YV8qjMH
         N5ZQ==
X-Gm-Message-State: AOAM532yAND7IkZYpafEZPeljH+qerb8K3z7qijiNmMOEK7t2juV/n8d
        j9PeClS6SkGOlbVm+9q9Hw==
X-Google-Smtp-Source: ABdhPJwOmIKfALlUUV7/8OtxuGv3plXSNmLw/cppX34gG2KRU+NuHHV0PYqmGWcFcGmvBOy24j+mgA==
X-Received: by 2002:aca:1911:: with SMTP id l17mr4172891oii.160.1629235321616;
        Tue, 17 Aug 2021 14:22:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s63sm753605oia.52.2021.08.17.14.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 14:22:00 -0700 (PDT)
Received: (nullmailer pid 862324 invoked by uid 1000);
        Tue, 17 Aug 2021 21:21:58 -0000
Date:   Tue, 17 Aug 2021 16:21:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     linux-serial@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tom Gall <tom.gall@linaro.org>, Marc Zyngier <maz@kernel.org>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Ryu Euiyoul <ryu.real@samsung.com>,
        John Stultz <john.stultz@linaro.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: serial: samsung: Add Exynos850 doc
Message-ID: <YRwodjUxlZmvrvSC@robh.at.kernel.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
 <20210811114827.27322-4-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811114827.27322-4-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 11 Aug 2021 14:48:23 +0300, Sam Protsenko wrote:
> Add compatible string for Exynos850 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>   - None
> 
> Changes in v2:
>   - None
> 
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
