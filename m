Return-Path: <linux-gpio+bounces-37891-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FLEoGOf0H2rdtAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37891-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 11:33:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F8636305
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 11:33:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alex-min.fr header.s=fm3 header.b="lw+ngl/j";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="Z G6Jr+d";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37891-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37891-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D490303743B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 09:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6BB382388;
	Wed,  3 Jun 2026 09:16:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACCB37B028;
	Wed,  3 Jun 2026 09:16:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780478188; cv=none; b=r5Q49XEalAZ8OjCK5GPQjrfLX/sWAEuCGgU1lE2wYJumxcngwwN/+DvVkenzhpSCJWbsIBvQIsa6GVsmAzbPh7Lxh/EeFIZGrz5Ips4nzHbLEYYoE51pJdN9eg5T9rMubdobU8FYuf6eWaiRcIKfXxZQ+B1s0GXVDyO5RD1L6j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780478188; c=relaxed/simple;
	bh=zZMMRaYCVfvGznAZaMWQjUMAtdzTOIBli6JD/djRl6c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eAo3Y8+4Jjp30Bo5AJs0DpS1RbtSTNC0TKF42V8skf3CCDRhSGhW/yuahquUPbelwcmc6WIQTdi8eVTGRIOtOLFPbptEQfEVW6AoFvPkuXZRVMaWoTB0Xmz0b0J6P2qdDRvh679re7Va9XNZERpm3k+PnKdlHkPBvlyO4t6AwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr; spf=pass smtp.mailfrom=alex-min.fr; dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b=lw+ngl/j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZG6Jr+d/; arc=none smtp.client-ip=103.168.172.156
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 092B1140010D;
	Wed,  3 Jun 2026 05:16:26 -0400 (EDT)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-04.internal (MEProxy); Wed, 03 Jun 2026 05:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex-min.fr; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780478186;
	 x=1780564586; bh=vyee6GA+nWTTHzOKHQkml5rtHb2XOqTCfRzWyyvR/0M=; b=
	lw+ngl/jwNEHm4RAoLixw50HbJ8WBvVO4Xh5FezsdzckaHYl+gj98dAg7D8KrXZO
	acNm1NA1yy3GEzV6y95gv3Jj9CrZ3482cC/roLO9Kl2HOZCUPCq13tFTyMICyl+2
	/hIXGY4L1aRpy+J3GkQeEmTOFZOZBfFUA4tZObMkyfol7XBa+WrJI7moST7mc98C
	cfC+jyexq0gUAsSdC3D3PiUI81T3L/D0o+/onIRC5+QB3THev1jEIVcG7x8vzecX
	LZN1Uqrv+jtYsn5lUYiA7H0s+BjXtLLXkLjKEPnuSNFq0i/ZmbWHyjiSUnptcbk/
	zorPe5sw/43ha7xwUZOpPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780478186; x=
	1780564586; bh=vyee6GA+nWTTHzOKHQkml5rtHb2XOqTCfRzWyyvR/0M=; b=Z
	G6Jr+d/mb4Vn+dx57WZu7UO4Cpa0sW0wjNe2Ea8Ti8m0NGnehJW2Jiyhu207AY/x
	Yr4d5VelVByS2/UKT1ekkTP6VVlCfcCJ7dz8KtEfyljpCIuIp1Gu1U+zzTv2EFQ+
	dQGq00FhBriCETd8BqyrEAw1zj0IjF92QydGFl7bp9vjL6nibK/O6ItBrT/pLGGX
	CbJ/+8LnpPpsvLl1shC2GpzZJNP9ZaT2LIlsG8pfkhJlAqlib1XILJO99ylmvt30
	a15ozh3gFswdwqiVtHFOWPURAk4L0q3tkN/QkFb9mAnldPDO2TH1kLyWf8KAx++N
	DbmJ30Mb2namRoVRNZXOQ==
X-ME-Sender: <xms:6fAfanEWFdfSK0xzUw3p7P_70Zqv-4DsDumqe0osby_MRNn4B-PNEg>
    <xme:6fAfavLn3g_LpedoMZlOhNYqLlV8gykHFTIWfSSNlniWLxEm8-zCQ0RXgX-73k2zE
    Qr20JasBAEI_cEbBlJioMZ--xo2OpDmNsYOvbwlZXGiVY8nvIW0Kw>
