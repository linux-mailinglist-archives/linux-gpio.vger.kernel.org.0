Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1FCE5606
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 23:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfJYVia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 17:38:30 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34691 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfJYVia (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 17:38:30 -0400
Received: by mail-oi1-f194.google.com with SMTP id 83so2580563oii.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2019 14:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AJg4z4K6dKxVgKfiKrGLtK6h9eZ9S7nIhf+xHWhd+KI=;
        b=ZLu/tgT0LpAye8ILfCW1a21D5MsM5sc+eUmfYfPaH2lqPwXcPHx3HezamSR+4igiXJ
         yeL/Rle+ftppmMVLabdI+Bw6czt9KZDuIz/OEYnqy+UKKOXVVJBFpt5uenaq49ARnDXL
         P+7FB671WNjD/IhsxuQ0YK8Z1was1LqMSouHSSs2NHY7/iEuuGNyuYmFK9QjS6JRyyOe
         iW3tMM59mkQQ8+7jGhbQ97TmPH+o43Vql2AJGdn43toXQmDSoe+z52V2wmYbUPvnrQwm
         UXPjEVV9qkPF9HMfMzLVkKsVjSb8CLfTvGQ5Kp0PbCZQeaZsDuFFripSwoQmt75VLSNF
         qmjQ==
X-Gm-Message-State: APjAAAUDKT4yNLemOh506bHNnLZ6ob84gzYdxclInCx7fkaQj4vsqLXI
        7rqYasaypPxU+WOBpYofIg==
X-Google-Smtp-Source: APXvYqyKKYeDsz6d6MNdmrfb3ZN68gpOWy77zXJ2XZq2BotysCtHUYhMQnG5QT0oNOeKsX0d+R1ZrQ==
X-Received: by 2002:aca:5691:: with SMTP id k139mr4909601oib.54.1572039509694;
        Fri, 25 Oct 2019 14:38:29 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k24sm894477oic.29.2019.10.25.14.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:38:29 -0700 (PDT)
Date:   Fri, 25 Oct 2019 16:38:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     linus.walleij@linaro.org, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Convert Allwinner Pin
 Controller to a schema
Message-ID: <20191025213828.GA30637@bogus>
References: <20191022160806.42971-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022160806.42971-1-mripard@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 22 Oct 2019 18:08:06 +0200, Maxime Ripard wrote:
> The Allwinner SoCs have a pin controller supported in Linux, with a
> matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Changes from v1:
>   - Add a description for the interrupts
>   - Put limits on the number of input-debounce items
>   - Remove the vcc-p.-supply type
>   - Fix the supplies description
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 243 ++++++++++++++++++
>  .../pinctrl/allwinner,sunxi-pinctrl.txt       | 164 ------------
>  2 files changed, 243 insertions(+), 164 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
