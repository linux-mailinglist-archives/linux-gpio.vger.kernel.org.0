Return-Path: <linux-gpio+bounces-35904-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOx1G3xA82kGywEAu9opvQ
	(envelope-from <linux-gpio+bounces-35904-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:43:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDDA4A24BA
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82A6B30D8056
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D0A3D7D96;
	Thu, 30 Apr 2026 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpqLcMhm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4AF3AF67A;
	Thu, 30 Apr 2026 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777548021; cv=none; b=sU/rge2PcR+otxs4fHrNJYpxiwI3O3y38pplYBlbUZdYvwpkrj83Ia/lP0jSFa6rsGa0kGBM5F3X3mCPh+7t5/UWT5WRqarkauF+fGtR2eM0zd+CMu+KT2UKtwd6fJyxikDaqFiMaeupOl114+89C3KFN1V8wn6RZsEMFBL3554=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777548021; c=relaxed/simple;
	bh=CbSjDmbB+fwd9uisoHdA7Y4E4U6AJ9oA6oBIi/aMsc8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=RyUVQ58CH6pjIFEa2hOXrZOG0E61slUsmfnfEAQXBF2RzL9I2hJGNio1Lq2oazsMjgev/4vqX30oyNbaBfG4K9Fa6X1ifJggXH5Fr6YMNae6vB4gMFGMwYD9YSKEa9AFcbsEC2IV2GdXkT/+hhBLiIrQ4meceShBddTKEMgjqx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpqLcMhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E20C2BCB3;
	Thu, 30 Apr 2026 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777548021;
	bh=CbSjDmbB+fwd9uisoHdA7Y4E4U6AJ9oA6oBIi/aMsc8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=cpqLcMhmh2CIoQ+Nl5Ja10CZ2fUCK2AqQR0hPt+Jg56DI00cidDuS0GPw+Qqf2Diq
	 tfB3oTt+jVvOoWtK1OREKNbMQ2zNRKBsYVHr9vr/0mHG9ZtBEm0RDDG0n5xZWzRlBo
	 MRxBgyCcjKBLbWiELDDYr034AwDjtwcB95J+z8jQJbK+g+dDRXpr2whmW0DLkM4yP0
	 xAp4x6MN2ejYI7MGy5fmbB5PQOGEMBBhMtlSiZZr+8OQyFC232C4CM+PV2mKFIzzNK
	 OCgWgFQfu+bEYdah5EWqsOzBW2kA+q3gNXYKzCInBmIgj48lTMpgYrCK0T2K6CNH8w
	 n4MzBQKAn6sFw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d813880cce0dd36de044a5774161cd7c2bdcd11d3b8f945b00451ee61dba;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 30 Apr 2026 13:20:16 +0200
Message-Id: <DI6G6LSE68E9.1PHS6K9083JJ9@kernel.org>
Subject: Re: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC
 RTD1625 SoC
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 =?utf-8?b?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
 =?utf-8?b?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
 =?utf-8?b?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "afaerber@suse.com" <afaerber@suse.com>,
 =?utf-8?b?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?b?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
 "Linus Walleij" <linusw@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com>
 <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
 <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
 <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
 <b73f34ec55984a33b0172e2ac3a28e04@realtek.com>
In-Reply-To: <b73f34ec55984a33b0172e2ac3a28e04@realtek.com>
X-Rspamd-Queue-Id: 9DDDA4A24BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35904-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

--d813880cce0dd36de044a5774161cd7c2bdcd11d3b8f945b00451ee61dba
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Apr 30, 2026 at 11:58 AM CEST, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=
=9B] wrote:
>> >> 3. Hardware Debounce: We also need to support hardware debounce setti=
ngs per pin,
>> >> which requires custom configuration via set_config mapped to these sp=
ecific per-pin
>> >> registers.
>> >
>> > Just add a version of an optional .set_config() call to gpio-regmap.c
>> > to handle this using .reg_mask_xlate() per above and add a new
>> > GPIO_REGMAP_CONFIG_OP to the above enum, problem solved.
>> >
>> > If it seems too hard I can write patch 1 & 2 adding this infrastructur=
e
>> > but I bet you can easily see what can be done with gpio-regmap.c
>> > here provided Michael W approves the idea.
>> >
>
> Our .set_config requires mapping specific debounce time values to
> hardware-specific enums and applying a Write-Enable bit.
>
> Would it be better to allow drivers to assign a custom '.set_config' call=
back
> directly within 'struct gpio_regmap_config'?

Yeah, I don't think there will be much code sharing of
code/functionality for the .set_config callback. A custom
.set_config was proposed many times in the past.

> Additionally, I didn't mention this in my previous email. we also need to
> implement GPIO interrupts. Our hardware design does not fit well with
> 'regmap_irq_chip'. Therefore, I am planning to create our own 'irqdomain'=
 and
> 'irqchip' ops to handle our cascaded interrupts.
>
> Because of this custom IRQ implementation, I would need to use 'readl()/w=
ritel()'
> for the IRQ callbacks in the rtd1625 GPIO driver instead of the regmap AP=
Is.
> Do you have any suggestions on how to handle this gracefully while keepin=
g it
> aligned with the regmap infrastructure?

Why can't the MMIO regmap be used for that?

-michael

--d813880cce0dd36de044a5774161cd7c2bdcd11d3b8f945b00451ee61dba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCafM68RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gI3AGAy9Rtm8M8cPTowSj7LX/6Bv869nnmd8Cw
MpzVztzODqPB/LkXkMyvpkhWH6AzyLlvAX48SNhCzsSDeC7wqRKPl8sErYeJZGLX
es14enI6yhoXQgX6nbZ9889InNSwBDjGvOQ=
=hoAy
-----END PGP SIGNATURE-----

--d813880cce0dd36de044a5774161cd7c2bdcd11d3b8f945b00451ee61dba--

