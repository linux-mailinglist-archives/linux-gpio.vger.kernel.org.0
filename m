Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732D6262186
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 22:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730179AbgIHUyy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 16:54:54 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36700 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgIHUyx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 16:54:53 -0400
Received: by mail-io1-f66.google.com with SMTP id d190so871705iof.3;
        Tue, 08 Sep 2020 13:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TAfTU+qJ3BFt0wPmSMTsikEhkhFnp28t/4mY2C5m4ks=;
        b=reYMpUzxLRlTOwEtdI/nz/9Hg8vfKj0OCMGufcxQkWvxPIWB1gKYjf+Hh/buZUHdEb
         RUh4F3tn4jlt+YkBY6By+CANnEJ47g2SuOAHhpQPcrlbVM5yS3Xfzx3nhrNgrPbc1+cX
         rqx390lyBZ/aeu81n2Tn3sjq5KLlaGkASauQfKH1THjSa7WZFO/dnqQzZopWzE5i7/nW
         1sXxaXOZq7CE9tk2V1iBt9nmBxBItBjo3V7PAfL2e1/BW/3J1hFMEu80TBUKXj5k36ws
         l+E4BzQ66p+lO/qDO2IXd87yMXQxRST6t6ajh3g1Ud409u5v/pDI/zUQRAECnJA8dnh7
         hblA==
X-Gm-Message-State: AOAM532ONASeYBVYmU3hpNtjMsgL80nmWSm0MliOmBmsTqKR1Y/7y5oP
        gr1BWORJUdn9DEmt7chHsA==
X-Google-Smtp-Source: ABdhPJz8tPhrbce/2/W7SICVXUb+Dxim4VKGv7E0diU+q2TOwJRxn+wJzzhwISJjnxN0n8orxMpIag==
X-Received: by 2002:a02:bb8d:: with SMTP id g13mr903244jan.21.1599598491950;
        Tue, 08 Sep 2020 13:54:51 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id i14sm200394ilb.28.2020.09.08.13.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 13:54:51 -0700 (PDT)
Received: (nullmailer pid 902907 invoked by uid 1000);
        Tue, 08 Sep 2020 20:54:50 -0000
Date:   Tue, 8 Sep 2020 14:54:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: rza1: Convert to json-schema
Message-ID: <20200908205450.GA902850@bogus>
References: <20200821111956.4989-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821111956.4989-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 21 Aug 2020 13:19:56 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas RZ/A1 combined Pin and GPIO controller Device Tree
> binding documentation to json-schema.
> 
> Rename "rza1-pinctrl" to "rza1-ports", to match the compatible value
> scheme.
> Use "pinctrl" generic node name.
> Drop generic and consumer examples, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Note: "phandle: true" is needed because dt-schema does not add it
>       automatically to subnodes.
> 
> This depends on "[PATCH] pinctrl: rza1: Switch to using "output-enable".
> To be queued in sh-pfc for v5.10.
> ---
>  .../bindings/pinctrl/renesas,rza1-pinctrl.txt | 222 ------------------
>  .../bindings/pinctrl/renesas,rza1-ports.yaml  | 190 +++++++++++++++
>  2 files changed, 190 insertions(+), 222 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
