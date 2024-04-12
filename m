Return-Path: <linux-gpio+bounces-5437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 633038A347F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 19:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 845C81C23EF7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 17:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9D714BFB0;
	Fri, 12 Apr 2024 17:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IK5vT4Mx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BAE84A37;
	Fri, 12 Apr 2024 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712941868; cv=none; b=MzuBKP39J5xxAw4IJyufxYwvf/8xL40tF6EmJhTz37M9kQws45JuG48YJ6fFTljRMV6mTp0STB+WLET/1pKI7mcBRTmx6B7FfixtTyJuJaWAPrsMuEZg10/9SYOfLOX+6Md20Su2+PpUG94Kb8r9TR1DdxIxONb2BspuczGvvDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712941868; c=relaxed/simple;
	bh=4t27ZjTep4ipBOCO/weDOKS7CrDC5uKQflUtnDmWdZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCYKuOaAXKv4yo4VwHEPc1Pf2MwG6HS+9B42s2OjMdSI/KHB1n4rBG1zcYyJjuG3+90/Poax1DPnTEm/F6xu+o2RmGbHCZuG34CkfhAglgXLns6xV9CqrHGumET8Sm4O2HtRqAAysZhQ2wM+VLUnmyVBw0cPjmbQzE80dRotT4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IK5vT4Mx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712941867; x=1744477867;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4t27ZjTep4ipBOCO/weDOKS7CrDC5uKQflUtnDmWdZ0=;
  b=IK5vT4MxJ0iHkAiaBWTIjHJSmNIzjvcAQeIqWLLDd7WQv5Yye0BSjIML
   36SevWlOmHTLvzGgO5LJuMDa9zCp98RI2QuGrSFHeJUs4mcJ2YcTaqiuf
   vCP6ajoffsPRz92wjg+u9G/ZZ68B5dVDjYOGRPGVLgXpfDbeWSuajJEY5
   PtOLwtM3kTPW+WYHuLniluBAg2RFdjocsBZ80f2h/RpSZlEyQoROW3QK+
   P6NDroDfmCUt2PDFJOqvdlrZNwvd7PQ9JVaIN2GBgDMNBpRgAJqO//QNk
   uV8g39JICYNGRV08xTE4h+9KzASHuKTlshlCs6M9EPkJIaPUwdSpWUBMs
   g==;
X-CSE-ConnectionGUID: LNCz3nwVRXaC1rDY6odakw==
X-CSE-MsgGUID: 5GOMtVP3Rz6C1nYk8SFeCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8250567"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8250567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 10:11:07 -0700
X-CSE-ConnectionGUID: bWtW6AqSStKQD4yIeXA1Ig==
X-CSE-MsgGUID: p4CXOTCSRKKKqSU4xP4JsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="52250894"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.215.136])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 10:11:04 -0700
Message-ID: <9e928be8-f62b-4488-ab33-63ae643467d6@intel.com>
Date: Fri, 12 Apr 2024 20:10:58 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] mmc: sdhci: Add support for "Tuning Error"
 interrupts
To: Hans de Goede <hdegoede@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240410191639.526324-1-hdegoede@redhat.com>
 <20240410191639.526324-3-hdegoede@redhat.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240410191639.526324-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/24 22:16, Hans de Goede wrote:
