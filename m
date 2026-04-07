Return-Path: <linux-gpio+bounces-34849-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xjt9AIqD1Wmv7AcAu9opvQ
	(envelope-from <linux-gpio+bounces-34849-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 00:22:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681F3B5497
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 00:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BE253018AE2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 22:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B37E37BE8B;
	Tue,  7 Apr 2026 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="O9UmWEZK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A91024679C
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 22:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600517; cv=none; b=euBC+OxPpB6oxhEDD3KMehQ5wBCwcE1VmaWiZcZjFwmVO5olLRwVLZBuADujCQTuhJku5dFauYbik3HESu/Oq09Lrkdl93NeD+A2F5QJv2O//2q4yCs2uYMl3k4yNXAxigqcdejxj0Vjbl0wl6/360SYNlRhOHmGCLXIjkQdR44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600517; c=relaxed/simple;
	bh=+3I2mvVshnTfDQl0HlS3kvUra2np7cG6URL2eOqZMfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKlfZKPf073ELJJ1ITWeX/ZEm6FA5AFqkinLasK0Wm5DGVTcHCrRp+jNpTDczw5v/XWKZnExeAPzR4W0KvhJqazLruafKNrNKTSQfLNzVPsXHW0SylArQ11kCIw2ORWXlUOiMUboyEvJswC8gm+fbYVkkWPw8Vt9bCLsZf3kW6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=O9UmWEZK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b150559bso19951185e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 15:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775600514; x=1776205314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T6utWXlZf4zJ+rD/H+yh8m2jcl3T/RJUmT9UPcUJ8Jk=;
        b=O9UmWEZKgYIvaFcdFzUK7drv1Tt8DiY9eIsvue9jnTdlupmsOESBTurm/WKEF74fsa
         3C2xVwrbTVxM954NXLMcN3n5DBWnsPQmrf59g3PUQK4YGAyfBWqvdLzkyRr5ZaHzh+e4
         JBAsvmUo0R5HRzqAXpYboj9VAsMz0cnW9QS6ebBPsvT29S+mNxZyPC5EKD3TCiGtXuYn
         JMyC/RrmBxwZKSJFHag5WuR+UwcXfchcWwh2dPwkLo4cfD21h+N0obPXfBye28xiedrE
         S1OHv4Q86NJKi1FiZ1HgQ7mAq6ff0mktTM6GcqZCFvS/Xw44PAfMX2S5BpXmlL7q739O
         9kBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775600514; x=1776205314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6utWXlZf4zJ+rD/H+yh8m2jcl3T/RJUmT9UPcUJ8Jk=;
        b=C7kkWtRWLr5LOJ0XqfM9P4ERfVYPmgQbLn65cu7ad4RMw5Gz03Ug3P3woZHEettunf
         5lIzs3eWUwMFmW8as8kI87yK8yyIIzfH1F+ocvNo+N9hJrjgGIrrpLCXRebXtyMSH++r
         NqEcrAFGopUlDAoocK3hr067cmo8Z67H6OBO+27VKk7itWHkQUa6NBCqifJVHTGoyq41
         9nMXuTc8vfI6HrdExSj185k30s+lfcsIDdl6jpXfJmiR46vIPSkGPPxMXm98DY0rZVnN
         1D/5t9mMLy6wY92GEYZpjHpJQSZ+oRkoNb5FevDSVGdsoj+i0+aAAIB6iD65yn0vNfR6
         ZRug==
X-Forwarded-Encrypted: i=1; AJvYcCXFDIBGjvkpXhpg0m0HGQiyY6XEFTMvjPcAQ12/ec0lgwgnm9c2lm96l+V5Sfq2p5ov0hNPP+EhOLtM@vger.kernel.org
X-Gm-Message-State: AOJu0YxeBM+BPDcrNypesLjUULsb5AFfGCKHi9Lqu58IU+X9apZw8vsl
	IbEoKZCbAAWoBzJGIwbaGdKlGj1PgvUS6J6bNVfQdJ/xhC3ZV47D3f1B40MqUCIsoRyB0VFho9n
	YDohM
X-Gm-Gg: AeBDiev7mRKBnTs2+gFGYpnt2K+lW1YsGwJQaE/lpH9QzElu27t6B7Lf2wyTyg/uikf
	oq4rEikDwNOGl+HCKgzk5EL8oAJcGu56J73YQMulXFGtR0sVW89t8T7FtGOH6hSZg8gQZSeDRzz
	HAS9pTIUEsdJxz082ydWPKMnoaZxpHjmiJmYVnNDC0Y9swKXF1sxv2IQo7E0BRyfWO4anHkRbTj
	6F5oM+xzy/AiJWL/oAQS+GfKoMa+lP7e/cvI2JBPijl27bMCamCjxR2sKVG1k1tUnsKYrSAZ6hQ
	j6wrBoy/OXN6hj9KQubI9CHnRoMZ3tJjczO0Wt1EPP6hq2Wex3L+EdOH95kYlFy1rSiTjcY5LFP
	sL+6AgplqnAmhTBiX+KG3cRctMOyQfylBnjnDOebTi3wPPzxfC6CJ49N4i4laYYHJNAZMGJRstf
	LRIe7AtuAuKYnncboNSFHiyeBn4qD2
X-Received: by 2002:a05:6000:18a9:b0:43c:fd7e:72eb with SMTP id ffacd0b85a97d-43d292ec159mr27318253f8f.41.1775600513592;
        Tue, 07 Apr 2026 15:21:53 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43d1e4e221bsm51109989f8f.29.2026.04.07.15.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 15:21:52 -0700 (PDT)
Date: Wed, 8 Apr 2026 00:21:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Francesco Lavra <flavra@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, 
	Sander Vanheule <sander@svanheule.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Dmitry Mastykin <mastichi@gmail.com>, 
	Evgenii Shatokhin <e.shatokhin@yadro.com>, Arturas Moskvinas <arturas.moskvinas@gmail.com>, 
	Andreas Kaessens <akaessens@gmail.com>, Radim Pavlik <radim.pavlik@tbs-biometrics.com>, 
	Thomas Preston <thomas.preston@codethink.co.uk>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during
 probe
Message-ID: <adWClh5fXP5OJeU1@monoceros>
References: <20260330161914.1071118-1-flavra@baylibre.com>
 <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4k4tr5qy25kz7wsd"
Content-Disposition: inline
In-Reply-To: <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34849-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,svanheule.net,linux.intel.com,topic.nl,yadro.com,tbs-biometrics.com,codethink.co.uk,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 3681F3B5497
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--4k4tr5qy25kz7wsd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during
 probe
MIME-Version: 1.0

Hello Linus, hello Francesco,

On Tue, Apr 07, 2026 at 08:58:09AM +0200, Linus Walleij wrote:
> On Mon, Mar 30, 2026 at 6:19=E2=80=AFPM Francesco Lavra <flavra@baylibre.=
com> wrote:
>=20
> > A chip being probed may have the interrupt-on-change feature enabled on
> > some of its pins, for example after a reboot. This can cause the chip to
> > generate interrupts for pins that don't have a registered nested handle=
r,
> > which leads to a kernel crash such as below:
> >
> > [    7.928897] Unable to handle kernel read from unreadable memory at v=
irtual address 00000000000000ac
> > [    7.932314] Mem abort info:
> > [    7.935081]   ESR =3D 0x0000000096000004
> > [    7.938808]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [    7.944094]   SET =3D 0, FnV =3D 0
> > [    7.947127]   EA =3D 0, S1PTW =3D 0
> > [    7.950247]   FSC =3D 0x04: level 0 translation fault
> > [    7.955101] Data abort info:
> > [    7.957961]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> > [    7.963421]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> > [    7.968447]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > [    7.973734] user pgtable: 4k pages, 48-bit VAs, pgdp=3D00000000089b7=
000
> > [    7.980148] [00000000000000ac] pgd=3D0000000000000000, p4d=3D0000000=
000000000
> > [    7.986913] Internal error: Oops: 0000000096000004 [#1]  SMP
> > [    7.992545] Modules linked in:
> > [    8.073678] CPU: 0 UID: 0 PID: 81 Comm: irq/18-4-0025 Not tainted 7.=
0.0-rc6-gd2b5a1f931c8-dirty #199
> > [    8.073689] Hardware name: Khadas VIM3 (DT)
> > [    8.073692] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [    8.094639] pc : _raw_spin_lock_irq+0x40/0x80
> > [    8.098970] lr : handle_nested_irq+0x2c/0x168
> > [    8.098979] sp : ffff800082b2bd20
> > [    8.106599] x29: ffff800082b2bd20 x28: ffff800080107920 x27: ffff800=
080104d88
> > [    8.106611] x26: ffff000003298080 x25: 0000000000000001 x24: 0000000=
00000ff00
> > [    8.113707] x23: 0000000000000001 x22: 0000000000000000 x21: 0000000=
00000000e
> > [    8.120850] x20: 0000000000000000 x19: 00000000000000ac x18: 0000000=
000000000
> > [    8.135046] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000=
000000000
> > [    8.135062] x14: ffff800081567ea8 x13: ffffffffffffffff x12: 0000000=
000000000
> > [    8.135070] x11: 00000000000000c0 x10: 0000000000000b60 x9 : ffff800=
080109e0c
> > [    8.135078] x8 : 1fffe0000069dbc1 x7 : 0000000000000001 x6 : ffff000=
0034ede00
> > [    8.135086] x5 : 0000000000000000 x4 : ffff0000034ede08 x3 : 0000000=
000000001
> > [    8.163460] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000=
0000000ac
> > [    8.170560] Call trace:
> > [    8.180094]  _raw_spin_lock_irq+0x40/0x80 (P)
> > [    8.184443]  mcp23s08_irq+0x248/0x358
> > [    8.184462]  irq_thread_fn+0x34/0xb8
> > [    8.184470]  irq_thread+0x1a4/0x310
> > [    8.195093]  kthread+0x13c/0x150
> > [    8.198309]  ret_from_fork+0x10/0x20
> > [    8.201850] Code: d65f03c0 d2800002 52800023 f9800011 (885ffc01)
> > [    8.207931] ---[ end trace 0000000000000000 ]---

I haven't looked in detail but wonder about the the noisy failure which
makes me wonder if there is an(other) issue that is just papered over
here.

Apart from that, it makes totally sense to disable interrupts during
probe.

Best regards
Uwe

--4k4tr5qy25kz7wsd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnVg3wACgkQj4D7WH0S
/k6WPQf/ZPebWlg0rBAd/MYpWTjjgqOWaXyMmUSyAyl5BAB3xJw6g/CsrJrMfmrM
arAENs5VYKzLWIBR1agiDNRk0pBKqcJcYOTB7WLdZ22AY1iy0NkunMlHAVBCXQqn
l80He2hrdndDIh2TWWDgFm25pSFQ0Zd2+89jx5RUeXIOQSoB7g5UfpLYDPX1PgHj
0FxZfPsN/xlyldsIRnW6Wi040J8W+bMfkkaIHxhbwfskcNAsyDWUk5I7+C3ndre3
LlCX6aZxjT0HBVqT9fNIrM3uMvAwndxRm7ZeggBaROY/mg2Kf8T2C4hGXn890cMU
VVOqiE9+oTJ/AFzlRjFL/9498ynUdQ==
=79p1
-----END PGP SIGNATURE-----

--4k4tr5qy25kz7wsd--

