Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2E32AC805
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 23:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729599AbgKIWHM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 17:07:12 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44070 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgKIWHM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 17:07:12 -0500
Received: by mail-oi1-f193.google.com with SMTP id t16so11936234oie.11;
        Mon, 09 Nov 2020 14:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4NplLP7reCOX38lHGM3FpIb2UggXOtaiRXhf6SLGOLo=;
        b=OprZhFEtO17L4P7hKyDtdY8h4Ew5HNve9KKXTvcluZwcQb6wI4288vzNSLABHFJW/B
         a+p/TscH+Wif+jNAk220aul2LwVzQKfpwBD0Geb/YULl4H6Dut2qmjGZQEbZ7ZNtj4nJ
         1jjAZgBZrsvXh7XGUgTEk6g15Wn0JGqbJOLIvBNlf09bAb26oc2wvZkM7qD29lPGzBtL
         v5Dr0L09hbLcnR+3/u115hgXObPA8Zo149LlxsmACCH/ovkUqyEKpx8YNUBii6msl5B8
         TUOG4lsTXT3Rpye8ZRlQVTv4zmuHrFocATRK14s9D4RFlSQPpp0CSfxgiKmKeQYKUpkm
         fC/A==
X-Gm-Message-State: AOAM530SbxWgal7CotSrXz7XbhpIFcDK87GtSxVwMDxEdCXtPvQdeInW
        tjHoCxl98VbMcNJP6+bEUg==
X-Google-Smtp-Source: ABdhPJyDPlTFeAl/88WFfyAw41YdRSJO7AZA3RV4dUJnr1UfWL5Jo5z4f9N5ux70F+ZrPi+HwAooPg==
X-Received: by 2002:aca:7250:: with SMTP id p77mr886934oic.130.1604959631308;
        Mon, 09 Nov 2020 14:07:11 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l1sm2812972otj.17.2020.11.09.14.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 14:07:10 -0800 (PST)
Received: (nullmailer pid 1840672 invoked by uid 1000);
        Mon, 09 Nov 2020 22:07:10 -0000
Date:   Mon, 9 Nov 2020 16:07:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SDX55 pinctrl
 bindings
Message-ID: <20201109220710.GA1840617@bogus>
References: <20201109062620.14566-1-vkoul@kernel.org>
 <20201109062620.14566-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109062620.14566-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 09 Nov 2020 11:56:19 +0530, Vinod Koul wrote:
> Add device tree binding Documentation details for Qualcomm SDX55
> pinctrl driver.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
