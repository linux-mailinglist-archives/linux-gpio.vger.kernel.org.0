Return-Path: <linux-gpio+bounces-31937-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKAWAaUYmGki/wIAu9opvQ
	(envelope-from <linux-gpio+bounces-31937-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:17:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B671165948
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61E0D3015D04
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1F1334C00;
	Fri, 20 Feb 2026 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bcwF+fJx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E5923BD1D
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575458; cv=none; b=cvOArEdV9aLwWkNxFGCYKOmZesGwF8vzoJ+0sA7zi5+PDssMFlPD+/aMT9xvGJPKFGMRc3LJQ/nhbhyIMEJyvBT4Dc6192vN5FOrs39MUj428/SvEJ2u3ogaGtBKMAbGRwKNZQ0O4CIN49u2EbLT11TkrWXjuHXmhXA91YgAku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575458; c=relaxed/simple;
	bh=BW900tmKdv9sOY9YIGabfV0NCjXLf0sLsssHMH+GApE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ev14PqPFHsUo9oezWCXcTGtlCpT3XGOnHPfYb7pvj+U83TBmTFuhHEYlVDb18Ivr3d500o+qH1wQzjvIizLms3teLPeA1zl0SNPWx1qGGdUQc2d2zaXbOJff9UvdJfMGxSTL8qb/4ji5BZvhd05AV8/U9sqn5AncxwQFsiwEBfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bcwF+fJx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 874C24E406D3;
	Fri, 20 Feb 2026 08:17:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45DDB5FA8F;
	Fri, 20 Feb 2026 08:17:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29C5A10368B60;
	Fri, 20 Feb 2026 09:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771575452; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VzvvW9lCbmbpLDeCUrBpDx40xl/soxiJcKA0/aCMgVw=;
	b=bcwF+fJxhbx1qFPpYbglmo7D3U3Y4uBaX5rNYiOVFKJYHA2i786uoQ17NTOygkOC0QjcSc
	PLYaR0kQwDGBRWcLBzWkBhwxtXJKGmgdd2qBmbAVUND3FYNGG6leMRXowmxo/i9BqEtcCU
	mNSELuWkbJD5b3S0iJfDjP2RnsbbdJtP2oI/CREnHVH5kKJoXyMj+izZUruxVvq9VReryb
	6IMOOnoJBjYtH7pGoj6BJD+DtfoJN7R36l408LEko835NNlPIMNFUeorDtaIcJdo1zT2RK
	Ir2blFSMDogrLB2B92rocUdoakFw1UWyNSNfGFcbOCxVsKhq04ksc/SGJFfmWw==
Date: Fri, 20 Feb 2026 09:17:27 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, James Hilliard
 <james.hilliard1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Stein
 <linux@ew.tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
Message-ID: <20260220091727.5330accd@bootlin.com>
In-Reply-To: <CAD++jLn9KJ2sfMtAxVGbcmWQW=1vxdiMNCDLNg-XV3hJDz=O9w@mail.gmail.com>
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
	<338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org>
	<92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
	<CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
	<30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org>
	<CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
	<20260212195423.GA787785-robh@kernel.org>
	<CADvTj4rPq8D5piqEijCdAjkWmZtq3Bi_Kxv-4F0aU4xi_O5WKg@mail.gmail.com>
	<CAL_Jsq+Fb0vOggHWkNGusCBcwTQubD1Lc+0=U4+MpZacXqc_ag@mail.gmail.com>
	<CAD++jLn9KJ2sfMtAxVGbcmWQW=1vxdiMNCDLNg-XV3hJDz=O9w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,glider.be,ew.tq-group.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-31937-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 6B671165948
X-Rspamd-Action: no action

Hi Linus,

On Thu, 19 Feb 2026 18:57:48 +0100
Linus Walleij <linusw@kernel.org> wrote:

> On Fri, Feb 13, 2026 at 3:34 PM Rob Herring <robh@kernel.org> wrote:
> 
> > > > Humm, peripheral boards! So there's a connector. You need a connector
> > > > binding. And the one solved binding for such a thing is GPIO! The
> > > > gpio-map property lets you remap GPIOs from one provider (the connector)
> > > > to a parent provider (soc_gpio). It would look something like this:  
> > >
> > > Well...some GPIOs are wired to peripheral board connectors...but
> > > some are wired to things like built in LEDs and a few different
> > > on-controller components as well which vary by controller hardware
> > > revisions.
> > >
> > > This gpio-map feature doesn't exist in the mainline kernel does it?  
> >
> > For at least the last 5 years. It's even defined in the DT spec
> > (generically as "nexus").  
> 
> I actually tested this. It works.
> 
> It's however a bit annoying that we do not have a single upstream
> DTS file using it, so there are no examples to look at other than
> in the documentation.
> 
> I suppose there would also be greater buy-in to the concept if
> we had managed to push the same for at least I2C and SPI,
> but it's easy to ask other people to work, I know that.

Nexus for I2C or SPI will not work.
In fact, busses cannot work with nexus node concept.

A nexus node translate a phandle.

prop = <&nexus X> is, in the end, translated to <&controller Y>.

For busses, you describe devices connected to the bus as sub-nodes of the
bus controller node.

&spi0 {
	my_device@0 {
		reg = 0;
                ...
       };
};

No phandle involved but labels.

With nexus, you cannot translate &spi0.

Also nexus works well when an index is involved. In other word, it works
well with phandle with args.

i2c-bus = <&i2c0>;

In this kind of of definition, no index are present. With nexus node, this
looks like

i2c-bus = <&nexus>;

How to handle multiple i2c busses with nexus node?

Some ways other than nexus have to explored to handle busses.

Best regards,
Hervé

