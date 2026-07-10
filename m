Return-Path: <linux-gpio+bounces-39795-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k5wkIl+jUGrt2gIAu9opvQ
	(envelope-from <linux-gpio+bounces-39795-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:46:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C483B73823D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:46:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=dG3mIzjx;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39795-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39795-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15DBF30416E6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 07:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E7A3D3327;
	Fri, 10 Jul 2026 07:42:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8C3C81B8
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 07:41:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669320; cv=none; b=k0JLsx5yHU1b9OcCP3tRmeNR2gwNxV1kVySNzysw439wHHW7V2t/6p6zWQ6IQJqZ65C4Wq+6cE6sprlN1VNioFj+mXlGqoNerw1HME6ZdapRQmh1dcBD1UeeFhzVzuXceDC3zFhHOr+Nafz/wqSa6TM53B+UETDYP8mZ3mf6558=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669320; c=relaxed/simple;
	bh=T93RY8BFfs4W3gNLpnk8Dup8vZOb+pZgaXNLQW9klgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH18LYrWsjOtcdD0U2nqDSw2RaPUGfkC4TokhsA5zy31CWNJwSEskm/p6JlpJFVlbQjOdHms+3oo6Q3VI4HPOzH0OLIx6wP8dq2LvE8Gz/QTqXHEP6le0bIUhPwyW/GLLSi2GRNdYAgQ8hEAHrqYSmgd0ZFjAtBPk7fNUcqYwck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dG3mIzjx; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c7902f47so4846545e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 00:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783669317; x=1784274117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T93RY8BFfs4W3gNLpnk8Dup8vZOb+pZgaXNLQW9klgg=;
        b=dG3mIzjxQ19XSx7Xh0httDnnSYTYForJ6fciHVx8gUQFJd9U+6XIK1gkvmyHMJ7JDC
         yQoDniERqe4+o5EwKDPugkFXDjxK/XmYJxEsz0GNRXVtm6Tq2/nTLdH1PkQswkt+XjqY
         f9xdAJQqju6rVrPhyNN5YrfhocB91M57MIPDu4jRBYXJYDthnLE1cTYZFNGyw0vP1zwF
         7ojJQKg5MOGGDq+DxSmE00EgzmqbSKiQDyMprTs4aBSRAKIenM9GbhrBKZtVNa4JKD1v
         i85iA51xutw7njlCUdpgve3v1YSoiRjCKzxyRB63kxtD0cZHPRTC5g1N7t76BoqGsd+O
         13Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669317; x=1784274117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T93RY8BFfs4W3gNLpnk8Dup8vZOb+pZgaXNLQW9klgg=;
        b=IWOLSCBX+gDstiP99gckTCUzk7emgZ2C5IxxM0H3a0eOrXo0jVqhry9LCkRLCFzP4+
         PvuFlBxuFdtbPiCnUZQBRKmLZ73nSX1VMrjN1cJKx0l3j8vlSYExKGeaw+AqNLGloCZe
         QcmgCKUQ1DLSYXwFPsjX/ATMg+f/ZeW5X53RQd4SWRJZ/sXnQyjejFtIBEsWQmtt5IAl
         OrJgevPYCCqTovCuGRk1/ZOozxr/9ygpbwCCIPksYO64qPGj7B0xOJjb7P9s3p5mPzVw
         KVE5iXRJ0RMKjlWuJO7Jr9MUWxbFDaFkYuZ3wYPEKSRF0LfzL+RvjIfwdn7HFEOsN/Hh
         XcSg==
X-Forwarded-Encrypted: i=1; AHgh+Rre5kMWQrGHJC+DlcKKtmQ/oEP32w/f6VL+oMyRQgSPpwxoSXyt/lvWetFmOLoplFa2WCoOkB7drrhU@vger.kernel.org
X-Gm-Message-State: AOJu0YzfJUw0VYBnpVSZp2LIRzOvH089zNtJgk/+9P+AycbY3Nl2PkN1
	ZhZm2KMq+8Sf6qqtRbg4N6jfbZtKxQr0Sp2uONu0JcSwCHZBG6g4V3s2HsoRSprKqag=
X-Gm-Gg: AfdE7ckKCvPkefr/rY6xnZHMiZVfQ5l+qeMxHMUdfaqQL7Iw/znB7y3gtudNRAwiEC1
	kupaf9FvkTXXP2Labylq0WYoCfkINoEujpTWtdLLOZt9jowuDiKxtysiguoDHx+FzImpq7d8bE5
	xI5TWAdjGYnyJ3h5fqyezAZA0sSjGUMOtyNmwKv6MlfB/Z73CEftySRPpKMxgy52Db+QT4f4lIv
	knpajUOf0eYf8dNW3XGp1NMMwoq92OgxR9CUbfBBsahUVDuOLbUBQnrkLuGFSoIDztHCxHo20lR
	EUOyRHNkCSyG9v0UWdlBz9LSRN1uRTa5m3WrqZ11/F2bLfoyeAO9iCzHwwiNOY19za5RrqYwlhL
	IFyaIJtYhZ+KwB/gb6Owrc8RD9fn8x0mFWMO5NS1nrKvQ0dy0ChhPAqXE4H4nW2aQ7DkPyaAUaw
	bZ71xbudtiALuzeCYkeHjPDgVDfqx3UbgLkpurV7mbmccqEE4TfGg4o+RT3iQW/vRs/mP38C/G4
	GOy
X-Received: by 2002:a05:600c:3b26:b0:493:e3e9:85fb with SMTP id 5b1f17b1804b1-493e685f1f6mr105605275e9.20.1783669316966;
        Fri, 10 Jul 2026 00:41:56 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6e8844sm130641505e9.10.2026.07.10.00.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:41:56 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:41:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
Subject: Re: [PATCH 4/6] iio: adc: Add AD7768 IIO Driver support
Message-ID: <alCiMwDDBUy4hbt9@monoceros>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-4-44e1194fd96a@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2mdkilrp6cmozhgk"
Content-Disposition: inline
In-Reply-To: <20260709-ad7768-driver-v1-4-44e1194fd96a@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39795-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,baylibre.com,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:dkim,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C483B73823D


--2mdkilrp6cmozhgk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/6] iio: adc: Add AD7768 IIO Driver support
MIME-Version: 1.0

On Thu, Jul 09, 2026 at 10:50:15AM +0200, Janani Sunil wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--2mdkilrp6cmozhgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQokEACgkQj4D7WH0S
/k5zhgf/cBqR/U9qN6HSwvEBvsH2YOyi2p7lqn4lGxGpKm0foNPRhW7lOziW1Wqz
oQESCV+7YKOqDOOgBTi5kCK0GDOR/68hQ9jF+IC8vGa4HSRURd5Kgo63T8mOCWSA
AE63f+yQYUH25nYtGDkF2a8Tl1l4A6oCe0IuiDZLx2lLbGWsKHVVdz0shdU+8tAG
9QXbQxmNNlHX9vIlIS4TtbhHo4Bb38pVVGyAyodZyNwEJLvoq7P0ariGNRHIGZLT
rdVbBkVgfUjKWHLpMDTFv9nDJghfDAVMXN5zfeLANW5EeDJvPBPwWFJ7zVdBEDX3
lVGl+K5A3uVTjmu1RkAZq/5JjP+pcQ==
=P41k
-----END PGP SIGNATURE-----

--2mdkilrp6cmozhgk--

