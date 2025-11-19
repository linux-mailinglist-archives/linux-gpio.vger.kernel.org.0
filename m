Return-Path: <linux-gpio+bounces-28717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE4C6C347
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 02:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5117E4ECF25
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 00:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3091922C32D;
	Wed, 19 Nov 2025 00:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEJc2POE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956332236EB
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513764; cv=none; b=LxvxUuWOIylCbrmPw1YORJXNXW8OW1BZ3R79fi16Na1Yxnx2bL/zZGaxb1PcyBnubjYK2T8YDV0H8DlZHTn8+3gXzeQT9GKizXc8apJkGKaC9l4XuptMtH5BNVUjlfuQiKD2e6lv/OjqLT9q6D2EQDPG3rD41eXX7qbKCgninN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513764; c=relaxed/simple;
	bh=BKrNrP8BjGezbcXd8uDclY2ruF3VWM3i6lCtYxUZQK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WF9+u9cmLJ8QPfAE5H7kHEzzL/MQdD5lgs8cfNkXhmtTQ1G8rcf8viyDTs1uxSgaLcFDlmDBoRci8Aj3JcgW5o9/VdCXhIJ7Q5d5Xkwxx8mw1ggRpJA9gaTXu9BmSCzUNsAfMaHIncg/w9r7JKt84jC8GHj0I84pJztM5cH9Dmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEJc2POE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b8d99ad095so302971b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 16:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763513760; x=1764118560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qo4JEq+KOie/L0hcnmnLjawlkwhdvWZpyF7Tskgs2WA=;
        b=QEJc2POEKdeXlpGAMhH/yh9wa04es9nE9uwVsto6r0yrmjKr5H/BzGo8LaFGlsQCHG
         M9PiOSCklUYE65LHioTA8Q+GzCRT7vn5fElb7WrHQsPNEQxh4iZA44wODuZIuKZvsLfN
         0x4jqubYGaIp63RHcYy7Rc+W858ZHyN58S5TGK+t3RZjQw14MDBsHUGm4YbJm7BLjLc3
         DYUDZPBIHHRR3KMFa35gyQFk0ogN+ikqpIuqMqCTouGB59JnRdNGhcgJWjfOP/pXt05e
         VIZIunOFV5428Ji4512XQigy6HjDUfadcBDD4DauYs4hdgRfWdnOoga4nvDNZcMSEuNR
         F88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763513760; x=1764118560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qo4JEq+KOie/L0hcnmnLjawlkwhdvWZpyF7Tskgs2WA=;
        b=RtfJ63WjZl6gBs8YDFPfjRWnMIdZ2LBsPE1+EEECwuqJWZgbOq50VTSEzqL+QSdy4w
         EbIbN+Qr2kHi2CkbSpvSAzWs6ktoY1QMtGJqhTOnVWai/EB54ZVSMbClc/d1GX4mUD+S
         Pp5kAspkdgepkkoPvLVzMldTHZb0xKk6MqiMYXhz0nRSPRTVijpxQI1aS3HqNgLoyuT8
         I55IxtG0ORmxC3o58XYcCygIY2LJg21PaE4sqEcHNrtHqCdjw4r1brOzH14zyjVDfQ2H
         SpWisQdDZOABTnrB1oil0pr0aqPm4NMiAs4PPBspp2NzFoM1MvjZTFdQy7Oj1HtbIGgV
         8TaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyJohIaMfkm3eoYXSz+k62+FscQBBhfOeQJIkma4R3ikQ3Qtqnz7YhUSy9OebujIJVYH0Sw3fFgxMv@vger.kernel.org
X-Gm-Message-State: AOJu0YwBDABZGqfutU7S9gSh+Jgaad9bxVoxi1iq7CcCBFU/nEd9ylMO
	/2OuGBTEqQpH/jcpAn4dKkkAeSfcm0szaSds4MitAyEItSdhY5OnBufGKCWEGDncJGQ=
