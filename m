Return-Path: <linux-gpio+bounces-37478-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEdbHPNzFGokNgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37478-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 18:08:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B20AE5CC9BB
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 18:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 166AD30136BC
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2362D349CE9;
	Mon, 25 May 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="AYDeK2nq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3A02F7EE5;
	Mon, 25 May 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725284; cv=none; b=SedlIhZL5cHyaN6fswRe8EQtDmSluQjVxpU245ZNz7AlNAgQ4N9Sx5LhoV5o6n1tUrHgu+jrFWgNsk0mGDFUviJOOZdq8ndvsaEvjLGhmWGFZs/QNwwIAJCKAkj/YJwU5dPYUXMmq/pXpymL4WRQMsDGwvXa+Bok0oA2JVoMie0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725284; c=relaxed/simple;
	bh=GbRPHHiQsxD4xUtNT48hfYk8TDSXOmW2yRGzpvs8x60=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=gGwO7h6CafnQocsItrXq3R/cWjj+s32k8Th1bHrM0+n4vamkWa/sPBkZ8PGbg5VonodCrZ40h64D1WcBnOYatlwhTah+vIY6YCsxHtAWXJuLPBZtCFncbMH1BWUfCfNH+jnYXYgse1lxZGld0I0JhRunrO1l6x8N+QJIQDA3aMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=AYDeK2nq; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779725281; x=1780330081;
	i=markus.stockhausen@gmx.de;
	bh=XfTJN+KrRLh/FBA8ycnlDczTS79RxLqiDmHuVL8Bm9s=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AYDeK2nqHpdtU2IISixaw5oOr3mdPoFh5q+0VTBRYFGNPu/l7p4SfVoZunekeB65
	 QOUw5DbrCrbc1BUXbdjSxkjkzrM4hZo/QAZhrEhCilpwOovgnrrUKyI1KYSgA1pNk
	 AvkDs88elD+i6S1vxzCGr53aF7AJ/P6PlCpRXJDsL65jlJ2umD8hq54wA6eAfBAKd
	 yPeXwW1+mhPP/mAVM9oOVrY4iizdrLGnMMlt8pjCWm6hKCFLJpJBvGz/r1Jb62aB8
	 wms2ME/n3WduYOM9uMZq1doZY6KFXIBag6w79oJGaxhAtKmVrU2a8GcTyyJwlCWnf
	 +MlM8W3AZtx9LZwRdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUm7-1wcFDS0Lmx-00F6IR; Mon, 25
 May 2026 18:08:01 +0200
From: "Markus Stockhausen" <markus.stockhausen@gmx.de>
To: "'Bartosz Golaszewski'" <brgl@kernel.org>,
	<wsa+renesas@sang-engineering.com>,
	<andi.shyti@kernel.org>,
	<linusw@kernel.org>
Cc: <linux-i2c@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
References: <20260520173129.1382489-1-markus.stockhausen@gmx.de> <CAMRc=Mf6EQDF-fSVb+jhmLvMUi2eJ5QhukKC08S-T12HKinibw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf6EQDF-fSVb+jhmLvMUi2eJ5QhukKC08S-T12HKinibw@mail.gmail.com>
Subject: AW: [PATCH v3] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Mon, 25 May 2026 18:08:00 +0200
Message-ID: <00c601dcec60$a9496f90$fbdc4eb0$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI6zeFKpso+Safsn/FOU0fhx6fKEgKiQYsdtU4SIuA=
Content-Language: de
X-Provags-ID: V03:K1:BBeQGrF9YjkFPBSC9oMZKdal3bm1lNGyl0ewk0AKB3v3Aj5LXWh
 WulInmBBjqX9+iOGs1GDAIGU2nezMJG12bPLS4miLGG+WBsOmpInmBF22YN9foib1NHfXvs
 a6qCWG0FWbs9w0F6VZ+CEwJuh/HaF7S79AcPY9xqHjzBhBWzvLnUcPJVwMiUtk1AF3T7ddO
 QvlrSjQQf7Gp2ovY+jB7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X6aICp7Mb9k=;mhrkgOvo5SnaYCctFahJW3aqSZ8
 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
 3dh0/i4WS0MZjYzoEs=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37478-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,gmx.de:email,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: B20AE5CC9BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

> Von: Bartosz Golaszewski <brgl@kernel.org>=20
> Gesendet: Donnerstag, 21. Mai 2026 10:59
> An: Markus Stockhausen <markus.stockhausen@gmx.de>
> Betreff: Re: [PATCH v3] i2c: i2c-gpio: Enhance driver for buses with =
shared SCL
> ...
> >  /*
> >   * Toggle SDA by changing the output value of the pin. This is only
> >   * valid for pins configured as open drain (i.e. setting the value =
@@=20
> > -53,7 +72,7 @@ static void i2c_gpio_setscl_val(void *data, int =
state) =20
> > {
> >         struct i2c_gpio_private_data *priv =3D data;
> >
> > -       gpiod_set_value_cansleep(priv->scl, state);
> > +       gpiod_set_value_cansleep(priv->scl->gpio, state);
>=20
> That one bothers me a bit. We're driving a clock line but may=20
> end up sleeping? That doesn't sound right. We typically do:
>
> setscl();
> udelay();
>
> I know it's been like this before and maybe I'm not understanding=20
> the whole picture so feel free to disregard the comment.

ATM I can only ignore that because I have no idea what this code=20
is about. Maybe soneone in CC can advise how to handle Bartosz's
question.

> Reviewed-by: Bartosz Golaszewski =
<bartosz.golaszewski@oss.qualcomm.com>

Thanks for that.

Markus