X-ME-Proxy-Cause: dmFkZTEKtdUk3+AoNrb6F/9o5+qhQ3MJedbgaPlnSzxbii3fpnIWSakKB30IRXehXRWZ8a
    3ArwDkxvG0XlD9ZRDd/oEngsRSASg8CVBxa7prWi7/Q1p6+/bTmnunWpL9c0l3T2Euye0G
    LPwV1CcAvqwqTX3nCAUATvT0rYc0mnTpff6AkUQdW7vxkuRjFZaV997pWsndxIdO36608s
    HlT87MdU4iNI0yTC+0PnFPdKzTNUKqg+6enjhDw6m2ys75CauEE69Gctn4VUaE8OuzHBaG
    +vkSziUvakMY1a5UJoK6y/6Lelrq5Y1IRXaC91cn6GvZDAWRoL08YaFnWqmu8IIYsIdYrX
    VHPJQgm8WlaYkTEPnEGSiRMQBc51jeK11IXvSKHod8QEIxgo2sGyEm8jxERRFsd5jbCf9U
    v72TT+WsfUvH/zAZBCGgwYsp/sSr8I36+5XO2P9Y6jnCN/3dJix4qFCA3o5NOZEzNHL2QR
    4xDLU9g8GgAAdpAVV/hfeUIp8BtE3N1yBGX2svO0c3cZ4R1zkZCpmLfUOmAP98zNusUBYN
    axzCjNrnddeurXHP1yfFdngFwpxyBR51T9oZJuTKwY4par/mTFpKYyaQq7202ULoFkaElL
    N7p9W3I2pcyFi+Z9K9Onq2eo6Ueeb+ahw+sW3rQx59YIyOxopNc98NzRjSYg
X-ME-Proxy: <xmx:6fAfahCXgm-c-CqFw50O6wBWhMnxectsULnmhxR4hgxFVbQLkgHWPQ>
    <xmx:6fAfaqjC7mKIzCzP6HTzIxcxnj0mNNKZy9e1S63FYQEVF9sjUVHkXA>
    <xmx:6fAfajMkNJRCYsWZVAOdd4OM-utzxguWF7WEx3hS8ZXGbD8ztPuisg>
    <xmx:6fAfapZNBotVaNo2Kq6tVXgORuFrfs4pjMwVJzXlrJeJoQv8iVHEcw>
    <xmx:6vAfaoh1KFr33uvHO8-B9LUi2UhHhGsAl0z3dihTQuK4XfSfeh3agVg0>
Feedback-ID: i72694427:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1840618E006C; Wed,  3 Jun 2026 05:16:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ALxfIZ7KI3KB
Date: Wed, 03 Jun 2026 11:16:04 +0200
From: "MINETTE Alexandre" <contact@alex-min.fr>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
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
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, phone-devel@vger.kernel.org
Message-Id: <356a9e23-7172-4b26-993e-e82581d29553@app.fastmail.com>
In-Reply-To: <39d8e501-d84e-4870-b98b-a08b0a68f8ee@kernel.org>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-2-3dd7aa125353@alex-min.fr>
 <39d8e501-d84e-4870-b98b-a08b0a68f8ee@kernel.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add PM8921
 compatible
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-37891-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@alex-min.fr,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[alex-min.fr:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,messagingengine.com:dkim,alex-min.fr:dkim,alex-min.fr:from_mime,alex-min.fr:email,app.fastmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C1F8636305

Sorry I initially replied to the wrong thread by mistake.

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

Mer 20 mai 2026, =C3=A0 09:22, Krzysztof Kozlowski a =C3=A9crit=E2=80=AF:
> On 19/05/2026 09:16, Alexandre MINETTE via B4 Relay wrote:
>> From: Alexandre MINETTE <contact@alex-min.fr>
>>=20
>> PM8921/PM8821 provide USB ID detection through the PMIC USB block. The
>> USB_ID_IN interrupt is exposed by the PM8921 interrupt controller and=
 is
>> used by APQ8064 platforms for OTG role detection.
>>=20
>> The device is modeled as a child of the SSBI-connected PM8921 PMIC.
>> Unlike PM8941, the downstream PM8xxx misc device is not instantiated =
with
>> a register resource for this path, and the mainline extcon driver only
>
> I could have guessed that at v2, but this suggests that device is not a
> separate block. If it does not have separate addressing, then it is not
> a dedicated/separate sub device in the PMIC and your node plus binding
> should be squashed into the parent.
>
>> needs the named USB ID interrupt. Allow qcom,pm8921-misc without requ=
iring
>> reg.
>>=20
>> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
>> ---
>>  .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml    | 17 +++++++=
++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>
>
> Best regards,
> Krzysztof

