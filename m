Return-Path: <linux-gpio+bounces-15041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE80A1A646
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 15:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C49ED167F0A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 14:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F8121171F;
	Thu, 23 Jan 2025 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="avsuKqSs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42D420F971
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737643932; cv=none; b=oy4rdqFI3HC/Ua12Fx5pEgBKdEwMMB2uEhhTRVRj7zAq/FU+hbQn+FtYyllTrxqHZaWQak137ruF99N2N9ff7K2h1QrMwOfyzUWss3+uMCn/8t2PT+VeTLJ/Wj1OOw7UOec0saqmawnSAAXlnEzxQgarReRG4wzKxmdxN/kSgh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737643932; c=relaxed/simple;
	bh=ePqn/vWgfspoR/wDr6Rz3z242AQ3HAozUcwW6cvj9X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+q+Vra3xfd20yWLaK52meVJ7ofaQXZFtetNp8p5V3XqT696GnwVijy/HF8szNGTxdh5uRiwse+DINoJNYroWsZyvT2dHq4jCVUGIdLoUkZyzqtOOS7NplYk88sZj6sSiy+iJ9L62yGx3HCoH9pqFfk/OaoHpoqbmtfI0c6SzL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=avsuKqSs; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-38634c35129so877489f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 06:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737643928; x=1738248728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ePqn/vWgfspoR/wDr6Rz3z242AQ3HAozUcwW6cvj9X4=;
        b=avsuKqSsTrl3CNd7+qyHvqbOIqOn9iyfsc9drxOWoLgutTie4Oj0gv+RjCgMlwhVlU
         6qNZhXUGQma0upGEvxD6HJKq70jjHacWVzSF7dVbFwuZkYOIRqy1myAh1BhRakL+CWFU
         6q8KNvN1d0aITek9wkFl0UgY98i4f/hnA7N3bfzGKa+drcNHLei1GGJFNqoKF+DQh/O2
         dgGfwGQmG6i8iNHwbuWYdLHOcFp3U/dmLDL7gKMQzeP2PzcprsC095DAOIz8z6arNlVy
         YxJ9IzCru6TifQh7jKXBTvjeFnj1IHGy/S9lD+4dmAo44pdYDMpaWQOEYZ/RlrOvZpJP
         hCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737643928; x=1738248728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePqn/vWgfspoR/wDr6Rz3z242AQ3HAozUcwW6cvj9X4=;
        b=WkBZB8ToppBputyBaIPFFr2dAfufyTO2fx2Ih7R+EdVnObEePTEybzWDPPq11DzE+j
         GFSepHSCKtTNi/cssqZ2XN1XgcOhSwFYi8o3rqh/6J9abF//2a+4ivoKGSSccB7fgjRD
         4i4RbmbRBA13hEr8g8f/s/HO1hQeJYGfyYPuUKc1oNRSjeGu3xw8C+x9OAwTF9xyDsP3
         GZoOhJ9mkV77kEo0V0QNCgVy6XF53LUDI+bvN7HKRUfzLKXhbHjwrmTULaSTR4vWHpMB
         6juslXLdwp2/CbkKcwgYTfi+v/G5/Df3ZS+3gzoOsqeIFkaZV+HLuzxH6K0u7bruLYYP
         Q+3w==
X-Forwarded-Encrypted: i=1; AJvYcCXFaFcU8qy3MgVTVejqCAr3W3dorYCMFuLJfzI2aFgVnLDiWPxQTk66b529n7CWqCzFp3EVKSdlPOhW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/IbmQ3fQwiMsQMS0uVP1qOq2TwKa9l6/2lfsoDGz2iW7Xpxh
	LB/lRLtqDaZ+6oYpTM1mdzMtg3kq9ImeOicgY+9cIUEj1c2rW+SXTymo6UWjchM=
