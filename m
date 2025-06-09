Return-Path: <linux-gpio+bounces-21126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF5AAD223E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 17:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD203A89C8
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 15:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E301FBE8B;
	Mon,  9 Jun 2025 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fT2aERJv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084102AE6F;
	Mon,  9 Jun 2025 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482420; cv=none; b=vEOUuoSS1I01x8e2APtnQID8S9mPu6UkJNJblp0dfBpcPO04qpu/jPt2xwTBoWq/30KzxxKtJn6dNWynnf3MTttp76C1JgWzOhHwg4ongFc5SO5Ubm3WA0/CNYIsMFseJTy7AUpRlUKmAke8dVSPhm6IhnOLYOrr/PZl0HBwnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482420; c=relaxed/simple;
	bh=v+qNLhObMXgfKH7cBPQ5CCrdeTCsLTz3+1rD022Ddq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSmpv7DDELLWBSC9J15+ShoLSIgcsmC2JeNrQmX9SZd8Bsfu5DAOoemL+u9YJmDpyfQVVswFZof/+vQ/oMHsgM5mPHaTJY3taPPdowBJVG20XrjkYlrW5xSHJKksRfxBLndGMFBzyQHpKDWvcig1iWIem1XFmB8F5vod80W4iQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fT2aERJv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749482418; x=1781018418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v+qNLhObMXgfKH7cBPQ5CCrdeTCsLTz3+1rD022Ddq8=;
  b=fT2aERJvcV14Hd4OYqhD+qDNcUevn5ZJC9qJzLQSrTnXfuacpvc7Uz+2
   ZOLs2pxyRG7vQ0oOBg6mh8gMLlyfLr+w1LnBRLEa8yY2tpz8yLB/WkG71
   DrFVbuF/MBHRgVYpBCwy+zNpheRLuCLxxkG5ll7YEymczcvgjcai0bbWk
   RDO/jj3OCx3zyaEC4bFP4ZADriYKvMn/peZ+EpVJpngQWTssmYKEyLisL
   LXfwxyaBtD3BpcT88jxR0tXAFMAYrFi2ACObJVrv+38qIRgUNo65ZMONQ
   8Y9bsQZzNhkx2BY5O0GM0nzA8M1BVavbBky/4IyVI7hdXO0FCWcUCDyj3
   g==;
X-CSE-ConnectionGUID: Lf/PUgCuQXOK9Ax9l4IBSw==
X-CSE-MsgGUID: B6EcGbAnSjGe4AW07tIXnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62218025"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="62218025"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 08:20:17 -0700
X-CSE-ConnectionGUID: Fv1ZiFD1Si6u1CUusduqvg==
X-CSE-MsgGUID: R/zDx6RHRxKuta3nM1KO5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="151540730"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2025 08:20:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOeIE-000781-1B;
	Mon, 09 Jun 2025 15:20:10 +0000
Date: Mon, 9 Jun 2025 23:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v7 06/10] gpio: aggregator: export symbols of the GPIO
 forwarder library
