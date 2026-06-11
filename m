Return-Path: <linux-gpio+bounces-38302-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4r45LkNLKmoHmQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38302-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 07:44:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D29A66EC21
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 07:44:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=bt9ZSPpW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38302-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38302-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17D87301E9B6
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 05:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFC7348C74;
	Thu, 11 Jun 2026 05:43:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF93451C6
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:43:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156594; cv=none; b=RuZ03XGF14GtgHDMSnsawdkHOJOIIWHuVdIjkdJ/T0Dh+RVxkimUSmIvfGIX7VjS9UlBg5zsQHmNflCZ1Fi/cIB2xpYD2tFPhPVYE1vRGdt+pnQUhzH1tNub6vm7E0TXnmESEDaob5qFsOtAf4fonUEAkCBRFPf1vfhh5sXlxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156594; c=relaxed/simple;
	bh=cgnZe9Zo0ZHFjiKAvOqf6uh2UWx48g1JrXcQ5xzTeqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdOz7YTywe2ECnKC0bHEUw25IPAOALvf0QC9o+RjfCtCaLOFI++9BqHnEyhifWvAvh9ze3POuPSP79FdOIvXo8l/OpyJNTWr6Mkx7zziUIsmU9Aq2Ti7v2DChQbU6i+KIpyafFz073tzPrOR25+BZDbi3Yl9G/HQa/fpYbq9H/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bt9ZSPpW; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso2663845e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 22:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781156588; x=1781761388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cgnZe9Zo0ZHFjiKAvOqf6uh2UWx48g1JrXcQ5xzTeqo=;
        b=bt9ZSPpWS2Sdli/Xi9TsXZQaFc8pzRX98WZcL5JuoLxU2CbZQtDqzlsnfbtzJnIfAD
         X5KzS3O8Ho5VbMi2OP5XNI+lrP340TJVOar2pvCyXsgZy5QvHc2GtHNfaL4H+84/bddS
         M7OLai//ptOEIThOYdAaig4poPYKzJPyPr8jTd6TO+NgtlkakK4K5g4tBr+mZ9zn9SLH
         ejWqJ2MSAeARatfpnHCL55M4YZfLVr640O+A7Wn7NQy5gqiEGSr6+9Jj5L0Mu4vx7MNa
         ieSte1BDuCvzGEV5Si0EbC5eeDxWYgf4XZAS21Xz3Qj+/ncI0fbccY7EKVFM0+kCLCiQ
         DhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781156588; x=1781761388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgnZe9Zo0ZHFjiKAvOqf6uh2UWx48g1JrXcQ5xzTeqo=;
        b=jjEPAVWgaUojCnAhnDibrq7V7rQL2Co3hlXurIJHIyIN7CudxsjB5ESE8pmVkS0vKe
         2Dh9y2v4SUw3X69XpNbUn9YGg0VO0z7ghD4XFkb5H16E+Nao+8RzIW1ipG9xzkZPqSCW
         MHu6K9e2LAC+ZtHnLL4VY2jBZXMWKBbjzaUedBROzGmI3lWNhH13MP//lv3NgX0qIxtr
         PxhX/gX9i6ld/PIsmm4tiboDlchxfsfc3wwVvisUc6cc9ir+AccXD2vdGTz2jU9Sxsza
         HRAGEmTW9DEfrsNsXGxt6H82rFqhBKQHBOmcaVuab6f9s0hlcwVvB3BAn7eAEDySd9To
         zfyQ==
X-Forwarded-Encrypted: i=1; AFNElJ82BEkVMHa86VPQS6G+adtAFJV2xgsRzJI08OQLcza8kWMEFKOMdAR1UVm0x2//O2f/4DbWSBQTCRu1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz926OwToEvaMbLYMx9lRLB2Zq+ZeHTb2twvVTpiBbcfTNDX6o4
	qvifrq6qV6aZf0/0e1zA36N/1emqcTV1OBx3reYh6gFjqSqnpNuvdrFqt1Z6z7HxSjA=
