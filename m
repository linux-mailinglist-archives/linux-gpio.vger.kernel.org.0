Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68FF93A39FE
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 05:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFKDCF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 23:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhFKDCD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 23:02:03 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD37C061574
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 19:59:51 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id l15-20020a05683016cfb02903fca0eacd15so1783590otr.7
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 19:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9elBhRYRohBJLYXGAbC8/QtueNh7yhzWwdc2SlWJcOU=;
        b=vegh8wsiAC+x1bVv8y3kjhUeGWh9t2LfpIXlFUh1fR7KFxkonHV4/EpbnYFyNJG7A/
         2S3+EdWpeDLbwZLpyPxeVdyla/rZijDPnQIK69FHteGtdP3mQv43s391Q7DJX1aiOLac
         S1YTiMwgrKzdu5xgDfcYnkdKSwKxPq5UmWtUV2LnVwBnYbhKlOaJReXdtkFp/f3UVGGd
         LJHHoiWY08rqK+q1ymjI0WbynAP/P0fCynmb+h/S5hdQ0WiRCf5nvZwkZnsgzcRzTtXq
         TnS9tECmSNSatPkOpPoNWoWUyIXw0ft+6kJIHOE3Pyfr3QHrMJKkI6IBeFULSnJ7MxKY
         baIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9elBhRYRohBJLYXGAbC8/QtueNh7yhzWwdc2SlWJcOU=;
        b=oFd1GZSLL8BoR9iWNabJqBE811fU/eS0FR5Zx+xWXGBqLgevp6W54PasQn8uK1n7IS
         CxPWg4W9PDj2V6mYaxlQIx3XKh8E6UtpsjfQAl5P6UIYoepVVLnlz6UNo3ElTA47gHpp
         H5yt2VRF7/fZfSl56JS3zx5bXq89M515SGoHcl2PDVPBpy43BzdMpM9yIrDjVhcWhPCD
         985eiHx61jUw58l2EMAvZ9QxTYuXgLkc1CSzBiDdBs95sx8jlckZT18oRT8OPeZlDLkk
         fmzjNTxl4Jk8mrvJ6RZfXi7uRnPqRGbN0/sj30C8B7/ggFY9QJdhrKfXVaR+4Sj5M0/A
         ucRA==
X-Gm-Message-State: AOAM530Ufz9VYsU/RWtM9flxftPw+amfOdMbGx57KvklNteeNgW+7gJD
        53YFxKQBsuetoILdhKZojdBgQg==
X-Google-Smtp-Source: ABdhPJzuDFfl+YeXo+oLDAV43WO+1r+i1ImfP2DWcxPkaviwdYfSnI2fhWMMdjGvSkOQ5LWpEaFxOw==
X-Received: by 2002:a9d:526:: with SMTP id 35mr1159467otw.176.1623380391091;
        Thu, 10 Jun 2021 19:59:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 7sm991454oti.30.2021.06.10.19.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:59:50 -0700 (PDT)
Date:   Thu, 10 Jun 2021 21:59:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 3/8] dt-bindings: arm: qcom: Add compatible for
 SA8155p-adp board
Message-ID: <YMLRpLoc7LiegLp/@builder.lan>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-4-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607113840.15435-4-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:

> SA8155p-adp board is based on Qualcomm Snapdragon sm8150
> SoC.
> 
> Add support for the same.

The SA8155p is similar to SM8150 and we can reuse most things, but I
think we can afford to add qcom,sa8155p in the DT bindings.

> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: bhupesh.linux@gmail.com
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 9b27e991bddc..b5897f1f9695 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -42,11 +42,13 @@ description: |
>          sdm660
>          sdm845
>          sdx55
> +        sm8150

Naturally sm8150 should be part of this list, but please also add
sa8155p as well.

>          sm8250
>          sm8350
>  
>    The 'board' element must be one of the following strings:
>  
> +        adp
>          cdp
>          cp01-c1
>          dragonboard
> @@ -198,6 +200,12 @@ properties:
>                - qcom,ipq6018-cp01-c1
>            - const: qcom,ipq6018
>  
> +      - items:
> +          - enum:
> +              - qcom,sa8155p-adp
> +              - qcom,sm8150-mtp
> +          - const: qcom,sm8150

And please split this in two (one qcom,sm8150-mtp and qcom,sm8150, and
one qcom,sa8155p-adp and qcom,sa8155p).

And note that this is saying that your compatible needs to be one of the
enum entries, followed by the const, but in your dts you only specified
qcom,sa8155p-adp. It needs to be:

	compatible = "qcom,sa8155p-adp", "qcom,sa8155p";

Thanks,
Bjorn

> +
>        - items:
>            - enum:
>                - qcom,qrb5165-rb5
> -- 
> 2.31.1
> 
