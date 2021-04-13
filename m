Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1880F35E3EC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 18:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344641AbhDMQ2g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 12:28:36 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:34583 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343767AbhDMQ2f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Apr 2021 12:28:35 -0400
Received: by mail-ot1-f54.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so16649397otn.1;
        Tue, 13 Apr 2021 09:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kTyqwHKevP2lNEtSd5dIRQCfq7ju4vpN7xE34QdHfaQ=;
        b=seSZYFyfFLWujo2QOzJIbQwIEX3+svdKkARkCNgQKEIpP3pc8emtWI9QWqCEwbRehw
         9dOKCIxgKUA/8mstVapD7W4WtBNSTMSzicIINserq9ofW9xtTpa17xr7IWI/GoZpjVMr
         nXo2hFwDqj68KdI9wbT+PXbn9aIOVluS4hcglx7t1SXd2HwkFiNri5F8cwie4jtxtPzI
         q16FXPQzeteTsbpQToTHLb14Z545AHlZzcp8wcD7k4mgTHt6js7ADN7H+7W5a/tv5yYs
         BHS0fvKmCGaM41BsQ+nyYP+U70CMattwQFmh5ZS8Xw0jd6kpEaFdmwpOFG1X8Hc2wOsT
         mKAA==
X-Gm-Message-State: AOAM53058QapnY6p7KdbnjKvdGlEcPboeJj986SgynFotqHdSazNyt4m
        Bp/5Z1stc0rPRYoGXgdT6w==
X-Google-Smtp-Source: ABdhPJyuhSbIJv4mUx+VH8jFty9shbSGOZfCO+oWHjTzq9L1UnUytrV0gle+6BF73Pu8io7WqR9vsg==
X-Received: by 2002:a05:6830:309d:: with SMTP id f29mr28655901ots.225.1618331295206;
        Tue, 13 Apr 2021 09:28:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y10sm3469681oto.18.2021.04.13.09.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:28:13 -0700 (PDT)
Received: (nullmailer pid 1785793 invoked by uid 1000);
        Tue, 13 Apr 2021 16:28:12 -0000
Date:   Tue, 13 Apr 2021 11:28:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     sean.wang@mediatek.com, sean.wang@kernel.org, hui.liu@mediatek.com,
        mark.rutland@arm.com, eddie.huang@mediatek.com,
        linux-mediatek@lists.infradead.org, linus.walleij@linaro.org,
        biao.huang@mediatek.com, hongzhou.yang@mediatek.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, jg_poxu@mediatek.com,
        matthias.bgg@gmail.com
Subject: Re: [PATCH v4 1/4] dt-bindings: pinctrl: mt8195: add pinctrl file
 and binding document
Message-ID: <20210413162812.GA1785746@robh.at.kernel.org>
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
 <20210413055702.27535-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413055702.27535-2-zhiyong.tao@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 13 Apr 2021 13:56:59 +0800, Zhiyong Tao wrote:
> 1. This patch adds pinctrl file for mt8195.
> 2. This patch adds mt8195 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 151 +++
>  include/dt-bindings/pinctrl/mt8195-pinfunc.h  | 962 ++++++++++++++++++
>  2 files changed, 1113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