X-Gm-Gg: ASbGncvQf4FqP/ewYVX7uN6mHYDsbsM8EDB1M+zMpTEQghUO685/Z+jjbVnvvUrx2+z
	SPRI0eUgkXCQxPgVzW4aPOKrV/RRRq1pdt9SZ0m7Qki5V5MEpQfztLzGtoV9UWuQanBU5UezaPI
	n+VsQVGKXwprYBgaYeCMjOf8zitUfoMYNVq/6oELU8QRW5JvmxRw4Wo8CfAhttgziiKMgTPaB4z
	KTyp1TXNS8ewzrSaWTcpp4wZUiqQnmFspnAFs2ioSMXWoT6a7tB7OuBqKVwE3omI8OV1qsS0nzi
	BDLNwTF1uK535p0Fzk9dcxjxSs3KCB8iKvy8zDiD+VEMsrA=
X-Google-Smtp-Source: AGHT+IFQqQFuSvvLQovWoq7l7qVc46JD3mJZP7FB9H76VfbS6zWrfPAG5QiWQlKCEuU308j8Ay4Ghg==
X-Received: by 2002:a5d:6dc5:0:b0:385:df5d:622c with SMTP id ffacd0b85a97d-38bf57a49a9mr15490857f8f.30.1737643927939;
        Thu, 23 Jan 2025 06:52:07 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275501sm19868153f8f.65.2025.01.23.06.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 06:52:07 -0800 (PST)
Date: Thu, 23 Jan 2025 15:52:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: intel: Import namespace for pwm_lpss
 function
Message-ID: <gw223bv34jyszlssyegvz2znb7q4zzh3lax2qgmvcx6m5lvy6l@gpuvyyhvsgf7>
References: <20250123101110.339337-4-u.kleine-koenig@baylibre.com>
 <20250123101110.339337-5-u.kleine-koenig@baylibre.com>
 <CAHp75VekFNu8Jzfit5euj2pKeesGHs3DQS4hJdT==RM7MONb4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hvlslgkc3i6hkyqs"
Content-Disposition: inline
In-Reply-To: <CAHp75VekFNu8Jzfit5euj2pKeesGHs3DQS4hJdT==RM7MONb4g@mail.gmail.com>


--hvlslgkc3i6hkyqs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] pinctrl: intel: Import namespace for pwm_lpss
 function
MIME-Version: 1.0

Hello Andy,

On Thu, Jan 23, 2025 at 01:45:17PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 23, 2025 at 12:11=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > The intel pinctrl driver can provide a PWM device and for that needs to
> > call the function devm_pwm_lpss_probe(). That function is provided by
> > the pwm-lpss driver which intends to export it in the "PWM_LPSS"
> > namespace. To prepare fixing the pwm-lpss driver to indeed use the
> > "PWM_LPSS" namespace, import that namespace when used.
>=20
> ...
>=20
> > +#if IS_REACHABLE(CONFIG_PWM_LPSS)
>=20
> > +#endif
>=20
> Why?

Because devm_pwm_lpss_probe() is only used #if
IS_REACHABLE(CONFIG_PWM_LPSS). Without the #if but with
https://lore.kernel.org/all/20250123110951.370759-2-u.kleine-koenig@baylibr=
e.com/
this results in a warning (with W=3D1) :-)

Best regards
Uwe

--hvlslgkc3i6hkyqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeSV4sACgkQj4D7WH0S
/k4x9gf+NnL8LfFHYku17Uep22q+3Me5sNMn5sNQ4ZwHRoLfkF8sw9gYzDqpWQbM
9wP/TnjL18DlYCsyyGL9azM19zT439A9xYtCviXUYhWdm42cpXs/QqzWYh04u7+/
xuYyHkOFazWIpExIBayZ7f8LvMLyE5n1cqsnXKwHqqgOlrYM88EHbD5RI8tRoHDM
dBi/yUiqvNEOvNorKrPQb8PxTC1ZcuvSgLnl/y32Dxlg7IkKJ4amw4qLKj35O4hr
9nEre2uGzo/hyEiQY62i6boLx8U4FgoRYoI7TBADXwlnVSblgc6+0+S18GSpwh6V
P6cB0XzjXYOGJvjjWwvTlKImxS7f0w==
=+gxQ
-----END PGP SIGNATURE-----

--hvlslgkc3i6hkyqs--

