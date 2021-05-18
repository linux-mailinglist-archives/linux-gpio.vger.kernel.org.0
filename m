Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20166386E79
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 02:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345158AbhERAuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 20:50:54 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:34744 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235151AbhERAux (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 20:50:53 -0400
Received: by mail-ot1-f41.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso7231794ote.1;
        Mon, 17 May 2021 17:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ajl7ACpQFyzNHdoWdNKqqUVobTElm0Nzp/Lk1+Ni+0w=;
        b=fSOl3Ak94GPopFlK5GtgxsPEhUHRaxLQy23pTVxwOUqG7rtkk6ktdRIhHTWTj6xakY
         LMjRZpRKS9uCt1FvktTCRbHZ7JVA22sOG3oWIQ7Y0GYeaEd5JNFZHrtPgavxqW+JCvC4
         oTfuygXkL84S8daBMfld5eIYuaNXhY75Ppk9sUfd9kO3WRjYEAZR5lqt/KJsDJi18vHT
         WywtyKf2da5uG10mcrrt/RTA5qBGvrolGIT8bLqPh02zEhQTpICY1dHcFcSTZv6X10Yl
         q1X2tdRTaaJJawTBUlptEGOp7penFoIFiBqaf0MOrBikSXMBSSWISJajcUXSYduKcCR0
         FSHQ==
X-Gm-Message-State: AOAM531GdVfOI/4vTmGo6FyqdRjOGuScy7czW3YCkfu1h5RxJGQAuYzF
        5KgTh6+/pCLWAlKb2sl8jw==
X-Google-Smtp-Source: ABdhPJxkMV9E1ZRWhofvj90zd3Oz58ftaKwqAlR1fwPYjIjwdVt3ZV4UwH6tixzbcfHIX6hiLWLK3Q==
X-Received: by 2002:a05:6830:17d5:: with SMTP id p21mr1930362ota.318.1621298975433;
        Mon, 17 May 2021 17:49:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 9sm3077807oie.51.2021.05.17.17.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 17:49:34 -0700 (PDT)
Received: (nullmailer pid 3539257 invoked by uid 1000);
        Tue, 18 May 2021 00:49:34 -0000
Date:   Mon, 17 May 2021 19:49:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V3 2/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm7325
 support
Message-ID: <20210518004933.GA3539204@robh.at.kernel.org>
References: <1620817988-18809-1-git-send-email-skakit@codeaurora.org>
 <1620817988-18809-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620817988-18809-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 12 May 2021 16:43:07 +0530, satya priya wrote:
> Add compatible string for PM7325 pmic GPIO support to the
> Qualcomm PMIC GPIO binding.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - Placed this patch before conversion patch and updated commit text
>    to be more clear.
> 
> Changes in V3:
>  - Rebased the patch and added pm7325 as others are already present.
>    updated the commit text accordingly.
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
