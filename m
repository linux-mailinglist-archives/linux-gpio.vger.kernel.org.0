Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C792D3D432E
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jul 2021 00:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhGWWR6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 18:17:58 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:46786 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbhGWWR5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 18:17:57 -0400
Received: by mail-il1-f176.google.com with SMTP id r5so2912981ilc.13;
        Fri, 23 Jul 2021 15:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4EjJJoODvkdc6CyvJ8WnupnabiMRBiCfSTR5snkfIfA=;
        b=btmv6ifSFtNvbu9IbUJSyFHDYaJNvoHVLuUnfDidaEkNlOS26RjbOeh55GGHhE4m5p
         a9sQao2ZtOPoUZgO6NM5IlmcDE19llap7TBgB2SMMhrGfDhc/6v7eHHLggBZIyJN4eKL
         lHZ9+HDq3PIvJ4qeHD6cHPpPlpGwG9KPNz4LX465onOsp/ANJxEeTLAPaRXMZDMbHkQJ
         iqNc2LIinZQA3GN4pKqePcs5dXfuMMNt8BkvTpwWA3d0dYbDPg+VQ/fhgCgZJIgbUM6/
         pioxtwSUH6RQEX40IQFtdj4IBZbLPOcGWSykCz+mB5IXfhB3ojzjOh7zRsPzvrwMfDpK
         0p9w==
X-Gm-Message-State: AOAM531C3iQJqERAxACXHM4D7kjwBCVz3XO/FEqFUWJBvJvhACncSaen
        fQSuB0qtxund92F6eGSK0A==
X-Google-Smtp-Source: ABdhPJwcFoHfdcoop1JvGeCqIgCqWNTlquHcUuqyvVVXqNRkOG0TE2VGciMjSdTlkkuMMi9O6lEh/A==
X-Received: by 2002:a92:c5c2:: with SMTP id s2mr4981797ilt.180.1627081109494;
        Fri, 23 Jul 2021 15:58:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o8sm17107239ils.24.2021.07.23.15.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 15:58:28 -0700 (PDT)
Received: (nullmailer pid 2762026 invoked by uid 1000);
        Fri, 23 Jul 2021 22:58:26 -0000
Date:   Fri, 23 Jul 2021 16:58:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V7 1/3] dt-bindings: mfd: pm8008: Add gpio-ranges and
 spmi-gpio compatible
Message-ID: <20210723225826.GA2761969@robh.at.kernel.org>
References: <1627029074-23449-1-git-send-email-skakit@codeaurora.org>
 <1627029074-23449-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627029074-23449-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 23 Jul 2021 14:01:12 +0530, satya priya wrote:
> Add gpio-ranges and "qcom,spmi-gpio" compatible to match with the
> parent qcom,pmic-gpio.yaml binding.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V7:
>  - This is newly added in V7 to resolve below error.
>  dtschema/dtc warnings/errors:
>  /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: compatible: ['qcom,pm8008-gpio'] is too short
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>  /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: 'gpio-ranges' is a required property
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> 
>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
