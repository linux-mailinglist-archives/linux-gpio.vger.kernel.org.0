Return-Path: <linux-gpio+bounces-33019-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NbKCBcysGl5hAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33019-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:00:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D4A252C6C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBBE3321EDDC
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F1A2DEA74;
	Tue, 10 Mar 2026 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dcsObDIp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367BA26CE05;
	Tue, 10 Mar 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152869; cv=none; b=B4l39uZI4xewl5iF3PLfw7yL0VA+BgjfLhhZBFdpTcJNE5uil8BQKH8mdytlgCq+T7i/Mjp2xM9MUN6FvaCFGp8u+NcneyHFkwGOfubm9qGHFbt1xWrzdd5h3HDJEdYcOPKlfX2m/J+M34BLEhXywqq/fZlnk/jXD9bdJkcxg7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152869; c=relaxed/simple;
	bh=8CFG28gHb1nwNSNq43O8008M+si6bdbaTHlzaj2Z2N4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/pgtDNPChxlZwSXeOMqiPDL2Bl/24hlNgZk+JJ3VJTi/AsvKqBjM/0j4tOG7znamCVacq35eND2yczOyOgQ5enn8aJcIzNRH/s7x84q7k7n56AErBIpLYIUe+BaxHhe6okGc+A5ma+kzTHDp64ALtcSvLzJ/kw+4KezXS0Jj94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dcsObDIp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BAF5250;
	Tue, 10 Mar 2026 15:26:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773152799;
	bh=8CFG28gHb1nwNSNq43O8008M+si6bdbaTHlzaj2Z2N4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dcsObDIpdkW5gvdG4HQwopcs+D3tJvdCm4WyIztIyonmBeyc/InkXTckGBVBhOhIn
	 K3zwWZgVxqT1im92leN2cZQX7D2719TYLQYhr5FoekhoLW4gUkzOusj99HeUT3oV8l
	 UgH4nqKVz2+VoX8YUNLuTV7h+KUMdnPhem+Ro16U=
Message-ID: <2074841b-5d38-4696-ab0d-f7ace1923980@ideasonboard.com>
Date: Tue, 10 Mar 2026 14:27:42 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] platform: int3472: Add gpio platform data
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com,
 kees@kernel.org, ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-4-antti.laakso@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260310124427.693625-4-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 76D4A252C6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33019-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,intel.com:email]
X-Rspamd-Action: no action

Hi Antti

On 10/03/2026 12:44, Antti Laakso wrote:
> The tps68470 supports i2c daisy chain, which need to be configured by
> gpio-tps68470 driver. Add daisy chain information to platform data.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---

I think this change is good, so:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

However I think Bartosz' suggestion has a lot of merit, so if you wanted to revise the patch in that 
direction, that would be even more welcome.

Thanks
Dan

>   drivers/platform/x86/intel/int3472/tps68470.c | 2 ++
>   drivers/platform/x86/intel/int3472/tps68470.h | 1 +
>   include/linux/platform_data/tps68470.h        | 4 ++++
>   3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0d2a..b02bc675cabe 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -197,6 +197,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>   		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>   		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>   		cells[2].name = "tps68470-gpio";
> +		cells[2].platform_data = (void *)board_data->tps68470_gpio_pdata;
> +		cells[2].pdata_size = sizeof(*board_data->tps68470_gpio_pdata);
>   
>   		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>   			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701593..c1c4290eb6d5 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -17,6 +17,7 @@ struct tps68470_regulator_platform_data;
>   struct int3472_tps68470_board_data {
>   	const char *dev_name;
>   	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	const struct tps68470_gpio_platform_data *tps68470_gpio_pdata;
>   	unsigned int n_gpiod_lookups;
>   	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>   };
> diff --git a/include/linux/platform_data/tps68470.h b/include/linux/platform_data/tps68470.h
> index e605a2cab07f..7330dab7a711 100644
> --- a/include/linux/platform_data/tps68470.h
> +++ b/include/linux/platform_data/tps68470.h
> @@ -27,6 +27,10 @@ struct tps68470_regulator_platform_data {
>   	const struct regulator_init_data *reg_init_data[TPS68470_NUM_REGULATORS];
>   };
>   
> +struct tps68470_gpio_platform_data {
> +	const bool daisy_chain_enable;
> +};
> +
>   struct tps68470_clk_consumer {
>   	const char *consumer_dev_name;
>   	const char *consumer_con_id;


