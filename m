Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65932A8D32
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 03:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgKFCxG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 21:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgKFCxF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 21:53:05 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34D0C0613D3
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 18:53:03 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id z16so36853otq.6
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 18:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w5gyVNPAQV8fE07qikdc7Uz5NrIkxAU4YvY0bEkoFoc=;
        b=kOdbxy39tWu17mWpdxjnH8mt2OR+ySce1YqJCYWZbc6lYBKoouQkq+mG7TUtzmrKV6
         BRDiQxGllLq3J1w3PKM1niPwVviRugy+gNrEK5rilU1G3pC1zlg2HCrU4Gxz8gf/Q9Dr
         9W90CZQvhYi6lIwXd+/T5twdu7v/XHSzqboXu1QODDwo9Eze9n2jn6cwnv1HIZNfBDKO
         rCy4e8PgQnKM6RyIYNZMrboqX5RUhiqbkYfcq1UJ9FQ9vToF+F8hdMRtzPgIVhvBzX+D
         KJS3MqWVpDxkgGV6XMppTskqQIiXi5z/opmQ3uEu3ii0IEjlUWuvvqblGcnbWOglKb2z
         XITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5gyVNPAQV8fE07qikdc7Uz5NrIkxAU4YvY0bEkoFoc=;
        b=sAfhZjcDzCg/bJsPQHn9/T2z2952TwJfXRw2Of++EzYQysyVsBaszMpjJm19PPRt5g
         ag2nYVYZXW80NFeqqHP5xHE3Md56DAP9zvKFiBpceIJx3LK2j5uouXdubGvd3NvSJan8
         QUfwB7bpKTCeTwBGzDpefHC6nvcyvSsuV9KjtM4GJG3CQWkmbZxt+zvWEqbEwJh4EjEk
         JdWNVuYHYDSmIOmIe2P15EwdiJ4/2qJ+bAnTRnyPlW1rUl2kgHzZm4BWU15OCaN7Xvq3
         fpPvgtymEd7CRtW/adEI2RbyXJHB9lBqIRgSu5woAaDPcdaw2BTwUmVF+XIyufkrXrsX
         NUWQ==
X-Gm-Message-State: AOAM530hxXpRdGZw24OWO2PyEz/8oT4LgktoeloP1BqcMyzd+3iKOnOQ
        fniyUBdI5MfIywoakZQEsg852A==
X-Google-Smtp-Source: ABdhPJx4WtQ8qUnEyCIAaDL7B8afU3mTLirbPlR80S0ycKg8QdDiALtkmN3OfIBqsGnxFWuUD176DQ==
X-Received: by 2002:a05:6830:150d:: with SMTP id k13mr3534693otp.26.1604631183136;
        Thu, 05 Nov 2020 18:53:03 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k13sm821445ooi.41.2020.11.05.18.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 18:53:02 -0800 (PST)
Date:   Thu, 5 Nov 2020 20:53:00 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 1/2] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
Message-ID: <20201106025300.GB807@yoga>
References: <20201031003845.41137-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031003845.41137-1-john.stultz@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 30 Oct 19:38 CDT 2020, John Stultz wrote:

