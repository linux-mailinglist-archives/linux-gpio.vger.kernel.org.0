Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A9B3154A5
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 18:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbhBIRGq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 12:06:46 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:39472 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbhBIRGp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 12:06:45 -0500
Received: by mail-oi1-f175.google.com with SMTP id l19so7669715oih.6;
        Tue, 09 Feb 2021 09:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XpXPzWPaycvh2regG1Os+zYNENzX5S0WHLa6/lkbuqw=;
        b=L4TvbktUIRt6vNjC8jvy1v1Rk+JIDFvzaQAWNu9tCKbdGjowHr7yGSXVxi9ieaDKEz
         Wa9LbdOLZLrxVczOW/MoHeBQP5RV5KQCIFJi6FP8D1eBceB3z4Erxip1RTIhUO7MorpK
         Q286R6CfSHePr4eF0GITBkcf4JWjrC9JiC/gE3ljnWzQec2ufIT+bX0fwX8ElONA/QMg
         OwEOgSCSprQXDUBdgiGs5mzyboqDwOtb+gGBCldrXgjDXrXQNYKRBTI/VcBguNZLDKED
         gpkiZL8L2LPOEO5zK1yfh+DOWd6g0Rpl9zIfCVC7/Kl7QU+2Z25F8UBrKXrPgAAAY3Z7
         K1GA==
X-Gm-Message-State: AOAM532JlT4xkLZrlvGLfQtYbcWK4P0p2hKeT3veoDWmaaMZQ60PECnv
        T90qcfyu6pmyalaDO3BMQK4h86lb6A==
X-Google-Smtp-Source: ABdhPJyXaypdw2kMEVhknZuDzkP38KotNgqJbfvOVaO4cxf8qEY93mBHY4CQZ7JKKj2QoKl2wujM9A==
X-Received: by 2002:aca:5bc1:: with SMTP id p184mr3053388oib.155.1612890363541;
        Tue, 09 Feb 2021 09:06:03 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s26sm4444258otp.54.2021.02.09.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 09:06:01 -0800 (PST)
Received: (nullmailer pid 3942006 invoked by uid 1000);
        Tue, 09 Feb 2021 17:06:00 -0000
Date:   Tue, 9 Feb 2021 11:06:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Define common TLMM
 binding
Message-ID: <20210209170600.GA3941951@robh.at.kernel.org>
References: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 25 Jan 2021 20:26:48 -0800, Bjorn Andersson wrote:
> Several properties are shared between all TLMM bindings. By providing a
> common binding to define these properties each platform's binding can be
> reduced to just listing which of these properties should be checked for
> - or further specified.
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Dropped "phandle", as Rob pushed this to the dt-schema instead
> - Expanded the "TLMM" abbreviation
> 
>  .../bindings/pinctrl/qcom,tlmm-common.yaml    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
