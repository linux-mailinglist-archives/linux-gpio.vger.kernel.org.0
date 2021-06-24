Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACCD3B379D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 22:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbhFXUNn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 16:13:43 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:33666 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbhFXUNn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 16:13:43 -0400
Received: by mail-io1-f45.google.com with SMTP id a6so9885337ioe.0;
        Thu, 24 Jun 2021 13:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S9irpCnuj1ZxG7TlFe7Eh6Y0jfUyNIBwZnYE8DiyvqU=;
        b=nz8JxyZIJdhnkxFTCz63RbZMK+WQTv/lwOp2U3JMvhLiZNyBsCLv1QBNA3+wDmoYJv
         NSljCHcMiHfkhiZaMi3NMfr4EUHyx/F3caHk2lvt2droGD9p4Rj0fik/TdNAGS7xjby5
         mR75v4FeEvKFT6+6AX2iiYn+avUGgNvUFfAshmQak0ywdTkOFDcbOhe1FipExJdw4ceg
         5ilLCn9LCy6Rtd+9wNadQKz3Dwut0CaExk7aoeWWypgSmbsgweMTEdlD6/Yr2IssOtbD
         0DFNyWD7s57W5bYyHC+QNXX/jVe6o3ugMb0akH1eg/VC4iLYEFAti7nsk1HjsTLS9LqW
         5txA==
X-Gm-Message-State: AOAM530dnoWkkj/7PbarmzK4aVgDO2kUHJf6k3XeUuCcq4oa+HEmsm8w
        EE6yLgD+alL/VCIiTP8F4OciJLwk/g==
X-Google-Smtp-Source: ABdhPJyXmKDgOwuseRMR7wsWDhzG+o9xoMFIcJHgRJ2CRkwT3ZBOp4K08i0OO8HA5azAlDTA+hTrsw==
X-Received: by 2002:a02:5b45:: with SMTP id g66mr6351558jab.62.1624565483419;
        Thu, 24 Jun 2021 13:11:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p25sm2086831ioj.18.2021.06.24.13.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:11:22 -0700 (PDT)
Received: (nullmailer pid 1911579 invoked by uid 1000);
        Thu, 24 Jun 2021 20:11:18 -0000
Date:   Thu, 24 Jun 2021 14:11:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        angelogioacchino.delregno@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, marijn.suijten@somainline.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add bindings for
 MDM9607
Message-ID: <20210624201118.GA1911377@robh.at.kernel.org>
References: <20210624191743.617073-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624191743.617073-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 24 Jun 2021 21:17:40 +0200, Konrad Dybcio wrote:
> Document the newly added MDM9607 pinctrl driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v3:
> - Use the correct compatible in the example
> 
>  .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