> Tweaks to allow pinctrl-msm code to be loadable as a module.
> 
> This is needed in order to support having the qcom-scm driver,
> which pinctrl-msm calls into, configured as a module.
> 
> This requires that we tweak Kconfigs selecting PINCTRL_MSM to
> also depend on QCOM_SCM || QCOM_SCM=n so that we match the
> module setting of QCOM_SCM.
> 
> Unlike the previous revision of this patch:
>   https://lore.kernel.org/lkml/20200625001039.56174-5-john.stultz@linaro.org/
> this version reworks PINCTRL_MSM to be a visible option and
> instead of having the various SoC specific drivers select
> PINCTRL_MSM, this switches those configs to depend on
> PINCTRL_MSM. This avoids adding the oddish looking:
>   "depend on QCOM_SCM || QCOM_SCM=n"
> to every SoC specific driver, as that becomes a maintenance
> headache.
> 
> We also add PINCTRL_MSM to the arm64 defconfig to avoid
> surprises as otherwise PINCTRL_MSM/IPQ* options previously
> enabled, will be off.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2:
> * Module description and whitespace fixes suggested by Bjorn
> * Added QCOM_SCM || QCOM_SCM=n bits on Kconfigs selecting
>   PINCTRL_MSM. Reported by both Todd and Bjorn.
> v3:
> * Make sure the QCOM_SCM || QCOM_SCM=n trick is commented
> v4:
> * Rework "select PINCTRL_MSM" to "depends on PINCTRL_MSM"
>   to consolidate the QCOM_SCM dependency.
> v5:
> * Add PINCTRL_MSM to arm64 defconfig
> ---
>  arch/arm64/configs/defconfig       |  1 +
>  drivers/pinctrl/qcom/Kconfig       | 49 +++++++++++++++---------------
>  drivers/pinctrl/qcom/pinctrl-msm.c |  2 ++
>  3 files changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 17a2df6a263e8..45768828fdb8e 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -483,6 +483,7 @@ CONFIG_PINCTRL_IMX8MP=y
>  CONFIG_PINCTRL_IMX8MQ=y
>  CONFIG_PINCTRL_IMX8QXP=y
>  CONFIG_PINCTRL_IMX8DXL=y
> +CONFIG_PINCTRL_MSM=y
>  CONFIG_PINCTRL_IPQ8074=y
>  CONFIG_PINCTRL_IPQ6018=y
>  CONFIG_PINCTRL_MSM8916=y
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 5fe7b8aaf69d8..8bb786ed152dd 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -2,7 +2,8 @@
>  if (ARCH_QCOM || COMPILE_TEST)
>  
>  config PINCTRL_MSM
> -	bool
> +	tristate "Qualcomm core pin controller driver"
> +	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> @@ -13,7 +14,7 @@ config PINCTRL_MSM
>  config PINCTRL_APQ8064
>  	tristate "Qualcomm APQ8064 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm APQ8064 platform.
> @@ -21,7 +22,7 @@ config PINCTRL_APQ8064
>  config PINCTRL_APQ8084
>  	tristate "Qualcomm APQ8084 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm APQ8084 platform.
> @@ -29,7 +30,7 @@ config PINCTRL_APQ8084
>  config PINCTRL_IPQ4019
>  	tristate "Qualcomm IPQ4019 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm IPQ4019 platform.
> @@ -37,7 +38,7 @@ config PINCTRL_IPQ4019
>  config PINCTRL_IPQ8064
>  	tristate "Qualcomm IPQ8064 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm IPQ8064 platform.
> @@ -45,7 +46,7 @@ config PINCTRL_IPQ8064
>  config PINCTRL_IPQ8074
>  	tristate "Qualcomm Technologies, Inc. IPQ8074 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
>  	  the Qualcomm Technologies Inc. TLMM block found on the
> @@ -55,7 +56,7 @@ config PINCTRL_IPQ8074
>  config PINCTRL_IPQ6018
>  	tristate "Qualcomm Technologies, Inc. IPQ6018 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
>  	  the Qualcomm Technologies Inc. TLMM block found on the
> @@ -65,7 +66,7 @@ config PINCTRL_IPQ6018
>  config PINCTRL_MSM8226
>  	tristate "Qualcomm 8226 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
> @@ -74,7 +75,7 @@ config PINCTRL_MSM8226
>  config PINCTRL_MSM8660
>  	tristate "Qualcomm 8660 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm 8660 platform.
> @@ -82,7 +83,7 @@ config PINCTRL_MSM8660
>  config PINCTRL_MSM8960
>  	tristate "Qualcomm 8960 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm 8960 platform.
> @@ -90,7 +91,7 @@ config PINCTRL_MSM8960
>  config PINCTRL_MDM9615
>  	tristate "Qualcomm 9615 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm 9615 platform.
> @@ -98,7 +99,7 @@ config PINCTRL_MDM9615
>  config PINCTRL_MSM8X74
>  	tristate "Qualcomm 8x74 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm 8974 platform.
> @@ -106,7 +107,7 @@ config PINCTRL_MSM8X74
>  config PINCTRL_MSM8916
>  	tristate "Qualcomm 8916 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found on the Qualcomm 8916 platform.
> @@ -114,7 +115,7 @@ config PINCTRL_MSM8916
>  config PINCTRL_MSM8976
>  	tristate "Qualcomm 8976 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found on the Qualcomm MSM8976 platform.
> @@ -124,7 +125,7 @@ config PINCTRL_MSM8976
>  config PINCTRL_MSM8994
>  	tristate "Qualcomm 8994 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm 8994 platform. The
> @@ -133,7 +134,7 @@ config PINCTRL_MSM8994
>  config PINCTRL_MSM8996
>  	tristate "Qualcomm MSM8996 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm MSM8996 platform.
> @@ -141,7 +142,7 @@ config PINCTRL_MSM8996
>  config PINCTRL_MSM8998
>  	tristate "Qualcomm MSM8998 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm MSM8998 platform.
> @@ -149,7 +150,7 @@ config PINCTRL_MSM8998
>  config PINCTRL_QCS404
>  	tristate "Qualcomm QCS404 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  TLMM block found in the Qualcomm QCS404 platform.
> @@ -157,7 +158,7 @@ config PINCTRL_QCS404
>  config PINCTRL_QDF2XXX
>  	tristate "Qualcomm Technologies QDF2xxx pin controller driver"
>  	depends on GPIOLIB && ACPI
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the GPIO driver for the TLMM block found on the
>  	  Qualcomm Technologies QDF2xxx SOCs.
> @@ -194,7 +195,7 @@ config PINCTRL_QCOM_SSBI_PMIC
>  config PINCTRL_SC7180
>  	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
> @@ -203,7 +204,7 @@ config PINCTRL_SC7180
>  config PINCTRL_SDM660
>  	tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
> @@ -212,7 +213,7 @@ config PINCTRL_SDM660
>  config PINCTRL_SDM845
>  	tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
>  	depends on GPIOLIB && (OF || ACPI)
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
> @@ -221,7 +222,7 @@ config PINCTRL_SDM845
>  config PINCTRL_SM8150
>  	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
> @@ -230,7 +231,7 @@ config PINCTRL_SM8150
>  config PINCTRL_SM8250
>  	tristate "Qualcomm Technologies Inc SM8250 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index c4bcda90aac4a..988343ac49b92 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1443,3 +1443,5 @@ int msm_pinctrl_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL(msm_pinctrl_remove);
>  
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. TLMM driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
