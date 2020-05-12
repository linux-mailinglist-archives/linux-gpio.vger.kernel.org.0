Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221BB1CEA54
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 03:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgELBzO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 21:55:14 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37879 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgELBzN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2020 21:55:13 -0400
Received: by mail-ot1-f66.google.com with SMTP id z17so9278110oto.4;
        Mon, 11 May 2020 18:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AiCoW3O58ru21ZOnNKb6RDGHeHYWQXHsIR7tZCS+sHM=;
        b=Sz6y/aqIZdomq7tfrYIofWcdoeyjjiPEAR1h7lPbxZAiVn9EAx1KIH+7g3ml2RkOk8
         M0RLGcDxxVDZNbpsUNCmHyNPRd40i+tF9imaKLWuZSKEwXvw1tif5YNY5sWsm8rGYWjh
         nF8/KSAfbH9H1eaZPwnkvZJZD/CZN4/QIWFnpIRhpnjNUze/E+Y8kgkR8KUwnpOmtRKg
         7WuNxJuIFyGFaGDNXL61NBCR6IdvUTffvdB6yvwg0h0dT4JMVMz01iZ5vLs+ZnaKrISy
         6b+wgWbvh94lHFe93+DZxtVO0Zcsa3LTZelTTCfRBRL+DAc0b7Bz381I+onFRcI9SNhm
         ND4A==
X-Gm-Message-State: AGi0Pub6JS1yQYKxUcwl777uGpS367X2cmp7SipI2eK0SRpbRkfgh5tp
        N33PjDGknVxa1AM3pJj1BA==
X-Google-Smtp-Source: APiQypJoPZyNv2xAcVy4mUw2XjOqoLdXsa9RO5P1ix63KAwt1m5ZukW5aGU1fy3z0MvvoPnCaiUjFA==
X-Received: by 2002:a9d:4b07:: with SMTP id q7mr2391552otf.372.1589248512008;
        Mon, 11 May 2020 18:55:12 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i81sm84561oif.26.2020.05.11.18.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 18:55:11 -0700 (PDT)
Received: (nullmailer pid 17008 invoked by uid 1000);
        Tue, 12 May 2020 01:55:10 -0000
Date:   Mon, 11 May 2020 20:55:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Convert to json-schema
Message-ID: <20200512015510.GA16909@bogus>
References: <20200427192259.27978-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427192259.27978-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 27 Apr 2020 21:22:59 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas General-Purpose Input/Output Ports (GPIO) Device
> Tree binding documentation to json-schema.
> 
> Drop the deprecated "renesas,gpio-rcar" compatible value.
> Document missing properties.
> Drop the first example, as it doesn't add much value.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/gpio/renesas,gpio-rcar.txt       |  94 ------------
>  .../bindings/gpio/renesas,rcar-gpio.yaml      | 143 ++++++++++++++++++
>  2 files changed, 143 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> 

Applied, thanks!
