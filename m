Return-Path: <linux-gpio+bounces-38598-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UMkwE9WcMWrmoAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38598-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 20:58:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA456949EA
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 20:58:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=RlRm2E8r;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38598-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38598-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED4D4328016A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 18:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C093547CC7E;
	Tue, 16 Jun 2026 18:53:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83BE46AEE1;
	Tue, 16 Jun 2026 18:53:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635987; cv=none; b=N4w2qZc5m0DNfba/lXKvOtsyjrY2SNEZBknYfOItNspo/12x1WVIhaUxoFbLfSZas+dk3JsUCoElvCvtautumZran/MZ/MeQfjtuEtHaOMKYECPfZdk5QkCqrJEa8Ea0pyfDShH5dIWJ6xJUw5Li+LbH2KWeezeBtrxc4bVRBXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635987; c=relaxed/simple;
	bh=mC5Hh/vlyMBLLmQTm+RpMMEUFVFSRtAWLP1pwAEJOek=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=oOyhKugnFWikcPd3MZje1EP70dafOo+hJ5P08MKaDRfBdRG0KmTFPigzy26I7079yBuBgmt816AtgCgnbedMzcoJl4+0PyMpNytX3lZvOOLyRP5k7fXdLJJCkvsRre6Ooj+rRxhzv0Twq3a0Ql/RM6ygtZtXR5+QFp7fmWg1duk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=RlRm2E8r; arc=none smtp.client-ip=212.227.17.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781635979; x=1782240779;
	i=markus.stockhausen@gmx.de;
	bh=fGcPX+qhHTbd6JIJf84c39fJOfQUD/rT8VK6ZRiJ7J0=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RlRm2E8rv+8tDaqXfT1sFNHlyF2U9NyueEt4w8ZpQSEqUP14O0YJMTjOysntjs7G
	 NFRfNWd+uQRIBumoJA0eaOeVyL/AcBXFxE7UbWWxNWGqbfe3xzMch96Bxmku8RDrX
	 29yWj1ndNjfODA6BdLIHlT7DVBL0kpZyu5P1IPPSb4/Du5x8L7vBX8rf2GKPpIn+i
	 XsEug/CPb9cJMqq0ctCqu6Rwrviy2RxLLYxr3iImM2rJpiKghtGifnvDdo7aLtIeU
	 k/NMPN1Xj3w6kRGEDBLJvYiJWbmwc01/2In042gXjLrTp6XCUPkRKJppzrOs5MFvB
	 eiFPBE2Hw/b14wAutA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYbu-1x3hSv2PDq-00aNC8; Tue, 16
 Jun 2026 20:52:59 +0200
From: "Markus Stockhausen" <markus.stockhausen@gmx.de>
To: <andi.shyti@kernel.org>,
	<wsa+renesas@sang-engineering.com>
Cc: <linux-i2c@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>,
	"'Linus Walleij'" <linusw@kernel.org>,
	"'Bartosz Golaszewski'" <brgl@kernel.org>
References: <20260520173129.1382489-1-markus.stockhausen@gmx.de> <CAMRc=Mf6EQDF-fSVb+jhmLvMUi2eJ5QhukKC08S-T12HKinibw@mail.gmail.com> <CAD++jL=d9e5HiR=JtwNjiDy-ihq-kzPo+1JtxH4Mwm+LZ6CG5A@mail.gmail.com>
In-Reply-To: <CAD++jL=d9e5HiR=JtwNjiDy-ihq-kzPo+1JtxH4Mwm+LZ6CG5A@mail.gmail.com>
Subject: AW: [PATCH v3] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Tue, 16 Jun 2026 20:52:59 +0200
Message-ID: <008e01dcfdc1$5a9a7660$0fcf6320$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI6zeFKpso+Safsn/FOU0fhx6fKEgKiQYsdAsuf2FC1WnYnEA==
Content-Language: de
X-Provags-ID: V03:K1:du2rUOyi7UqNSn+INcmkSigHQTNb7Nk6ldLrSmj4mjVDqWt9FWd
 vcTVOZdxnQsKZwIPmybShboZoOQntUF9QEV4I3xkscJWtIsLDoVVqu3y6JufOqdA4hiPqd8
 rOf6KLmTroh9sYQovR06qyH5P9icAmvzzX++RXc7bA9yDvQWuN3MDYHvBbO47uVwS+gC+d0
 qlTsTpxLXJEDTj7w3stcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6Y48C2X+oMw=;KgvFAQ70cKxmmyOopQW5nM7tFBU
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:wsa+renesas@sang-engineering.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38598-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,gmx.de:dkim,gmx.de:mid,gmx.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBA456949EA

> Von: Linus Walleij <linusw@kernel.org>=20
> Gesendet: Mittwoch, 27. Mai 2026 12:25
> An: Bartosz Golaszewski <brgl@kernel.org>
>  Betreff: Re: [PATCH v3] i2c: i2c-gpio: Enhance driver for buses with =
shared SCL
>
> On Thu, May 21, 2026 at 10:59=E2=80=AFAM Bartosz Golaszewski =
<brgl@kernel.org> wrote:
>
> > >  /*
> > >   * Toggle SDA by changing the output value of the pin. This is =
only
> > >   * valid for pins configured as open drain (i.e. setting the =
value
> > > @@ -53,7 +72,7 @@ static void i2c_gpio_setscl_val(void *data, int =
state)
> > >  {
> > >         struct i2c_gpio_private_data *priv =3D data;
> > >
> > > -       gpiod_set_value_cansleep(priv->scl, state);
> > > +       gpiod_set_value_cansleep(priv->scl->gpio, state);
> >
> > That one bothers me a bit. We're driving a clock line but may end up
> > sleeping? That doesn't sound right. We typically do:
> >
> > setscl();
> > udelay();
> >
> > I know it's been like this before and maybe I'm not understanding =
the
> > whole picture so feel free to disregard the comment.
>
> I think there are people driving I2C on slow buses, i.e. a bit-banged
> GPIO I2C on a GPIO expander which is itself on I2C.
>
> I'm not saying such hardware design is a good idea, but I think
> I've seen it...
>
> The only way to make that work is to use gpiod_set_value_cansleep().

Gentle ping.

Thanks.

Markus


