Return-Path: <linux-gpio+bounces-36250-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMJgG0Ko+mlURAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36250-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 04:32:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 173FB4D5B17
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 04:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81B4D3038A5A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 02:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798862D2382;
	Wed,  6 May 2026 02:31:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FFA19DF6A;
	Wed,  6 May 2026 02:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034671; cv=none; b=hrGXYl2nZSDtICYm+qnGAY2ZnV/YtcYrCyafKk7wtXkoWbvXyVYK8iZnVw0ExwL2x4ZmpqDIuFTUfy5reHkprnjPp4FP2DZPztHPei5bZ9VEYaSKDh1yMP/2ckJ59khsoxI8EuDdV1z/v0UgqMjrKRqyTBvZtyw/DLtfvCEpIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034671; c=relaxed/simple;
	bh=g5oNCXLIrRB8Peo+P5aiq5oeMf2uwLyTTn+a4i74TPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHwgMEfwmu39wnwoy2cCxvvZAAOV0IyBIomipSx26bkFue+J/1dJ4wozFzkdDYPLWnzaw5cegee1NhcIf2T0tOIcmOBmGT/MKCMCpZ0CN0p65AuuuISAC//nmPfGpe4p8NZXDIi7+fZ0FLlARmD+sRxnjhw7iMQNFzeafqgdF2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz16t1778034653t405f70b0
X-QQ-Originating-IP: 4meMtvNm/og9G0fVM/ycSpSa183Qcv1XH6iFoe6ZdSA=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 May 2026 10:30:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2498618263695594642
Message-ID: <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
Date: Wed, 6 May 2026 10:30:46 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260501155421.3329862-11-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MxdW4jxL6NvXsbtSC0sdkRTYslY/wd+PTnnOEmueE64hCrFI+earuJRV
	hgNg2Ceej//UIQfd+2Wlk//epUITPXjjocchjWHEZMcdfNK1LLNLFyz0ZfXIRI3td8fvLcg
	ioV78ncJzF7+KQCzQK9t0u73IRt2vWCCO0ElFvy14O+nJcxgQpZdBKTQ9TxTIcZUoaAwD4Q
	xxzCEbjkDEoZxLTSeuiKoMKu+9qsf2zYfVwTd4hlpiDd5MHlm0CJzfCfSSoeI2FKWi3VgWo
	9CEexip17TssKCTg8w/buxu5ytVm0435turBile67gA71cUUxk7zTng8zNvMjJmNoMxOCli
	SSSo40gjI+GpvWoeF8JpMycBvTtnwXL8DvuC8k18EOcCQq+lv2FwbMqMBWph7sa7gSjdkCp
	O8jkqB5fGOO5vVNzg/eaRrs7biPOkQy44iN36TDJx0Wb03IkHOXbWxOab453acDV/JxVNOl
	uN9OScd0yczqaUxHJhVCBUC6AHGRz92UcT3bVSvvvD+L9qnUx3msHzghPxpppLzzOOcG0xw
	n79UGEvdQpwNrII1tgGEiLdYEYaUqmKTtnlD19HdD5uYy9GBUatNcBJtzhbCH9ijDsGrDTy
	sIre1iDEw9SwHlD/oFtCYBgrgyS6IHnf2+zt/3HEx1OgJOH5rlUg03KJ4BOL5bmDkOOdVtg
	hV3z89018f9IgXo2HO9E26kHWJoIdXlggavuQIQ/xNcS8GyZ973bAYpcbARpt/R5eHrlGKt
	yYmwp6EciINtFp7rAHahigqRc7OkhTAYteXoLX+w13hrYAAbpmbGo7nyIQh6eVXWksTovTp
	DNCclkxdoVXVsPuZuHvdsyeAiCuxOhLSqYwUXbeLg/0vNJMLPsFFK1MyzNaPPLIFuwuERmM
	W0BM4I5HB7dilQPZZyLzEFCaY2yOLQxcMxwiwF8R32kA1J4gqGyz16Qs8HzIVHG3H24Vu5H
	bSaoBbcHAZIxNn+BUYUmS+plXKCWKlZWHhqmJJh7mvJXe92jRy1l2J4fKNglrg3Cni9s=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 173FB4D5B17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36250-lists,linux-gpio=lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:mid,radxa.com:email,riscstar.com:email]

On 5/1/2026 11:54 PM, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
> small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
> that can be accessed, along with several other peripherals, via two
> PCIe endpoint functions. There is a main driver for the endpoint that
> decomposes things and creates auxiliary bus devices to model the SoC.
> 
> The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
> supported by an MSIGEN that bridges TC956x level interrupts to PCIe
> MSIs.
> 
> Add a driver for the eMAC/MSIGEN combination.
> 
> Co-developed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  13 +
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>   .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 791 ++++++++++++++++++
>   include/soc/toshiba/tc956x-dwmac.h            |  84 ++
>   4 files changed, 890 insertions(+)
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>   create mode 100644 include/soc/toshiba/tc956x-dwmac.h
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index e3dd5adda5aca..66bcfaccbe21f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -404,6 +404,19 @@ config DWMAC_MOTORCOMM
>   	  This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
>   	  controllers. Currently only YT6801 is supported.
>   
> +config DWMAC_TC956X
> +	tristate "Toshiba TC956X DWMAC support"
> +	depends on PCI
> +	depends on COMMON_CLK
> +	depends on TOSHIBA_TC956X_PCI
> +	default m if TOSHIBA_TC956X_PCI

Hi Alex,

I think GENERIC_IRQ_CHIP should be selected here.

Thank you for the driver.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>


