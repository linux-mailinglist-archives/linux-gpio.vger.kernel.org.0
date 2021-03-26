Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0572734AFE2
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 21:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhCZUKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 16:10:05 -0400
Received: from mail-il1-f180.google.com ([209.85.166.180]:46766 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhCZUJu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 16:09:50 -0400
Received: by mail-il1-f180.google.com with SMTP id j11so5989823ilu.13;
        Fri, 26 Mar 2021 13:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AkCUIqrDpoBOSKigFHhA2k2pcNZc0hz1RWLlw0pcsiM=;
        b=By0XflESuNO0NE+YJx+htF3XlE+LDG3x1jBtSz36+98aiIEMHwXZiclrJ/yS/TVIgO
         Us5RfWHXdBfLd5G0YYO1NvWHDLw2jevMm/BeBrpD4fce2MuZ/8IapLcSkaMNgRfCfcXs
         nv4MfDa78eCyDHKT3T5EadwIrjjgPgvcCSH+jJ4IlN48kuZmlHWo5Mgb6FCThPGnHKPy
         49+IZcOmDOq6iqbVGn6jGZc+auLjZTO5HI9IhHkDs52fakhyyzUYxYJr4Vo4tKOS7EMJ
         ExjCdUw7uemdIPfiit5w1ddivIcYl5MXXBoUvjv8QN1TM64whg0N1GxLfoWFVIsQPZyH
         9xRA==
X-Gm-Message-State: AOAM532kF8pWIErY02YhQv3EUALgEEFRJcVhsgvO9XDrxGnf1PAGoW4Y
        pBK761GURvEq1JUYRUPsWg==
X-Google-Smtp-Source: ABdhPJyK27t4CjD8Pj+GSlozZALWsqhAJrZgBVKhy0GAt0b4oFJtiYjR8YGnKvgRmRHxokxExft5MA==
X-Received: by 2002:a92:1910:: with SMTP id 16mr4030393ilz.201.1616789389926;
        Fri, 26 Mar 2021 13:09:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c3sm4790964iln.76.2021.03.26.13.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 13:09:49 -0700 (PDT)
Received: (nullmailer pid 3787107 invoked by uid 1000);
        Fri, 26 Mar 2021 20:09:46 -0000
Date:   Fri, 26 Mar 2021 14:09:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Michael Walle <michael@walle.cc>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v9 17/22] dt-bindings: add BCM63268 pincontroller binding
 documentation
Message-ID: <20210326200946.GA3787059@robh.at.kernel.org>
References: <20210324081923.20379-1-noltari@gmail.com>
 <20210324081923.20379-18-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210324081923.20379-18-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 24 Mar 2021 09:19:18 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in the BCM63268
> family SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v9: drop function and pins references and fix Co-developed-by
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
>  v6: add changes suggested by Rob Herring
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts
> 
>  .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