> From: Adrian Hunter <adrian.hunter@intel.com>
> 
> Most Bay Trail devices do not enable UHS modes for the external sdcard slot
> the Lenovo Yoga Tablet 2 830 / 1050 and Lenovo Yoga Tablet 2 Pro 1380 (8",
> 10" and 13") models however do enable this.
> 
> Using a UHS cards in these tablets results in errors like this one:
> 
> [  225.272001] mmc2: Unexpected interrupt 0x04000000.
> [  225.272024] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
> [  225.272034] mmc2: sdhci: Sys addr:  0x0712c400 | Version:  0x0000b502
> [  225.272044] mmc2: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000007
> [  225.272054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 0x00000023
> [  225.272064] mmc2: sdhci: Present:   0x01e20002 | Host ctl: 0x00000016
> [  225.272073] mmc2: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
> [  225.272082] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
> [  225.272092] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 0x00000001
> [  225.272101] mmc2: sdhci: Int enab:  0x03ff000b | Sig enab: 0x03ff000b
> [  225.272110] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
> [  225.272119] mmc2: sdhci: Caps:      0x076864b2 | Caps_1:   0x00000004
> [  225.272129] mmc2: sdhci: Cmd:       0x00000c1b | Max curr: 0x00000000
> [  225.272138] mmc2: sdhci: Resp[0]:   0x00000c00 | Resp[1]:  0x00000000
> [  225.272147] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000900
> [  225.272155] mmc2: sdhci: Host ctl2: 0x0000000c
> [  225.272164] mmc2: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x0712c200
> [  225.272172] mmc2: sdhci: ============================================
> 
> which results in IO errors leading to issues accessing the sdcard.
> 
> 0x04000000 is a so-called "Tuning Error" which sofar the SDHCI driver
> does not support / enable. Modify the IRQ handler to process these.
> 
> This fixes UHS microsd cards not working with these tablets.
> 

Needs my SOB here:

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>

> Link: https://lore.kernel.org/r/199bb4aa-c6b5-453e-be37-58bbf468800c@intel.com
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mmc/host/sdhci.c | 10 ++++++++--
>  drivers/mmc/host/sdhci.h |  3 ++-
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index c79f73459915..746f4cf7ab03 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3439,12 +3439,18 @@ static void sdhci_data_irq(struct sdhci_host *host, u32 intmask)
>  		host->data->error = -EILSEQ;
>  		if (!mmc_op_tuning(SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND))))
>  			sdhci_err_stats_inc(host, DAT_CRC);
> -	} else if ((intmask & SDHCI_INT_DATA_CRC) &&
> +	} else if ((intmask & (SDHCI_INT_DATA_CRC | SDHCI_INT_TUNING_ERROR)) &&
>  		SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND))
>  			!= MMC_BUS_TEST_R) {
>  		host->data->error = -EILSEQ;
>  		if (!mmc_op_tuning(SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND))))
>  			sdhci_err_stats_inc(host, DAT_CRC);
> +		if (intmask & SDHCI_INT_TUNING_ERROR) {
> +			u16 ctrl2 = sdhci_readw(host, SDHCI_HOST_CONTROL2);
> +
> +			ctrl2 &= ~SDHCI_CTRL_TUNED_CLK;
> +			sdhci_writew(host, ctrl2, SDHCI_HOST_CONTROL2);
> +		}
>  	} else if (intmask & SDHCI_INT_ADMA_ERROR) {
>  		pr_err("%s: ADMA error: 0x%08x\n", mmc_hostname(host->mmc),
>  		       intmask);
> @@ -3979,7 +3985,7 @@ bool sdhci_cqe_irq(struct sdhci_host *host, u32 intmask, int *cmd_error,
>  	} else
>  		*cmd_error = 0;
>  
> -	if (intmask & (SDHCI_INT_DATA_END_BIT | SDHCI_INT_DATA_CRC)) {
> +	if (intmask & (SDHCI_INT_DATA_END_BIT | SDHCI_INT_DATA_CRC | SDHCI_INT_TUNING_ERROR)) {
>  		*data_error = -EILSEQ;
>  		if (!mmc_op_tuning(SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND))))
>  			sdhci_err_stats_inc(host, DAT_CRC);
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index a20864fc0641..957c7a917ffb 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -158,6 +158,7 @@
>  #define  SDHCI_INT_BUS_POWER	0x00800000
>  #define  SDHCI_INT_AUTO_CMD_ERR	0x01000000
>  #define  SDHCI_INT_ADMA_ERROR	0x02000000
> +#define  SDHCI_INT_TUNING_ERROR	0x04000000
>  
>  #define  SDHCI_INT_NORMAL_MASK	0x00007FFF
>  #define  SDHCI_INT_ERROR_MASK	0xFFFF8000
> @@ -169,7 +170,7 @@
>  		SDHCI_INT_DATA_AVAIL | SDHCI_INT_SPACE_AVAIL | \
>  		SDHCI_INT_DATA_TIMEOUT | SDHCI_INT_DATA_CRC | \
>  		SDHCI_INT_DATA_END_BIT | SDHCI_INT_ADMA_ERROR | \
> -		SDHCI_INT_BLK_GAP)
> +		SDHCI_INT_BLK_GAP | SDHCI_INT_TUNING_ERROR)
>  #define SDHCI_INT_ALL_MASK	((unsigned int)-1)
>  
>  #define SDHCI_CQE_INT_ERR_MASK ( \


