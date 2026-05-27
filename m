Return-Path: <linux-gpio+bounces-37564-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMlsA960FmokogcAu9opvQ
	(envelope-from <linux-gpio+bounces-37564-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:09:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E51E5E190E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50E92306CF66
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7084C3E63A3;
	Wed, 27 May 2026 09:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkMAgueW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AF73E5EC7;
	Wed, 27 May 2026 09:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872820; cv=none; b=UupQck3CZ+9DFq7pD3tViekgF6+iIKXqYLzQC1NuTBpr6T/ZerHG4QkRqooSXaXmfUMjgCUSEOkcL/O54z+AR7Rg0KKuRdsIzRcHOqPCQBo8n1vmEl+SdtPYT8VnZ04uc7tkdCJaMJIUWHr/gf3aYVdBPnnSYeo/V8mpqPA0jA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872820; c=relaxed/simple;
	bh=OQVJZfwHpXN0n/v7h29x/cHNl444YSA1UCol0sqqDpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDc61mwv2X2632KVqmvLoMYffwx2w4vgfnecJQC+CAIurc/3UKk6LALNfVnYEqDtrOhhNMJVuXJ/6/gBZLp1+oQnJ5+rsc7A2Q5l89CzcDqym/ocMExC5Svso/GxbjX4nO2ddHnkHcB8wZq7Uc7TVxIAD8IHMUklVJ0G7lC6ItQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkMAgueW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE9A1F000E9;
	Wed, 27 May 2026 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779872818;
	bh=Ka6yC3QrHcEkiDk7alcfHWrv6N92oBkr2LoopdWzh7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nkMAgueWuwGVRv0HOVp+lcKpTELX8upnzcUnPp3tNS1p4S4x3iB0NS5KSyHXzMvnZ
	 aU5hGJKwUyxUBQw9g7fSNZ5y5tcrYKNLK3B6/rwV6+3HeuuxhcBz2ZX/F9pUWTbYEs
	 YBXBgRwY6uB7lRQlxxo4kXrb8nMhy0IW616dPfsdF77zbHaCcp8btD4JhIBUMknHW5
	 d4MeuIJM7GJ6F9oDQ4lwUHJ54+SaJ0awD7/Q+RHUMGNY2hz/iqIRk0dcT6pWDCChqm
	 s7UovzhkqzWyRU6o+5nu0ShMvqjiHijzNY+q6XTIE8y5xkfFep41mW8bJMOwb8w2ql
	 lnOkwlcwQq+JQ==
Message-ID: <a35b5300-c5f4-4af7-b566-194724451d37@kernel.org>
Date: Wed, 27 May 2026 12:06:52 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
 <20260522102251.1723392-10-claudiu.beznea@kernel.org>
 <ahBMKWrKQDko3cG8@shikoro> <fb892151-33e5-4bb2-9a01-9abebe0f3b39@kernel.org>
 <ahXQnt4MTVoBB9bF@shikoro>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahXQnt4MTVoBB9bF@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37564-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7E51E5E190E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Wolfram,

On 5/26/26 19:55, Wolfram Sang wrote:
> Hi Claudiu,
> 
>> Could you please let me know what do you consider we should do here? Do you
>> think we could drop these pin controller setting and do some particular I3C
>> controller settings instead?
> 
> My original thought was: If it was a boolean state which is active when
> suspending and disabled when resuming, then we wouldn't need a customer
> specific binding for it and just do this in the suspend/resume functions
> of the pin-controller...
> 
> ... BUT ...
> 
> reading more about this in the manual, just raises more questions for
> me.
> 
>> The output is fixed at Hi-Z and no data is transmitted to the inside even if
>> data is input from outside. “Standby mode” is available when using I2C mode
>> only. (Not available when using I3C mode).
>>
>> The current driver proposal don't take into account the IP mode when setting
>> STBN though
>> pinctrl_pm_select_sleep_state()/pinctrl_pm_select_default_state() to keep
>> the code simpler, relying on the "Not available when using I3C mode" part of
>> the note, and considering setting it when the IP is in I3C mode is harmless.
> 
> This is one question I also had: What does "not available" actually
> mean? Did you confirm with HW guys that it is really harmles?

I asked this yesterday, but I don't have an answer to it.

In my testing I haven't noticed any issues with it.

> 
> I also wonder about the intended use-case of this mode. "no data is
> transmitted to the inside even if data is input from outside" doesn't
> really sound like a mode intended when the whole SoC goes to sleep.

Indeed, that's why I chose in the driver to touch it though the runtime PM APIs, 
so it can be configured after the I3C IP is no longer used.

> Why
> or how would input be even transmitted to the inside if everything is in
> a deep-sleep state? I could also imagine that this mode is rather used
> to hide from the bus for a while for some corner-case reason.
> 
> And finally: does this really save energy? 

I don't expect. I'm not sure I can measure it. I also asked to the HW team.

> Could you measure a benefit?
> Maybe there is nothing driven at all in the sleep state? Then, nothing
> is gained? Not clear from the datasheet.
> 
> Because the datasheet is so sparse with information and because it
> doesn't say how STBN is intended to be used, I would argue we should
> skip it until we know what it is for and how it is used. If we know this
> somewhen, we can still add this in a second step.

OK for me.

> 
> But for now, enabling I3C realiably is the first step, and for that we
> surley need the POC bit to select the voltage. This is easily
> understandable and straightforward to do. So, my suggestion is to pick
> this low-hanging fruit now and reach for the other one once we have more
> information about it.

OK, I'll re-spin this dropping the STBN feature until further clarification.

-- 
Thank you,
Claudiu


