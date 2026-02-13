Return-Path: <linux-gpio+bounces-31652-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yETxAUvfjmluFgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31652-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:22:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F90133F73
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D8CC302D96D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 08:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647893161A4;
	Fri, 13 Feb 2026 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKaclgpJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2506A27F005;
	Fri, 13 Feb 2026 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970899; cv=none; b=C3/QDAn9gF1ViFJ/FkmsUrgPoy5UOh4o8r9mU9O/q7nYdNKE7xWAZ+wy4p1OTTW0BBBVN0J8cTJ90Dnzoebjr33+nqgpHgp07L1vKDcagcZ8LX3tcxcHRRCEDFdW3H4n78LC0rYtPib9lDrO6G34rFOe2hzeSG0QLaqqa6gZ+xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970899; c=relaxed/simple;
	bh=Z5PhnKVNT+CKs2AEO0dXnHGG+26A6uAvZNtL9tY8HW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElId3aV3upBTIq9fn43buxoy1nm2WcpmaPsnDmCCMxwT3LrMv126ykNV0nAxKxIne30nym3ctN8s67nMswLmJmS6eKKzjtBve2ch2gShZ6B5Y9BpDJzrcBGwrNqcZARrfRqzMkgibaJQGMmYZxksrLjOCxswFiJX7VPKRMrYVs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKaclgpJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25241C116C6;
	Fri, 13 Feb 2026 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770970898;
	bh=Z5PhnKVNT+CKs2AEO0dXnHGG+26A6uAvZNtL9tY8HW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kKaclgpJ9xy6XAIMl77qtXz/wKzdxBSflmnUiHGZpefGAxyrUEpJsFVXQWKIcHX5K
	 dNp97fIlGu4XohPO/UbJGPAoK6xRyIUrjKbg23s3iluWw65IFWRpftxc2J7M1asnUP
	 71YzBt5Fe2uGmdk3uccA6nkZQbcVZ9Y0b3wmPErwkFZTOQCxIqldM8GNwLOcwsbS7f
	 7m1Off2kAEClqYs3EZbTkhvYmpNsfU4jMLT+6R3WFFL/liUneGWdCjwirdeKEt/79U
	 x9UtRzj3leD5S9tR9+RpyIyzKEF8/XTVSRlrcP7Ot8V/P2I7fNIX9Htsli5oW//91W
	 EWcs9Vj1t+m+Q==
Message-ID: <7ac8c937-61b7-41e3-a4f7-b3e4256e727a@kernel.org>
Date: Fri, 13 Feb 2026 09:21:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT
 compatible
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Stein <linux@ew.tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>
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
 <CADvTj4rhn32T=AOqq8boK6r0JXzV5oZ+CPWBEejLrUpP1771zA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CADvTj4rhn32T=AOqq8boK6r0JXzV5oZ+CPWBEejLrUpP1771zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31652-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 90F90133F73
X-Rspamd-Action: no action

On 13/02/2026 09:02, James Hilliard wrote:
> On Fri, Feb 13, 2026 at 12:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 12/02/2026 20:16, James Hilliard wrote:
>>> On Thu, Feb 12, 2026 at 12:18 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 11/02/2026 22:49, James Hilliard wrote:
>>>>>>>>>
>>>>>>>>> Regardless of the DT bindings - this change is perfectly fine. We do
>>>>>>>>
>>>>>>>> You cannot have compatible without DT bindings, so this alone is not
>>>>>>>> "perfectly fine". Maybe you wanted platform_device_id entry for
>>>>>>>> ACPI/legacy/MFD devices?
>>>>>>>>
>>>>>>>
>>>>>>> Sure you can, you just can't put it into upstream devicetree sources.
>>>>>>> We have had a compatible for gpio-sim for testing purposes for years.
>>>>>>> Why would it be illegal to enable matching of platform drivers over DT
>>>>>>> for testing purposes?
>>>>>>
>>>>>> The primary issue is undocumented ones show up in 'make
>>>>>> dt_compatible_check'. I would like that to be warning free.
>>>>>
>>>>> Would adding it here make sense?
>>>>> https://github.com/torvalds/linux/blob/v6.19/Documentation/devicetree/bindings/incomplete-devices.yaml#L243-L245
>>>>
>>>> What would you like to achieve with that? The binding patch did not have
>>>> rationale why do we want it and here is the same question - what sort of
>>>> problem is being solved by adding it to incomplete (so wrong) devices?
>>>
>>> See details for what I'm trying to accomplish with gpio-aggregator:
>>> https://lore.kernel.org/all/CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com/
>>
>> I don't think that putting it into incomplete-devices would help you. I
>> assume you read the binding... You still could not use that compatible
>> in any upstreamable DTS code, even if this is only an overlay. You would
>> have warnings...
>>
>>>
>>> I'm basically trying to use it for the reasons described here:
>>> https://bootlin.com/blog/gpio-aggregator-a-virtual-gpio-chip/
>>>
>>> Is there a different device tree mechanism that can be used to
>>> name individual gpio lines on a gpiochip without having to name
>>> all of them for non-hog lines?
>>>
>>> I'm confused why a "gpio-delay" compatible is allowed but one
>>> without the delay param is not?
>>>
>>> Or is the issue just with the name of the compatible I used being
>>> called "gpio-aggregator"?
>>
>> No, the issue is that there is no hardware you are trying represent in DTS.
> 
> I'm trying to represent the physical board GPIO pin connections in
> DTS...so representing hardware is exactly what I'm trying to do AFAIU.


Sure, then please show me some sort of picture of the board/circuit or
piece of schematics with visible aggregator, if you claim this is the
hardware you represent.

You can also (as exception) send it to me in private, without leaking to
mailing list.

> 
>>
>>>
>>>> This is not a pure virtual device, but for use with actual hardware.
>>>>
>>>> Nacked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> I'm trying to use this with actual hardware, I just called it "virtual"
>>> because that's how it was described in the bootlin blog post.
>>>
>>> I'm confused about what the issue is here as "gpio-delay" is also
>>> a virtual device in the same way.
>>
>> gpio-delay IS NOT a virtual device. You can even touch it. Can I touch
>> your gpio-aggregator?
> 
> Sure I guess, the gpio-aggregator would be used to say define the
> physical GPIO lines for exposed peripheral connectors in my case.
> 
>>
>>>
>>>> Well, it is a virtual device in that there's no actual "aggregator"
>>>> device on the board. It virtually aggregates GPIOs into a separate
>>>> chip for user's convenience. While there's no such device as a
>>>> gpio-aggregator - and so we must not put it into bindings nor into
>>>> mainline devicetree sources - having a compatible matching in the
>>>> driver is perfectly fine IMO. Just like gpio-sim.
>>>
>>> There's no such "gpio-delay" device either right? I'm confused
>>
>> There is.
> 
> I'm not really seeing the difference, both are used to describe
> physical circuit layouts, the only difference is a delay configuration
> AFAIU.

I explained you the difference, so again, can you touch gpio-delay? Yes.

Can you touch gpio-aggregator? No (that's my claim, but I wait for
picture of the circuit I can touch).

> 
> Should the compatible be named something like "gpio-connector" or
> something else to indicate it's for describing physical connections.

Rob and Geert already pointed you towards the connector work and this
might solve your case.

Best regards,
Krzysztof