X-Gm-Gg: ASbGncvgF2z23OvgnMwLsVF+q+iwgf9OUY9XZIu40Il3+ohVAzA+Tgt3FXCpGh5o6cT
	TIJm59PrXwiZ6sN6iZkyrr8rSFmnOpCLI4URc1aVKLGKa8hg5rMgI7oSQZaXT6gG4ol54qirI+Z
	w9KnQP9UYUZeQ82TaHIRMIBa0iLcFZ4cCcHcz2ff5XiFxpsFpKXYQp5P//BtMPZ+1+5NyGj+9PD
	ypcIkkeF5P9dLHI1R02/JJCLVX3dy3Kt+puwPI/0dE56fbCY5f+eG9/l5jucaN2ixm7KR3cIy5f
	fMOmG5sxtWvb7CkSNWWLOqKxf6leNgdvUDiyoDesjl1BYu7YoDdnXSu0sqs74V+wYLhcsL9jO/W
	f8uNpZfpnsW5xjkbYeZghruhBE8prgpxMaQqQ91LGBB3St9tUyElb7KU2tE2EeYUCU9FzBTKfh2
	ggB34zhKNY+qQ=
X-Google-Smtp-Source: AGHT+IE/M14afXvdq5MKXj+LWlmsFFeyMGuj4xCweOKwCSV1tbS4gqr5aW8zZmdh7h2vwGllY/FvLQ==
X-Received: by 2002:a05:6a20:9190:b0:35f:5896:859b with SMTP id adf61e73a8af0-3612ed3d961mr677749637.4.1763513759747;
        Tue, 18 Nov 2025 16:55:59 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927731e65sm17728848b3a.62.2025.11.18.16.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 16:55:58 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 514404241834; Wed, 19 Nov 2025 07:55:49 +0700 (WIB)
Date: Wed, 19 Nov 2025 07:55:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Levente =?utf-8?B?UsOpdsOpc3o=?= <levente.revesz@eilabs.com>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
Message-ID: <aR0VlNp-kR8kj9_2@archie.me>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
 <aRfWouKGA7q2ufCV@archie.me>
 <aRzBGhsLA_s1rJbM@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yOYvkH9L78ohLBAH"
Content-Disposition: inline
In-Reply-To: <aRzBGhsLA_s1rJbM@smile.fi.intel.com>


--yOYvkH9L78ohLBAH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 08:55:22PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 15, 2025 at 08:25:54AM +0700, Bagas Sanjaya wrote:
> > On Wed, Nov 12, 2025 at 11:48:20PM +0100, Andy Shevchenko wrote:
>=20
> When answering to the long email, please remove unrelated context.
> Thanks.

Thanks for the tip!

>=20
> ...
>=20
> > > +I went through all the datasheets and created this note listing
> > > +chip functions and register layouts.
> >=20
> > Nit: above first-person intro can be instead edited to:
> >=20
> > This document lists chip functions and register layouts for all chips
> > supported by PCA953x driver.
>=20
> I believe it's fine to leave author's original text here. Also the propos=
ed
> version is not so clear how these document was assembled.

Ack.

>=20
> ...
>=20
> > > +.. note::
> > > +     This is followed by all supported chips, except by pcal6534.
> >=20
> > Do you mean aforementioned banks offset arrangement?
>=20
> Yes. The chapters are per the stuff explained in them, so everything in o=
ne
> chapter or section is related to the entire chapter or section.

Ack.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--yOYvkH9L78ohLBAH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaR0VjwAKCRD2uYlJVVFO
o2ICAP9WHtChH9dyebnwypQSwklbupLbP3TG+lZ3z35QAY5QCgD9H1ZV6+A6Zr3O
UmiAM3izQ1UNBvZ70YamMwreBzk0pQs=
=zxU5
-----END PGP SIGNATURE-----

--yOYvkH9L78ohLBAH--

