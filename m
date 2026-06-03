Return-Path: <linux-gpio+bounces-37887-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FqisB7npH2o/sQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37887-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:45:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56492635D48
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:45:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alex-min.fr header.s=fm3 header.b=NUhbtQtX;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="H gJyHdR";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37887-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37887-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46F1130479D9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 08:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D22346782;
	Wed,  3 Jun 2026 08:40:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9D539DBFC;
	Wed,  3 Jun 2026 08:40:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476021; cv=none; b=t5cXDH//6Ksq3Sq/NnCsX0P7MeNCUMyiaVDWB6ejob7AAtfh+K9yovUySnURhwnrs8KahhWmbcFHkTjMWDPhm6c6YNhAskW5O3F+GKTNOipACCXdltk294qMRyidR1EOgJIIsAIgFum4IQkFKqV5gfw2Yv57lpOiZcobmiAonhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476021; c=relaxed/simple;
	bh=K/rKz6b4F77j0xHWzIXpJgeNDf7V610k4bC4qX6dHXs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CAjnkncX2WHqKbj2AXXxQArdawp+bjePU5J1KjLqSWsYKvP0dFKrTaOL7vrcYsx+gqKbMltIsiRB+5ZiEsNgxYsNJClRvR90mj6HY+7C5ZNnB3ZGeaxRJM8AOUnN0A8jeLBML60N2Y+Z+SZCW/14w6rc65DSHhhiCeOI8Awz/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr; spf=pass smtp.mailfrom=alex-min.fr; dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b=NUhbtQtX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HgJyHdRS; arc=none smtp.client-ip=103.168.172.148
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 16D21EC013A;
	Wed,  3 Jun 2026 04:40:19 -0400 (EDT)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-04.internal (MEProxy); Wed, 03 Jun 2026 04:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex-min.fr; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780476019;
	 x=1780562419; bh=u0muCYJkeE3pAYE8lO+AAxGI4J4BhmqEcwm6uUfo5uE=; b=
	NUhbtQtXq9p/nvFoC74C/PrIAJqC6bllujDUVKiqxWWnA84ocxtk6uRXfbIl/0cO
	i+hsW7ELyy2qYZD2v/NxN1RMlqzwe1lDNKCdu2NlTJgw+WAjLh7kNLcNUvHFF1IL
	iS0C1chljLts+6KV5h3fW2cToPiEtY+E7HpzNCFTtjuVEXmMLr8hF5aFYnz5qPPu
	5jpwp/wj/+L2ld7X9mG1jvtQ4xDneF+2XBPdk79P3Ql56K9E9vcu4TZUyQY5/AaD
	5r3MLSfKiI0YGatPMgpPtI4ij8NwkFxqsMoK2JjN0uyACz4x/yDaEJVzW1TrmEye
	WczvN6GhHr14LUGUgL4gOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780476019; x=
	1780562419; bh=u0muCYJkeE3pAYE8lO+AAxGI4J4BhmqEcwm6uUfo5uE=; b=H
	gJyHdRSTRsWoDpuJsf7SJWxzVfm1dIVxuZktRPwJpnCUOzGt+eynSj4QNtK9VBt+
	S0jm6E5WhzgLn1SyDpVYUBSPAyx3cEpzi+K9ebItz+nFl6CiEwGs7Xbqf9ufdJ0F
	qa/urCO67q/hxfjF2KgfogPWFBJBinLYWw+0JH1FT0aLaZa03sYZ0VX349TGDovy
	oOlFMR1WDmZ7SrE8yYYN3yPPSfYIfwboNX/K3NeY2ciIrkBrKv6s6JXSRk3xYbNw
	hj6kGHKzTJ0aSoWPQ2EgmZS3TH8LXrOFmGYto7mmloQbPXrzOUc5FMQNpVxRJ/uO
	w6gwWCx4qVXzbD948xo1A==
X-ME-Sender: <xms:cugfalkrtFRJoZEYipjnGJLLK79ssZzaBQRS3TZRTQSDuOKjgz22sw>
    <xme:cugfaro-Q--4yh0osdZvzxv0hW7y5fXjZZsBFqn6EK_9MbAhq0cmAWn5pv9BvklDV
    DuUbHK9IKnjTvfYwrB8FjKhhzqrLTyO3gPhI104YnODxkuadkDtEQ>
