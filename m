Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD6BF2C6A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 11:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388465AbfKGKcY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 05:32:24 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15568 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387796AbfKGKcY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 05:32:24 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dc3f27a0000>; Thu, 07 Nov 2019 02:31:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 07 Nov 2019 02:32:22 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 07 Nov 2019 02:32:22 -0800
Received: from [10.26.11.187] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 7 Nov
 2019 10:32:18 +0000
Subject: Re: [PATCH v4 2/2] gpio: Add xgs-iproc driver
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20191024202703.8017-1-chris.packham@alliedtelesis.co.nz>
 <20191024202703.8017-3-chris.packham@alliedtelesis.co.nz>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a2d82f20-a559-c3b9-f7b1-0e488b75f7e6@nvidia.com>
Date:   Thu, 7 Nov 2019 10:32:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024202703.8017-3-chris.packham@alliedtelesis.co.nz>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1573122682; bh=vlL4FFSlaCHxygpXvqXKdAedbg7/9JjZ1VuXUKB8qfk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=mBe+dGi/qz/+XmLSgjEIzPi7Og1wAUH/XpvopBVOPmTg5gh5D4dYoMvfz8Jx4VO0V
         guHbznWjjesTmS7pG121QnpKssxnqiAAKHzIBb0BR5yETCZCbHwbNToTxJ7WwMwJQS
         0ulnXw/Ov0riCTDiL2b2ei/2JlrXcicxsxvtQINsdfWVO+ZW64+IakoFivdtpUzgKR
         Ul5QCCi7cOOMKI8RtTB+qZEBcriRNZdU/2CKhD8TB/O3vRbgIQ2DgzqO+goLV7E9DY
         YiDWUBr0RdaqSqr+TCK8xdoXlSYa/Pp70rWx9uogtsNgFp3eZsrnrtNGO3aEgXhFFO
         U9uElbUOrbHhg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 24/10/2019 21:27, Chris Packham wrote:
> This driver supports the Chip Common A GPIO controller present on a
> number of Broadcom switch ASICs with integrated SoCs. The controller is
> similar to the pinctrl-nsp-gpio and pinctrl-iproc-gpio blocks but
> different enough that a separate driver is required.
> 
> This has been ported from Broadcom's XLDK 5.0.3 retaining only the CCA
> support (pinctrl-iproc-gpio covers CCB).
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v4:
>     - rename the config option to GPIO_BCM_XGS_IPROC and place alphabetically
>     - sort #includes alphabetically
>     
>     Changes in v3:
>     - prefix local #defines with 'IPROC'
>     - use {readl,writel}_relaxed
>     - remove unnecessary headers
>     - actually use spinlock to guard hardware accesses
>     
>     Changes in v2:
>     - use more of the generic infrastructure for gpio chips
>     - handling the root interrupt is still done manually due to sharing with uart0.
> 
>  drivers/gpio/Kconfig          |   9 +
>  drivers/gpio/Makefile         |   1 +
>  drivers/gpio/gpio-xgs-iproc.c | 321 ++++++++++++++++++++++++++++++++++
>  3 files changed, 331 insertions(+)
>  create mode 100644 drivers/gpio/gpio-xgs-iproc.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 38e096e6925f..04396787fbb0 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -147,6 +147,15 @@ config GPIO_BCM_KONA
>  	help
>  	  Turn on GPIO support for Broadcom "Kona" chips.
>  
> +config GPIO_BCM_XGS_IPROC
> +	tristate "BRCM XGS iProc GPIO support"
> +	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
> +	select GPIO_GENERIC
> +	select GPIOLIB_IRQCHIP
> +	default ARCH_BCM_IPROC
> +	help
> +	  Say yes here to enable GPIO support for Broadcom XGS iProc SoCs.
> +
>  config GPIO_BRCMSTB
>  	tristate "BRCMSTB GPIO support"
>  	default y if (ARCH_BRCMSTB || BMIPS_GENERIC)
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index d2fd19c15bae..8725d158a964 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
>  obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
>  obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
>  obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
> +obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+= gpio-xgs-iproc.o
>  obj-$(CONFIG_GPIO_BD70528)		+= gpio-bd70528.o
>  obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
>  obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
> diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
> new file mode 100644
> index 000000000000..a3fdd95cc9e6
> --- /dev/null
> +++ b/drivers/gpio/gpio-xgs-iproc.c

