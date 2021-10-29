Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3E043F485
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 03:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhJ2Bpy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 21:45:54 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:40885 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhJ2Bpy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 21:45:54 -0400
Received: by mail-oo1-f43.google.com with SMTP id m37-20020a4a9528000000b002b83955f771so2787266ooi.7;
        Thu, 28 Oct 2021 18:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g0vRry/q9gPa6K5DqnEdQ+MjuDPXnWlIXsLq1efeXiU=;
        b=UsGB/ua1OAnHddZfzGPlTtcVJ8VqGGIrKY+j6Qa7wCSwZxAD4FAdFRgzDiqT5T56cQ
         zFlEsh/Y0TX9fiyCvTBk4gwqzggtm6qJDDoMJe2qQdPvM7kbcLiX6pqwH/GhJ2AS8xyr
         +L5DkfhP3UyYC2pJx8UdpXJwbZusNtUKKHwg1FU0CtP0q7GkAvYs97q/4HCQONiNqHZH
         ODg/usjIDJdY7QWfu3MMTUd7HRZcOEjNOFiFpJZhQYGuOhEbqhbnE1OIIv45GW+HIN4T
         PR7LxI7Jb5iVt5w0Oc8MrK26dl1YtI6mRh61gT83E1olkrulycQw/zmE0Qa0Wlog6QBm
         0vUA==
X-Gm-Message-State: AOAM532oXUTI65wEYFM9vLa9xNSTKqZOn3HEZJHVZoXdWGa+fTJocucW
        MIhKnQ5sKlnEoqVVeKF80Q==
X-Google-Smtp-Source: ABdhPJyNVEv7cAeglRB/mWUpRoGfC/2zNsORUfP+htb5VfqOA1jyBofmsXbAWWcfU1MpLlzHQ6EsgQ==
X-Received: by 2002:a4a:b501:: with SMTP id r1mr5585148ooo.20.1635471806004;
        Thu, 28 Oct 2021 18:43:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e32sm1440963oow.30.2021.10.28.18.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:43:25 -0700 (PDT)
Received: (nullmailer pid 977190 invoked by uid 1000);
        Fri, 29 Oct 2021 01:43:24 -0000
Date:   Thu, 28 Oct 2021 20:43:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
Message-ID: <YXtRvIS9qHgP26zd@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-9-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-9-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 21, 2021 at 07:42:15PM +0200, Emil Renner Berthing wrote:
> Add device tree bindings for the StarFive JH7100 reset controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> new file mode 100644
> index 000000000000..c6ad5d7ad100
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/starfive,jh7100-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7100 SoC Reset Controller Device Tree Bindings
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jh7100-reset
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rstgen: reset-controller@11840000 {

Drop unused labels.

> +        compatible = "starfive,jh7100-reset";
> +        reg = <0x11840000 0x10000>;
> +        #reset-cells = <1>;
> +    };
> +
> +...
> -- 
> 2.33.1
> 
> 