Message-ID: <202506092324.XqSwWl1z-lkp@intel.com>
References: <20250609-aaeon-up-board-pinctrl-support-v7-6-1ab73ec0cb98@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-aaeon-up-board-pinctrl-support-v7-6-1ab73ec0cb98@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9946fe286439c2aeaa7953b8c316efe5b83d515]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richard/gpiolib-add-support-to-register-sparse-pin-range/20250609-175445
base:   d9946fe286439c2aeaa7953b8c316efe5b83d515
patch link:    https://lore.kernel.org/r/20250609-aaeon-up-board-pinctrl-support-v7-6-1ab73ec0cb98%40bootlin.com
patch subject: [PATCH v7 06/10] gpio: aggregator: export symbols of the GPIO forwarder library
config: i386-buildonly-randconfig-001-20250609 (https://download.01.org/0day-ci/archive/20250609/202506092324.XqSwWl1z-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506092324.XqSwWl1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506092324.XqSwWl1z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/dw-edma/dw-edma-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dw/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dw/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dw/dw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/dw/idma32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/fsl-dpaa2-qdma/dpdmai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/fsldma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/hsu/hsu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/cdev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/idxd/submit.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/mcf-edma-main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/of-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/ppc4xx/adma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/qcom/hidma_mgmt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/qcom/hidma_mgmt_sys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/sh/shdma-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/ti/k3-psil.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/ti/k3-udma-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/ti/k3-udma-private.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/virt-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/xilinx/xdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dma/xilinx/xilinx_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dpll/dpll_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/dpll/dpll_netlink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/edac_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/edac_mc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/edac_module.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/edac_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/edac_pci_sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/mce_amd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/mem_repair.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/skx_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/edac/wq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/eisa/eisa-bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/extcon/devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/extcon/extcon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firewire/core-card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firewire/core-device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firewire/core-topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firewire/core-transaction.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/arm_ffa/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/arm_scmi/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/broadcom/bcm47xx_nvram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/broadcom/tee_bnxt_fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/cirrus/cs_dsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/cirrus/test/cs_dsp_mock_bin.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/dmi_scan.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/efi/capsule.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/efi/cper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/efi/efi-init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/efi/efi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/efi/embedded-firmware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/efi/tpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/efi/vars.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/google/coreboot_table.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/google/memconsole.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/imx/imx-dsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/imx/imx-scu-irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/imx/imx-scu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/imx/misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/imx/rm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/imx/sm-cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/imx/sm-lmm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/imx/sm-misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/iscsi_ibft_find.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/meson/meson_sm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/mtk-adsp-ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/qcom/qcom_tzmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/raspberrypi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/samsung/exynos-acpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/smccc/kvm_guest.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/smccc/smccc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/stratix10-svc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/sysfb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/tegra/bpmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/tegra/ivc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/thead,th1520-aon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/firmware/xilinx/zynqmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fpga/altera-pr-ip-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fpga/dfl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fpga/fpga-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fpga/fpga-mgr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fpga/fpga-region.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fpga/lattice-sysconfig.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fpga/xilinx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fsi/fsi-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fsi/fsi-master-i2cr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fsi/fsi-occ.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fsi/fsi-sbefifo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/fwctl/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gnss/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gnss/serial.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpio/dev-sync-probe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/gpio/gpio-aggregator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpio/gpio-aspeed.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpio/gpio-cs5535.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpio/gpio-max730x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpio/gpio-mmio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpio/gpio-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpio/gpiolib-of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpio/gpiolib-sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpio/gpiolib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/aux-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/aux-hpd-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/panel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/samsung-dsim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/clients/drm_client_setup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_bridge_connector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_dp_aux_bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_dp_cec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_dp_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_dp_mst_topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_dp_tunnel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_dsc_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_hdmi_audio_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_hdmi_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_hdmi_state_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/display/drm_scdc_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_atomic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_atomic_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_atomic_state_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_atomic_uapi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_auth.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_bridge_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_buddy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_client.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_client_event.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_client_modeset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_color_mgmt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_connector.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_damage_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_debugfs_crc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_drv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_edid.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_exec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_fb_dma_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_fb_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_fbdev_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_fbdev_shmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_fbdev_ttm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_flip_work.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_format_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_gem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_gem_atomic_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_gem_framebuffer_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_gem_ttm_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_gem_vram_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_gpusvm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_gpuvm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_managed.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_mipi_dbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_mipi_dsi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_mode_config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_modeset_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_modeset_lock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_panel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_panel_backlight_quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_panel_orientation_quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_panic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_plane.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_plane_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_print.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_privacy_screen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_self_refresh_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_simple_kms_helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_suballoc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_syncobj.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_vblank_work.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_vma_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/drm_writeback.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/i915/gt/intel_rps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/i915/intel_gvt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/i915/intel_gvt_mmio_table.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/lib/drm_random.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/mcde/mcde_display.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/mediatek/mtk_cec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/panel/panel-samsung-s6e63m0.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/pl111/pl111_nomadik.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/pl111/pl111_versatile.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