...

> +static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst = {
> +	{ .compatible = "brcm,iproc-gpio-cca" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, bcm_iproc_gpio_of_match);

This patch is generating the following warning when built as a module ...

MODPOST vmlinux.o
WARNING: vmlinux.o(.data+0x834d0): Section mismatch in reference from the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gpio_of_match
The variable bcm_iproc_gpio_driver references
the variable __initconst bcm_iproc_gpio_of_match
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console


This then leads to the following crash on boot ...

[   13.586799] ------------[ cut here ]------------

[   13.591406] Ignoring spurious kernel translation fault at virtual address ffff80001139a990

[   13.599659] WARNING: CPU: 0 PID: 5 at /home/jonathanh/workdir/tegra/mlt-linux_next/kernel/arch/arm64/mm/fault.c:302 __do_kernel_fault+0xd0/0x128

[   13.612582] Modules linked in: ina3221(+) ip_tables x_tables ipv6 nf_defrag_ipv6

[   13.619966] CPU: 0 PID: 5 Comm: kworker/0:0 Tainted: G S                5.4.0-rc1-00031-g6a41b6c5fc20 #11

[   13.629509] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)

[   13.635416] Workqueue: events deferred_probe_work_func

[   13.640540] pstate: 40000085 (nZcv daIf -PAN -UAO)

[   13.645318] pc : __do_kernel_fault+0xd0/0x128

[   13.649663] lr : __do_kernel_fault+0xd0/0x128

[   13.654006] sp : ffff800010073a10

[   13.657308] x29: ffff800010073a10 x28: ffff0001f5ccb700 

[   13.662605] x27: ffff0001f7185730 x26: ffff8000117aff28 

[   13.667901] x25: 0000000000000000 x24: 0000000000000025 

[   13.673198] x23: 0000000060000085 x22: ffff80001139a990 

[   13.678495] x21: ffff800010073a80 x20: 0000000000000025 

[   13.683792] x19: 0000000096000007 x18: ffffffffffffffff 

[   13.689089] x17: 0000000000000000 x16: 0000000000000000 

[   13.694386] x15: ffff8000117998c8 x14: 3131303030386666 

[   13.699681] x13: 6666207373657264 x12: 6461206c61757472 

[   13.704978] x11: 697620746120746c x10: 756166206e6f6974 

[   13.710274] x9 : 616c736e61727420 x8 : 6c656e72656b2073 

[   13.715570] x7 : 0000000000000160 x6 : ffff0001f717c180 

[   13.720867] x5 : 0000000000000001 x4 : ffff0001f717c180 

[   13.726162] x3 : 0000000000000006 x2 : 0000000000000007 

[   13.731458] x1 : aa4a2528bb290a00 x0 : 0000000000000000 

[   13.736756] Call trace:

[   13.739194]  __do_kernel_fault+0xd0/0x128

[   13.743192]  do_translation_fault+0x40/0x70

[   13.747363]  do_mem_abort+0x3c/0x98

[   13.750839]  el1_da+0x20/0x94

[   13.753799]  __of_match_node+0x40/0x88

[   13.757535]  of_match_node+0x3c/0x60

[   13.761099]  of_match_device+0x18/0x28

[   13.764837]  platform_match+0x4c/0xd0

[   13.768488]  __device_attach_driver+0x34/0xc0

[   13.772832]  bus_for_each_drv+0x70/0xc8

[   13.776655]  __device_attach+0xdc/0x140

[   13.780479]  device_initial_probe+0x10/0x18

[   13.784649]  bus_probe_device+0x94/0xa0

[   13.788471]  deferred_probe_work_func+0x6c/0xa0

[   13.792990]  process_one_work+0x1c8/0x358

[   13.796986]  worker_thread+0x48/0x460

[   13.800637]  kthread+0xf0/0x120

[   13.803767]  ret_from_fork+0x10/0x1c

[   13.807331] ---[ end trace ce728f2656bbae67 ]---


I think we need to drop the __initconst from the match table.

I will send a patch.

Cheers
Jon

-- 
nvpublic
