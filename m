Return-Path: <linux-gpio+bounces-35644-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F/vMJFa8GlQSAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35644-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:58:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2416247E5AA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C2AD3092948
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 06:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6590A35F18D;
	Tue, 28 Apr 2026 06:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gcgabdgk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571813624B0;
	Tue, 28 Apr 2026 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359283; cv=none; b=ADHS7CYjcq+V1FYdyQs7prb8ZkuTXLEh5GDqRrM3MsNlOQ2apuMtHJ/Bdn9CTL+PXdZmty9kUjhT8i+iLem+R6eocipE9LELlotJS5lpUcJLPxyfGuLOJm5hCDxSan9N+DsrCAR/pJfb3jmW6VummhHCn6zyRRj48d6wdNnAHiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359283; c=relaxed/simple;
	bh=87ptCNzS8etKpoWXXSIt1nI1bb8JpNih5tPXA5yoe7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTKBToiTxin8USqrN3BF7oVebrgxQU+wH6t7lOPBDMXXHB6OVs0PeJtV7CV4gMUH6kuP94NqIS1AiI1wFCggEZ303G/X2KXeQHc+m7yl/duFiixu3T49M+hv4z10dYY5EKBGeVyhnjSSujOeD+R1oMYYYia14O5DXiamBZ1g5/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gcgabdgk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AED8C79;
	Tue, 28 Apr 2026 08:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777359177;
	bh=87ptCNzS8etKpoWXXSIt1nI1bb8JpNih5tPXA5yoe7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GcgabdgkUGAhD8dHOr51bUB4+AywC/FxGzLk4AIQNxebdhFp5MMOs8lwePEzgIggF
	 6d9YJmk2KvAuZq0itz4fSkOHFTAVCHcsrXUrkSMq8MnNBazBQl+Hr1Tz233mFiiWG5
	 qus9OWCp8Rzt4gu3NAmmaoy6MePlOc9OlZHtR49Y=
Message-ID: <3150bbb4-ff19-4c17-9431-35d33fa97223@ideasonboard.com>
Date: Tue, 28 Apr 2026 09:54:36 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
 Linus Walleij <linusw@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Bartosz Golaszewski <brgl@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "G.N. Zhou" <guoniu.zhou@nxp.com>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
 <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
 <CAD++jLmi1Q4sGeY6vK7fxw8AdCmiiW-8kdEi4OFkV1xep=Od_A@mail.gmail.com>
 <AS8PR04MB9080113A71D87E952561FC53FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <CAD++jLkuDWPd5KsKTpQ=htyupaXEwkPt_jV+RNngs+TTVkYSkw@mail.gmail.com>
 <AS8PR04MB908082A6E403407A88D3978DFA372@AS8PR04MB9080.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <AS8PR04MB908082A6E403407A88D3978DFA372@AS8PR04MB9080.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2416247E5AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35644-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]

Hi,

