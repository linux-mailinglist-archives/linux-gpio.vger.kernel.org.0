Return-Path: <linux-gpio+bounces-33149-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFvmMF19sWmACAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33149-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:34:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD3265759
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D9313004D3E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6777C3B0AF4;
	Wed, 11 Mar 2026 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjTK4FC6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293121EE7C6;
	Wed, 11 Mar 2026 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239599; cv=none; b=OsWUIGIT4iSzGNHSy7ExTV5u8AVuHQs2zhaJhMY1UMxOJaIHMEIwjv4bMOuL4xX/gvIMqu2Lfcg2vIcbiwZkBizgAm72wiHnooWFV1GwxVDoWPdHivEseovuXTMcYddfRD15fD2XLRhnEJSHqzL/pqcpAhApfh2KDZPfJX5k6Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239599; c=relaxed/simple;
	bh=Mm3/l5PSuS+ONmFZtSVCRNHD4omf3DWM/QuMCPKDtDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLfJMhpQJX5McSd+95EsRK7zczGAdA/VHFwggSR5tZR0htB55Tzbowi4awaELFxNFhYS7KYeQWzGh3fj9/56chPQgmDvVPiXHbTUMBxKFYIEfpA5ZvXgkroOru5fbgMPy09G3HcYrEE3aIjgliPiuinmAnVgwJq8x9k2jT9EmIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjTK4FC6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D20C4CEF7;
	Wed, 11 Mar 2026 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773239598;
	bh=Mm3/l5PSuS+ONmFZtSVCRNHD4omf3DWM/QuMCPKDtDo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qjTK4FC69tbkqw1Ty1m3Hy5u32JXSuHAFlXL2HLUJkHrofnhLjFh+Uo8z4YybGPQ6
	 k/s9UMFr4rVmVVKab2dVhFDqQ3QnnaSyQmWgYvnfVBUmWReD+Yg55BtUY7mtj94aIq
	 2XY0sMz7DthFT4tIE8timPAtVmCZL1DsbeDWVm/2GAXkp9J8PU8GDcojYwdO3IrKsL
	 B3QCetwPYbbCTiM2wqpX+kCIlzp9GaA179H7B+FGsApk+6iLb2P2M0ZP9WyTsRizTT
	 eGy37MVRa5iUbE3EamKMzwXy12vKoGr3QgZCYjgWIheQIx9yYxQj9+N7/4k9zxSFQc
	 38/Att6CRlEWA==
Message-ID: <480d3808-caba-43ac-aed7-1ca2738bb029@kernel.org>
Date: Wed, 11 Mar 2026 15:33:13 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] platform: int3472: Add gpio software node
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, dan.scally@ideasonboard.com,
 ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org,
 hao.yao@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com,
 kees@kernel.org, ribalda@chromium.org
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
 <20260311131910.835513-4-antti.laakso@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260311131910.835513-4-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33149-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,intel.com:email]
X-Rspamd-Queue-Id: CADD3265759
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 11-Mar-26 14:19, Antti Laakso wrote:
> The tps68470 supports i2c daisy chain, which need to be configured by
> gpio-tps68470 driver. Add daisy chain information to software node.

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 1 +
>  drivers/platform/x86/intel/int3472/tps68470.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0d2a..a77ed32abe55 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -197,6 +197,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>  		cells[2].name = "tps68470-gpio";
> +		cells[2].swnode = board_data->tps68470_gpio_swnode;
>  
>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701593..3bbaade96c57 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -17,6 +17,7 @@ struct tps68470_regulator_platform_data;
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	const struct software_node *tps68470_gpio_swnode;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };


