Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D54A0413B41
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 22:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234802AbhIUUYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 16:24:52 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:36746 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhIUUYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 16:24:51 -0400
Received: by mail-ot1-f48.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so250498otx.3;
        Tue, 21 Sep 2021 13:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eAPlaFllVauSFXh1QwSW2AiMtJcGPxVfXAMwNAaKx/w=;
        b=yLfg5yBlfg+Wm93QjzOJ6Q1pKz/TFPlrQuGaOy2mdwSkoad2tnMAnJQ6WY0XWa/vZz
         iAnRLLkf1jfXeCekSc7MSYN7U/O6qrmbuU+p2prZBkLbKjpixc6zdFlB0SBJ8C7nGHkv
         QptHDMtst6lSp5Mrp5r/T5K6DyZ0tahrgeyz9k5V4aZ9232QbZPj2N45JBVepR46Ar88
         VgChcQABX3uB0+Prs/GMfl9r8GDjiN2dFmmN+wmncJGV9FhAIZfVpIXueM8t4o94wxWf
         RK0ZS4+cb446EgXtVswUl5kuBkVCWMWxtyEy3AysoAjy9r9m1gi2UWmnYrIXPsxSN5NG
         FhMA==
X-Gm-Message-State: AOAM533ddwi7f/YBY5XFnWvp4pRShtLIYmOCAguXjZVsvSw873c+4uRy
        6rhVDHdG2kgSNCEGso54xQ==
X-Google-Smtp-Source: ABdhPJwlCzT76A2X71MUUHuBQHrdQeBr9zZo6I0T3GGGu8t0KhUopsg+GWBWrkBZGY5Tfh7Vwamwcw==
X-Received: by 2002:a9d:7759:: with SMTP id t25mr27689033otl.245.1632255802377;
        Tue, 21 Sep 2021 13:23:22 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id i25sm9958otf.31.2021.09.21.13.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:23:21 -0700 (PDT)
Received: (nullmailer pid 3268058 invoked by uid 1000);
        Tue, 21 Sep 2021 20:23:19 -0000
Date:   Tue, 21 Sep 2021 15:23:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add
 output-{enable,disable} properties
Message-ID: <YUo/N4Y3drE63+6n@robh.at.kernel.org>
References: <1631588246-4811-1-git-send-email-quic_subbaram@quicinc.com>
 <1631588246-4811-2-git-send-email-quic_subbaram@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631588246-4811-2-git-send-email-quic_subbaram@quicinc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 13 Sep 2021 19:57:25 -0700, Subbaraman Narayanamurthy wrote:
> Add support for the pinconf DT property output-enable, output-disable
> so that output can be enabled/disabled.
> 
> Signed-off-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
