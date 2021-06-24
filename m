Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EDC3B3894
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 23:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbhFXVZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 17:25:44 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:38576 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbhFXVZo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 17:25:44 -0400
Received: by mail-io1-f46.google.com with SMTP id k11so10072702ioa.5;
        Thu, 24 Jun 2021 14:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l4eP7w08I/YN9mtyDDTIo5X0P7LXWGlKzk8WA8+Mxh4=;
        b=rjXYU/djoIg3Xbbc9YvZLJPxp1kNrAobQ/dw+OfO4GEvquVnKrehn+8W83h1K/Aeg5
         fUNE68s5VNfE/OQ73PXE9ZBuUvVt1MyncMDfPc+yBZrHw1b/xlXKZ5xt795xhKjRBdRv
         l9m/zlw15qcYR3RPtZWE3kRo/+WFvGEqep5qU69S1yYrmH74Qo520+3YeM0jmdeDhxtz
         GP5WLRWVNH900zdcln4QaOSwpBAdDLXOKKw71EINno4Vm2glGeBUXdyigg3PGXqqkLbO
         gLAoJJmx7XFHdt4EJmEbCvYUJzk8HOTsbThlytnmV8U6lz7G0QMn2FvzkFTl5qrDC2pL
         o8qA==
X-Gm-Message-State: AOAM533G6eTNCFFhC7uPdGmMOa7nZXmgkBAhUfLUUU2BBkYz2u042onq
        5Lkm+wXA8pJ5bpPkAxfQGA==
X-Google-Smtp-Source: ABdhPJwqC7zbMaLi3mDjSWJLi6hfdu1+N+J8pjJOGBLe4VflmwmsBWYMVtZWr7H8oS2TXzUXZQQ/1g==
X-Received: by 2002:a6b:7004:: with SMTP id l4mr5930514ioc.68.1624569803534;
        Thu, 24 Jun 2021 14:23:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a18sm2241435ilc.31.2021.06.24.14.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:23:22 -0700 (PDT)
Received: (nullmailer pid 2009655 invoked by uid 1000);
        Thu, 24 Jun 2021 21:23:19 -0000
Date:   Thu, 24 Jun 2021 15:23:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     bhupesh.linux@gmail.com, lgirdwood@gmail.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: regulator: qcom,rpmh-regulator:
 Arrange compatibles alphabetically
Message-ID: <20210624212319.GA2009605@robh.at.kernel.org>
References: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
 <20210617051712.345372-2-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617051712.345372-2-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 17 Jun 2021 10:47:08 +0530, Bhupesh Sharma wrote:
> Arrange the compatibles inside qcom-rpmh regulator device tree
> bindings alphabetically.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../bindings/regulator/qcom,rpmh-regulator.yaml  | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
