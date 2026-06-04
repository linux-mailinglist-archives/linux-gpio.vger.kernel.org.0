Return-Path: <linux-gpio+bounces-37941-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VKEHNr9fIWoxFQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37941-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 13:21:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E8963F608
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 13:21:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VZ4LecXb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37941-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37941-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AEA1B3008CBF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 11:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDFD40B6DD;
	Thu,  4 Jun 2026 11:12:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266E1409E07;
	Thu,  4 Jun 2026 11:12:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571560; cv=none; b=DXnv+aQ7Svlb+NOnDSROLa1nHXlbvNJ/r+aGA6SMUggTcB9hbakofAGPRCndmENuXqIm0816sKiL0WZnIDsG/P2drAKGB8DJnE86pqlrYHWE7i32AcZgx2TujjDfnZY05/bvYpA+PZ/rV01a+irDNmEcrlBehrB7Lsj2RD6OUpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571560; c=relaxed/simple;
	bh=I88HAvooNXAVPw8et8v7wZotnTTMMoPuZDI3XrkfNDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ST/1DWLJNZo1JoG6k35RakZUtuZAVa5oAzKtr0bXmQbJD52XObfxqs+e2tSTg9AY7ZfciB2lOdF0ZvaDtujzmMab5QBa9W8YN1TZ546oQzsuC5Y553SDy88JiDznOxBsUxU+P23h4jej5ms5OjAFlwtOi4UqaGXsUvLJYNplooA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZ4LecXb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1891F00893;
	Thu,  4 Jun 2026 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780571558;
	bh=sZQ6a4Dsms3if87ljXUV9N/jMfWtTZ5A6QMP9+mvWcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VZ4LecXbsqHS1ifoNGgx4ZZDqRtVBGq4jk6Weo/TXACMfPjSQ+flOlvRxTPi6+R9h
	 tgr8wcZlTCTcWcJS4eYjwVLbcuc+hMEl87mMK5ZAq01lRuWqoXGeNS/Pf53IDmtks7
	 cPYyJu8xJmugv0GjCGl+xdSfMiufgvhXaw+nA93E3FRosHZxICcEi/spQO28FmmYGo
	 4wV++uWOnVQxQlugw/Ljcj1AJX1Eu6F/ZBYBXGhjgqcYJGweDEOpXFY0WuUtcME0L7
	 C3DxG7j7YqyI9xMmXgy221Bxb5ZHCo5+6IxOKaBRDsbL0Vg8+sftXqpqlQoZbZW2X4
	 ZuTUUaJpFiZVg==
Message-ID: <dc1c2c1c-73f1-43a9-a157-7cd362faf89f@kernel.org>
Date: Thu, 4 Jun 2026 14:12:34 +0300
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37941-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18E8963F608

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
> 
> I also wonder about the intended use-case of this mode. "no data is
> transmitted to the inside even if data is input from outside" doesn't
> really sound like a mode intended when the whole SoC goes to sleep. Why
> or how would input be even transmitted to the inside if everything is in
> a deep-sleep state? I could also imagine that this mode is rather used
> to hide from the bus for a while for some corner-case reason.
> 
> And finally: does this really save energy? Could you measure a benefit?
> Maybe there is nothing driven at all in the sleep state? Then, nothing
> is gained? Not clear from the datasheet.
> 
> Because the datasheet is so sparse with information and because it
> doesn't say how STBN is intended to be used, I would argue we should
> skip it until we know what it is for and how it is used. If we know this
> somewhen, we can still add this in a second step.
> 
> But for now, enabling I3C realiably is the first step, and for that we
> surley need the POC bit to select the voltage. This is easily
> understandable and straightforward to do. So, my suggestion is to pick
> this low-hanging fruit now and reach for the other one once we have more
> information about it.

This is what I've got from the HW team:

The purpose of STBN is to control the standby state on the I2C side. It is not 
intended to control transitions to a low power consumption mode such as VBAT mode.

In I2C mode, enabling standby mode places the device in a non-communicating 
standby state while maintaining the I2C configuration. The outputs are set to 
Hi-Z, internal transmission is stopped, and communication is disabled. As a 
result, the bus is effectively not actively driven.

In I3C mode, standby control via STBN is ignored even if configured. STBN can 
therefore remain set to 1 while the clock is turned on and off. In I2C mode as 
well, it is acceptable to keep STBN = 1 while toggling the clock on and off. It 
is also possible to change the STBN setting while the clock remains enabled.

Standby mode is not intended for power consumption control, but rather for 
placing the I2C interface into a standby (non-communicating) state.

-- 
Thank you,
Claudiu


