Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD7244EA0F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 16:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbhKLPc2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 10:32:28 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:36473 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbhKLPc2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 10:32:28 -0500
Received: by mail-oi1-f169.google.com with SMTP id q124so18514645oig.3;
        Fri, 12 Nov 2021 07:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NcKV1P8PtklrAEv0EqDF5emPk1NdNH66AlfbPOIsk58=;
        b=IFWTClQIXqhlMQb8wr4Nbq+zYg6C+kr8BHnV70t6um0APLJfoy5B0vzvTZdfCeqAN8
         2v+1G1x1w0Aud9NkwVp+z7MfHoF2cy3lSthCQ5qXeOqGEG0EEzAQD4U9QTmDIf29e3nv
         Tz0pYbQgUFRWGk1vppKRQwKf3ZMm+xn1LEe/YzybqnZPIdiFszfawkZXkZA0pdqferPW
         00uocr9lrZJ0cPgm/JmULiwuHd2Q0xynUziVx2EQibIlIipLhI983TF7F7IAfh+i94zE
         9pKj6xirOiNVI5gO0g9uxk5j3hSWMA8ZeiV57RLyDxDveev+IuoROjhwT1DOU/i2ove9
         k4vg==
X-Gm-Message-State: AOAM532mRxBrd+QMGd3QTkoRpXcmudh7m+QFJ9hPQmidDxAS9HFJAFrK
        kZ13PuX8gHc4i80tFORgNw==
X-Google-Smtp-Source: ABdhPJwKyezcypEhopkQsqPZqd2bc/4EdlYNnybf6hgAvuR7p9iajdD+9EvTtzuxT+R2z7irxYQ5nQ==
X-Received: by 2002:a05:6808:bc7:: with SMTP id o7mr10400028oik.172.1636730977266;
        Fri, 12 Nov 2021 07:29:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l2sm1262579otl.61.2021.11.12.07.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:29:36 -0800 (PST)
Received: (nullmailer pid 2884680 invoked by uid 1000);
        Fri, 12 Nov 2021 15:29:35 -0000
Date:   Fri, 12 Nov 2021 09:29:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     David Virag <virag.david003@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: samsung: Document Exynos7885
Message-ID: <YY6IX0FYGfdP11zR@robh.at.kernel.org>
References: <20211031231511.46856-1-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031231511.46856-1-virag.david003@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 01 Nov 2021 00:15:11 +0100, David Virag wrote:
> Document compatible string for Exynos7885 SoC.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - (none)
> 
>  Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
