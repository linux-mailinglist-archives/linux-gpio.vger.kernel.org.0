Return-Path: <linux-gpio+bounces-37331-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKyGHCAfEGqjTwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37331-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:17:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB85B0FE9
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86D2B3008CB4
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C323AFB0B;
	Fri, 22 May 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pnq5S84M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93205CA6B;
	Fri, 22 May 2026 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441431; cv=none; b=bu6SZS+5/L+whbl38O8zN4oALOtZE9kwv3Sd6F20OkUUPnUIGQdTjsK1jhyqWGsQPOWZqENV8nzYHAxu9V5Vs8C42pVQxBXHKrhOfKOFS8cUbknLHFCr9BS32fgi74U8sTqR1UhnwGS+V9Qwj1fPYGNicrHBs5sMxFUVH7QZs3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441431; c=relaxed/simple;
	bh=7FsT7Io1HwX6GQuGxqlQvtJ5Apbg+ApUtYK8rIeEkiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZVwiRNyeGbpbvwLV9ayqhpiRLkGsx9IIpd81yvNYk3pcMgHVJp07Z5hWGzh9PBFd6G3a7pFygza6PYT1VvU2c940yEyicDIJG8zwS6o2VbzsvTRaaE+9N+IuNew39H3e0fEJ1d2X86JKOJTHUAwE5seLa5bX9+i4lUynRNPwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pnq5S84M; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29011F000E9;
	Fri, 22 May 2026 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779441430;
	bh=EnDMOaYpKvg80tbbLkEJvBycItG1RtQ8Qo85D+AKCow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Pnq5S84M46OH7+YMlqxfD2yr4BJPyvgL6ydXAhMN7fqp7Co0UolDiD62yKl9Iyec7
	 ffxRTY4018jePAh6zPLWGqVOe4kuyIwy3zN1xAZ27rdGHZS6VQeUlBCEgArLZb3hcH
	 rNufFcTyJLAclcsjnGkhAzBCN3m83KoN2qpKfG/D/wZICtj1RQjOC7IfnaL99pLTbV
	 q/O8ntZONbttR/VSZlpFPYkPK9ZQOCjwR2arJPK+/qzxkrmx1YgXMoXz9E5g/nC3EF
	 b0EDdESa5W00ouJwWSoJ651lhsQ0IiiswIvFNhajNAc9PnNSdS1EnSLBgF+w2gMRfd
	 UIoItKsYoV9pQ==
Message-ID: <588934dc-8a92-4952-8280-cc131d2cf035@kernel.org>
Date: Fri, 22 May 2026 12:17:05 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Use -ENOTSUPP instead of
 -EOPNOTSUPP
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linusw@kernel.org, brgl@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com,
 claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org>
 <20260515124008.2947838-2-claudiu.beznea@kernel.org>
 <CAMuHMdVK7Wu=Lv1Qhu0+CMCQSXv6Lj6BoTdzVoW1K5Z=kgecag@mail.gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <CAMuHMdVK7Wu=Lv1Qhu0+CMCQSXv6Lj6BoTdzVoW1K5Z=kgecag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37331-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:email]
X-Rspamd-Queue-Id: 74DB85B0FE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Geert,

On 5/22/26 12:11, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 15 May 2026 at 14:40, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The pinctrl and GPIO core code make exceptions for the -ENOTSUPP error
>> code. One such example is gpio_set_config_with_argument_optional(), which
>> returns success when gpio_set_config_with_argument() returns -ENOTSUPP, but
>> reports failure for all other error codes.
>>
>> Returning -EOPNOTSUPP from the pinctrl driver on the unsupported pinctrl
>> operation may lead to boot failures when pinctrl drivers implements
>> struct gpio_chip::set_config, the system uses GPIO hogs, and the
>> struct gpio_chip::set_config implementation returns -EOPNOTSUPP for the
>> unsupported operations.
>>
>> Return -ENOTSUPP for the unsupported pinctrl operation.
>>
>> Fixes: 560c633d378a ("pinctrl: renesas: rzg2l: Drop oen_read and oen_write callbacks")
>> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v7.2.
> 
> I guess drivers/pinctrl/renesas/pinctrl-rzv2m.c needs a similar patch?

Yes! I'll prepare and send one.

-- 
Thank you,
Claudiu


