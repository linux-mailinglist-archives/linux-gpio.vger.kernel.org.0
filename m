Return-Path: <linux-gpio+bounces-37491-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBoYJ61NFWpMUQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37491-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:37:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8E5D1C2A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15BFA3011F0C
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 07:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670203CB91C;
	Tue, 26 May 2026 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sjb1/1yN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3F936212C;
	Tue, 26 May 2026 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781032; cv=none; b=GhO2ercNdsQ5ygvWpbQ49l8uYrtds3DhjiaMHYjUY/1JtMRaD6Rcq1yzT6qg0DngAJzJikU/hEPPCFRGQUJrxhJgJuulGPikqYiRhxij0ZBzARzBZvhocZvfUQEnUbTCcLhGMrPEevBeTizncJz5828q1IO1LiOipt8soqsc8rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781032; c=relaxed/simple;
	bh=WDUEc3nT6D7k35uGIEKrh+UkfK8RcrRLdCs8npGj4o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/HhQjdDGjAPiGpf0I2ewNYkGMHSTPy8iF7sc3ZbrDrGGuE0U7TMAnpnv6ahfAvVUTx3hZn3e5oWsXteMTfHrFuPLbB87wI9lQz/+mUSZ8ZNpqLaJs7GcH+V69PYoV7lECTLFIl0meB9cswH6DRwsBFVgINixCx79BfiXd18XSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sjb1/1yN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA611F000E9;
	Tue, 26 May 2026 07:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779781030;
	bh=gSk1dsE4fG3ioQpFNYc3UhWQSgEMFs6oXA7PxJFF5PU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Sjb1/1yN2pyX4qYw3eemrH0bH6JVbbzXPw9NkmceTWmu/hX5yRWPqCyvLlkBdDD+W
	 Ys4gDbUgb/K/3KwVCTrH8xJYjKRiPgfiJxDWyPaCOYmiptAquS8NPUhWejFK302XOv
	 BfHRp71rv97T+KrEUPqwUf2z42WCpRcWrFDPg6PoIHaVQSVHbOSHL9mFVAGmNRkZ6c
	 qenV2bRClX0zTw709X1q0lZv0Hn3fLovm+0Q06gCAmySnX7FmBpSmDG+2nT8GcL1Xx
	 VEhnSBaPUU7Kb3qyrwUner+vqJka++zVam/nf/Q0yuFxszKctM03WxlEnT2bsy1ILO
	 yxdH3JcfHXFBg==
Message-ID: <fb892151-33e5-4bb2-9a01-9abebe0f3b39@kernel.org>
Date: Tue, 26 May 2026 10:37:05 +0300
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
 <ahBMKWrKQDko3cG8@shikoro>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahBMKWrKQDko3cG8@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37491-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2EF8E5D1C2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Wolfram,

On 5/22/26 15:29, Wolfram Sang wrote:
> The driver should
> know what to do, or? Am I missing something?

Could you please let me know what do you consider we should do here? Do you 
think we could drop these pin controller setting and do some particular I3C 
controller settings instead?

The documentation on the I3C_SET.STBN is limited. There are 2 places in the 
manual (Rev 1.20) that references it, both in the pin controller chapter.

The 1st is the "Figure 45.13 I3C (I3C_SDA, I3C_SCL)".

The 2nd is I3C_SET register documentation where it states:

Control the standby mode of I3C Interface.
0b: Standby mode*1
1b: Normal mode (Initial value)

With the note 1 being:

The output is fixed at Hi-Z and no data is transmitted to the inside even if 
data is input from outside. “Standby mode” is available when using I2C mode 
only. (Not available when using I3C mode).

The current driver proposal don't take into account the IP mode when setting 
STBN though pinctrl_pm_select_sleep_state()/pinctrl_pm_select_default_state() to 
keep the code simpler, relying on the "Not available when using I3C mode" part 
of the note, and considering setting it when the IP is in I3C mode is harmless.

-- 
Thank you,
Claudiu