X-ME-Proxy-Cause: dmFkZTEjqkwl1pkbDArUnxuEE9GIScT8QO+8RvSWozOv35+sUiTP6ILEcbWB6RLnpvoP3a
    Ba61CieoqCG+XP2aXBG06Q49zacl1TWZDij9mZ5F82zfTe0jpnrLGMRNbdJvC0FPseuIsm
    0bTvDzAJDmxhsFLm1cIDD7h68Tco7NgQlFArcyK+9QG8qy/n3pGwgDvY5ukcuRNs+0M9Es
    CkDowBjDl0Z7YoMuJbADt1w+VnwwQpS8eG6cRxSftCj6tJJ3THuMsY3pr6Lx6fWTZ1EpjI
    xJvy7fGjVZ/qLMZ7wJa+egFrb1Phw9ygMsklLoOz7gzYuZSTsHb8OctXMhBoqT3RZDHmgx
    L2BxiLdoF2oa4ypW459jUGwxzF66/Jzr+vCRHuIgIlZUuJZcwvn0f1gibdnq1sRwk6uPJi
    568djrU1KhUo8av09KNlw3EsHTbJOkngAG+4TtOWgMOiWV9+nfNK5FBg1RLW17c3nXSyzP
    wAtOx3pWkzFQAyyYKnPlMPfz+eFWVFsDs2z/aWRf9GhXdKFGu9r7CudNWQO0Dl+CpIZfIi
    ASP+fYv1QfWjokvSqf6xIOP4CayS/+SjmH0wfKidhsSKCZjNVzWIjtj6QL0xlcAp6frGEb
    I+etpvMfP7exP71LFKgjYtw3I9VIbYnQdH/I88cL0oi3r60YQmb0pXuVXW4A
X-ME-Proxy: <xmx:cugfajihGlrX1kAJ-qiBxOhBd6SoT11j81dCPcitNeQOHm3I40ydkg>
    <xmx:cugfarAFq-uIuJD1OXMgI1b5z3zRJseXAfN79wfjPDKdzqCpeRM7sA>
    <xmx:cugfapve9avYfSV3IYPTPCKmiab9e2uk2aroJolroF4YFoy1nwdoqw>
    <xmx:cugfat4b3L2DC-G2_6QuNaEqhcEOJLKzCKayrLi7ZD_PVZaeeu5q9Q>
    <xmx:c-gfanApLeFI2REDd8kclC9auE-RF1W7wpIXdJ4H7oN0pt4tTUxk6jGP>
Feedback-ID: i72694427:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3B73B18E006C; Wed,  3 Jun 2026 04:40:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABg7bcuugZBJ
Date: Wed, 03 Jun 2026 10:39:24 +0200
From: "MINETTE Alexandre" <contact@alex-min.fr>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Guru Das Srinagesh" <linux@gurudas.dev>,
 "Linus Walleij" <linusw@kernel.org>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Will Deacon" <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>,
 "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 phone-devel@vger.kernel.org
Message-Id: <50c433df-d737-45da-93dc-76d365052a6c@app.fastmail.com>
In-Reply-To: <20260428-jumping-discerning-oarfish-d2caf1@quoll>
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-7-dcaa9178007b@alex-min.fr>
 <20260428-jumping-discerning-oarfish-d2caf1@quoll>
Subject: Re: [PATCH v2 7/8] ARM: dts: qcom: pm8921: Add USB ID extcon
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[alex-min.fr:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[alex-min.fr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[contact@alex-min.fr,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:iommu@lists.linux.dev,m:phone-devel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37887-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@alex-min.fr,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[alex-min.fr:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alex-min.fr:dkim,alex-min.fr:from_mime,alex-min.fr:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,app.fastmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56492635D48

Thanks for the feedback, Krzysztof.

Do you mean that the PM8921 USB ID handling should be exposed by the
PM8921 parent node itself, so USB consumers would reference the PMIC
directly, e.g.:

  	extcon =3D <&muic>, <&pm8921>;

I am fine with that model, but it would require more driver changes: the
current extcon driver binds to a separate platform device, while the
PM8921 parent node is already handled by the PM8xxx MFD driver.

Is that the direction you would prefer for v4?
--=20
  MINETTE Alexandre
  contact@alex-min.fr

Mar 28 avr 2026, =C3=A0 08:56, Krzysztof Kozlowski a =C3=A9crit=E2=80=AF:
> On Mon, Apr 27, 2026 at 09:34:53PM +0200, Alexandre MINETTE wrote:
>> Add the PM8921 USB ID interrupt as a disabled extcon provider. Boards
>> can enable it when their USB controller consumes the PMIC USB ID state
>> for OTG role detection.
>>=20
>> The interrupt corresponds to PM8921 USB_ID_IN, block 6 bit 1.
>>=20
>> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
>> ---
>>  arch/arm/boot/dts/qcom/pm8921.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/q=
com/pm8921.dtsi
>> index 535cb6a2543f..30366536f580 100644
>> --- a/arch/arm/boot/dts/qcom/pm8921.dtsi
>> +++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
>> @@ -121,6 +121,13 @@ ref_muxoff: adc-channel@f {
>>  				reg =3D <0x00 0x0f>;
>>  			};
>>  		};
>> +
>> +		usb_id: usb-detect {
>
> You should not mix non-addressable children with addressable. If you
> really do not have address, but other children have, then probably this
> is part of the main device, so should be folded into the parent node.
>
> Best regards,
> Krzysztof

