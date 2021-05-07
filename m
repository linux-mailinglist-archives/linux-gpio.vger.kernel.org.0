Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501FD376B49
	for <lists+linux-gpio@lfdr.de>; Fri,  7 May 2021 22:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhEGUtN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 May 2021 16:49:13 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:42605 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhEGUtM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 May 2021 16:49:12 -0400
Received: by mail-oi1-f182.google.com with SMTP id v24so9869663oiv.9;
        Fri, 07 May 2021 13:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HU+cc6QB3f1fPnYktuf5XnUl4ynjpynUl2t6lVOEa5M=;
        b=l8/bcf+nK5g9EqOijMPA3yCTADX9MILg7fwXx6ihYpiQlOA8WXm99jE9hhC68vKkF9
         JThrckHorJbhR0p3BCq/sk7/3lQWiRhG5RWC9TVQTHqqCdn81CVExA7/uOa7RQm8rErW
         f7F7ansFG2cgZHzwuN84xhMphFaRmvHuVQ6g/83VapxiMRGPeNjTYMsbbD9HOXJ20Go3
         JjEmhd1hg0dkJcZQj2+TU2wT7HdcaKnsI8ktQ+OlP0F4u4624xn51ljFAOfvnV/qh2Qt
         wyWDat2iO1zgHFqmOZvw6POC4lxzFR1jAuQYBQMVw93Sih92vkyOwQtAVAVKGl/Y7mzt
         N9zA==
X-Gm-Message-State: AOAM531T3fcYmWOfiMYsrE42a7SgQZ2EUiM18IATAvh1ZOsTZCS4UxTz
        FSxhomytY5f6isj3qHy9wU71lSZXvg==
X-Google-Smtp-Source: ABdhPJxsDYwiJwIh4yaHta4SS11PTmwCu05WiwyrFfAqWHDIsc+5n85jx0lFK7+D6RTXRfkE0h1OeQ==
X-Received: by 2002:aca:c30f:: with SMTP id t15mr8519964oif.145.1620420491792;
        Fri, 07 May 2021 13:48:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z6sm246025oiz.39.2021.05.07.13.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 13:48:10 -0700 (PDT)
Received: (nullmailer pid 2856423 invoked by uid 1000);
        Fri, 07 May 2021 20:48:09 -0000
Date:   Fri, 7 May 2021 15:48:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     cl@rock-chips.com, jay.xu@rock-chips.com,
        linux-arm-kernel@lists.infradead.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, zhangqing@rock-chips.com,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        huangtao@rock-chips.com, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, david.wu@rock-chips.com,
        robh+dt@kernel.org, shawn.lin@rock-chips.com, heiko@sntech.de
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: convert rk3328-grf-gpio.txt to
 YAML
Message-ID: <20210507204809.GA2856332@robh.at.kernel.org>
References: <20210505134028.13431-1-jbx6244@gmail.com>
 <20210505134028.13431-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505134028.13431-2-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 05 May 2021 15:40:25 +0200, Johan Jonker wrote:
> Current dts files with RK3328 GRF 'gpio' nodes are manually verified.
> In order to automate this process rk3328-grf-gpio.txt has to be
> converted to YAML.
> 
> Rename 'grf-gpio' nodename to 'gpio'.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/gpio/rockchip,rk3328-grf-gpio.txt     | 32 --------------
>  .../bindings/gpio/rockchip,rk3328-grf-gpio.yaml    | 51 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