On 28/04/2026 09:17, G.N. Zhou (OSS) wrote:
> Hi Linus,
> 
>> -----Original Message-----
>> From: Linus Walleij <linusw@kernel.org>
>> Sent: Tuesday, April 28, 2026 4:50 AM
>> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>; Mauro Carvalho
>> Chehab <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof
>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Frank
>> Li <frank.li@nxp.com>; Vladimir Zapolskiy <vz@mleia.com>; Bartosz
>> Golaszewski <brgl@kernel.org>; linux-media@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; imx@lists.linux.dev;
>> linux-gpio@vger.kernel.org; G.N. Zhou <guoniu.zhou@nxp.com>
>> Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
>> remote GPIO data source
>>
>> On Mon, Apr 27, 2026 at 11:13 AM G.N. Zhou (OSS)
>> <guoniu.zhou@oss.nxp.com> wrote:
>>> [Me]
>>
>>>> I understand that the driver needs to deal with this in a
>>>> per-gpio-line basis though, have you considered:
>>>>
>>>> 1. Just hard-coding this into the driver based on the .compatible
>>>>    string, if the remote GPIOs are always the same for this TI thing?
>>>>
>>>> 2. If it is just for one particular system, you *could* actually have
>>>>    a table/mask inside the driver for this:
>>>>    if (of_machine_is_compatible("my-funky-system")) which will
>>>>    kick in only on that very machine,
>>>>
>>>> 3. If you really want to store the information in the media i2c
>>>>    device node, add some custom property like this:
>>>>    ti,remote-sources = <0x0000001f>;
>>>>    where a bit is set to 1 for each GPIO which is remote.
>>>>
>>>> Putting flags on the GPIO lines themselves seems too complex and
>>>> system- specific.
>>>
>>> Thank you for the detailed feedback.
>>>
>>> After considering your suggestions, I think option 3 (custom device
>>> property) is the most appropriate approach for this case.
>>
>> Why is that the most appropriate?
>>
>> I think (1) is most appropriate, if the hardware with this compatible always
>> looks like this. You need to answer the question if this is a per-system flag for
>> the GPIO lines or something that is *always* applicable for a device with
>> compatible ti,ds90ub9NN-q1?
>>
>> If it for example always applies to ti,ds90ub971-q1, then make that compatible
>> decide how to handle indvidual line, just write code for it. That is case (1).
>>
>> If this setting depends on how the serializer is integrated and the remote
>> setting may apply to some systems with this device and not others, you have
>> options (2) and (3).
>>
>>> However, I initially implemented this using a custom device property
>>> (ti,gpio-data) in v1 [1], and Vladimir rejected that approach.
>>
>> Vladimir is saying that the driver code should handle this without any extra DT
>> properties. That can be done with approach
>> (1) and (2). But I don't know about that.
>>
>> I think the basic problem with the patch is that no-one (myself included) apart
>> from you understand what a remote serializer is, why it is remote and what
>> that means, how the mechanism between the components making up this
>> essentially works etc. I.e. a much longer and more detailed commit message
>> and binding explaining very cleary what this is and how it works and why the
>> special property is needed on some lines, and how it is a property of some
>> specific way of integrating this GPIO controller.
>>
>> If a custom property should be used ti,gpio-data is too generic, come up with a
>> property name that actually says what it is all about and which anyone would
>> understand. "gpio-data" is a bit "the thing that does the thing" and overly
>> generic term.
> 
> Thank you for this feedback. Let me explain the hardware architecture and the
> reason I chose option (3).
> 
> Hardware Architecture:
> SoC --- I2C --- DS90UB960 (Deserializer) ---+--- FPD-Link --- DS90UB953 (Ser) --- OX03C10 Camera
>                                                                             +--- FPD-Link --- DS90UB953 (Ser) --- OX03C10 Camera
>                                                                             +--- FPD-Link --- DS90UB953 (Ser) --- OX03C10 Camera
>                                                                             +--- FPD-Link --- DS90UB953 (Ser) --- OX03C10 Camera
> 
> Each DS90UB953 serializer has 4 GPIO pins. One of these GPIOs connects to the
> OX03C10 camera's FSIN (frame sync input) pin for multi-camera synchronization.
> 
> The Problem - Remote vs Local GPIO Data Source:
> -----------------------------------------------
> The DS90UB953's GPIO pins can operate in two modes:
> 1. LOCAL mode: GPIO data comes from the I2C-controlled GPIO register
>     - Standard GPIO expander behavior
>     - Data written via I2C controls the pin state
> 
> 2. REMOTE mode: GPIO data comes from the DS90UB960 deserializer
>     - The DS90UB960 generates a frame sync signal internally

While not exactly part of this series, how do you handle UB960 
configuration? I don't remember all the options, but if I'm not 
mistaken, a GPIO can be generated internally (e.g. frame sync you 
mention), but it can also come into UB960 via a pin (could also be used 
for a frame sync). And there were some debug options that can be exposed 
via the GPIOs.

I'm not asking to implement all those, but I think it's worth at least 
going through them, to have an idea if whatever is done now could 
possibly support the other features.

>     - This signal is transmitted to the DS90UB953 via the FPD-Link back channel
>     - The DS90UB953 routes this remote signal to the specified GPIO pin
>     - The GPIO pin state is NOT controlled by I2C register writes
> 
> For camera synchronization, we need REMOTE mode: the FSIN GPIO must receive
> the frame sync signal from the deserializer, not from local I2C writes.
> 
> Regarding option1, the remote GPIO configuration can vary between different board
> designs using the same TI device, so hard-coding based on .compatible wouldn't be
> flexible enough.
> 
> Regarding option 2, if I understand correctly, driver would require adding a new
> compatible string or mask entry for every different board configuration, which
> doesn't scale well.
I think option 3 is okay.

Although I (perhaps naively) think that the approach in this patch feels 
nicest: the user just defines the GPIO the normal way in the dts, and 
marks it with a REMOTE flag. But I think the REMOTE flag should be a 
device specific flag. Are those allowed?

But now, after writing the above, I wonder... If we use the REMOTE flag, 
that will be in the consumer side of the GPIO, i.e. in the sensor node. 
A 'ti,remote-sources' (or whatever it would be named) property would be 
in the provider, the serializer node. Which one is the correct place to 
configure a thing like this? The REMOTE flag is not quite like the usual 
flags in gpio.h, as the sensor works fine (wrt. the gpio) with or 
without the REMOTE flag.

So maybe 'ti,remote-sources' in the serializer node is better, after 
all, to configure where the serializer gets the GPIOs value...

As for doing this configuration at runtime, with no DT changes... In 
theory that would be possible with custom V4L2 controls to both the 
serializer and the deserializer. But I don't know how the user could 
ever know how to configure it, without having detailed information about 
the HW.

For example, let's say the board generates a frame sync signal (a pulse, 
30 Hz), which is connected to deserializer's GPIO pin X. The deser needs 
to be configured to take the signal from pin X, and forward it to 
serializers 0,1,2,3. Then the serializer needs to be configured to use 
the "remote" gpio X from the deser, and provide it from the serializer's 
GPIO pin, going to the sensor.

  Tomi


