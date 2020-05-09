Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F381CC26C
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 17:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgEIPdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 11:33:19 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:50868 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727092AbgEIPdT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 9 May 2020 11:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JgmA1XKh2hvtQmy33sPmh16aTHMDwUxJXCit/7l1/68=; b=Y1MBgsdLckmFXnnOd2KWaSLqct
        LeKw5X/AfbnevefC7rR3qIDml7EQDBp09/kaBW1OWVfDP1gUGUMkPKPmPyebhQdqMrujHBkNvj5sA
        jZ0p8yz+rIC1tIPu8+9LduuLqtDDwsokuurXwnoSwI+jVfTi4JH+H5Ak2P7oS94U0dZ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jXRTX-001W1U-DD; Sat, 09 May 2020 17:33:15 +0200
Date:   Sat, 9 May 2020 17:33:15 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     u-boot@linux.nxdi.nxp.com, jiafei.pan@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 2/3] armv8: gpio: add gpio feature
Message-ID: <20200509153315.GR208718@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509103956.26038-3-hui.song_1@nxp.com>
 <20200509103956.26038-2-hui.song_1@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 09, 2020 at 06:39:55PM +0800, Hui Song wrote:
> From: "hui.song" <hui.song_1@nxp.com>
> 
> add one struct mpc8xxx_gpio_plat to enable gpio feature.
> 
> Signed-off-by: hui.song <hui.song_1@nxp.com>
> ---
>  .../include/asm/arch-fsl-layerscape/gpio.h    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 arch/arm/include/asm/arch-fsl-layerscape/gpio.h
> 
> diff --git a/arch/arm/include/asm/arch-fsl-layerscape/gpio.h b/arch/arm/include/asm/arch-fsl-layerscape/gpio.h
> new file mode 100644
> index 0000000000..d8dd750a72
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-fsl-layerscape/gpio.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2014 Freescale Semiconductor, Inc.
> + */
> +
> +/*
> + * Dummy header file to enable CONFIG_OF_CONTROL.
> + * If CONFIG_OF_CONTROL is enabled, lib/fdtdec.c is compiled.
> + * It includes <asm/arch/gpio.h> via <asm/gpio.h>, so those SoCs that enable
> + * OF_CONTROL must have arch/gpio.h.
> + */

This does not seem right. You would expect each sub arch to have a
subdirectory in arch/arm/include/asm/ when in fact none do.

	     Andrew
