Return-Path: <linux-gpio+bounces-37367-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCNUF4hXEGopWgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37367-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 15:18:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE85B4F85
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 15:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B60C301B3DC
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AFE394E80;
	Fri, 22 May 2026 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5nGxVmZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03C7388893;
	Fri, 22 May 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454914; cv=none; b=jbmaclz3C9Crs7yuxffjRUqcojUY/OQGv+R0tuSuQ13JIfZBtUgz2DD/GwCtBGCOEnh+aARdgDlBDtUrEu8IMg7L8YUKNpqFaf8R0zFEdYNQpZz2GHRriDJqZu52jKqdYFa6wn1KrzhnPrsWAMibs8fRzogA9bvd5HfiXdYYiqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454914; c=relaxed/simple;
	bh=Es7Vb9ABTUmgzzmnqEEGOu7GP+RMFAjOpM00ciITgFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9g29ZaBcKOVdl8RkOWQcpOy0hPiHYyczMYl21Sm4TtBllanX4ejpk/LrbILWbDZ3fhe6jK/JaZWpXGiWQA5h8qS2++CTP3ESegQLuHnCb6RhDkidWcCX2L81sGQpco9zGxiFuzyNCNzm9rjiZtbrItL30B6OKA0FNfM4ESZxok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5nGxVmZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEC11F000E9;
	Fri, 22 May 2026 13:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779454913;
	bh=iAvcOQlHfItm6RV8kDuEo5a7+X4i437AKkSh6Oa6+5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T5nGxVmZhnWsSDibU0hWrbUOcLh39IfcYmSPjEoMhdS+SGEYRzQhUeKOomYjfeJX1
	 hKbaSjobLHiKV6lzFL/6LClX7PZoKtSbp4CLMe/yvMVzILMdiNUwYPY1yUfXiq/7qh
	 PB/8skuf3e6Y112NpVRICUhZ1PW0vmIGVzafRBwRStTg+xuLt4URx/FALzHXATUp2r
	 2DNCwHw1T+Ke++b9/50j185f4KvZVceitez4wpPnjLdHonbAdu+AGNdmUvEod/qtSq
	 c6LdcUpIgBoELj6Q/Fa5+sh++jHC+lyR/MzARpNY9H+8eSRNfUPjVxxlYeEGKp57MG
	 8T8nX2rZhgyBQ==
Message-ID: <f2ffcf92-34b7-40e8-877c-669c2d320506@kernel.org>
Date: Fri, 22 May 2026 16:01:48 +0300
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
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37367-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F2EE85B4F85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Wolfram,

On 5/22/26 15:29, Wolfram Sang wrote:
> Hi Claudiu,
> 
>> +	i3c_pins: i3c {
>> +		pins = "I3C_SDA", "I3C_SCL";
>> +#if SW_CONFIG4 == SW_ON
>> +		power-source = <1200>;
>> +#else
>> +		power-source = <1800>;
>> +#endif
>> +		input-enable;
>> +		renesas,i3c-standby = <0>;
>> +	};
>> +
>> +	i3c_standby_pins: i3c-standby {
>> +		pins = "I3C_SDA", "I3C_SCL";
>> +#if SW_CONFIG4 == SW_ON
>> +		power-source = <1200>;
>> +#else
>> +		power-source = <1800>;
>> +#endif
>> +		renesas,i3c-standby = <1>;
>> +	};
> 
> That doesn't look like HW description to me because the pins are the
> same for regular and standby mode.

Yes, same pins, different states. Isn't that the role of different pinctrl 
entries in DT for the same node? E.g., for SHDI we use the same approach, same 
pins but different states. Bellow is an example from RZ/G3S but same approach is 
used for other Renesas SoCs as well:

https://elixir.bootlin.com/linux/v7.1-rc4/source/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi#L305

https://elixir.bootlin.com/linux/v7.1-rc4/source/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi#L321

> Their state is changed when powering
> down, but that should not need DT encoding, I'd think. The driver should
> know what to do, or?

Through different pinctrl states different pinctrl settings are applied in the 
pin controller HW by calling well known pinctrl APIs from the consumer drivers 
(e.g. pinctrl_pm_select_sleep_state() in case of the I3C driver as proposed in [1]).

Is there another way the I3C driver (or any pinctrl driver consumer) could apply 
pinctrl settings?

[1] https://lore.kernel.org/all/20260522101815.1722909-18-claudiu.beznea@kernel.org

-- 
Thank you,
Claudiu


