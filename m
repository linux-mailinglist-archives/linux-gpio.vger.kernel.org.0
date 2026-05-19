Return-Path: <linux-gpio+bounces-37131-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD6CBmQnDGrMXgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37131-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:03:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F127557AD30
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B80930A0803
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 08:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CCA3EF675;
	Tue, 19 May 2026 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b="F85fbw/+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CjZsoEZg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED63EEAF1;
	Tue, 19 May 2026 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180541; cv=none; b=BHng3LO+DCIEzqk7cxOukpeuo3xtlOrHHi+51dgtbcowSh3DFZXNRhfGaqUYbfR7rLiEukD0FYt/hOQmjSu0zmBposB8Axgg/1xIhD+MdnjcfD41SP67WoSmbSrZl/L45+1Duj+OMhbu8id0FXt9NVx5jWHDE8YYXiVSyvySCQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180541; c=relaxed/simple;
	bh=0R6tgNs7XNPthelErmwGT4ZGv+aYiUM/RQr+NH310yc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sOWlVfLCaKSCimr09Y92RDVyWbgZRjP58zA2dBDgeFPjvxujv6grFz5yFfG1+D56vKzJwoeljQ4mGCTC7zO7guEUNyjvMRCgM2Ap0naZRYkCx9VzANVszoxODQzktaZgvCXa8Y7o6DHnnNirSqztF7AjpmrrTpxSAW8EBRfqjk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr; spf=pass smtp.mailfrom=alex-min.fr; dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b=F85fbw/+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CjZsoEZg; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alex-min.fr
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 11560EC026C;
	Tue, 19 May 2026 04:48:58 -0400 (EDT)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-04.internal (MEProxy); Tue, 19 May 2026 04:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex-min.fr; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779180538;
	 x=1779266938; bh=abYMyDQFoR6Lu3Pj6ylmgRRpraIjYYCfuZS78X7Ygwo=; b=
	F85fbw/+3MbXuusQwUxFHgM2k3osbciJPnsFVyZby9969JTmWurDaD9ihx0hdHSS
	fuKw60kdlipczmZiVm2klmtBoHguwBz3BCzoLO0jXFNp3l1az+fyBJHY0MYYfVCf
	XRK9V5eS5xZrfCImVrLsyG7FE5GQAMSupeJrU0ycA/E7GjaI5Kvtf3WsbkcXaPrw
	Vu2BVUhC0zTCbQ7UveUVvIkT54Qrub0/6Hks5XFJ/qWpUKoY0v8IGxp87D793gjt
	dS0pIWTXeHNnVVgpdI7MYRbLbZHh9SqNBwiwR7rPLO1bVhp2F3XFZwFderGrnEM3
	qU2Jq6tzwjpgopZRjNCZXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779180538; x=
	1779266938; bh=abYMyDQFoR6Lu3Pj6ylmgRRpraIjYYCfuZS78X7Ygwo=; b=C
	jZsoEZgvwnuZLhr4hEMBxwDyJuDfrNY8HpmA+zGxPztuk3y5yrQrM5RIRWbPaSEb
	iXF7E22gMg/rhAI/oHprcLbWNSMl8xuqEk/jGPUzfz7SSEOgzql8h5++nvUGiBqw
	LMRbYnDam0DV/eY2jX/POEJ50dy//qR/nZ/iNBHcUfuf6ZP3I/sMmFgGf6rvlyjo
	DCwMK4sYlN6QUaor/UaX8tEzy61e7Ybg2utq8tVqeiJpl+C/bM2Kp786c/T0Ycpq
	cn4d5CaCDm9iSqnKvLmqRvWuuUCuAgtBPY46LZT6wtiNa8v3hjmDfWNN/+RfVEav
	Zaz7t/o85X6ZBygiZsMRQ==
