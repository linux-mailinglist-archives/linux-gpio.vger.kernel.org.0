Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2550F288BBE
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 16:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388997AbgJIOnp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 10:43:45 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35681 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387662AbgJIOno (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 10:43:44 -0400
Received: by mail-ot1-f67.google.com with SMTP id s66so9219529otb.2;
        Fri, 09 Oct 2020 07:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dOsE09lqg8xfhaENVLTYfHrMNxg+wDtzzAMabberaGg=;
        b=VDhQGQRin/BrFzeeqiFlp3ngq1mJ+4w2r0WzxIzsarigXYVTfMFo+oBuITWTuonSXH
         C+lt8RgC74NdvgotKPUx4OLfXXJRHVUet9ube7LEUbjeqtr8iJrmlSue+XNWtkTgdZao
         uMCZYlsIGxJ42WY7y3m+I7FzXJX6JYbHB+cqABBUu0ApIoxtdouBbWiXbcqNCjvOgq5j
         tmw7OqthIpW+oeL0Oyl3fFpjapwasUIaMKH2Hi7gxDOJUQ8dkhdh5oUEi3ZHDyvdcS5M
         XrRG1gwazp4Qm3T2J/dZ8ADhG6PE6qAS0efg10GkwangXU2GToPwN437S/LpSgJi+zzb
         nW3Q==
X-Gm-Message-State: AOAM530rMxoYmNsnVcg5uxsfXjfDfBOw5SZvOGM3Rq1/4N2q+9Xc8nq9
        lTCVeW2U26TR27aoYmkjymvznVOET8b1
X-Google-Smtp-Source: ABdhPJzObzDE04JdzjIoWiLq5wi7qtxuGZGqWS590nHGfuia4F0wRI98fv8oDheNIT007JEFjKtwyA==
X-Received: by 2002:a9d:6847:: with SMTP id c7mr8586668oto.134.1602254623404;
        Fri, 09 Oct 2020 07:43:43 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 8sm7456921oii.45.2020.10.09.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:43:42 -0700 (PDT)
Received: (nullmailer pid 4128777 invoked by uid 1000);
        Fri, 09 Oct 2020 14:43:42 -0000
Date:   Fri, 9 Oct 2020 09:43:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mike Looijmans <mike.looijmans@topic.nl>
Cc:     linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gpio: pca953x: Add support for the NXP
 PCAL9554B/C
Message-ID: <20201009144342.GA4128628@bogus>
References: <20201009060302.6220-1-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009060302.6220-1-mike.looijmans@topic.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 09 Oct 2020 08:03:02 +0200, Mike Looijmans wrote:
> The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
> with 8 GPIOs, latched interrupts and some advanced configuration
> options. The "C" version only differs in I2C address.
> 
> This adds the entry to the devicetree bindings.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v2: Split devicetree and code into separate patches
> v3: Devicetree bindings in yaml format
> 
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

