Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856C93FCF54
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 23:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234412AbhHaVxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 17:53:55 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:38466 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhHaVxy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 17:53:54 -0400
Received: by mail-ot1-f46.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso1025023ots.5;
        Tue, 31 Aug 2021 14:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zwk6nIr7M6qjVtVA+MSr+QucaA8ZgDpKt75V4TKIZ2Q=;
        b=VFmgxXZ8RqsF4XrxTkRkqvBrZ17QmFGErbkV0gy9AYE6RbpM3yWxvU2s3aBymkZ6Vf
         M56qQBBO8dFGkpbtpJXEZoIp4NjbFNLb2cMgAuViKChQiAHIbhpRefkKJmbgvkhNMwhG
         Toh1V709JpZmW9CCF+mrSE35WNLpwgcmES+xLDnNEGy6BTmFY7p8DLuuaM6GShbHgCoe
         WLVa/59og6TH+4IBWnSNIjynTCufBecfLk/LpnzYKdTzxumedfpQkq5+FFQ11E8fds+5
         YRPquz/P8bpvcLhwq/kBSvKK5/vfSVjDvgPPQvLRjtXGSmP7Q3yel1uVDCFJuwTBr8qH
         MNIQ==
X-Gm-Message-State: AOAM531TP5ZdiBr6EHBv0hrBum0b/E/dK8msFIZGCzCj518y+Tk8LYsw
        Da6o9392Q/YsqRJiseGVcw==
X-Google-Smtp-Source: ABdhPJzlcnvClbVJAarCbSLNcm1UiifqSWfuZqXJYXWQs5GxTafXiTcX4//TkI4WIWJA8Hk/DWA/AQ==
X-Received: by 2002:a05:6830:1d69:: with SMTP id l9mr25848571oti.154.1630446778727;
        Tue, 31 Aug 2021 14:52:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id be5sm2046064oib.10.2021.08.31.14.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 14:52:57 -0700 (PDT)
Received: (nullmailer pid 708691 invoked by uid 1000);
        Tue, 31 Aug 2021 21:52:56 -0000
Date:   Tue, 31 Aug 2021 16:52:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        jamipkettunen@somainline.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SM6350 pinctrl
 bindings
Message-ID: <YS6kuPIanj2e7KkS@robh.at.kernel.org>
References: <20210828172315.55742-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828172315.55742-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 28 Aug 2021 19:23:13 +0200, Konrad Dybcio wrote:
> Add device tree binding Documentation details for Qualcomm SM6350
> pinctrl driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v2:
> - Tweak the regex to match gpio0-gpio157
> 
>  .../bindings/pinctrl/qcom,sm6350-pinctrl.yaml | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
