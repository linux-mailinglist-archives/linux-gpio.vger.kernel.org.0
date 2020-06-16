Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D79F1FAA81
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 09:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgFPHzI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 03:55:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:60100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbgFPHzH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 03:55:07 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2B13206D7;
        Tue, 16 Jun 2020 07:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592294107;
        bh=8FPZO3O3J5yEXOHRALaLJwubp6h2AwWSBchtYuoch88=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MkI/+np2dDimaPbgKZ2S6bxxT/H0/5Kcu+KB+40UE7gA4X81MXbwvAb+4UIfSw+i+
         YJF+ofTwhDTe1xdbZsK8RIVHZdjUn6mBzG7VFvqL0uOFjsRtQJzSC+taURiTbC9zbn
         QZdzj2cHtUF8b4PLo98a8+0YvyaMtPAqmhmdgVbI=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jl6Qz-003LKN-Dg; Tue, 16 Jun 2020 08:55:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Jun 2020 08:55:05 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org, will@kernel.org
Subject: Re: [RFC][PATCH 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
In-Reply-To: <20200616061338.109499-6-john.stultz@linaro.org>
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-6-john.stultz@linaro.org>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <0be86735238a0f8b0c25934e2ed39eee@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: john.stultz@linaro.org, linux-kernel@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, joro@8bytes.org, tglx@linutronix.de, jason@lakedaemon.net, linus.walleij@linaro.org, ilina@codeaurora.org, saravanak@google.com, tkjos@google.com, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi John,

+Will for the SMMU part.

On 2020-06-16 07:13, John Stultz wrote:
> Allow the qcom_scm driver to be loadable as a
> permenent module.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/firmware/Kconfig    | 2 +-
>  drivers/firmware/Makefile   | 3 ++-
>  drivers/firmware/qcom_scm.c | 4 ++++
>  drivers/iommu/Kconfig       | 2 ++
>  4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index fbd785dd0513..9e533a462bf4 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -236,7 +236,7 @@ config INTEL_STRATIX10_RSU
>  	  Say Y here if you want Intel RSU support.
> 
>  config QCOM_SCM
> -	bool
> +	tristate "Qcom SCM driver"
>  	depends on ARM || ARM64
>  	select RESET_CONTROLLER
> 
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 99510be9f5ed..cf24d674216b 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -17,7 +17,8 @@ obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
>  obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
>  obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
>  obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
> -obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> +obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
> +qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>  obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
>  obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
>  obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 0e7233a20f34..b5e88bf66975 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1155,6 +1155,7 @@ static const struct of_device_id 
> qcom_scm_dt_match[] = {
>  	{ .compatible = "qcom,scm" },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
> 
>  static struct platform_driver qcom_scm_driver = {
>  	.driver = {
> @@ -1170,3 +1171,6 @@ static int __init qcom_scm_init(void)
>  	return platform_driver_register(&qcom_scm_driver);
>  }
>  subsys_initcall(qcom_scm_init);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SCM driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index b510f67dfa49..714893535dd2 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
>  config ARM_SMMU
>  	tristate "ARM Ltd. System MMU (SMMU) Support"
>  	depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && 
> MMU
> +	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y

This looks a bit ugly. Could you explain why we need this at the SMMU 
level? I'd have expected the dependency to flow the other way around...

>  	select IOMMU_API
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select ARM_DMA_USE_IOMMU if ARM
> @@ -500,6 +501,7 @@ config QCOM_IOMMU
>  	# Note: iommu drivers cannot (yet?) be built as modules
>  	bool "Qualcomm IOMMU Support"
>  	depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
> +	depends on QCOM_SCM=y
>  	select IOMMU_API
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select ARM_DMA_USE_IOMMU

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
