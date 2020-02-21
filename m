Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4014C1681AA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgBUPcS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:32:18 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39774 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgBUPcS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:32:18 -0500
Received: by mail-ot1-f65.google.com with SMTP id 77so2327196oty.6;
        Fri, 21 Feb 2020 07:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5jRzIkWfQ+0gox1TYbOKZYWDKTNe51R7eEKfAaND2e8=;
        b=EwglTzWDYHi5zUI0G73egd4M8WlMq3bTf6ltjxwAhfwj0yGP2OQra9rJ/T28QVtQcF
         VuLxYSannvQna2hi5P14PtkBHxph2sznltyrZqcAMS+swFY02tYpZEq9ezMzZQxQBaLz
         YhBGldvZtk1mLwRrKnd+D2Td72Jr6D5lG+eDMv0Iv3me1ck5dWhwtmD8dZgjcZlRqrut
         7cm3y91tdzTj9/WoxYLlHTkGjsf/PUxmuURJ60K3P30u7PabB5oKSBj/Q6wBWaD8j7Lj
         tV+h3B6dwD1O9NLdi0uFieY4rOd2m6IYzW1m6bKd7vh0Kf2G58B2vPnJ/tDV+5yc7MdL
         sLfQ==
X-Gm-Message-State: APjAAAWGJ6+FxRtS2tsO1TB6zAaQy7MvqN6sBg4MFYZmAhqqy+zm088S
        w77myMc3OGIYntQLqKV56w==
X-Google-Smtp-Source: APXvYqyIi7otPk4YqJ66riR/MI9UiSp8vpqQOhiJlly3+GQnLyt8fa9IB1l62IViMdRSA1KiKTCn5w==
X-Received: by 2002:a9d:6f0a:: with SMTP id n10mr29655564otq.54.1582299137818;
        Fri, 21 Feb 2020 07:32:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t9sm1108521otm.76.2020.02.21.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 07:32:16 -0800 (PST)
Received: (nullmailer pid 14335 invoked by uid 1000);
        Fri, 21 Feb 2020 15:32:15 -0000
Date:   Fri, 21 Feb 2020 09:32:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Convert UniPhier GPIO to
 json-schema
Message-ID: <20200221153215.GA9815@bogus>
References: <20200221021002.18795-1-yamada.masahiro@socionext.com>
 <20200221021002.18795-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221021002.18795-2-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 21 Feb 2020 11:10:01 +0900, Masahiro Yamada wrote:
> Convert the UniPhier GPIO controller binding to DT schema format.
> 
> I omitted the 'gpio-ranges' property because it is defined in the
> dt-schema project (/schemas/gpio/gpio.yaml).
> 
> As of writing, the 'gpio-ranges-group-names' is not defined in that
> file despite it is a common property described in
> Documentation/devicetree/bindings/gpio/gpio.txt
> So, I defined it in this schema.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> I have a question about the range about 'ngpio'.
> 
>   ngpios:
>     minimum: 0
>     maximum: 512
> 
> The 'ngpio' property is already defined as 'uint32' in the dt-schema tool:
> https://github.com/robherring/dt-schema/blob/master/schemas/gpio/gpio.yaml#L20
> 
> 'uint32' is unsigned, so 'minimum: 0' looks too obvious.
> 
> I cannot omit the minimum because minimum and maximum depend on each other.
> I just put a sensible number, 512, in maximum.
> 
> If this range is entirely unneeded, I will delete it.

This property is generally for when you can have some number less 
than a maximum number implied by the compatible string. 

If there is really no max (e.g. 2^32 - 1 is valid), then just do 
'ngpios: true'

> 
> 
>  .../bindings/gpio/gpio-uniphier.txt           | 51 -----------
>  .../gpio/socionext,uniphier-gpio.yaml         | 89 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 90 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Error: Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.example.dts:38.34-35 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1241747
Please check and re-submit.
