Return-Path: <linux-gpio+bounces-36870-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM3DMoYvBmrLfwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36870-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 22:24:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF2546B2D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 22:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F229E3034EFA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BA53C378F;
	Thu, 14 May 2026 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b="zOuRPC73";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mt/f1WO8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270CD3BD646;
	Thu, 14 May 2026 20:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778790269; cv=none; b=PSUWu/ojxe6JmQFETTuKB8iIrTqrc+JDQD1JPA9KGQka6wVJYZxtMwdhrM3NEKAI8wJ8CL/NC+BUN2avWOzIgVObdpnBOTH4oQis2o5Eaj6VQxrYJUP/OBvJsU94BuI4GhVBvmHeQVoIiGItw7KI9Er0/ZhfPbki81U1nCxBMKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778790269; c=relaxed/simple;
	bh=g3qoX9x95xkfd9K0GCPcK3eWaEEijQGDlDehl+xHsCg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FFZAJO3+r5YkUXpFUhOykmNY5CiBYwzNllNhOVi5nn6JXZv94jKPnzQbjb0bMoC6oZ85Xy86YlnRj4G7+6BotnVjugqTgJQys/1ihdw3gMbdAvpyZq1FI0s365fKm5x88f+ZBhAaiGdm9f2k2hjWG2D8dzbJroIOg6nThtV0JMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr; spf=pass smtp.mailfrom=alex-min.fr; dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b=zOuRPC73; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mt/f1WO8; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alex-min.fr
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9FF431D00010;
	Thu, 14 May 2026 16:24:26 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Thu, 14 May 2026 16:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex-min.fr; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778790266;
	 x=1778876666; bh=BqCa42RBfsepdJCydhw9ZTRpzjRnVDw7eW4C6C6kiok=; b=
	zOuRPC73yIs/jH8a7GuzX8+Wbbv/mUVhfWwJAOWzLDqatDPhYKUm+jAhhHfJS9D9
	et863n48gmsBen/EJo61IcEcVJ9RNM430oJE68iKysZSmw/yjIETkmxKa/lmEmq8
	BLZpcJ4zZLloUu+83oROuza04oZPnOXs8fTzbxDl4KKoq1gmlWrxzbbIwHrPbTzb
	6wpRitqz5E4MBmjBjXx7Ye18tshmV3RWYBOw2kEaoVFHTruGVwLwU/57aYHEEST/
	qo1HuEtwDLP3hghEhfrZO3vCfzMKJgWt7qtFVawDP46XppJLx+Fpp2WDYzoJexGA
	9M0rr0dxsR178/2/JfHVyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778790266; x=
	1778876666; bh=BqCa42RBfsepdJCydhw9ZTRpzjRnVDw7eW4C6C6kiok=; b=m
	t/f1WO8yv13aucNIHlwCTiJfemM/MkBs++M1rKlNd1qVFz7mlhH6J2Vy2+3aZE7g
	xQArubKl34EWZ95B3UJQellfscgH0Z/9fzbNDQV2qLJ0P//ZXKZ2zgwpxDOLCso7
	hOFwuV8j6eMtuJtqA0KZyxxtaQK0jPkMgTrVPzYeAtWXpxCU/aeFIL8xTdzkLK33
	zNuNp5ZUv6/7zqdn03/6iqlULACV/FydPY8PylLXnN4dTk0nJbnxL7SS/hgTfMsV
	T8Zni6aOCJ+NXRpCP/fHp1GvrBbND8nwcXD4J9ev4+bGixDdSoekry0ULjlwcB27
	7IcxZlE0QwWSo7NteanrQ==
