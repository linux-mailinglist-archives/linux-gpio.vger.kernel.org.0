Return-Path: <linux-gpio+bounces-31656-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGObOrvljmkDFwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31656-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:50:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C9D134307
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5B04303FAC9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 08:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165D5349B0C;
	Fri, 13 Feb 2026 08:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t98A1toH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB119DF76;
	Fri, 13 Feb 2026 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770972599; cv=none; b=uCVPQhO0bsRbIXS2IpBSvAP1/HrExNW3wOhhynBFF/us88vAvNLSeqqST5xk5nesZjD4B9UaqiyyO1F9oZrr7FkIPtCTBcgdyT3km6QmhjY8dQV+M1R82uQvbxoUJALFvzUtVMJZC3DmsCNdVcimL8WoA3LA8teAzT78boT2Ouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770972599; c=relaxed/simple;
	bh=MbVoK4GTREQTGMIleb02zYT71orVkmHlmwhbCifQ/G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4AysByASeqaDhnBA5Ekhs9lhHGTErY0h8LYCDpKBSu9jTEPzDOOq4hoiwqLyIkcCCwTAJoWhYOXdKFUVxgmJfkhAmLqZ+BAgivU1F0U+twHtZh7X23TrtMgraoCmRMGTr3ok8MqZYZ+bLzENllgxgSDzAIKRnGDpLR91Qm3wKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t98A1toH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA11DC116C6;
	Fri, 13 Feb 2026 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770972599;
	bh=MbVoK4GTREQTGMIleb02zYT71orVkmHlmwhbCifQ/G0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t98A1toHdwcYWnrlEgANI/B9q6awe0uAhc0+fT611GK6bjNTWk8zsBWoLxmyIY+Ma
	 t5JiwuHYETtiusD6PpHWEZFKMkYwKBVK9TrHMdJy5HSLoizeiRhy/BESinY23uXI/g
	 ZBKUyJn3xWbXCy7fWQJit6z7/vY21gUwb3/C9KsloqJPaAqYsXjBumaAmCB7Qt+3Hl
	 6H1BncPBDKQvyVCCtyWYy9x+XT6c2LqbKGFYETis/PPZOrPIygRf6m0D/GZR//D5BN
	 w/8Pn0NCz7Hd3B5wDhx9yOjiYT616HpMOGenreiHTfYnCqyg+vFJ2CNeGMOMniEBgA
	 GVx1+8y27BF1A==
Message-ID: <0c6c8063-3c8e-49ad-a5cf-f751b3d9f2f5@kernel.org>
Date: Fri, 13 Feb 2026 09:49:55 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT
 compatible
To: Herve Codina <herve.codina@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Stein <linux@ew.tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <20260211081355.3028947-2-james.hilliard1@gmail.com>
 <CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
 <34a9b531-4f53-47ee-861e-1b18ff1a5752@kernel.org>
 <CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
 <20260211214708.GA3947691-robh@kernel.org>
 <CADvTj4p-zHMrXW+GJstB2sKS-7Wij98JNJGoiPiYmaP5RHhNQg@mail.gmail.com>
 <9afa52c1-b7de-4ccb-9114-a142567d21af@kernel.org>
 <CADvTj4pmAXo+KUMyB0=+x3HRdUdUq=baj_pnoa44oxnugZuTOg@mail.gmail.com>
 <89c0dd51-fdd5-4368-b5f5-615143ffd166@kernel.org>
 <20260213092914.79790cb9@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260213092914.79790cb9@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31656-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,kernel.org,vger.kernel.org,ew.tq-group.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 52C9D134307
X-Rspamd-Action: no action

On 13/02/2026 09:29, Herve Codina wrote:
> Hi all,
> 
> On Fri, 13 Feb 2026 08:31:21 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>>>
>>> Or is the issue just with the name of the compatible I used being
>>> called "gpio-aggregator"?  
>>
>> No, the issue is that there is no hardware you are trying represent in DTS.
> 
> Except if you have a piece of hardware that invert the gpio line.
> 
> In that case you need to set GPIO_ACTIVE_LOW somewhere.
> 
> The aggregator allows to describe this line inverter.

Of course. And then you could touch that piece of hardware and use it as
an argument here, where I asked show me the piece of hardware being
described.

Anyway, we encode the inverters in the final GPIO flags.

> 
> Of course, if the gpio is connected to a hardware component handled by the
> kernel, the DT node describing this hardware can set the flag.
> 
> The issue is for GPIOs that are just GPIOs and should by a user-space
> application as GPIOs.
> 
> Some bindings exist for GPIO and do not describe the hardware but the
> feature. For instance:
> https://elixir.bootlin.com/linux/v6.18/source/Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml
> https://elixir.bootlin.com/linux/v6.18/source/Documentation/devicetree/bindings/power/reset/gpio-poweroff.yaml
> https://elixir.bootlin.com/linux/v6.18/source/Documentation/devicetree/bindings/power/reset/gpio-restart.yaml
> 
> Can we consider the gpio-aggregator describing the wires that should be
> grouped together.

No, because the grouping depends on user-space choice (as explained by
the author).

> 
> Industrial board can have some GPIOs grouped together and used as inputs or
> ouputs of this industrial board.
> 
> As output they command an external system. As input, they get feedback from
> this system.
> 
> gpio-aggregator describes those lines.
> 
> In that sense, it describes hardware.
> Maybe the "gpio-aggregator" name doesn't reflect that and a compatible such as
> "gpio-equipment" could make sense.

What is a "GPIO grouped together"? The moment such grouping does not
depend on hardware characteristics, it's the moment it is purely
arbitrary choice thus not suitable for DT.

Comparison to gpio-restart where you have actual component, receiving a
fixed line and then doing restart is not appropriate.


Best regards,
Krzysztof

