Return-Path: <linux-gpio+bounces-37624-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAiZBPcBGGp+ZQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37624-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:51:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9975EEF4A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 323B63013A53
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357753845B6;
	Thu, 28 May 2026 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKbsBXKC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098F9377558;
	Thu, 28 May 2026 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957978; cv=none; b=XkNHdrwS5s9nYQJp7tkuLVJe3N5AgiQQppIpKax7dY2BBnl8dXxbqsm6om1igCh/QLsQPva8+CV9lUhp3VQoJ/XLlW63h+2m3IC5TYXElMv3sXMpPWUhy93bOcGIHEqp4ofSyhZgsw4+nPw5xv2uQXnC70KzL7Nsg8fUalNf9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957978; c=relaxed/simple;
	bh=bCw1mziPAWq/LFTvN5yIdeNzZL/wui4MxRIIvoGyqOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxTUM4tSNShR/M2BcHhh3vaLeqifVHBZ2qQFtX9n0/ekWeq7arjQFa9lz3yRgurU3hNeRER6UU36ljgx+m0bYMOvvT+yITsRfu0H81skexHF48ttq8JEn3cXg035uiHb1hikWmZOm9zMC2/6xgMwcQSuY+K/rpTofSb54fjNDak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKbsBXKC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9C11F000E9;
	Thu, 28 May 2026 08:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779957976;
	bh=WI7oT4rS33f9Z+daXxCWohJCYdbj3iwN4CHJSsXs+J0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RKbsBXKC3kpBLUM5x3zgOI/roHmPOSubwT/QosUm29nDe7oYMPqciLaXg4crgSSVx
	 mu9fsMLX8tFd4KFcWJPOCPvCs7LN8poDP6zfE/e71gNXwM30X9lfD84U8fiuhc0oQj
	 laSHVLWAc/9YviADQukNXLsqx7Ff6EE+XMcTWqgLa1UY2gCjXTSWHujUta/fqEb1rL
	 /flNqSlKZaXNP5aXXck8a/Qs79202gzzjHhn8Jw3k4dOfSeOU4yiIznWRMTBMlOxR8
	 KjosAdJ6/TPz8g+H/4Oi0niw4pQimcGreJqfActJRt68H8774WA8+bYT+bnMxnaOKV
	 y5Zz+/gUqbq3g==
Message-ID: <8df8e9dd-3d84-44af-899f-b46496506a19@kernel.org>
Date: Thu, 28 May 2026 11:46:11 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm" <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-3-claudiu.beznea@kernel.org>
 <TY3PR01MB113461A5FC6EEB722B947671586092@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <TY3PR01MB113461A5FC6EEB722B947671586092@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37624-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bp.renesas.com,glider.be,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7E9975EEF4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Biju,

On 5/28/26 11:16, Biju Das wrote:
>> @@ -3816,9 +3814,9 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
>>   	.regs = {
>>   		.pwpr = 0x3014,
>>   		.sd_ch = 0x3000,
>> +		.qspi = 0x3008,
>>   		.eth_poc = 0x300c,
>>   		.oen = 0x3018,
>> -		.qspi = QSPI,
> Any reason for moving the assignment?

I tried to keep it sorted by the register offsets but it seems the pwpr is not 
in the right place either for this.
> 
> struct rzg2l_register_offsets {
> 	u16 pwpr;
> 	u16 sd_ch;
> 	u16 eth_poc;
> 	u16 oen;
> 	u16 qspi;
> 	u16 other_poc;
> };
> 
> Cheers,
> Biju

-- 
Thank you,
Claudiu