X-ME-Sender: <xms:-CMMaoL9vca9oy6TPbFIioD25iTUnMlvqz_nSkWaSrlJBB_lJsHbEg>
    <xme:-CMMai-QDpwakfTh8BTgfPquqpAGGSzTPOThX0-_28dR6RI_3si85JaSotOfZ7aIv
    FAO7Y5AeCC6sfgGz8dumM7jrc6NPp4kVQxuf5WupLr3LgyIKoZM4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugedufeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfoffkpffg
    vffvgfcutehlvgigrghnughrvgdfuceotghonhhtrggtthesrghlvgigqdhmihhnrdhfrh
    eqnecuggftrfgrthhtvghrnheptdeutdeftdduudegtdeugfegtdeikeehhfetfedvteeu
    veehgeehhfefteefjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheptghonhhtrggtthesrghlvgigqdhmihhnrdhfrhdpnhgspghrtghpthht
    ohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjohhroheskegshihtvg
    hsrdhorhhgpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhr
    tghpthhtoheplhhinhhugiesghhurhhuuggrshdruggvvhdprhgtphhtthhopehgphhitg
    gtohhlihesihhgrghlihgrrdgtohhmpdhrtghpthhtohepthhonhihrdhluhgtkhesihhn
    thgvlhdrtghomhdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhnrhgrugihsggtihhose
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-CMMagIGcaPPLO3RKgklQYCzEFkYTnnAPRANuiJ6ZE0LwZR1hN3zCQ>
    <xmx:-CMMalBOrmovJhYppY26P1TvvRn1fWSOJZVa50xSwhzRsbiIObGB0w>
    <xmx:-CMMauRIf_BZAnaDyJpcQjwt1m2l8yHaFlqUFXnfYX1zLY5wwuvVtQ>
    <xmx:-CMMavewgbgQDoCu-3t9ifQ2kKUJuDjjDZx9WPhh_MUUNUc1x_5L5Q>
    <xmx:-iMMahzT8EEEBkuqfhMQDMUYmFL5I3oXzTk4vskXSas19CZs7-6X0BHT>
Feedback-ID: i72694427:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5E7B918E006C; Tue, 19 May 2026 04:48:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A511MZycEBGs
Date: Tue, 19 May 2026 10:48:20 +0200
From: "MINETTE Alexandre" <contact@alex-min.fr>
To: "Linus Walleij" <linusw@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Guru Das Srinagesh" <linux@gurudas.dev>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Will Deacon" <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>,
 "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 phone-devel@vger.kernel.org
Message-Id: <298550eb-1bdf-4d7c-8111-8b8f0b5dc056@app.fastmail.com>
In-Reply-To: 
 <CAD++jLm=BxHsPJ4rgqwY8SvaefZUO+Pfv8E8xizqPsdJZw5weA@mail.gmail.com>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
 <CAD++jLm=BxHsPJ4rgqwY8SvaefZUO+Pfv8E8xizqPsdJZw5weA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling pinctrl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[alex-min.fr:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[alex-min.fr];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-37131-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@alex-min.fr,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[alex-min.fr:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,alex-min.fr:email,alex-min.fr:dkim,messagingengine.com:dkim]
X-Rspamd-Queue-Id: F127557AD30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks a lot Linus!

This patch is required for my Samsung Galaxy S4 GT-I9505 to boot but I a=
lso
have confirmation from another contributor that the same pinctrl patch
helped boot the ASUS Nexus 7 (2013), codenamed flo, which is also based
on APQ8064.

--=20
  MINETTE Alexandre
  contact@alex-min.fr

Mar 19 mai 2026, =C3=A0 10:31, Linus Walleij a =C3=A9crit=E2=80=AF:
> Hi Alexandre,
>
> thanks for your patch!
>
> On Tue, May 19, 2026 at 9:16=E2=80=AFAM Alexandre MINETTE via B4 Relay
> <devnull+contact.alex-min.fr@kernel.org> wrote:
>
>> From: Alexandre MINETTE <contact@alex-min.fr>
>>
>> pinctrl consumers can request states while the pinctrl core enables t=
he
>> controller. On Qualcomm pinctrl drivers this can happen before the SoC
>> function list has been registered, which leaves the function table
>> incomplete during state lookup.
>>
>> On APQ8064 this can fail while claiming pinctrl hogs:
>>
>>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map ta=
ble
>>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
>>
>> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add =
the
>> SoC pin functions, and only then enable the pinctrl device.
>>
>> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
>
> I think I've seen this one before, if Bj=C3=B6rn or someone else from =
Qualcomm
> can review this and test on some other hardware it would be great.
>
> But if there is no reaction I might just merge it so something happens.
>
> Yours,
> Linus Walleij

