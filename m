Return-Path: <linux-gpio+bounces-32809-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI8jLIGermmqGwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32809-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 11:18:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC3E236E42
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 11:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4C31302F6A2
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 10:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596983921CB;
	Mon,  9 Mar 2026 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbvrwkY6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F81E38F24E;
	Mon,  9 Mar 2026 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051483; cv=none; b=eErokaF2k0e1ppULE4DWzWY7FHGxmkqq78hwCIKBEs/RPqAOLdd0mr3S2nodlqlCBDLbQqWX4CCKq471i9U6mr3npuj+InyXvst31FrKJ6qbXXrOnDeHjtDDz9BGQkXibmK5fcPWGUP90nclfGGFUxqCSNR/fmkoRMh1BTbGYss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051483; c=relaxed/simple;
	bh=SRnH1NwAp8w9VnUxeMdQQ22bjINRJvdOwnb+w2CyyoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=newri/KR9BQH3eJEpmHZzFd6nAUCGDzyj+bz4KywAyEl1gIgCMZ84wNK3TdMJRQrXQC8KPijXiuRovCoXFADO3TlFF4TWF3N1KVMTQ7b2KiV+0gAjn2mTTXsB2S/IT7qMwfaFOMEs+iFCpDdcQsb7qlHM2Jt0+alwhJuGWl6Lzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbvrwkY6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5CDC19423;
	Mon,  9 Mar 2026 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773051482;
	bh=SRnH1NwAp8w9VnUxeMdQQ22bjINRJvdOwnb+w2CyyoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WbvrwkY69JG/s4o3qMNFez6zGnP0aaTiwhZ6euNW7VfFe957SK4mE3Hky70kXumBX
	 4WyaPMbTtArfbPihZMGhiqYjFUUp/49Y4vp/Et7+bkZTvscn+wBpkdzU3c8b4VmPRz
	 PSRTkwBr/LrC6S+wpDsZ2jRP+4xm2SVSo8S+9iAhXafBTW6FilzgATwKSLZIIHsW8i
	 i6Jwm7PmgHbXeHrULS7xLCb22+pxt7in3qIpCvD+CC3h7aqJxuetboQx9QmMwdvxU+
	 qFsiREvlGT5VIFdokr2t+wRM9g1GbzgQPen6AhuzpqrlcGFnbXc10NnfENbHMipjD8
	 y0NhDnxGbPh7g==
Message-ID: <af8aa42e-8ef6-43c0-9a46-173420ffe49c@kernel.org>
Date: Mon, 9 Mar 2026 11:17:57 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "bartosz.golaszewski@oss.qualcomm.com"
 <bartosz.golaszewski@oss.qualcomm.com>, "afaerber@suse.com"
 <afaerber@suse.com>, =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
 <james.tai@realtek.com>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
 <cy.huang@realtek.com>, =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
 <stanley_chang@realtek.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
 <tychang@realtek.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-10-eleanor.lin@realtek.com>
 <20260307-purring-kind-binturong-1fcb37@quoll>
 <1baf65a11c26482cae4f7b54df1521c5@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1baf65a11c26482cae4f7b54df1521c5@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1FC3E236E42
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
	TAGGED_FROM(0.00)[bounces-32809-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email]
X-Rspamd-Action: no action

On 09/03/2026 10:18, Yu-Chun Lin [林祐君] wrote:
>> On Fri, Mar 06, 2026 at 03:52:39PM +0800, Yu-Chun Lin wrote:
>>> From: Tzuyi Chang <tychang@realtek.com>
>>>
>>> Rename 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'.
>>>
>>> The previous name was misleading because this hardware block is not a
>>> PWM generator. It does not generate a signal with a specific frequency
>>> and duty ratio.
>>>
>>> Instead, it provides a fixed nanosecond-level adjustment to the
>>> rising/ falling edges of an existing signal.
>>>
>>> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
>>> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>> ---
>>>  .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml       | 9 ++++++---
>>>  .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml       | 9 ++++++---
>>>  .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml       | 9 ++++++---
>>>  3 files changed, 18 insertions(+), 9 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.y
>>> aml
>>> b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.y
>>> aml index 90bd49d87d2e..7b3888b2cea8 100644
>>> ---
>>> a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.y
>>> aml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinct
>>> +++ rl.yaml
>>> @@ -133,10 +133,13 @@ patternProperties:
>>>          minimum: 0
>>>          maximum: 7
>>>
>>> -      realtek,duty-cycle:
>>> +      realtek,pulse-width-adjust:
>>
>> No, that's ABI break without explanation. "misleading" is not the sufficient
>> argument for breaking ABI.
>> You are stuck with the ABI you added back in 2023.
>>
>> Best regards,
>> Krzysztof
> 
> The reason I renamed 'realtek,duty-cycle' to 'realtek,pulse-width-adjust' is that
> during the v1 review, it was pointed out that the name caused confusion with
> standard PWM bindings [1]. Since I need to modify the driver logic to address
> this, I intended to update the binding simultaneously.

Again, confusion is not reason to break ABI.

> 
> Although the binding was added in 2023, there are currently no DTS files in the
> mainline kernel that use the 1315e, 1319d, or 1619b pinctrl device nodes.

Still ABI.

> Therefore, changing this property name will not break any existing device support
> in the mainline tree.

Yeah, but will break all other users.

Best regards,
Krzysztof

