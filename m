Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B362F3DAFEA
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 01:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235185AbhG2XhM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 19:37:12 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:37381 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbhG2XhL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 19:37:11 -0400
Received: by mail-io1-f48.google.com with SMTP id r18so9273147iot.4;
        Thu, 29 Jul 2021 16:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FYMjXCYj0p0tfB8Ya9eQk25kWYa4rjV97W3dcaDO+L0=;
        b=gJo7S8klIpOU1PE617CSvH51zl3KDy8UEoeDbH6OrJcOKnvtMce/jvzZ7SSWJTr/0M
         YfE+2h8SEXnitk8kMs03N8WQMWdS0YtrfTald3s7kOIDiNnmlUsnd4BNNSN5HIBIlpIK
         jVORzDv0YrwQcYeM0+hU6xSYc4q5vhu+2mHVdN6rXq2T4Caqpn2Rr/aKEQUgb2X/u4ax
         O/UCWhHLcSquhIcg1tdkZdHc9LAS8FbbNj4wzSCg/j0QAzYo4t45ZlA/GmiYCqRs+yYL
         JlaDnn5CydWcdXOzLB1d6hvSp2oyS+hpuDUUNUhlpzBszCyRIawlN9H8h4V7u0NpqZcz
         q2lQ==
X-Gm-Message-State: AOAM532tl8lVe0e624BBfNW7JQ47aLVq8wueG4TU0yvsH4NYeCHoZYDW
        KURYbVJu3FC2E1zPybAHvg==
X-Google-Smtp-Source: ABdhPJzpBYSMtdtkgUy7KpA/xttDXHBSjSEdHjdAOESAbYOrlBvldUBW8ugRBd1lZmpS3Ff4u+7XNA==
X-Received: by 2002:a5d:87cc:: with SMTP id q12mr5998639ios.131.1627601826889;
        Thu, 29 Jul 2021 16:37:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w17sm3388415iom.20.2021.07.29.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:37:06 -0700 (PDT)
Received: (nullmailer pid 1124527 invoked by uid 1000);
        Thu, 29 Jul 2021 23:37:04 -0000
Date:   Thu, 29 Jul 2021 17:37:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Use real world values for
 drive-strength arguments
Message-ID: <YQM7oDlooIVAQZ1i@robh.at.kernel.org>
References: <20210726111941.1447057-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726111941.1447057-1-wenst@chromium.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Jul 2021 19:19:41 +0800, Chen-Yu Tsai wrote:
> The original binding submission for MT8195 pinctrl described the
> possible drive strength values in micro-amps in its description, but
> then proceeded to list register values in its device tree binding
> constraints.
> 
> However, the macros used with the Mediatek pinctrl bindings directly
> specify the drive strength in micro-amps, instead of hardware register
> values. The current driver implementation in Linux does convert the
> value from micro-amps to hardware register values. This implementation
> is also used with MT7622 and MT8183, which use real world values in
> their device trees.
> 
> Given the above, it was likely an oversight to use the raw register
> values in the binding. Correct the values in the binding. Also drop
> the description since the binding combined with its parent,
> pinctrl/pincfg.yaml, the binding is now self-describing.
> 
> Fixes: 7f7663899d94 ("dt-bindings: pinctrl: mt8195: add pinctrl file and binding document")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/pinctrl/pinctrl-mt8195.yaml          | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
