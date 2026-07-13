Return-Path: <linux-gpio+bounces-40007-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1nTDIWN0VWp9ogAAu9opvQ
	(envelope-from <linux-gpio+bounces-40007-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:27:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC42774FB41
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:27:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=fUzXAIaS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40007-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40007-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nabladev.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87619305D6E1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 23:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D7B3D649D;
	Mon, 13 Jul 2026 23:27:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A5B395ACB;
	Mon, 13 Jul 2026 23:27:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985231; cv=none; b=kRVKHKWbU5fWlDTiXlJw8FsvjJWPde/RYOwNSgJWFWdNsdJKW6O+TTlAbiaGEWvJZj7U9Kqi1FWZuBfsQ4zu4dxeZdIbJlrN12mcDUbtdKSntZ8Fh9B478IRk3QyBRapMxVWXFOTy1Q9xZ35zwFegJSPn5XQ+dyw2734V9IMXjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985231; c=relaxed/simple;
	bh=7qo4Fd1LcGckAE3slJyezM1uRHAPu9pnZY4Fz48b8ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgltQGY4hDg/4nyal1mr85knogcygYImW/6XY6aHlHu3Wth8lsDs9mQyQB54qdrJ4Iig9+CJi3VliMEycLwGafCXAuaJCmYauQGPhnSe2arIUGMf/AdcNzaI/cIbu7HsQnED0aoElUQ1myHiermJgmG+6g6c52p4Q5LRzGsrAsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=fUzXAIaS; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C4A21199D6;
	Tue, 14 Jul 2026 01:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783985228;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wkoq468eULIdSiAa93TheBL4sQoUuAbGk8pmYh3mGOs=;
	b=fUzXAIaSuCh0oLPMva5wnofUcYh/u51JZN3FvET/4kCQJLdmKG3HlfRe7x0gCpHXzOogRX
	15xvwUwAu3zbyLZto9isihoLwjwkb3NsO1R0qxFLsyYTYHBzioOy82PKkquo5O0nahn8ia
	/H6Rhz37FuMchcDLUMZKCm78dZuZp3a/6dFdrGjlXUpyrFNvpFAlp3Khnekk8F4HLRFJwf
	54kSvAOTIHjuSJJx+bMJwzLVMqsvgs/1Z2qXyJOEPOUoxHlDiTCD88rkTel5SrMQ9Yh9gu
	vWg1bBFNXt2UWeqGaaLN//bfhV/n6PxulHNZCRcl71tBhwPzVLoQYoXPvc+wgg==
Message-ID: <47178bf9-1fc7-4585-aa17-37ec07152b01@nabladev.com>
Date: Mon, 13 Jul 2026 12:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic
 KTS1622
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-3-marex@nabladev.com>
 <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40007-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:alexandre.torgue@foss.st.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nabladev.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,st.com:email,infradead.org:email,nabladev.com:from_mime,nabladev.com:mid,nabladev.com:email,nabladev.com:dkim,dh-electronics.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC42774FB41

On 7/13/26 10:36 AM, Bartosz Golaszewski wrote:
> On Sat, 11 Jul 2026 22:59:31 +0200, Marek Vasut <marex@nabladev.com> said:
>> The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
>> expander via the I2C bus for microcontrollers when additional I/Os
>> are needed while keeping interconnections to the minimum. Datasheet
>> comparison suggests that it is compatible with TCAL6416, add the
>> compatible string and TCAL6416 as a fallback compatible.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Bartosz Golaszewski <brgl@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Linus Walleij <linusw@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>>   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>> index 4f955f855e1ab..4631388a7d914 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>> @@ -22,6 +22,9 @@ properties:
>>         - items:
>>             - const: diodes,pi4ioe5v6534q
>>             - const: nxp,pcal6534
>> +      - items:
>> +          - const: kinetic,kts1622
>> +          - const: ti,tcal6416
>>         - items:
>>             - enum:
>>                 - exar,xra1202
>> --
>> 2.53.0
>>
>>
> 
> I applied this. I would have sent a b4 notification but got this instead:
> 
> $ b4 ty -all
> Auto-thankanating commits in gpio/for-next
> Found 9 of your commits since 1.week
> Calculating patch hashes, may take a moment...
>    Located: [PATCH 00/10] arm64: dts: st: Add support for DH
> electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and
> DHSBC
> ---
> Generating 1 thank-you letters
>    Writing: ./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks
> Traceback (most recent call last):
>    File "/usr/bin/b4", line 8, in <module>
>      sys.exit(cmd())
>               ~~~^^
>    File "/usr/lib/python3/dist-packages/b4/command.py", line 417, in cmd
>      cmdargs.func(cmdargs)
>      ~~~~~~~~~~~~^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/command.py", line 113, in cmd_ty
>      b4.ty.main(cmdargs)
>      ~~~~~~~~~~^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/ty.py", line 681, in main
>      auto_thankanator(cmdargs)
>      ~~~~~~~~~~~~~~~~^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/ty.py", line 386, in auto_thankanator
>      send_messages(applied, wantbranch, cmdargs)
>      ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/ty.py", line 452, in send_messages
>      with open(outfile, 'wb') as fh:
>           ~~~~^^^^^^^^^^^^^^^
> OSError: [Errno 36] File name too long:
> './marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks'
B4 bug ?

