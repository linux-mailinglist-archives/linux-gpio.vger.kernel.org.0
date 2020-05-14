Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2A11D30A9
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 15:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgENNIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 09:08:05 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33628 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgENNIE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 09:08:04 -0400
Received: by mail-oi1-f195.google.com with SMTP id o24so24466565oic.0;
        Thu, 14 May 2020 06:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fbQaej0+IJeKYT0mug72y3TFgNAGh3pGBDCTmds+4Dg=;
        b=ggKxPgTE5lsEr2Lp9mtxlQaGy9V5W46OIASq8eTGlIKRtUWAQMZ9Rv8Cbf4vTUSHdq
         kOWfW4N9COBe9b1BLrLqzn4zBgGI3VhMS08Lhj6bb1t05rBHyoTNMdCU/dZKe42lgwIc
         C/qbdU6/l93p+hl8epFdr6cn7tDZKyh4w5wQO6iP1+SCqwVZnCL9thCiUBflTOKkYpw6
         KOJrIwyWWnlO8GFElD+dmMjE9eT7Y5X2dFbY0kFgiuJjKayj96XRgbaKT/QIntkQqdd9
         2A6IrjtgYVMciuIBp55Br5AMKpEF4aGDsacjMqU9W5s7RTA3c2cvXwH6esSSB9BziaSb
         S09w==
X-Gm-Message-State: AOAM530LVQtpFYCTazIu0gt7ORlYb/jkwRY14/TQM2bFd1e1qr59tbtX
        46gAvd9CAC2omOyg+hEZ2w==
X-Google-Smtp-Source: ABdhPJw9GMygDyZnfEXw9k49JWUj2GYlVgzzt4Ko7/p8rxdjnplLymQ5zNFFIPHAyaQ6bZG1qZsHbQ==
X-Received: by 2002:aca:af94:: with SMTP id y142mr4549151oie.111.1589461682497;
        Thu, 14 May 2020 06:08:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l89sm757614otc.32.2020.05.14.06.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 06:08:01 -0700 (PDT)
Received: (nullmailer pid 23923 invoked by uid 1000);
        Thu, 14 May 2020 13:08:01 -0000
Date:   Thu, 14 May 2020 08:08:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     TY Chang <tychang@realtek.com>
Cc:     robh+dt@kernel.org, afaerber@suse.de, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        linux-realtek-soc@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: pinctrl: realtek: Add Realtek DHC SoC
 rtd1195 and rtd1295.
Message-ID: <20200514130801.GA23147@bogus>
References: <20200514092125.6875-1-tychang@realtek.com>
 <20200514092125.6875-5-tychang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514092125.6875-5-tychang@realtek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 14 May 2020 17:21:22 +0800, TY Chang wrote:
> Add compatible string for RTD1195 and RTD1295.
> 
> Signed-off-by: TY Chang <tychang@realtek.com>
> ---
>  .../bindings/pinctrl/realtek,rtd-pinctrl.yaml | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd-pinctrl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/pinctrl/realtek,rtd-pinctrl.example.dts:24.5-6 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/pinctrl/realtek,rtd-pinctrl.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/pinctrl/realtek,rtd-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1290046

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

