Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060E434AFE3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 21:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhCZUKg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 16:10:36 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:33651 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbhCZUKK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 16:10:10 -0400
Received: by mail-io1-f45.google.com with SMTP id n198so6691563iod.0;
        Fri, 26 Mar 2021 13:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Em4YLfmzgLloI84lVgW6g4blSx2dakwel/TmZyQCjEc=;
        b=eWvR4bqmjrp6QZQrGsOJNorFiGLDskiCLy0QXggHKAkRKRWQUJrm8FyYoeFhga3TA3
         XIbM2xJ7cBpl2aX9hpLn47ci3uPO9cCS4Dk9LwTVGS9bzf0tuZJNedTax5IKQr23bujI
         z7nKF3ZNmwvmpL/KvIHxpNS2Aia82R1dPAkUL7zPq7JOYi0XtGHUDT1fOuNtPLRgaP9L
         YD5/OXjY8DgDj1D0OAjreN7UVV7Rmm80BJov3zC5om5Acct297CalBnNn6myNFRo60zR
         69TAxsvArsPfxuIrCq9AUveHPpNiQS01Fle1TV1t6Kx9/Gx8smu23NVEEK4iVPjWX7zN
         Gnxg==
X-Gm-Message-State: AOAM531nvJddj6mTseywY65QGXxBuOtRdxHgIycq8zDd7Hol9OZ+CH/a
        zN9x8Q4LOLi4DZsQMlwpZw==
X-Google-Smtp-Source: ABdhPJy25LEJPGQSbjs/aCmJyukTShepPCXx5eP++pzM1VxwTzQ84qLquboEXxOdU6SbdAd0WIGJ0w==
X-Received: by 2002:a5d:9599:: with SMTP id a25mr11605074ioo.25.1616789409498;
        Fri, 26 Mar 2021 13:10:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 7sm2774300ilx.81.2021.03.26.13.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 13:10:08 -0700 (PDT)
Received: (nullmailer pid 3787641 invoked by uid 1000);
        Fri, 26 Mar 2021 20:10:06 -0000
Date:   Fri, 26 Mar 2021 14:10:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Michael Walle <michael@walle.cc>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v9 20/22] dt-bindings: add BCM6318 pincontroller binding
 documentation
Message-ID: <20210326201006.GA3787596@robh.at.kernel.org>
References: <20210324081923.20379-1-noltari@gmail.com>
 <20210324081923.20379-21-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210324081923.20379-21-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 24 Mar 2021 09:19:21 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in BCM6318 SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v9: drop function and pins references
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
>  v6: add changes suggested by Rob Herring
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts
> 
>  .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
