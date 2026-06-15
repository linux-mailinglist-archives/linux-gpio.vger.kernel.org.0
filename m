Return-Path: <linux-gpio+bounces-38464-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tFBpNN21L2rQEwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38464-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:20:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E16847A8
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:20:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Biu4IkOD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38464-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38464-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3CA0301DCC6
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423F93C277F;
	Mon, 15 Jun 2026 08:17:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D733BE65F;
	Mon, 15 Jun 2026 08:17:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511425; cv=none; b=Z+K7XO+Z41mRU+wkoVjHQOUk44MZ/fW+Sx5Ata5boarh/fBG+kLbkfPk3Qnw5ZX4bzjvuHTOH9MuZalMxvimKwZuQixGefj2lYdMjaThqTTeTmoqRSF4jMmQTGxNS1WJXicW8niu/sRYaQaSYiMR5SUFDzmw04eUOU9VfdsScOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511425; c=relaxed/simple;
	bh=8eyhlRIj8sWtROsfnlZnpmAb9R6mFe7bid6T9bEOvC8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wkm9aVikMGQ+d6nWAOHHAQP00OESj8IkU08wvQ1/+qrfzGGhlq4//ySpDsnJUI3+kxqx6P2hn2LjUivHwLilzg9xsA/vWIXAjVvn/lr91pIc2OS57osXZG8N2owKeKQ+j6guJKnc5TUS6YYxbl8lQFxS/OlxCckGITJ2kRdmUfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Biu4IkOD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721151F000E9;
	Mon, 15 Jun 2026 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781511423;
	bh=aH0o7nWDQT6KV9saGoM0jvsLIafJzmaBf4bhSqCtANs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Biu4IkODwpBcr+U/99U7lwrDVYfvGocIpBerQgK4X95YFyOYeuSbM4KdwZr7cJROz
	 gjlLH2yHFHfG3uy67alqdVM8q+vJSHXnz8ayg6fs7SbMmwomyIOtbJf1ncaiO7lL1a
	 i6E7yoqDShUBJO8DzW2JqMB4pg7CoCLUqDn3SksGMoc51hXpwKuuwpAHkG+e4uRNFM
	 UePo4g6fts7bkpyCuFfikeZsjRX4u19b+VmUp24A6JH01cXUUa0k/xih+TKiL4SmVs
	 braHK3PxxAf477vEg8VyeudilrdcpJhw/JOInESoNaVnMYFw+ByQN/9y4wAfPfNyEt
	 1N4S659lRqCrw==
Message-ID: <419fe57b-fed0-411d-8bd6-eb452e767784@kernel.org>
Date: Mon, 15 Jun 2026 10:16:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 'Linus Walleij' <linusw@kernel.org>
Cc: peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 hajun.sung@samsung.com
References: <CGME20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8@epcas5p3.samsung.com>
 <20260612163020.411761-1-alim.akhtar@samsung.com>
 <20260612163020.411761-6-alim.akhtar@samsung.com>
 <CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com>
 <007a01dcfc9d$aa94dd60$ffbe9820$@samsung.com>
 <0aa74645-d99d-4776-b3e6-e74fc0528f11@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <0aa74645-d99d-4776-b3e6-e74fc0528f11@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38464-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:linusw@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:email,linaro.org:email,vger.kernel.org:from_smtp,get_maintainers.pl:url,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 763E16847A8

On 15/06/2026 10:12, Krzysztof Kozlowski wrote:
> On 15/06/2026 10:04, Alim Akhtar wrote:
>> Thanks Linus for your review
>>
>>> -----Original Message-----
>>> From: Linus Walleij <linusw@kernel.org>
>>> Sent: Monday, June 15, 2026 12:51 PM
>>> To: Alim Akhtar <alim.akhtar@samsung.com>
>>> Cc: krzk@kernel.org; peter.griffin@linaro.org; robh@kernel.org;
>>> conor+dt@kernel.org; linux-samsung-soc@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>> gpio@vger.kernel.org; hajun.sung@samsung.com
>>> Subject: Re: [PATCH 5/5] MAINTAINERS: Add entry for Samsung Exynos8855
>>> SoC
>>>
>>> Hi Alim,
>>>
>>> On Fri, Jun 12, 2026 at 6:11 PM Alim Akhtar <alim.akhtar@samsung.com>
>>> wrote:
>>>
>>>> Add maintainers entry for the Samsung Exynos8855 SoC based platforms
>>>>
>>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> (...)
>>>> +SAMSUNG EXYNOS8855 SoC SUPPORT
>>>> +M:     Alim Akhtar <alim.akhtar@samsung.com>
>>>> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-
>>> subscribers)
>>>> +L:     linux-samsung-soc@vger.kernel.org
>>>> +S:     Maintained
>>>> +F:     arch/arm64/boot/dts/exynos/exynos8855*
>>>
>>> If you really want to single out a single platform like this (and I don't even
>>> know if that is a good idea... how do you keep the big picture in mind?) you
>>> should probably want to also add a wildcard for all the
>>> 8855 device tree files.
>>>
>> I am also not sure, just followed what was done historically, other Exynos8855 file will get added once they
>> are posted for review, e.g. clock driver.
>> Let me discuss with Krzk during OSS (Mumbai) and see how do we handle this or any other better ways.
>>
> 
> You are Alim already reviewer for entire Samsung, so not sure if this is
> beneficial but I also do not mind.
> 
> For Exynos850 and Google GS101, these were added because folks wanted to
> be involved in these specific bits. In the past I was voting for per-DTS
> file maintainer entry and rejecting per-board maintainer entries. There

Lemme clarify: "voting for in-DTS file maintainer entry", so like we
have for DT bindings, which lists maintainers.

> was even get_maintainers.pl patch doing that. Unfortunately after many
> tries that patch eventually did not land and I got bored bringing it up,
> thus I agreed to earlier NXP approach for per-board or per-SoC maintainers.
> 
> I would like to encourage more people doing meaningful reviews, so if
> having maintainers entry helps that, then I am in.
> 
> Therefore I am fine with this patch as is.
> 
> Best regards,
> Krzysztof


Best regards,
Krzysztof

