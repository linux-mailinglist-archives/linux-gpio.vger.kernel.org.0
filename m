Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C270C3A481B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 19:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFKRx1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 13:53:27 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:38684 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhFKRx1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 13:53:27 -0400
Received: by mail-il1-f176.google.com with SMTP id d1so5932977ils.5;
        Fri, 11 Jun 2021 10:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RX+Bo0UgzAD8/UduQU4KpeKnISuzqk/KemxgYpudb3k=;
        b=alpXF5S5FyP1BWI24iYXiMtwDIY/Vbtl93/1KLUQm1DckhOlqrSI4VPDc07BsLus1c
         3K59bTIBkBgRSHO860R7pfyzxJDR8wMJ6B09kO27E8+fvH/2e15YB6b87kPu1pnDFJ69
         8FsPnCcJ/K5UBlmTmEk+NHvN+60hjr725T1f6fiqBDECxM8+1/Wuk4oz+k1iTo2E7N55
         6Jo8nOtToarb+71//16UhzL/zWUg3pdgWYeeBFQMwsrqnBEkSlDTB0A9qgmzx3BK+QTw
         RKuz0yL+Lcz6ezzaJv2TfVXqizwiDq1MsmXObVTRaYi3NretguynA/K9M2aDSZtE36lW
         GtSQ==
X-Gm-Message-State: AOAM531nRhlnldNCE/xjEp6PnAXwmFETiXRQml6bFmMUAnDTIwarDXps
        92jTQc1ceupfggH9k97ZEw==
X-Google-Smtp-Source: ABdhPJxCied/k4BThdR+HC99YI0jGRP2DvkwyF58PVXdOppBAgwbn+K5zT8fVwRgMKjKZ0/kiXJGEQ==
X-Received: by 2002:a05:6e02:13a9:: with SMTP id h9mr4003108ilo.96.1623433888805;
        Fri, 11 Jun 2021 10:51:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id h7sm3626330ilr.44.2021.06.11.10.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 10:51:27 -0700 (PDT)
Received: (nullmailer pid 1202361 invoked by uid 1000);
        Fri, 11 Jun 2021 17:51:25 -0000
Date:   Fri, 11 Jun 2021 11:51:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        marijn.suijten@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        linux-gpio@vger.kernel.org, martin.botka@somainline.org,
        Linus Walleij <linus.walleij@linaro.org>,
        jamipkettunen@somainline.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add bindings for
 MDM9607
Message-ID: <20210611175125.GA1202120@robh.at.kernel.org>
References: <20210611091615.15309-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611091615.15309-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 11 Jun 2021 11:16:13 +0200, Konrad Dybcio wrote:
> Document the newly added MDM9607 pinctrl driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - Change the compatible to qcom,mdm9607-tlmm
> 
>  .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
