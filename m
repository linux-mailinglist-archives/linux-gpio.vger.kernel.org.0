Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF99A3B35C1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 20:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhFXSce (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 14:32:34 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:40764 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbhFXSc1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 14:32:27 -0400
Received: by mail-io1-f53.google.com with SMTP id r12so9461609ioa.7;
        Thu, 24 Jun 2021 11:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N0G6ilA7dVREtDoZc6dY5LMaWm93UIO096LNTjkIjUY=;
        b=Xwwl1w5MQ2ybAy0FyxsqkTuO/C9axfAITLh+I9PnugiZFyU4CN+LIpMfzlK0DMRXJo
         Du5Gimb5wgrY3v0RUXWxOcI6vs03i6MyHIRHu7xGbWiEGtCwMbr05Elcwnq9ZVmj1m8K
         kVJe7MRCykyukR3eFn7cxIEtQoP8SoJaRHWpVXpmwUKNfoOZNbfzqXSUTHxDGyXuhbgl
         b4l08Rdeoqv1s7vZpOPJAP3Oez1EaeiBUb++bu6tFBDLHDeX/y9XzS57PpzCSphk1rnu
         nkljIh4WV135EELu7O74oLrTYuHIrsqCEr5zqNiFCXzbf95WL6rKhTWw6APrkwWIrdPK
         eOQQ==
X-Gm-Message-State: AOAM532XcYwa1MwggQu3dI+begyFL8mZ1ifphF7nhWTI4JwLVTmUWfdy
        z2NtlXpmKkFqOGtMbeFloQ==
X-Google-Smtp-Source: ABdhPJxPT0YnkliWRfRNtKT8GfUaQFZh1HlciM8usKxfxVUGuN0ur8P1dVgQwhBDw1Gj5GqD3qxkdw==
X-Received: by 2002:a05:6638:22b8:: with SMTP id z24mr5803245jas.45.1624559407452;
        Thu, 24 Jun 2021 11:30:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k3sm1910660ilv.83.2021.06.24.11.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 11:30:06 -0700 (PDT)
Received: (nullmailer pid 1766658 invoked by uid 1000);
        Thu, 24 Jun 2021 18:30:02 -0000
Date:   Thu, 24 Jun 2021 12:30:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     sandberg@mailfence.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, andy.shevchenko@gmail.com,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, drew@beagleboard.org,
        devicetree@vger.kernel.org, geert+renesas@glider.be
Subject: Re: [PATCH v5 1/2] dt-bindings: gpio-cascade: add documentation
Message-ID: <20210624183002.GA1766624@robh.at.kernel.org>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210621172053.107045-1-maukka@ext.kapsi.fi>
 <20210621172053.107045-2-maukka@ext.kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621172053.107045-2-maukka@ext.kapsi.fi>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 21 Jun 2021 20:20:52 +0300, Mauri Sandberg wrote:
> Add documentation for a general GPIO cascade. It allows building
> one-to-many cascades of GPIO lines using multiplexer to choose
> the cascaded line.
> 
> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> ---
> v4 -> v5:
>  - renamed gpio-mux-input -> gpio-cascade
>  - changed vague term 'pin' to 'upstream line'
>  - added more verbose description for the module
>  - added missing 'mux-controls' entry
>  - dropped Tested-by and Reviewed-by due to changes in bindings
> v3 -> v4:
>  - Changed author email
>  - Included Tested-by and Reviewed-by from Drew
> v2 -> v3: added a complete example on dual 4-way multiplexer
> v1 -> v2: added a little bit more text in the binding documenation
> ---
>  .../bindings/gpio/gpio-cascade.yaml           | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-cascade.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
