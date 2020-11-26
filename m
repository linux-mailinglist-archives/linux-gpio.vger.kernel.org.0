Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B092C5181
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Nov 2020 10:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730678AbgKZJm0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Nov 2020 04:42:26 -0500
Received: from mga05.intel.com ([192.55.52.43]:30972 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730561AbgKZJmZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Nov 2020 04:42:25 -0500
IronPort-SDR: Cg8LlIVG3apn9d/iJhw5lnyM1NdkSabI5/wQbXZpFOQCmBBqAeamD0kIxbmbztfN27DpALaLxL
 cVqA3pIUKJrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="256971334"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; 
   d="scan'208";a="256971334"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 01:42:25 -0800
IronPort-SDR: 4//eXEixjR6gd1UDlQzUaW4uzjufpkJR38BN2hMyHp+XFPNVLD1yVypoEaxPl0ZyScu7msE5gg
 fA3yfSLdRNEw==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; 
   d="scan'208";a="433225718"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 01:42:23 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kiDoD-009r40-Lh; Thu, 26 Nov 2020 11:43:25 +0200
Date:   Thu, 26 Nov 2020 11:43:25 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        Sergey.Semin@baikalelectronics.ru, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] gpio: dwapb: fix NULL pointer dereference at
 dwapb_gpio_suspend()
Message-ID: <20201126094325.GB4077@smile.fi.intel.com>
References: <1606374991-55165-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606374991-55165-1-git-send-email-luojiaxing@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 26, 2020 at 03:16:31PM +0800, Luo Jiaxing wrote:
> Following Calltrace is found when running echo freeze > /sys/power/state.
> 
> [  272.755506] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> [  272.755508] Mem abort info:
> [  272.755508]   ESR = 0x96000006
> [  272.755510]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  272.755511]   SET = 0, FnV = 0
> [  272.755512]   EA = 0, S1PTW = 0
> [  272.755513] Data abort info:
> [  272.755514]   ISV = 0, ISS = 0x00000006
> [  272.755515]   CM = 0, WnR = 0
> [  272.755517] user pgtable: 4k pages, 48-bit VAs, pgdp=00000020a3b66000
> [  272.755519] [0000000000000010] pgd=00000020a5ebe003, p4d=00000020a5ebe003, pud=0000002093cd3003, pmd=0000000000000000
> [  272.755525] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [  272.755527] Modules linked in:
> [  272.755532] CPU: 2 PID: 3523 Comm: bash Not tainted 5.10.0-rc1-109487-g2893d0937cea-dirty #936
> [  272.755533] Hardware name: Huawei TaiShan 2280 V2/BC82AMDD, BIOS 2280-V2 CS V3.B160.01 03/10/2020
> [  272.755535] pstate: 60400009 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> [  272.755544] pc : dwapb_gpio_suspend+0x18/0x318
> [  272.755550] lr : pm_generic_suspend+0x2c/0x48
> [  272.755551] sp : ffff80002f0aba90
> [  272.755552] x29: ffff80002f0aba90 x28: 0000000000000000
> [  272.755555] x27: ffffbc08c155c000 x26: 0000000000000002
> [  272.755557] x25: ffffbc08c155c5f8 x24: ffffbc08c1621000
> [  272.755559] x23: 0000000000000000 x22: ffffbc08c15cc000
> [  272.755561] x21: ffff357204472410 x20: ffffbc08bfd6a7a0
> [  272.755563] x19: 0000000000000000 x18: ffffffffffffffff
> [  272.755565] x17: 0000000000000000 x16: 0000000000000000
> [  272.755567] x15: 0000004a5f1918b8 x14: 0000000000000219
> [  272.755570] x13: 0000000000000219 x12: 0000000000000000
> [  272.755572] x11: 0000000000000000 x10: 0000000000000000
> [  272.755574] x9 : 0000000000000000 x8 : ffff15729beb6180
> [  272.755576] x7 : 0000000000000000 x6 : 000000000000000b
> [  272.755578] x5 : ffff15729dbd4600 x4 : 0000000000000000
> [  272.755580] x3 : ffff357204472504 x2 : ffffbc08bfcefef0
> [  272.755582] x1 : 0000000000000000 x0 : ffff357204472410
> [  272.755585] Call trace:
> [  272.755587]  dwapb_gpio_suspend+0x18/0x318
> [  272.755588]  pm_generic_suspend+0x2c/0x48
> [  272.755595]  acpi_subsys_suspend+0x60/0x70
> [  272.755599]  dpm_run_callback.isra.18+0x40/0xe0
> [  272.755601]  __device_suspend+0xf4/0x360
> [  272.755603]  dpm_suspend+0xf0/0x1f8
> [  272.755605]  dpm_suspend_start+0xa0/0xa8
> [  272.755610]  suspend_devices_and_enter+0xe0/0x618
> [  272.755612]  pm_suspend+0x250/0x308
> [  272.755613]  state_store+0x8c/0x118
> [  272.755621]  kobj_attr_store+0x18/0x30
> [  272.755625]  sysfs_kf_write+0x40/0x58
> [  272.755626]  kernfs_fop_write+0x148/0x240
> [  272.755630]  vfs_write+0xc0/0x230
> [  272.755632]  ksys_write+0x6c/0x100
> [  272.755633]  __arm64_sys_write+0x1c/0x28
> [  272.755639]  el0_svc_common.constprop.3+0x68/0x170
> [  272.755641]  do_el0_svc+0x24/0x90
> [  272.755646]  el0_sync_handler+0x118/0x168
> [  272.755647]  el0_sync+0x158/0x180
> [  272.755651] Code: 910003fd f9000bf3 f9001ff8 f9403c13 (f9400a78)
> [  272.755724] ---[ end trace afcb0e834c241837 ]---
> [  272.937286] Kernel panic - not syncing: Oops: Fatal exception
> [  273.210068] SMP: stopping secondary CPUs
> [  273.214006] Kernel Offset: 0x3c08af7b0000 from 0xffff800010000000
> [  273.220071] PHYS_OFFSET: 0xffffeaae00000000
> [  273.224235] CPU features: 0x0040002,62808a38
> [  273.228486] Memory Limit: none
> [  273.234390] ---[ end Kernel panic - not syncing: Oops: Fatal exception ]---

Please, reduce the above to leave only necessary minimum.

> The reason is platform_set_drvdata() is deleted, and dwapb_gpio_suspend()
> get *gpio by dev_get_drvdata().
> 

> Fixes: feeaefd378ca ("gpio: dwapb: Use resource managed GPIO-chip add data method")
> 
> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>

Should be no blank lines in tag block.

With above addressed,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks!

> ---
>  drivers/gpio/gpio-dwapb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 2a9046c..4275c18 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -724,6 +724,8 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
>  			return err;
>  	}
>  
> +	platform_set_drvdata(pdev, gpio);
> +
>  	return 0;
>  }
>  
> -- 
> 2.7.4
> 

-- 
With Best Regards,
Andy Shevchenko


