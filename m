Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586ED45F6B8
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 23:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242605AbhKZWHL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 17:07:11 -0500
Received: from mail-il1-f180.google.com ([209.85.166.180]:35819 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242791AbhKZWFK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 17:05:10 -0500
Received: by mail-il1-f180.google.com with SMTP id 15so1301935ilq.2;
        Fri, 26 Nov 2021 14:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U7pqWisj6jJ5TjISWm7FuFwz6JZmQrfbLJ0Krc3qwoQ=;
        b=6TkcbgVqeEwZV9rb2ffPFtfQSyQB2gvQRNEyR/pHceN3TVwFgClT+NXv05rDyHV+PM
         SQ45Ikig4Xfo1zr5SiLChcA0c5c/0WWToCPKXNubqy9v/CAUNOqwIlp6R8sbNr2q7LHl
         uDUVkGedF4DBRYsNzb/pAz5sjZNJWulCPkW2sVsq8TpR5crGh6qWxKKMIjvE6lQS72nb
         NO99IYGIE4iJRsufXg13RLCkbC5VEoRx7xUIyj17bb274FPqXZDkugr7MO8rEm55UEve
         uszr/cQW44zD2f8nVswlEHHwkg9Y3xjrCBeL0WbsyU2iXUpUUBLpIWkXPgYM/2SBCWVl
         jxhg==
X-Gm-Message-State: AOAM530gYn7JJNKxjjZrQqQfTIzlacX6okkmYbBSQnBvlv+GY99i6moP
        BFls8RhRQjAnc/8D4g+yRA==
X-Google-Smtp-Source: ABdhPJybx68U174Eaha9BUWMvTEppJV0mtTc/A29ZFmkJSy95RayV1OjBHFQ4cZ9gxqQF4ChAq/L9A==
X-Received: by 2002:a05:6e02:484:: with SMTP id b4mr34984883ils.173.1637964116491;
        Fri, 26 Nov 2021 14:01:56 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y4sm4469705ilv.21.2021.11.26.14.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 14:01:55 -0800 (PST)
Received: (nullmailer pid 3352231 invoked by uid 1000);
        Fri, 26 Nov 2021 22:01:51 -0000
Date:   Fri, 26 Nov 2021 15:01:51 -0700
From:   Rob Herring <robh@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SDX65 pinctrl
 bindings
Message-ID: <YaFZTxDcTMqeA/42@robh.at.kernel.org>
References: <cover.1637048107.git.quic_vamslank@quicinc.com>
 <06234768890dc7572226f23d432e5a69a4d5b305.1637048107.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06234768890dc7572226f23d432e5a69a4d5b305.1637048107.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 15, 2021 at 11:39:45PM -0800, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add device tree binding Documentation details for Qualcomm SDX65
> pinctrl driver.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml  | 195 ++++++++++++++++++
>  1 file changed, 195 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml

This fails dt_binding_check:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.example.dt.yaml: pinctrl@f100000: 'serial-pins', 'uart-w-subnodes-state' do not match any of the regexes: '$-state', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml

The DT list was not Cc'ed so checks never ran nor was this reviewed.

Rob

