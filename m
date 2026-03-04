Return-Path: <linux-gpio+bounces-32477-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLH2H3kbqGmYoAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32477-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 12:46:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 386821FF381
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 12:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF61E30B86E3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 11:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4863822B6;
	Wed,  4 Mar 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozuTWSoD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D53A3537FB;
	Wed,  4 Mar 2026 11:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624502; cv=none; b=iwO5QGcvaej+ElJaPdks808tmActZ39f2xJBW5sW+13E9izCcoeTcYF1l3AiBqWYu2By9FB6TtCvNkoo1u/JSp/0ludivMZojK3XgV03aGIpDgYYY/J/3QS13v/qY04x/zXCTNZMXffFMfKDJ3AsZXDpdDZKmJgs8f94UIudW0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624502; c=relaxed/simple;
	bh=8XBKJFSYVkrlnbEwdWsm36bhQfjTOhlobMpxdbYqoQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsXbIHOPAgOv0Nb+bTsIVHPdLzbj6UDV5dUFl8db577ypj+z9sKyBc+W3i2xWR/nQBhyFIRBDFRjYLz3zHNHruWmw4T7XrkECifggLQ6SgvAHMl1YowcZne7ECBKb452KKbdSXj93I1frOUlw+T7nEaRkOl+a/UNR9UiybXzsh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozuTWSoD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5316C19423;
	Wed,  4 Mar 2026 11:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772624501;
	bh=8XBKJFSYVkrlnbEwdWsm36bhQfjTOhlobMpxdbYqoQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ozuTWSoD516BTpSKSDdGtRM7rJmBOCb1dlexlRepprMK58eWlq4BVfcnRN4rYl6D2
	 6Hc9JdjOF2DRA0jl9Hm+edbYbTJEgLgBorm85HrxMP5WG/Hl10/OyMzAX7x0o5XFNt
	 5VdBAtEACwqnUexScLW09jkQE8i3cLwWudfU+p+SGaWCkTLEUjRlswNtyCAisUf/r+
	 u8JensLn68/50+degdLvoYZNMyiXegob5T3lKZbOW08VLJjEINlGvoxgOnm+WWIJz7
	 +D7o7QTIMYz/Eufy9oobG20kxcWAwjyH97W0V+sZ9VUlB2guabmQqKZv12WPL70xIH
	 t54Bu/HsB4mzg==
Message-ID: <98debf2d-cc29-42dc-bb93-ee97439683fd@kernel.org>
Date: Wed, 4 Mar 2026 12:41:37 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
To: David Jander <david@protonic.nl>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 "Rob Herring (Arm)" <robh@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de>
 <177254885509.3251575.14819823286886805862.robh@kernel.org>
 <aacH7NmkOzZued0Y@pengutronix.de>
 <20260304-graceful-sweet-bittern-98efdb@quoll>
 <20260304100642.44d00b99@erd003.prtnl>
 <4d4c6ebc-698b-44c2-9a91-607381d6ece1@kernel.org>
 <20260304112500.4766f21b@erd003.prtnl>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260304112500.4766f21b@erd003.prtnl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 386821FF381
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32477-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,nxp.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 04/03/2026 11:25, David Jander wrote:
> On Wed, 4 Mar 2026 10:49:06 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 04/03/2026 10:06, David Jander wrote:
>>>
>>> Hi Krzysztof,
>>>
>>> On Wed, 4 Mar 2026 09:05:11 +0100
>>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>   
>>>> On Tue, Mar 03, 2026 at 05:10:20PM +0100, Oleksij Rempel wrote:  
>>>>> Hi Krzysztof and Rob,
>>>>>
>>>>> On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:    
>>>>>>>  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++++
>>>>>>>  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
>>>>>>>  2 files changed, 196 insertions(+)
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
>>>>>>>     
>>>>>>
>>>>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>>>>
>>>>>> yamllint warnings/errors:
>>>>>>
>>>>>> dtschema/dtc warnings/errors:
>>>>>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
>>>>>> 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
>>>>>>     
>>>>>
>>>>> Folding the mux node into the parent as suggested [1] causes this error.
>>>>> Because the parent now has #mux-control-cells, the generic
>>>>> mux-controller.yaml forces the node name to be mux-controller. Since
>>>>> this chip is primarily a switch/GPIO controller, naming the parent SPI
>>>>> node mux-controller@0 is misleading.
>>>>>
>>>>> What is the preferred way to go here?    
>>>>
>>>> https://www.nxp.com/products/interfaces/multi-switch-detection-interface/22-i-o-msdi-programmable-current-analog-mux:MC33978
>>>>
>>>> Name of the mc33978 device is "programmable analog mux" and further
>>>> description says "analog multiplexer for reading analog inputs ", so I
>>>> don't find "mux-controller" a confusing name. It is EXACTLY a
>>>> mux, so mux-controller.  
>>>
>>> Sorry to chime in here. I'm afraid the NXP description on that link you posted
>>> is a typo. It is not correct. This chip is primarily a "Switch Detection
>>> Interface", or in other wordt a switch input interface. Wee here for the same
>>> page for the MC34978, which is the exact same chip:
>>>
>>> https://www.nxp.com/products/interfaces/multi-switch-detection-interface/switch-detection-interface-22-i-os-programmable-wetting-current-temp-sensor-3-3-v-5-0-v-spi:MC34978  
>>
>> That's MC34978 and I commented on MC33978.
>>
>> What is the primary function of MC33978 being described here as the base?
> 
> The MC34978 and MC33978 are the exact same part (except for the temperature
> range). The fact that NXP has two different web-pages with two different
> descriptions of it certainly doesn't help, but you can also check the
> datasheet[1] description: "MC33978: 22-channel multiple switch detection
> interface with programmable wetting current"
> 
> Further down in the description it says: "It also features a 24-to-1 analog
> multiplexer for reading inputs as analog."
> IMHO this makes it clear that this is NOT primarily a MUX.
> 
> Actually, I doubt many users of this chip will use the analog MUX function at
> all since it has quite a few limitations that make it not very practical to
> use.
> 
> The most fitting Linux framework for this chip's primary funtcion IMHO is
> pinctrl/gpio, but there are some caveats unfortunately.
> 
> [1] https://www.nxp.com/docs/en/data-sheet/MC33978.pdf

OK, thanks for the explanation, but then primary function is not GPIO
either, because nothing on linked page says it is a generic purpose IO.
It says it is switch detection. Maybe better generic name is then
"pinctrl", thus also "pinctrl" child should be folded into the parent...
but switch detection is also not a pinctrl. :/

Best regards,
Krzysztof

