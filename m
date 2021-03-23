Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36154346CAF
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbhCWWYK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:24:10 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:43817 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233878AbhCWWVn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:21:43 -0400
Received: by mail-io1-f53.google.com with SMTP id z136so19437419iof.10;
        Tue, 23 Mar 2021 15:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Fg0JbHxWwc5hs6YUiBAKgad03eD2j4gV/dnUv7t4aS8=;
        b=JbwnKuIEYhBq4uXppyClKxHhw/+bnu1niNWa0R145EmVVlNQMozayL/MDDtghJH30A
         SHMYJuIwAAg6mEdlnQWqLRdZq3CmUuqNKc/CWF6Ytzo7IFbO0NDL//mVF49ezoBC79Be
         OSKkTlNEwgGH6aRaWoeZnAJy6VHbUuzE5meNWU/pskYg4FmTywXK1b+JRTo7PcAbQ4sp
         /R0Ki72yBpR7SrxLzDDNKGQwY+8lGSSGfptd0uqTJ3EayXmFlb0tYAOKkkMKZybFDuq4
         kVGpyyZcDSh+htsgl3h1OGoGvuEvyY8lrNrLP4Xi6VwANKTDfK0Q/GGX8qmCgSdXfCyw
         seGQ==
X-Gm-Message-State: AOAM531BWRE2CIdNLrWbSpbkznuvFhvm5kSjH6lwKOUcVMXVHQN7h2mr
        6wQauiaEireGko3yHVIt6w==
X-Google-Smtp-Source: ABdhPJwOGnFXOew/OUUy0TgllGRyOgIpGWGfFfMIPAjRH2ecZP4DkyHvB+cAnhPyQYBZzB6BQQyb1w==
X-Received: by 2002:a5d:9d56:: with SMTP id k22mr221902iok.145.1616538103036;
        Tue, 23 Mar 2021 15:21:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e12sm87137ilm.85.2021.03.23.15.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:21:42 -0700 (PDT)
Received: (nullmailer pid 1448259 invoked by uid 1000);
        Tue, 23 Mar 2021 22:21:40 -0000
Date:   Tue, 23 Mar 2021 16:21:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH v8 14/22] dt-bindings: add BCM6368 pincontroller binding
 documentation
Message-ID: <20210323222140.GA1448229@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-15-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-15-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 17 Mar 2021 15:37:55 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in BCM6368 SoCs.
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
>  .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 219 ++++++++++++++++++
>  1 file changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