X-Gm-Gg: Acq92OFDsrzfJrcJMdqp11PcAwL1vGneBLMs2Y7i+OjbJejr0ZlDlb8D+b+2pwFHFwW
	qDQ5LRqiJcZR+NyhTFrc5S5NoyWHy2PuO3IYpo2NyUHQn0ZCp2rwbd+xVBZqOCNWo39OysksNdN
	F7MMXFv8o+fRbi8D0EJlknHU6V8DacYBWL6eu8am2r4sY+r8xHRqK4zRSfJnopNBl6MpntG+PZF
	CcY4bbmiubZsa8qt9+ppS5UiakLqFWoaYDQg0cvTIPUtGG5/a9lNGmB6BW1oTgFIVnPd7OPGzJT
	NHKF6AmTq9rO1kfy+ArwXKEPXGxaxDn1ZgywHO+LBqypSqsb/xTiS04Jhn0zyaDa1V8TVoEfFAp
	3hpJ4r7Lt5XYitAVjcHDQTeYsubjFNbMkfqOcOKvYYOiyZdOo4Xzg/inp1gcq6gMUx7ZuDJ+7eK
	ft5tpUYxCHfRled5M8Swk6T3kr8zZ3jgb7SN1Idwk=
X-Received: by 2002:a05:600c:2d4b:b0:490:da23:1d50 with SMTP id 5b1f17b1804b1-490e50fc9cemr6949465e9.3.1781156588495;
        Wed, 10 Jun 2026 22:43:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f35fb24sm83598500f8f.34.2026.06.10.22.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:43:07 -0700 (PDT)
Date: Thu, 11 Jun 2026 07:43:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sashiko@lists.linux.dev
Subject: Re: [PATCH v1] pinctrl: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aipJa6qc8_isXFd6@monoceros>
References: <20260517134835.588648-2-u.kleine-koenig@baylibre.com>
 <aimZ-yzZ1hAut_KF@monoceros>
 <CAD++jLme4HQjp6kWWsgtuiAfzPU5mUOHPEY0EBWF9dZSrFp=Ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="csy4capwujfxztmy"
Content-Disposition: inline
In-Reply-To: <CAD++jLme4HQjp6kWWsgtuiAfzPU5mUOHPEY0EBWF9dZSrFp=Ag@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:patrick.rudolph@9elements.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sashiko@lists.linux.dev,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38302-lists,linux-gpio=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D29A66EC21


--csy4capwujfxztmy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] pinctrl: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hey Linus,

On Wed, Jun 10, 2026 at 11:22:32PM +0200, Linus Walleij wrote:
> On Wed, Jun 10, 2026 at 7:09=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub)
> <u.kleine-koenig@baylibre.com> wrote:
>=20
> > Gentil ping! I'd like work on the patch series that builds on top of
> > this patch. Do you still have it on your radar and maybe even consider
> > to apply it for your v7.2-rc1 PR?
>=20
> Actually I was waiting a bit for reviews but noone is saying anything
> (not even Sashiko!) so I have applied it now!

On the sashiko website my patch doesn't appear, so that there is no
feedback is no surprise. However why my patch didn't make it there, I
have no idea. [I added the sashiko list to Cc: in case someone wants to
do some research here.]

But let me assert you that sashiko is mostly happy with this type of
patches, the only critic is that sometimes I pick the wrong commit
log template or forget to mention that I also removed a trailing comma.

Given that the patch doesn't modify the compiled result, I think we're
save---even without AI feedback :-)

Thanks!
Uwe



--csy4capwujfxztmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoqSucACgkQj4D7WH0S
/k68FQf+KXPPTnUQ3jzjcRqrHFehW4igG5ntwzEqepVlejviYR6enZXlXlC+m7m4
3yI+jrob6bkAcapa+ZE3dhGBqCYgc4Eey3N/yyDptQ98BvunRoVY0Zo4euIrHIU1
nlTw5L7xnf1MPxOCyiUQTYBzikniJzK3Q6yiEWOSY3JjzbnnFGxJ7C17+Oa+5ic4
1rmo7wfTz5054BFScCiFhk5rGQcwGSfmACQEcYNDXSb1qcx56eUZZKIvGFadpQmH
cRZTO9+Bwng71J3stVAkpWq9Jugy6tchzp++N8XkxZbn6UoEj+WS6HgPrYUbqki0
/ZmR+3R5guKfGlxiiuFU40C4Lozglw==
=MwRd
-----END PGP SIGNATURE-----

--csy4capwujfxztmy--

