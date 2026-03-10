Return-Path: <linux-gpio+bounces-33011-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L4EF0oosGn1ggIAu9opvQ
	(envelope-from <linux-gpio+bounces-33011-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:18:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B2251B43
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB4A5315FD95
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01D13A1699;
	Tue, 10 Mar 2026 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FJOkBcAn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574F39DBE1;
	Tue, 10 Mar 2026 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149704; cv=none; b=qabgjgD3oLsFqWkMJWb2R79l9VjiS/KB4X2psM1eEq4ELJyfGRA+rzlCZAlaz+Y+u4C8NHPq0Y6CCqOv6xyL+AJYn3H87y9MRXxdBRD/S0CP/Gxzu7anFsPkrM5kwNeOwgho2p086MtsP/laJSibTJs7Nd1LF8QKiCmzP0EaIfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149704; c=relaxed/simple;
	bh=pKqOkKX7CRXooHok80H4ZPwmfTHqEJgEysyE6k/X15M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hv2osxnS2cHKd+8/sFFA3/+tLFuhsrSgLsVHwzsT0lj2Y13x71LTsQEz9/RDIDSOkpb0JeclbOYB0yGUs94w/2N3KqcECnBA8NpL+Ha1OJCqXYpt0PtY4t/V77CTwCtuDpYF7TyrN5H2gAkSln2idJKVN0KmH5s7jGboJV/htEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FJOkBcAn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31D30594;
	Tue, 10 Mar 2026 14:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773149063;
	bh=pKqOkKX7CRXooHok80H4ZPwmfTHqEJgEysyE6k/X15M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FJOkBcAnFkYe4vPe4YH9cnkLWKl6ov27QakdWzdeus+itKJqMNGhBMwF+PtqlDg1D
	 RY5AlL0Oh/lV4Ifhn52mK/6NDuAsAhHs/DKPW2fRO+zOGpvovl3WStW4tk0lWfunNg
	 eN2CFS8bgHJ2e3gkwBWoCH/Nhxs7deBB3uioHFXo=
Message-ID: <e41212f3-5a55-4c14-85fb-91cdaa5e6786@ideasonboard.com>
Date: Tue, 10 Mar 2026 13:25:26 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: ipu-bridge: Add ov5675 sensor
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com,
 kees@kernel.org, ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-3-antti.laakso@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260310124427.693625-3-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 156B2251B43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33011-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Antti, thanks for the patches

On 10/03/2026 12:44, Antti Laakso wrote:
> The Omnivision ov5675 is found from MSI prestige
> 14 AI EVO laptop, for example.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---

Looks ok to me:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/pci/intel/ipu-bridge.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index c895584e25a0..ee070d44d5f1 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -91,6 +91,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>   	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>   	/* Omnivision OV2680 */
>   	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
> +	/* Omnivision OV5675 */
> +	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
>   	/* Omnivision OV8856 */
>   	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
>   	/* Sony IMX471 */


