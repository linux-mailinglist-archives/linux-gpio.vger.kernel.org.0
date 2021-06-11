Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9653A39E4
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 04:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhFKCvS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 22:51:18 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:36540 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbhFKCvR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 22:51:17 -0400
Received: by mail-oi1-f179.google.com with SMTP id r16so4027690oiw.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 19:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ET0Wo9pMUsI9hBiKex+wY6Ul5+CPxPf28986pbN/EI8=;
        b=Iseiym3XfDQgP5PW7eJN1GwuNhwtjrkNSyfsk2d62Gjx6tZlaIQBmsm5i4cidk+odv
         e16sKIQ7BwJOk2C4LEALXoIAxEjHgGi62G0yRCUotsSccwggOlHDSkweK+zPSVp6O+/9
         gNnhRuw0jWJgwnE67tYQGX+sq2Ei2FoYKop4iMuR0ZURcFhtMK90C8H8fN1wVhdV7Vm7
         aiFbBiZFSsTqU0vS9vST8xfcTR3QkeIqdU1yEJf1NqmZjiZXIB2ue1EXxFCVbZ+GQkq+
         d9Ze2RSacRNjcGo6V9XjIlO82Bo4tPP9iluGBiZKJCYJfLYtUyrF74r18DHSyhxAeHPF
         gqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ET0Wo9pMUsI9hBiKex+wY6Ul5+CPxPf28986pbN/EI8=;
        b=hO/0g3yLZeu/0mBW8mj8rpZ+ouoJmzKV6MEtiFVPWFTXGb2uvH3tC4cxb2/P2Hqt4t
         kxciKtNXoXvVLF90d3WMB0ZsjbN5ewBgGaUt2dIojINUmtBPMInI9A5oalibqVWkxfSF
         TOpFxd/J22rWBrbLp694krJ8Ugz9nNcAewTHnUFQ2xE1PQjwCQr9qMD+q+l8kagyoKGt
         alyXTguvi+x2dVORPkF0IDX6SDPGAz5pT9+cZFvpAbhtW2cZkTlYCh2IMu0I8Q0tZxR1
         pkCdOTXzEcTngf2KCpEnm0+AOkdJnWP7Md5iyvLu5g6Rd5cHIaB4wQu4lhpB1jtpvI3U
         whyg==
X-Gm-Message-State: AOAM533AsMR/JAaLFdRFRp96uHsvLbwAjdxO4G0NTM29GMhyYFX8I2Qx
        RtXH7xM0ET4focNsAfdXMApHiQ==
X-Google-Smtp-Source: ABdhPJz04W/K9tQFYJrLbGW31b3a6sL0JI96PcarTWMMiRhX4hwe2np+7ggxBmcFSUfQkfxWI4JNNA==
X-Received: by 2002:a05:6808:999:: with SMTP id a25mr938976oic.123.1623379689633;
        Thu, 10 Jun 2021 19:48:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a74sm929046oib.21.2021.06.10.19.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:48:09 -0700 (PDT)
Date:   Thu, 10 Jun 2021 21:48:07 -0500
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
Subject: Re: [PATCH 1/8] dt-bindings: qcom: rpmh-regulator: Add compatible
 for SA8155p-adp board pmics
Message-ID: <YMLO56Rr7UGUy8vo@builder.lan>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-2-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607113840.15435-2-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:

> Add compatible strings for pmm8155au_1 and pmm8155au_2 pmics
> found on SA8155p-adp board.
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
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index e561a5b941e4..ea5cd71aa0c7 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -55,6 +55,8 @@ properties:
>        - qcom,pm8009-1-rpmh-regulators
>        - qcom,pm8150-rpmh-regulators
>        - qcom,pm8150l-rpmh-regulators
> +      - qcom,pmm8155au-1-rpmh-regulators
> +      - qcom,pmm8155au-2-rpmh-regulators

Looking at the component documentation and the schematics I think the
component is "PMM8155AU" and we have two of them.

Unless I'm mistaken we should have the compatible describe the single
component and we should have DT describe the fact that we have 2 of
them.

Regards,
Bjorn

>        - qcom,pm8350-rpmh-regulators
>        - qcom,pm8350c-rpmh-regulators
>        - qcom,pm8998-rpmh-regulators
> -- 
> 2.31.1
> 
