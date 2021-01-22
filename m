Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF833004C1
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 15:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbhAVOCS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 09:02:18 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:36816 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbhAVOBd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 09:01:33 -0500
Received: by mail-ot1-f47.google.com with SMTP id v21so5126506otj.3;
        Fri, 22 Jan 2021 06:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=J/tUZzvykoZkd9JJt583sreD3ebEWjT4q0KMk8iAjqs=;
        b=Kjc73uMaGJexrOckRL21e/BN2964KNcur3G+WcffjVJYY9CsxqG5y3QEZl+WwmPslZ
         S6kkA8v63pvh6eFqJyL1eH9WJXL5pJ92XriDAg1ssvGfjW6wgarm/hOh240w+TR3QrD6
         Y3LY7DGks6IJJqPl3lBqPXvLcS2XBqQijDmJj6fXrC5BYgErOy2G9spGX8Y2pf0RrVcw
         Tvwu8yTX1mBN76PJ9TxfgyOhEE6dt3U27Hdt2j07zd1bEvhjwO/KgPdcwUr7hIL/PqDH
         AgaFd+SeTSpVbmcpN8ncvGZJLrToRDZR5LXL4kIfvERwpDVB3d+cxV7kWSbQASa8SakW
         HcqQ==
X-Gm-Message-State: AOAM533IQW12rdEmvScMQuIFffXHATI5/T7pd1aZXnFy+ONWTEUKiJT+
        334PfX4YRiAvvG2dkOSwJcB2msXZwg==
X-Google-Smtp-Source: ABdhPJzhQuF9hbFB1akXwm17GIM4g4G+p+4YUHPYtMeU07fuzkJuP792ZqPdxjpJE/sSEs8J9neF2g==
X-Received: by 2002:a05:6830:1614:: with SMTP id g20mr3330366otr.77.1611324052392;
        Fri, 22 Jan 2021 06:00:52 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s123sm566256oos.3.2021.01.22.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 06:00:51 -0800 (PST)
Received: (nullmailer pid 674371 invoked by uid 1000);
        Fri, 22 Jan 2021 14:00:45 -0000
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20210121171747.3161543-2-vkoul@kernel.org>
References: <20210121171747.3161543-1-vkoul@kernel.org> <20210121171747.3161543-2-vkoul@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl bindings
Date:   Fri, 22 Jan 2021 08:00:45 -0600
Message-Id: <1611324045.680277.674370.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Jan 2021 22:47:46 +0530, Vinod Koul wrote:
> Add device tree binding Documentation details for Qualcomm SM8350
> pinctrl driver.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/qcom,tlmm-common.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/qcom,tlmm-common.yaml'
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1429976

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

