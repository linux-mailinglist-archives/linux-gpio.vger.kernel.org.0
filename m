Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 521E139A47
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 05:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729973AbfFHDcf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 23:32:35 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46620 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730056AbfFHDcd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 23:32:33 -0400
Received: by mail-pg1-f196.google.com with SMTP id v9so407337pgr.13
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 20:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w8yMs0A1kswOPadFYz1C2fi/C0+bcAjRjGc687sOHgM=;
        b=c7n9thBGRp2TEdtjghoVzImcNhyBb/VGwjyjCm3JbuSUilHIelfibtChp8GIaE13ag
         JNOGB+hr6YlznweL7qHBqLNQTVTGDtYKkRf2j18Y9qAdXrCG+GWCHjakZ6eG8owGdoxP
         Nn0DnoxyIjpF/fzEmh2Sq+lKuLx2brgS3c4ic3En3Eok0EDpahGBcI8woeuCmztpX+hT
         1ynX7bvjVqIZXzxE5zt7kbq8TDS/HkU1IthcxKu99GeKRkqM7xbhzN3ypBD4GyqgshNP
         hJR/Nc4drgs04AE64vN1B+FBz35vmQErDRSlXL+J5SMxFXd2xo/i0qA+X2/h6PjhUuOh
         /tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w8yMs0A1kswOPadFYz1C2fi/C0+bcAjRjGc687sOHgM=;
        b=hMJYdCg27WAatnqCovroim8sJgFXqQv8r7U88qnSgz3LMLqvy1udCPkTWo/dACLosT
         wNTx/S9xmPaqqz+cyPliRDTdwbLnspZt8HI5mrJC4Vxva6u4Na/rhXjVqyl3A9HlPfso
         a7ffODvxJ5fYfn9ROhl7UdLYtgQF4XMQLHauo149Lq3Rq6q2TzGj5CgLcidXu3nlCHOE
         Zgw2SAN1Rk0c0TEUxzCy4Clk2R8BwmgBeXqEucSdEYfhhZTrDQJB/Nq0PtT+7FZ9kdXt
         +5U4UOJvWpGO9IZSZrkN5rXngJgFYsrwRoVqYCOwVnHA1qUO4hna1/qX/BEk2E4AvvyG
         TS/Q==
X-Gm-Message-State: APjAAAX6LP+ThwnHPU7btRZU2TnqvPJyXtrHBygtuLajIO8/9KKERvJf
        p+9ADSfS4GF2w6hRGAF0BlwBWw==
X-Google-Smtp-Source: APXvYqzrB7QuXo0561fGi5AbE7OYmt8MLxD5Fo8pdCLTO0o6oJi2WGdEIJ2vz0ye4zuI2JWRQJG4IA==
X-Received: by 2002:a65:5003:: with SMTP id f3mr5749817pgo.336.1559964752104;
        Fri, 07 Jun 2019 20:32:32 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p65sm7027057pfb.146.2019.06.07.20.32.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 20:32:31 -0700 (PDT)
Date:   Fri, 7 Jun 2019 20:32:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] clk: qcom: Add ipq6018 Global Clock Controller
 support
Message-ID: <20190608033229.GE24059@builder>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-5-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559754961-26783-5-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 05 Jun 10:15 PDT 2019, Sricharan R wrote:

> This patch adds support for the global clock controller found on
> the ipq6018 based devices.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: anusha <anusharao@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

Please fix your s-o-b chain, as described in my reply to 1/8..

> ---
>  drivers/clk/qcom/Kconfig       |    9 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-ipq6018.c | 5267 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 5277 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-ipq6018.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e1ff83c..e5fb091 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -120,6 +120,15 @@ config IPQ_GCC_8074
>  	  i2c, USB, SD/eMMC, etc. Select this for the root clock
>  	  of ipq8074.
>  
> +config IPQ_GCC_6018

Please maintain sort order.

> +	tristate "IPQ6018 Global Clock Controller"
> +	depends on COMMON_CLK_QCOM
> +	help
> +	  Support for global clock controller on ipq6018 devices.
> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> +	  i2c, USB, SD/eMMC, etc. Select this for the root clock
> +	  of ipq6018.
> +
>  config MSM_GCC_8660
>  	tristate "MSM8660 Global Clock Controller"
>  	help
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index f0768fb..025137d 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
>  obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
>  obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
>  obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
> +obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o

Ditto.

>  obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
>  obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
>  obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
[..]
> +static int gcc_ipq6018_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &gcc_ipq6018_desc);
> +}
> +
> +static int gcc_ipq6018_remove(struct platform_device *pdev)
> +{
> +	return 0;

Just omit .remove from the gcc_ipq6018_driver instead of providing a
dummy function.

> +}
> +
> +static struct platform_driver gcc_ipq6018_driver = {
> +	.probe = gcc_ipq6018_probe,
> +	.remove = gcc_ipq6018_remove,
> +	.driver = {
> +		.name   = "qcom,gcc-ipq6018",
> +		.owner  = THIS_MODULE,

Don't specify .owner in platform drivers.

[..]
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. GCC IPQ6018 Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:gcc-ipq6018");

This modalias won't be used.

Regards,
Bjorn
