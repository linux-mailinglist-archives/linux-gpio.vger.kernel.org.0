Return-Path: <linux-gpio+bounces-37883-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4U/TGMDjH2qArwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37883-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:20:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B4635A25
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:20:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="SWvm/YIk";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37883-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37883-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E2AD304D49B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 08:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C43640913C;
	Wed,  3 Jun 2026 08:19:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2618472;
	Wed,  3 Jun 2026 08:19:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474779; cv=none; b=lty3YuNbCfKviaKU8qW8DcD4PFOHSM0zQVx1+rinB653mqD1RhLM35XHlkn5egw/lg0+4uchFjm2fMqpv1ezUXovpajcr6G2QdjDzmtAQqLE+8cGaqxfdrgu67oGfjeBTsOy+XOCTjfD+sTicGYuzNnsqIw1YOHuJFzcGN/X1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474779; c=relaxed/simple;
	bh=nWwjS8Mr20fDWKSL0zfgfubdVpa6oMYco7fA71M/hAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrkX6Ci346Gu1YicPzXX4GfBMle5pWQr0iiwaAXSBF8lEhyioNiYAp8nmqLOthDHAqbqTtlQ5L8j5RtLArPFMsLBb3I5tOt7TH6thj18K4gWBO54fkIY0ArgrAbRjMZsiP4+NOe6yrgio7ojG3Au8IU1KrkLrSMsupTqbzwspoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWvm/YIk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919751F00898;
	Wed,  3 Jun 2026 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474778;
	bh=JcYA2oFILzb6weg9P7dCyayz8oFLadaOOZdee5CSgOQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SWvm/YIkETWsR0+HHd1o6beNzkUd/KKdobYbOCh05Lm+8gIhs4MeR+3xEl9obrGdG
	 AqcHLpG+OjWP2m7BsJBU+w0xU5V8XWaQZdVFMqF2foRkSTVshRUZ3jBL06Yq4ZYkKZ
	 r3ejsSBdm40Il+8NXJWCnIJBhRXtMKtKnoJ8damxm3i8IVOV7xGr7zopfE81FnvcvM
	 2+SwgmTWA9QHrG56g+yJI4cAMWTZ77P1vkUOCmIEYxu9VzCwF3xUNQxzB5PFWANCy7
	 LbG/3gyg1Jk94lM2BPOHAWJZMO7miFmlMolxUJO+8WE8gW6PUUgS3eB7MGF/ut7272
	 6j8u8jBMoB40Q==
Message-ID: <096df078-1027-44f2-b02c-c0a27b646a87@kernel.org>
Date: Wed, 3 Jun 2026 11:19:33 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-2-claudiu.beznea@kernel.org>
 <ah9BkQjUKwZ9KXMH@ninjato>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ah9BkQjUKwZ9KXMH@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37883-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 397B4635A25



On 6/2/26 23:48, Wolfram Sang wrote:
> On Thu, May 28, 2026 at 11:04:33AM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The current functions used to get/set the pin power source check the
>> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
>> code to be extended for other power source functionalities (e.g. I3C on
>> RZ/G3S), generalize the functions used to get/set the pin power source.
>>
>> For this, introduce the struct rzg2l_register_masks data structure whose
>> purpose is to store SoC specific register bit masks. The members of this
>> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
>> corresponding to a SoC specific power source capability.
>>
>> The conversion between HW specific power source values and SW specific
>> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
>> rzg2l_ps_to_pwr_reg_val().
>>
>> Finally, to keep the code generic, the register update in
>> rzg2l_set_power_source() was changed to a read-modify-write approach to
>> cover all cases.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Have you seen the comment from Sashiko about this patch? Doesn't sound
> entirely wrong to me...

Indeed, that should be fixed. I'll add a fix patch in the next version.

Thank you for testing this,
Claudiu