X-ME-Sender: <xms:eS8GatdQDZycfCgdOjhNcUo6qoOvsgUJ5ivFC8FuK7Lm2kK_xb67vA>
    <xme:eS8GamBpDzyY2fmDTI0pPp8uj7jVTBOd_Hv-9lpCSbT2c3DbVwXkjMBYyKueggoma
    0uyllHa8GlHS_2Mk1dyTMR_hnuBlpcoIsMkEZHzDEVvcjrOPdNC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdekgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfoffkpffg
    vffvgfcutehlvgigrghnughrvgdfuceotghonhhtrggtthesrghlvgigqdhmihhnrdhfrh
    eqnecuggftrfgrthhtvghrnheptdeutdeftdduudegtdeugfegtdeikeehhfetfedvteeu
    veehgeehhfefteefjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheptghonhhtrggtthesrghlvgigqdhmihhnrdhfrhdpnhgspghrtghpthht
    ohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjohhroheskegshihtvg
    hsrdhorhhgpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhr
    tghpthhtoheplhhinhhugiesghhurhhuuggrshdruggvvhdprhgtphhtthhopehgphhitg
    gtohhlihesihhgrghlihgrrdgtohhmpdhrtghpthhtohepthhonhihrdhluhgtkhesihhn
    thgvlhdrtghomhdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhnrhgrugihsggtihhose
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:eS8GaiSP-uTrzszT7PzzBrGKsxvvRy-Xet-v_kq4s7ZQQEgLUwHAhA>
    <xmx:eS8GaoVwahhdn_A1e3ElGrrnlpGTbvBihVLYLgHOW0RLuJPDw6jZwQ>
    <xmx:eS8GaouVp28Qi9F_BoQdSnhwWIx_Sv-uDCAgv6UWkpK2QcDR8zzQEw>
    <xmx:eS8GaoPaI6nlAybWZq4wN4-_RVOFinoVQMoFVXN6HNgM8HrmggDhmw>
    <xmx:ei8GalXQHoLO93fIVvrNqBNRaKOtb8i05lwcIqbCemwMbU_6m1R4Ke32>
Feedback-ID: i72694427:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0138E1060065; Thu, 14 May 2026 16:24:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0acSZ0bucxw
Date: Thu, 14 May 2026 22:23:25 +0200
From: "MINETTE Alexandre" <contact@alex-min.fr>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
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
Message-Id: <1eb77056-0716-49d3-b45f-d51ee5b70618@app.fastmail.com>
In-Reply-To: <bb8353fe-29f6-4902-9c7f-67ef61676f2b@oss.qualcomm.com>
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
 <97969bf9-8eb2-4498-90bd-9973fb2bd638@oss.qualcomm.com>
 <edbaf71e-6a47-4294-a8c6-6b356bc336ed@app.fastmail.com>
 <fdca4d01-eb6b-49a6-86e1-b6d582af4ba8@oss.qualcomm.com>
 <bb8353fe-29f6-4902-9c7f-67ef61676f2b@oss.qualcomm.com>
Subject: Re: [PATCH v2 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 49EF2546B2D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[alex-min.fr:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[alex-min.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36870-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@alex-min.fr,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[alex-min.fr:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,alex-min.fr:email,alex-min.fr:dkim]
X-Rspamd-Action: no action

Ah yes, I see. I tried GSBI for both the MUIC/extcon bus and the LED bus,
but it does not work on my GT-I9505: USB does not enumerate with the MUIC
on GSBI2, and the LED on GSBI3 times out when setting brightness (-110, =
with no visble changes).
So I think these should stay as i2c-gpio like downstream.
--=20
  MINETTE Alexandre
  contact@alex-min.fr

Lun 04 mai 2026, =C3=A0 09:41, Konrad Dybcio a =C3=A9crit=E2=80=AF:
> On 5/4/26 9:40 AM, Konrad Dybcio wrote:
>> On 5/1/26 9:41 AM, MINETTE Alexandre wrote:
>>> Thanks a lot for the suggestion, I checked the downstream board files
>>> and it does not look like these buses are wired for GSBI.
>>>
>>> There, the MAX77693 bus is instantiated as a dedicated i2c-gpio bus =
on
>>> GPIO 22/23, and the AN30259A LED bus as a dedicated i2c-gpio bus on
>>> GPIO 6/7. The native APQ8064 GSBI2/GSBI3 I2C pins are different
>>> (GPIO 24/25 and GPIO 8/9), so these two buses do not seem to be wired
>>> to the GSBI controllers on jflte.
>>=20
>> What I meant is that the pins that the i2c-gpio nodes reference
>> are actually wired (inside the SoC) to the GSBI I2C controllers.
>>=20
>> You'll notice that in drivers/pinctrl/qcom/pinctrl-apq8064.c,
>> there are bits like:
>>=20
>> PINGROUP(6, gsbi3, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>>=20
>> which mean "function 0 is GPIO [implicitly in the macro], function
>> 1 is mux to the GSBI controller"
>
> Unless you meant "these are indeed GSBI pins, but within that GSBIn
> pingroup, those specific ones aren't assigned to SDA/SCL when
> proto=3D=3DI2C, to which I'm afraid I won't be able to find docs for (=
too
> old)
>
> Konrad

