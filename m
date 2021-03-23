Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38B2346C5E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbhCWWVn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:21:43 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:36804 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbhCWWTw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:19:52 -0400
Received: by mail-io1-f50.google.com with SMTP id f19so19416703ion.3;
        Tue, 23 Mar 2021 15:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eobTKQLYqR+i7ZkZ2HN+deQRJnLYXWvwoZqWhBGMD7Y=;
        b=k8iXDBx3oxWgBOQT/ActnONpSpfVsx9BzMjqre0OvItfUy8C7v2dvDsfpqfy4x4eCu
         e76SK9yrnmOld1TC/zB8MAOf7VpUzNIwAp96A5oPeYxpXFRsqqxKJjIIRj5Mm6J4K63l
         77OdU+RQERvWvrbAf1n80oSmdKV3IJs1FLTvkoc6dzR2QVZLiqTC1tL/md30SPn8B0C0
         7JYlhwrIrKFm8QBlR6VoCpKJM6EkuYl7UshOTqTjq/14QpNlyVvrEqxy7+s3kYHuOh4U
         dhk8zoZdq6QDtMeIBSBL4QNzU9h3l5Q7dZ0VK5D5PpKnDcfQ8hwqL5F+qJ65D7I5LqW4
         kcKg==
X-Gm-Message-State: AOAM533JIFXiusWSh9Dy09iimOyugTKUG49RpH6fMR1A9ZqYijmsoQnO
        SMlrg2odl5YGokL0tXt36vWF8jd1cw==
X-Google-Smtp-Source: ABdhPJxaAJw1NqElngz54v4tKHzSXxMGBWWnblkdNjvjGsnu3zHWcgChnkx7eBn8+c9lqmFJ2VHHsw==
X-Received: by 2002:a05:6602:2355:: with SMTP id r21mr228497iot.62.1616537992107;
        Tue, 23 Mar 2021 15:19:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 13sm96378ioz.40.2021.03.23.15.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:19:51 -0700 (PDT)
Received: (nullmailer pid 1444932 invoked by uid 1000);
        Tue, 23 Mar 2021 22:19:49 -0000
Date:   Tue, 23 Mar 2021 16:19:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 08/22] dt-bindings: add BCM6358 pincontroller binding
 documentation
Message-ID: <20210323221949.GA1444858@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-9-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-9-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 17 Mar 2021 15:37:49 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in BCM6358 SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
>  v6: add changes suggested by Rob Herring
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts
> 
>  .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
