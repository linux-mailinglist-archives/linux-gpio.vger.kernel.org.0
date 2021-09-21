Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F2E413D2E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 23:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbhIUWA4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 18:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235654AbhIUWA4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 18:00:56 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B968C061756
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 14:59:27 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so565409ota.6
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 14:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ERZn09RzvY8rn9MTPmUjdnDe5Cvx6gD06HefJz6Y3b4=;
        b=SQFXCpc7vgjKtuYXKBRS76J6eM5IhO65sgVlBujADSM3DO4deLw0qaTSiT3daTesCl
         Kb76k0R3Wcx9gZCg+FH/2kzDk11VMaHp+RWx6SI7ie8e/9iKbleiIqeqn13orm1Z1zf3
         Zz3LfkO17f2uagRueFDiZW7wqVjyRKCAd+itSe+OZuFBByEB83+m4U/sqrN/KeZhLq7Z
         qk7iyk828b25Wgd6Y/EZJfd6sK5RAePlMqxXOCA025/Q1NEr/CLov0z3XhP+cCQdwCZf
         rh7nOQRFbQ48/EFetpE2tXvA4mmFK3yzGOPomy9anWMKtUpKaJ7/NO7Bi1E/4krwK7Qu
         mQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ERZn09RzvY8rn9MTPmUjdnDe5Cvx6gD06HefJz6Y3b4=;
        b=0J1XH6R8/DKW7Ig2RfTCDUb2IrVB82oJJD+z6HP4jprKyutwhqsWg1jgzFfqpQY8cS
         Gg1qAJ40IHejJ+IzLyF7TyD9LU0S6ggmnBQU862sbu7SNL5ydG4q5Iwfb9VSh9MLnSji
         UZuKgSnNNAxDT7Xm/JXnszKT430TRI+Emz+JyxIKm8ydRIrUIRjhSSMLBKl+Igd4IMS4
         ZwRw9eWyHcKJkq1+COjr2d6cHqUmmjHTVtbq0hP0KCosf3J0ekb0W1aXlwsSsLTj9PjJ
         JiBPx1ZA9wkRkSakPILHBsbJ4KxHxXtZs+wJaBLp1CBkHfKWZuT1+S72jX8LmlGsKdyA
         YtAg==
X-Gm-Message-State: AOAM532pirUoLqOGDQvsiRPxlnb1bZ/T1asr9G75diGhjUzDLyXld7CL
        fvJTvuAQRi7JkKCZx9aKrVKH9w==
X-Google-Smtp-Source: ABdhPJxmVxfbRCUjhNToAtcJMU5kjhsgQITrJ1T/7CkH3AvdQJofm2nbdZgkn8AGULg+tYI4vAlW/w==
X-Received: by 2002:a9d:192c:: with SMTP id j44mr8721188ota.302.1632261566430;
        Tue, 21 Sep 2021 14:59:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n15sm62070oic.25.2021.09.21.14.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:59:26 -0700 (PDT)
Date:   Tue, 21 Sep 2021 16:59:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl
 bindings
Message-ID: <YUpVvB3zNMaiV78I@builder.lan>
References: <20210914074542.12957-1-shawn.guo@linaro.org>
 <20210914074542.12957-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914074542.12957-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 14 Sep 02:45 CDT 2021, Shawn Guo wrote:

> Add device tree bindings for QCM2290 pinctrl.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../pinctrl/qcom,qcm2290-pinctrl.yaml         | 186 ++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
> 
[..]
> +'$defs':
> +  qcom-qcm2290-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-2])$"

^gpio([0-9]|[1-9][0-9]|1[0-1][0-9]|12[0-6])$

To make it cover the entire gpio space.

The rest looks good!

Regards,
Bjorn
