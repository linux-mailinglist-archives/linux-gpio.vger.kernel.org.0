Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AFB1CC25F
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 17:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgEIPYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 11:24:11 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:50854 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727092AbgEIPYL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 9 May 2020 11:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=DxMBxCTCZ7e8xucmtxia3JjQpAhXwTssvS4Ui38O4Ro=; b=xesHzv1t0P3roD+z20qiny9ZCj
        VVrO6R+X7EsZyyQ2pW3vBHG/N6TxU6ui9qxR4MOgLt1wnfPhy6VG6xkO3HOjUhIrE4NEBRdtOL708
        E0TbvHVBXmh+e2IDDll8KYFQPoYwinLHvt3m+h8KCnUVwS5obMQWgo2XtOdITW51c0hI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jXRKd-001Vxd-Gw; Sat, 09 May 2020 17:24:03 +0200
Date:   Sat, 9 May 2020 17:24:03 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     u-boot@linux.nxdi.nxp.com, jiafei.pan@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/3] gpio: mpc8xxx: support fsl-layerscape platform.
Message-ID: <20200509152403.GQ208718@lunn.ch>
References: <20200509103956.26038-1-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509103956.26038-1-hui.song_1@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 09, 2020 at 06:39:54PM +0800, Hui Song wrote:
> From: "hui.song" <hui.song_1@nxp.com>
> 
> Make the MPC8XXX gpio driver to support the fsl-layerscape.
> 
> Signed-off-by: hui.song <hui.song_1@nxp.com>
> ---
>  drivers/gpio/mpc8xxx_gpio.c | 59 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/gpio/mpc8xxx_gpio.c b/drivers/gpio/mpc8xxx_gpio.c
> index 1dfd22522c..466f5f50cf 100644
> --- a/drivers/gpio/mpc8xxx_gpio.c
> +++ b/drivers/gpio/mpc8xxx_gpio.c
> @@ -12,6 +12,8 @@
>  #include <dm.h>
>  #include <mapmem.h>
>  #include <asm/gpio.h>
> +#include <asm/io.h>
> +#include <dm/of_access.h>
>  
>  struct ccsr_gpio {
>  	u32	gpdir;
> @@ -20,6 +22,7 @@ struct ccsr_gpio {
>  	u32	gpier;
>  	u32	gpimr;
>  	u32	gpicr;
> +	u32	gpibe;
>  };
>  
>  struct mpc8xxx_gpio_data {
> @@ -49,31 +52,51 @@ inline u32 gpio_mask(uint gpio)
>  
>  static inline u32 mpc8xxx_gpio_get_val(struct ccsr_gpio *base, u32 mask)
>  {
> +#if CONFIG_ARM
> +	return in_le32(&base->gpdat) & mask;
> +#else
>  	return in_be32(&base->gpdat) & mask;
> +#endif
>  }

Hi Hui

Did the hardware engineers really change the endinness of the
register? Forget about the CPU here, did the register change
endinness? In general, you should not need to use #if like this, so
long as the register itself is still the same. There are functions
which will do the correct thing depending on if the CPU is big or
little endian.

> @@ -147,13 +183,29 @@ static int mpc8xxx_gpio_ofdata_to_platdata(struct udevice *dev)
>  {
>  	struct mpc8xxx_gpio_plat *plat = dev_get_platdata(dev);
>  	fdt_addr_t addr;
> +	u32 i;
> +#if CONFIG_ARM
> +	u32 reg[4];
> +
> +	dev_read_u32_array(dev, "reg", reg, 4);
> +#else
>  	u32 reg[2];
>  
>  	dev_read_u32_array(dev, "reg", reg, 2);
> +#endif
> +
> +#if CONFIG_ARM
> +	for (i = 0; i < 2; i++)
> +		reg[i] = be32_to_cpu(reg[i]);
> +#endif
>  	addr = dev_translate_address(dev, reg);
>  
>  	plat->addr = addr;
> +#if CONFIG_ARM
> +	plat->size = reg[3];
> +#else
>  	plat->size = reg[1];
> +#endif
>  	plat->ngpios = dev_read_u32_default(dev, "ngpios", 32);

So you are extending the DT binding. You need to document this. And it
should really have a different compatible string, since the binding is
not compatible between the two variants.
>  
>  	return 0;
> @@ -187,6 +239,7 @@ static int mpc8xxx_gpio_platdata_to_priv(struct udevice *dev)
>  static int mpc8xxx_gpio_probe(struct udevice *dev)
>  {
>  	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
> +	struct device_node const  *np = dev->node.np;
>  	struct mpc8xxx_gpio_data *data = dev_get_priv(dev);
>  	char name[32], *str;
>  
> @@ -198,6 +251,12 @@ static int mpc8xxx_gpio_probe(struct udevice *dev)
>  	if (!str)
>  		return -ENOMEM;
>  
> +	if (of_device_is_compatible(np, "fsl,qoriq-gpio", NULL, NULL)) {
> +		unsigned long gpibe = data->addr + sizeof(struct ccsr_gpio);
> +
> +		out_be32(gpibe, 0xffffffff);

That is an odd way to determine the address of a register.

     Andrew
