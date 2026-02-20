Return-Path: <linux-gpio+bounces-31958-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LJWIaZcmGlRGwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31958-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:07:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2A167AD2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BCC93033ABF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 13:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4A0345CD3;
	Fri, 20 Feb 2026 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cIhNC/ye"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D355313E1B;
	Fri, 20 Feb 2026 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771592837; cv=none; b=iIFyZIelEioz4iYpuf7VT9hdBw0TYP3HYhA6JPpg5SqzF/kFMOJtBLqDw0dK/Qrb5h1avYKfTMLJvg1A4Sqvoa78tyPS13VQ71iRqwLNMqC5koIW0lgDIUCq/CP7lwLNFl/3A0k89Bz4Cx/22hREGSwx803lKLs0kWSvPEikX6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771592837; c=relaxed/simple;
	bh=E1kDxW0McVUxAT9Q5uhi7OkBtj6DyOzeJfy70YrOl34=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZI66Uw4A+9XYodj0d/1jWno52p5w+4cw7+i8wW7DHCeAFk6yO6A2tE2JpKb37gJq0uR2/67PIMklzDrrl4u0AMERn/4mnOWHIZOEReeY8+VWg9ZisoMEA68DIOSUxiZEGoUjfhcdTfb+nVP19WHX1SoGg8U7MOYo1v08uBi7vKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cIhNC/ye; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B2E854E408AC;
	Fri, 20 Feb 2026 13:07:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 866E75FA8F;
	Fri, 20 Feb 2026 13:07:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A7B110368D03;
	Fri, 20 Feb 2026 14:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771592827; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uo3FcRrNZvstHgRU0C+fsC99kQyzBJu/3TRSEsjzZcY=;
	b=cIhNC/yeyGEXOr8hB2fKyWRIDrhtrYhQ+Dn58LEK1mumw0PVrLrBtXKh81i0hWWmGhVz5G
	Wc37Fg22da2blWMSPFj40i6qmgd7HTiasomWmOje8YtFL3taQH85fr2wUwFo5ZlFQCrNgh
	0nlS7XSUz1T/M5fZFOeQbsM3j3ilA4dSHxzbTuxgeoS07XLq2bJFYL6/t2OV0xDc52STBb
	U9SEvoBfDvxZyPrb1RxYQSwefDuHNKLPMKSh1JAsCx8+eYyMkCt6TRWD3tQ/2IoAwm+uII
	7WWUAvEDo0rsDj9tvD9mvp/RoIS+3HhdPbQFGBf2a7Etoj9uT0u/QWkWCiR3tg==
Date: Fri, 20 Feb 2026 14:07:03 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, James
 Hilliard <james.hilliard1@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Stein <linux@ew.tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
Message-ID: <20260220140703.0ba7b435@bootlin.com>
In-Reply-To: <CAMuHMdUkdF1X7xZvu9uhNPJBnq6grq-BvBk-598f=h7uTbYbVA@mail.gmail.com>
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
	<20260220091727.5330accd@bootlin.com>
	<CAD++jLmwAb35RW1fh3ONc-R4ca_NeWPWhWag-c-xv0oACNAG9Q@mail.gmail.com>
	<CAMuHMdUkdF1X7xZvu9uhNPJBnq6grq-BvBk-598f=h7uTbYbVA@mail.gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,ew.tq-group.com];
	TAGGED_FROM(0.00)[bounces-31958-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4c:email,linux-m68k.org:email,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 29F2A167AD2
X-Rspamd-Action: no action

Hi,

On Fri, 20 Feb 2026 10:15:59 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Linus,
> 
> On Fri, 20 Feb 2026 at 09:35, Linus Walleij <linusw@kernel.org> wrote:
> > On Fri, Feb 20, 2026 at 9:17 AM Herve Codina <herve.codina@bootlin.com> wrote:  
> > > With nexus, you cannot translate &spi0.
> > >
> > > Also nexus works well when an index is involved. In other word, it works
> > > well with phandle with args.
> > >
> > > i2c-bus = <&i2c0>;
> > >
> > > In this kind of of definition, no index are present. With nexus node, this
> > > looks like
> > >
> > > i2c-bus = <&nexus>;
> > >
> > > How to handle multiple i2c busses with nexus node?  
> >
> > Can't you just use the foo-n suffix trick from the pinctrl etc?
> >
> > my_nexus: nexus {
> >    gpio-map = <...>;
> >    interrupt-map = <...>;
> >    nexus_i2c0: i2c-bus-0 = <&i2c4>;
> >    nexus_i2c1: i2c-bus-1 = <&i2c6>;
> >    nexus_i2c2: i2c-bus-3 = <&i2c8>;
> > };
> >
> > &nexus_i2c1 {
> >      sensor@4c {
> >           ....
> >      };
> > };
> >
> > Maybe it's not as elegant but I think it could work?  
> 
> Wasn't that already solved using i2c-parent, cfr. the connectors
> discussion at last ELC-E?

Well, I wouldn't say "solved".

But yeah, the idea is i2c bus extension:
https://lore.kernel.org/all/20250205173918.600037-1-herve.codina@bootlin.com/
https://lore.kernel.org/all/20250618082313.549140-1-herve.codina@bootlin.com/

When DT overlays enter in the loop, the main issue is to reference a
symbol from the overlay.

This issue led to DT addons to replace overlays:
https://lore.kernel.org/all/de02ed8c-0176-4996-ad7a-680a2e115161@beagleboard.org/

All of these is really out of scope of this "dt-bindings: gpio: add
gpio-aggregator binding" series.

I am open to discuss nexus nodes, busses, DT addons but I don't thing this
series is the right place to do this discussions and, on my side, I don't
want to pollute James' work with all that stuff.

Best regards,
Hervé

