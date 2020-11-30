Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F812C9310
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgK3XuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:50:17 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:42421 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgK3XuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:50:17 -0500
Received: by mail-il1-f195.google.com with SMTP id f5so13108564ilj.9;
        Mon, 30 Nov 2020 15:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J6EbXhsW5fN3yBjCyVEPyIx477gV7aMbZdAD7syPooI=;
        b=f72pb1MNJHCI9pHCgoy5TsNqLukXh+sOc83oa5f4xONVskDwIfokQbLZyt454Ps4ji
         ynuZYOS3h5alN1DyJftVjwT4vSmH5EXnn0F5vJopfwpV4/pucw3LuJvcCkd+vl/GowSZ
         brUkYcGiR1siDQPxVG4cJDggWiQhl3dmPG11OGjNhiY8i/BmyYua6FmA3PIvlaNHNEId
         8ohwW15D9IXv69WTts+WIUpeuSr6jCXH6zE0LqzWA6SNrR8SiMzP30WFy4fpauLR47ok
         6KwlRi9sa7Tyoz/p6JMCVmiEoU4C1uJc7cCWvlz3fMnnSy7X1AXNIm8yY3MVrMeeG3wo
         +s8g==
X-Gm-Message-State: AOAM533qFHIQWwx5RZEs1+LOO5j0q5qubbJ9ApweSseTaz/yluIEOdb8
        2VtEIiEcsH1f+hVL3W/hLw==
X-Google-Smtp-Source: ABdhPJzceB7Yz7DZ84DfuUCkRNhl1H+v/ITUy2z4Ug1NcuaWTnuN5GNLzaPQjWsxpMmSOOIHBupfJw==
X-Received: by 2002:a92:d38e:: with SMTP id o14mr143903ilo.59.1606780176352;
        Mon, 30 Nov 2020 15:49:36 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k15sm63625ils.87.2020.11.30.15.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 15:49:35 -0800 (PST)
Received: (nullmailer pid 3277325 invoked by uid 1000);
        Mon, 30 Nov 2020 23:49:32 -0000
Date:   Mon, 30 Nov 2020 16:49:32 -0700
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi
 pinctrl bindings
Message-ID: <20201130234932.GA3277243@robh.at.kernel.org>
References: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
 <20201116143432.15809-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116143432.15809-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 16 Nov 2020 14:34:31 +0000, Srinivas Kandagatla wrote:
> Add device tree binding Documentation details for Qualcomm SM8250
> LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
