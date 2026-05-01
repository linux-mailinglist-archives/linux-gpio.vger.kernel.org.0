Return-Path: <linux-gpio+bounces-35950-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ly8EmhZ9GkvAwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35950-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 09:42:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0F44AB035
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 09:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4440530086A4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 07:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E17236B07B;
	Fri,  1 May 2026 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b="BHPV6KbV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="irqP4X/n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3501D3624C3;
	Fri,  1 May 2026 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777621342; cv=none; b=BMAI0sXmEu6kb0jqKmNUzjhdotc9YXoJ1VrzV8IpKtFnwDXQDyl/O29PFOprPEHIMTYBbdDf4GNuYTYNMjp/OAsHaGSoq6CwMVnI4UzWaYWcLgZuLZeEP/rQ5mLVE5lv6ZHeORt2GOWg0dajAqTJ4YCdg1Mv4IPh5WSkWhBvAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777621342; c=relaxed/simple;
	bh=hBnzokI6KHxyl17lpS6jXZPBgbFHczeNt0+6RC6qwUQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XsyO3N76JC6o1rMGGuMJM8HwJ1iHL+p59W1ibpwXQHJqiu7pywZe92xVR5OMPdpFH7jWdN36DYiPQ1h+gFlG4gGvE8Vfaykza9r/WwT0R0EpiwrcdXsY02i8PWimDK6lXL84PUYE7S5yY78VMVo+6EINbzWZjFdbdaefMig02yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr; spf=pass smtp.mailfrom=alex-min.fr; dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b=BHPV6KbV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=irqP4X/n; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alex-min.fr
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 693B7EC0128;
	Fri,  1 May 2026 03:42:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 01 May 2026 03:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex-min.fr; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1777621338;
	 x=1777707738; bh=Zg5eNZ5CCvS7Z24O3/xznVWLB3OXF7Zf2PatPh9o7WU=; b=
	BHPV6KbVLBP0+ivN2+rBflpqymNvZEB8JHTB/+2kMQ2YMULpzEa0v5X/oaiKIvuY
	1ZiGrLXpEPKPn44sNmiuB/tWmkTaYhk9fwAPduJKL8Rk+SQpydwQuBasjZdaC3TK
	wSor3iQYk80x0iDLRvx7iRbY5J6LojfFXpqWnKVybO3bym1UCZcOu9Gpq9AsK0UL
	0ZGXvj0zSw92gFtPXuC9jaq8zcDiK7hG6y8TerWgokP90rXAuJHjDz80KwlfcHeq
	uv2waobLwrHNNAe5P7+ct/o82jiN49PxYw224G/K0hzFGINpPE9pmTsoCEovjUkY
	5RlmyggfZAdBC2GYYeHCYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777621338; x=
	1777707738; bh=Zg5eNZ5CCvS7Z24O3/xznVWLB3OXF7Zf2PatPh9o7WU=; b=i
	rqP4X/ncZgoXaUTrrxnDaN/aelca1i0lZ0zJfz7xE7WuREsyKyT7wvrI7tbr0Nuw
	gtGBlPzug8vrNzwRywLY4ipBKJGE0/Cm977OIU0eQLAbXyum/9wLY2LjxSrVzvr9
	R1QhvBkBuMFYzGyfC2WQNBE+L2rqsRSMMx8sgngvnPq4touiaS5VVqDJSzeLs3Gs
	bEpVHBef+R1BXlCZAHk++sY9azs738d8jWx9KnQVlcWklT7Pu9j+IVuY3K6rGkO5
	o+JpkmcuBT5vnXNx8BWAuGqDn10GC2SAKCoGG/HnXt4gY4XCwt1svIli20Vukzhs
	kw5rTxy80EDEJ5Fw8Ll6A==
