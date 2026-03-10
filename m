Return-Path: <linux-gpio+bounces-32999-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIwKJIYjsGmVgQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32999-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:58:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 496FB2511FA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 360273419111
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F6B3B27F6;
	Tue, 10 Mar 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln1xstyJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA5D3B27DE;
	Tue, 10 Mar 2026 13:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147815; cv=none; b=hfqKWP+1BdmRJrqqChjS1TnTjYVF2SnnwjGGqX8lg9EdGTL0+2t/84eFmBhxsHpYB8pDAXIzpDziytlvyxpK0QzGZW3u6X9WzOYay9eldflX7xkcoPP32lAxBQENvdcTARNYaLm6rkbPkexwdmu0RaoHVQVTPD+2H8PqgXy1Hb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147815; c=relaxed/simple;
	bh=MfEXy1ctseopp63FSBOa0UQ1m/J7vCPfW+SR5dSkFkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwDeD9bWlJnySMqzO2inI1CeZ5zcv5BDvjaLB6dV6fB+X0xygYXQBPH7jT0CspYfSd8rgyWiLtpZ+wPztZ58avZpdv/DD6BkeJ77kT3cLOh2ta7Bixs44ldblWCGLFHoT0VKXwc7rzVfyyurXdEMUq5ANadmiMj4rYddTb/Up3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln1xstyJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F28BC2BCB1;
	Tue, 10 Mar 2026 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773147815;
	bh=MfEXy1ctseopp63FSBOa0UQ1m/J7vCPfW+SR5dSkFkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ln1xstyJp0BoYpFoSFJnSctWSbgDDiJ7aiAs5vss36QOCCOhspsj2Qv0a8Q3PhdTe
	 bO4PisEawqrnMt3l21W/NfkFxjsx++INMM9ohMS64akIcobdMkUYpzIsOqboD4lNkg
	 WpXvAdiN+7wlDiCIyBTc19BiyE30eEoD84Cr3+bGgIkP620QaiTR/nRSr45/TV38N8
	 KlG/ZOFE/TLKACO3XPepuyv4z03JLf1Uq0KsKGir6bajteaqjo4l3VJm7rFvcsE5Gj
	 HC1Fjr8XiVcWKAhbYd0ok58jqDVweCBhb4fzOylpxo7IMHhIeceOodHOSYfv35pbHe
	 44mLuSEDyPpPA==
Message-ID: <14af1139-cb61-4519-a769-23796ecca3e2@kernel.org>
Date: Tue, 10 Mar 2026 14:03:30 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: i2c: ov5675: Wait for endpoint
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, dan.scally@ideasonboard.com,
 ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org,
 hao.yao@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com,
 miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-2-antti.laakso@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260310124427.693625-2-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 496FB2511FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32999-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

Hi,

Thank you for your patches for this, cool to see someone working
on supporting this!

On 10-Mar-26 13:44, Antti Laakso wrote:
> Defer probe if endpoint is not yet available. And do it before acquiring
> clock, gpio and regulators.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---
>  drivers/media/i2c/ov5675.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index ea26df328189..81916fa8c117 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1181,6 +1181,13 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>  	if (!fwnode)
>  		return -ENXIO;
>  
> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;

This should be:

		return dev_err_probe(dev, ret, "failed to parse endpoint\n");


> +
>  	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
>  	if (IS_ERR(ov5675->xvclk))

and here and in all other error-exit paths you now need to do:

	if (IS_ERR(ov5675->xvclk)) {
		ret = dev_err_probe(dev, PTR_ERR(ov5675->xvclk), "failed to get xvclk\n");
		goto check_hwcfg_error;
	}

So that the v4l2_fwnode_endpoint_free(&bus_cfg); get called.
Note in this case I also dropped the %pe print because dev_err_probe()
already prints the errno value from its second argument.

You will need to add a similar ret = ...; goto check_hwcfg_error;
to all other error-exits below this point.

Regards,

Hans




>  		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),

> @@ -1210,15 +1217,6 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>  	if (ret)
>  		return ret;
>  
> -	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> -	if (!ep)
> -		return -ENXIO;
> -
> -	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> -	fwnode_handle_put(ep);
> -	if (ret)
> -		return ret;
> -
>  	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV5675_DATA_LANES) {
>  		dev_err(dev, "number of CSI2 data lanes %d is not supported",
>  			bus_cfg.bus.mipi_csi2.num_data_lanes);


