Return-Path: <linux-gpio+bounces-34275-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LWsNEqZxmnrMQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34275-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 15:50:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 27093346544
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 15:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 982BD302AAC7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 14:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456B13ECBF3;
	Fri, 27 Mar 2026 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tbZMekGk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820C02459E1;
	Fri, 27 Mar 2026 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623034; cv=none; b=bKzudrPtHGJZvFS4gvDxDRgYJoEwDKk8n5BV21i4o+qsyCr7hzMh0DYyduxjBpf1LVpy8b0UdFZJD8HVtcoyM/Inp6PX/wuIHZ6MlytvhHOxkFVEQ6Yd2aGlW27RB0UdmJBAcXQKfMwJJiWsRs9h0TCu8u6sGx31hk/uf/ptUKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623034; c=relaxed/simple;
	bh=zscjXi9MVK0FT3fVQJwSvaIPjyt14k6440PyKgBymwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o208hb7HTeV9LxNLHrWSVYKg9TJ5PYygD/Zn7Y4Ay+JYxo7G2aPrxmYCo2lRpfK1MmWGWOIogi9whfohVkWqKnO5P777kC+SMAAbe2tw5sVj6IB++hxlRsLKR6dH9jjDlCgZ/UUn4DE4o57kp6lc7sapmLSGpP7ga+xBpoTpnf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tbZMekGk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A84091E31;
	Fri, 27 Mar 2026 15:49:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774622951;
	bh=zscjXi9MVK0FT3fVQJwSvaIPjyt14k6440PyKgBymwE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tbZMekGko73w71JNSZuMM/9A+ve1pKguqY+bQOlLyqJ1LjSeEV6vSrs9agrVmVNGc
	 WAfxWFZTOu6uCBjG/CUNJoFuvUx/OmU8yu9OYfdeQvpF+3FZcdSYDzHwlBV8CxVOEo
	 owys2tZJWWWxBWPZ9rDknF74I4V4aQ/bog/TlnWQ=
Message-ID: <732143c6-3cca-4b47-8e7f-7f8d1499d901@ideasonboard.com>
Date: Fri, 27 Mar 2026 14:50:27 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform: int3472: Drop redundant initialisation to 0
 and NULL
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-gpio@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linusw@kernel.org, brgl@kernel.org,
 mchehab@kernel.org, ilpo.jarvinen@linux.intel.com,
 hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
 jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org,
 ribalda@chromium.org
References: <20260317131040.215119-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260317131040.215119-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34275-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 27093346544
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On 17/03/2026 13:10, Sakari Ailus wrote:
> A few fields in structs containing regulator initialisation data for Dell
> laptops are initialised to 0 and NULL. Drop the explicit initialisation as
> redundant.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/platform/x86/intel/int3472/tps68470_board_data.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 6bec5a910396..c1ddbf9a82c0 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -151,8 +151,6 @@ static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data =
>   		.apply_uV = 1,
>   		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>   	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>   };
>   
>   static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
> @@ -162,8 +160,6 @@ static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
>   		.apply_uV = 1,
>   		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>   	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>   };
>   
>   static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
> @@ -173,8 +169,6 @@ static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
>   		.apply_uV = 1,
>   		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>   	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>   };
>   
>   static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
> @@ -184,8 +178,6 @@ static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
>   		.apply_uV = 1,
>   		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>   	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>   };
>   
>   static const struct regulator_init_data dell_7212_tps68470_vsio_reg_init_data = {


