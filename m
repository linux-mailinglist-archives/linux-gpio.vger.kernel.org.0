Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8ED20B5D8
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 18:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgFZQZ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 12:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgFZQZ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 12:25:58 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C104C03E979;
        Fri, 26 Jun 2020 09:25:58 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id rk21so9966949ejb.2;
        Fri, 26 Jun 2020 09:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MPO7rvkWKnvxq0BW/sOq27JB7Uw7g3nGxOsI1D2HaaM=;
        b=ek1n0mIjZqnzR/Lt0U5ndwPl4IvZwOOPBM+PVmwWbgb9FTw8sAc+mDdNz/FUgjLTz6
         +UJt00/97ldk+Nkg37lLujn9722CSbM/Wp2Sh7qM5JYQKc5bdehvRsVy0kDbMYMJVf0s
         Yvre+V2tluUbF7+fcFproCrZevtfsONs+P5y3bxvLUArUAe8W1MRHo9hxkY/VhVry4jb
         9yQ78uBXiiZAXDtRkQITzWtvn1Ci8b2siINtCBDlBvcjLE+TaFE+w6zan/OffgBbhLfg
         S8ZdNNg43xFMf3H3FfG0uOLz7AOxzhnTLfHg1/MKM9FQ5t4a6IT1QndN3mRasJ0cljdZ
         pMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MPO7rvkWKnvxq0BW/sOq27JB7Uw7g3nGxOsI1D2HaaM=;
        b=KGPZbAh0mKEkGM2nftNucG+dV2/LSFqbvkJujYmTRZE37mb3+3ogaQey7FAuk1rdyD
         eQ7/aGj3NOzgqfUMzV0jJtKGM/y7//2pfAHRxxGkwBVXwhjuYJtDfprAhhgYfGWzJeK+
         VX6efS6YXiw4aHRnWOD2n38PrBj8eZp7Sqd+Dja9fEI3P0Xm42QcF333jt04Rme/+/7U
         RTA+5eJn2A6wrJyvKjPrQUvkxNWkyeLWXZ1Dt0OmVaRjDqxnOJhAs7qFse34Z3OfV6kP
         yk1HhsCDy7V2M87dK6oKKuUKSStkXk2i0LBTbfO1VkkY4TrmY6YV3VpDFWaUrS/G53xy
         D0NA==
X-Gm-Message-State: AOAM533b3qI7hkr/gxjXdLHTDewgQQZmuju1BMMWKl4dwJa3P4EK4Wwf
        qkDZs26/e0XhH9Q7QyCwJiI=
X-Google-Smtp-Source: ABdhPJyxqwp+qrJqIXb5iXeRvVG6QmrdYqppmPzFFwLQ815uwVeqbSRGPZdfOpb+lYp2Zi0S10C9Yw==
X-Received: by 2002:a17:906:840a:: with SMTP id n10mr3152639ejx.453.1593188756720;
        Fri, 26 Jun 2020 09:25:56 -0700 (PDT)
Received: from BV030612LT ([188.24.137.55])
        by smtp.gmail.com with ESMTPSA id w8sm21193158eds.41.2020.06.26.09.25.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 09:25:56 -0700 (PDT)
Date:   Fri, 26 Jun 2020 19:25:53 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 3/3] MAINTAINERS: Add pinctrl binding entry for Actions
 Semi S500
Message-ID: <20200626162553.GC6611@BV030612LT>
References: <cover.1593112402.git.cristian.ciocaltea@gmail.com>
 <d54d1fe9d8378e7c44d19e7b366b909bf5dbb7dc.1593112402.git.cristian.ciocaltea@gmail.com>
 <EDE29F4D-CB0B-4A24-B7B4-01E2C11179A3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EDE29F4D-CB0B-4A24-B7B4-01E2C11179A3@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 26, 2020 at 12:57:15PM +0530, Manivannan Sadhasivam wrote:
> 
> 
> On 26 June 2020 1:46:20 AM IST, Cristian Ciocaltea <cristian.ciocaltea@gmail.com> wrote:
> >Add a pinctrl binding entry for Actions Semi S500.
> >
> >Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> >---
> > MAINTAINERS | 1 +
> > 1 file changed, 1 insertion(+)
> >
> >diff --git a/MAINTAINERS b/MAINTAINERS
> >index e6285c13bab0..4b9eec04c937 100644
> >--- a/MAINTAINERS
> >+++ b/MAINTAINERS
> >@@ -1519,6 +1519,7 @@
> >F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
> > F:	Documentation/devicetree/bindings/dma/owl-dma.txt
> > F:	Documentation/devicetree/bindings/i2c/i2c-owl.txt
> > F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
> >+F:	Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> 
> I think we can use wildcard now.
> 
> pinctrl/actions,*
> 
> Thanks, 
> Mani

Done, thanks!

> 
> > F:	Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
> > F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
> > F:	Documentation/devicetree/bindings/timer/actions,owl-timer.txt
> 
> -- 
> Sent from my Android device with K-9 Mail. Please excuse my brevity.