X-ME-Sender: <xms:WVn0aY4gDNgx1dcpRRVIp8lt74QaDBil9eyJL_JCr3GpcLZzMX7afw>
    <xme:WVn0aUtE4ORcwKnHixp5KMa-J16fLMsKtI5yAMAIx9DfKkdIyEskC0CrvPClNJ1y5
    frR1opxLb6ADFCW3xZ9hRulIzeHwnt8Azx5vgFYUrGRFiCwrpXeXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekleeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdfokffpgffv
    vffgucetlhgvgigrnhgurhgvfdcuoegtohhnthgrtghtsegrlhgvgidqmhhinhdrfhhrqe
    enucggtffrrghtthgvrhhnpedtuedtfedtuddugedtuefggedtieekhefhteefvdetueev
    heeghefhfeetfeejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegtohhnthgrtghtsegrlhgvgidqmhhinhdrfhhrpdhnsggprhgtphhtthho
    pedvfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhorhhoseeksgihthgvsh
    drohhrghdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomhdprhgt
    phhtthhopehlihhnuhigsehguhhruhgurghsrdguvghvpdhrtghpthhtohepghhpihgttg
    holhhisehighgrlhhirgdrtghomhdprhgtphhtthhopehtohhnhidrlhhutghksehinhht
    vghlrdgtohhmpdhrtghpthhtoheprghnuggvrhhsshhonheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehk
    vggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhrrgguhigstghioheskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WVn0aQDL2F-AF40KutzE8NRagdkt1s25sLDUepaJP0Gs399YZg6Cmw>
    <xmx:WVn0ad-A-bhFR3otixkBEP5ojjstOyloATJVnAQUC-jKDeusgcIcAQ>
    <xmx:WVn0aSRfiWvouhwJlWsYNAvzmrscLTvS6O7T06L6KZn77W59DrXRKQ>
    <xmx:WVn0aT4JynqPYm-SJt6gJd55t9PXNGsTdxsUfcZTFxgOeMErILBOgw>
    <xmx:Wln0acDKOmxMLmcQjSxJrVoRGxGmFxeG8awHyg1rwKf6ZrKBakyUQahQ>
Feedback-ID: i72694427:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B2479700065; Fri,  1 May 2026 03:42:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0acSZ0bucxw
Date: Fri, 01 May 2026 09:41:09 +0200
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
Message-Id: <edbaf71e-6a47-4294-a8c6-6b356bc336ed@app.fastmail.com>
In-Reply-To: <97969bf9-8eb2-4498-90bd-9973fb2bd638@oss.qualcomm.com>
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
 <97969bf9-8eb2-4498-90bd-9973fb2bd638@oss.qualcomm.com>
Subject: Re: [PATCH v2 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6B0F44AB035
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[alex-min.fr:s=fm1,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[alex-min.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35950-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Thanks a lot for the suggestion, I checked the downstream board files
and it does not look like these buses are wired for GSBI.

There, the MAX77693 bus is instantiated as a dedicated i2c-gpio bus on
GPIO 22/23, and the AN30259A LED bus as a dedicated i2c-gpio bus on
GPIO 6/7. The native APQ8064 GSBI2/GSBI3 I2C pins are different
(GPIO 24/25 and GPIO 8/9), so these two buses do not seem to be wired
to the GSBI controllers on jflte.

Regards,
--=20
  MINETTE Alexandre
  contact@alex-min.fr

Mar 28 avr 2026, =C3=A0 10:57, Konrad Dybcio a =C3=A9crit=E2=80=AF:
> On 4/27/26 9:34 PM, Alexandre MINETTE via B4 Relay wrote:
>> From: Alexandre MINETTE <contact@alex-min.fr>
>>=20
>> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
>>=20
>> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial sup=
port
>> covers UART, USB peripheral mode with USB networking, the front LED a=
nd
>> the physical buttons.
>>=20
>> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
>> ---
>>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>>  .../boot/dts/qcom/qcom-apq8064-samsung-jflte.dts   | 485 +++++++++++=
++++++++++
>>  2 files changed, 486 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom=
/Makefile
>> index 32a44b02d2fa..c23c961f79e3 100644
>> --- a/arch/arm/boot/dts/qcom/Makefile
>> +++ b/arch/arm/boot/dts/qcom/Makefile
>> @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM) +=3D \
>>  	qcom-apq8064-ifc6410.dtb \
>>  	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
>>  	qcom-apq8064-asus-nexus7-flo.dtb \
>> +	qcom-apq8064-samsung-jflte.dtb \
>>  	qcom-apq8064-lg-nexus4-mako.dtb \
>
> 'l'g < 's'amsung
>
> [...]
>
>> +	i2c-led {
>> +		compatible =3D "i2c-gpio";
>> +		sda-gpios =3D <&tlmm_pinmux 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
>> +		scl-gpios =3D <&tlmm_pinmux 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
>
> Have you tried setting up the I2C-GPIO busses as GSBI devices, like
> I think I suggested the last time? This will potentially bring power
> and latency benefits, since there's an actual bus controller
> connected to these pins
>
> Konrad

