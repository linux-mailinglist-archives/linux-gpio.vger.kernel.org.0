Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37BF345FF8
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 14:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhCWNmn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 09:42:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:51330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhCWNmS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 09:42:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BB6161931;
        Tue, 23 Mar 2021 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616506938;
        bh=pIK0Jl792OsAEIbuymZcvsOtYsmlAhpnsbWLU01/6lg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iqxFC5SbGDLebgbe8Q+SCPB7cvqsS8A4UxVdIO1fIkuN6zfVynhSsFkjQiVWUxlGs
         hFR8ZVpCtJexso7wBltkbvaoVadcFTd/5X1hS6l306fN7pdUaGmZWI4A4lBJyA4Slp
         zG5UVuEAu2T+ZCt+1PGm+q3hVNFLEqS4YOgHdN+4=
Date:   Tue, 23 Mar 2021 14:42:15 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        git@xilinx.com, saikrishna12468@gmail.com
Subject: Re: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Message-ID: <YFnwN6mqXml5xdR3@kroah.com>
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 01:55:16PM +0530, Sai Krishna Potthuri wrote:
> Adding pinctrl driver for Xilinx ZynqMP platform.
> This driver queries pin information from firmware and registers
> pin control accordingly.
> 
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> ---
>  drivers/pinctrl/Kconfig          |   13 +
>  drivers/pinctrl/Makefile         |    1 +
>  drivers/pinctrl/pinctrl-zynqmp.c | 1030 ++++++++++++++++++++++++++++++
>  3 files changed, 1044 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 815095326e2d..25d3c7208975 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -341,6 +341,19 @@ config PINCTRL_ZYNQ
>  	help
>  	  This selects the pinctrl driver for Xilinx Zynq.
>  
> +config PINCTRL_ZYNQMP
> +	bool "Pinctrl driver for Xilinx ZynqMP"

Please make this work as a module.

> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -43,6 +43,7 @@ obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
>  obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
>  obj-$(CONFIG_PINCTRL_STMFX) 	+= pinctrl-stmfx.o
>  obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
> +obj-$(CONFIG_PINCTRL_ZYNQMP)    += pinctrl-zynqmp.o

Please use a tab like the other lines in this file.

> +
> +	dev_info(&pdev->dev, "zynqmp pinctrl initialized\n");

When drivers work properly, they are quiet.  Please remove this.

thanks,

greg k-h
