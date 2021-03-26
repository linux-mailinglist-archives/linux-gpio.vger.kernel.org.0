Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A6234AFDE
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 21:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhCZUJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 16:09:36 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:41716 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhCZUJS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 16:09:18 -0400
Received: by mail-io1-f46.google.com with SMTP id z3so6620767ioc.8;
        Fri, 26 Mar 2021 13:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TPNgb9rXj+FhBd//9Ja3ksFG/vnIKjqJGB6IivAs5bs=;
        b=Duxs4VVewPy0yVfuQY9tkmZloAgSTuScVXdWn2YC0zWH/imvDjgM14f5hY86w9UTrH
         66aTp6Do/ILxYtCRKwLU3NM9lp+uILiZOGyqF7vFIxGtXKs8fJSGwQ4fwM8206WoD477
         KAaxBdP+Vdhs8CTnt0OS1htZmhdWMyNqFB+8ts/OIkWFMX9W+lq7aLvwmAdK/VumaNy5
         xkEXbHtFPtTbKiFLc6ADhuuSLF2xMZz+PNj3Gt2T8OpoIUdSOZM58QetG6tQ8G/b+xRB
         UlxqoMePwH0G7qiTGiiys7BO+AnncI6e0GE1YhRYNJ+ciduGx0L7hrzgEzpHQe3unwGn
         TWDA==
X-Gm-Message-State: AOAM530ZcgvKjhqZPwRlZp1YuKkHhWI631ZfzR9Y8d+Xt9nEK9L6lnUD
        7w5LcZFPIPsjOF8vxDHjow==
X-Google-Smtp-Source: ABdhPJzkRjooppTzNzCk08Gvrt15MjIcx60FMYdOXlFfD4PcxELtCC8NGkn+WlQ2ILOzVdepTFvtLw==
X-Received: by 2002:a6b:da0f:: with SMTP id x15mr11598413iob.181.1616789357854;
        Fri, 26 Mar 2021 13:09:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id x20sm4810406ilc.88.2021.03.26.13.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 13:09:16 -0700 (PDT)
Received: (nullmailer pid 3786292 invoked by uid 1000);
        Fri, 26 Mar 2021 20:09:14 -0000
Date:   Fri, 26 Mar 2021 14:09:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v9 03/22] dt-bindings: improve BCM6345 GPIO binding
 documentation
Message-ID: <20210326200914.GA3786252@robh.at.kernel.org>
References: <20210324081923.20379-1-noltari@gmail.com>
 <20210324081923.20379-4-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210324081923.20379-4-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 24 Mar 2021 09:19:04 +0100, Álvaro Fernández Rojas wrote:
> Convert existing BCM6345 GPIO binding documentation to YAML and add binding
> documentation for the GPIO controller found in BCM6318, BCM6328, BCM6358,
> BCM6362, BCM6368 and BCM63268 SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v9: document 32-bit registers and replace gpio-controller with gpio.
>  v8: introduce changes suggested by Rob Herring
>  v7: new patch, splitted from pinctrl documentation
> 
>  .../bindings/gpio/brcm,bcm6345-gpio.txt       | 46 ----------
>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      | 86 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
