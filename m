Return-Path: <linux-gpio+bounces-16526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E53C5A435E1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 08:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2323E3AE7B6
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 07:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423BA257429;
	Tue, 25 Feb 2025 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9m2A9cz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576451FCD1F;
	Tue, 25 Feb 2025 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740466867; cv=none; b=kXtm5JN3QcUIr+OchAgQlwvDSxTJMVr7icuAjzUTWgPibRUH05sb5g+cZ1xp0+wPQ3VNpoEq5eQ0iaUi781i62ApbnHqQ6SVb/Od2ifPtObf3+KdIMvcM8hneUXn7zRQ1KWBwyaSUEhTYPpnk2IOiaKLlvMIxipPlBpRuddXAvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740466867; c=relaxed/simple;
	bh=KWUdJgIpUQsVXCnBiWxg3+iKKy8Ujl9Xa6y63DyZMJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+osidvlNux9w/d4YxQ9yXBH2dVrfC2lbUpSnOih8zbFAyRJ4Mfv/2eGmbjxkwRrBQh6H7bVCTdB1KYTDfECIKeFS5ibfCkVqb79ROgPv+JD7F+W71n/Fn5BhGNUCxdkIGbt7vwvp38tAtLnZkCd/p8SEn0brMtktUpvKiBPML8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9m2A9cz; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so6062233e87.1;
        Mon, 24 Feb 2025 23:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740466863; x=1741071663; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEybYvWRx/5H4FjB4f3Tj6B5Z+fVUBC9NtkC11fk+HI=;
        b=h9m2A9czLVH9gA+NEYe0i6EdRCuqOk7RSatYxmTqXAU/2OJT3eKSJwloPwC9Fp1INY
         19PQKhtuOaFXvnLTjnTPyUdplBd6ZexqEPMXbZycQ4LmtfxxzxLfFrFPaTg6ycRnBp5j
         oD84tseCGa7oxVENbxlNf4xPYYLGykCxa7wG4VE8zkYYA8z38KwlM6YO1qP3b94ebITh
         basPuU5PGl/MWD5sytGt4Xqyt5Moe5p4u25DcUAok21vGV29MJeN5UCqgSedDIDptfID
         KyLQKGMA92x6ZYBfssiHkYzKwVz8Rcd0k4iqwAujFVSO0yCjUoOU00+7ahth0sgpSWs1
         nQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740466863; x=1741071663;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEybYvWRx/5H4FjB4f3Tj6B5Z+fVUBC9NtkC11fk+HI=;
        b=HoZExk67o7yYknjjcWeaR/nXA5G6b4psa/tEQdO48SZ/PxMN/AcgEcWiuNqTDCePon
         Ix1SHVQFFxf5vki4JqUlf0LReNuL2h1gl/OhKynibprZUsWyQ0UNTF+NDDSxw1IYWLCU
         ++EiGQXzoePOlP/I/eTkIO/OueaNF1FPCxbJBlClo2s7dusKNwUY8S4wwknyR4dCvwIp
         hiCyw9pBXaSVyLj9ZcPigrgpkCzYJvPc0+MikasGowxyL9KiF6iF2pQSjWqlL7CyefOW
         flIkYe9/bvovKrpZy+/AScFvRCjld3eaqhLUpO6KscFHhu94NGMYTcRXUhGuTuxxaDJg
         jjJg==
X-Forwarded-Encrypted: i=1; AJvYcCVBJ257/Mrd2dDqYCU5TeDhipFJiWzPNi9Rq+O/uCuAm2kliHtgvUNcRjiScxUMlt0IBslWUNZluddS@vger.kernel.org, AJvYcCVFwaLLFiqkWTsOjRzY1CFsQS6FMdox61gVGgi/USsKDMI90ZtITLl9K0SoJVaPWxRZAQVW1wtJU3Vq0gPM@vger.kernel.org
X-Gm-Message-State: AOJu0YzzevdS4JUKve0AFZiFWPnNc4Lv/nhmLCBpqW8PgEJ6QdV/j2aI
	QB9cXicwDd9eo+S+dgKUjYX1mTIGawrkkL46wwdXs4276INgwqodtMf/3g==
X-Gm-Gg: ASbGncsACHkGMsMalrgfXrdXOGgK+xAmH8TKwAwkO1x0/9HjSG0re/q6GIMROZIr9f8
	d6bzA6bnsI9VTZ3iK+vAtlORMzbdxYvHrBl8QBF8Mx+LlPUU58d6oVFPqoLYGt97n4urCAosYa2
	N31jtVpCbHF8OnmMixIqG/K2vKVAv9Z+j+mR5DYMTibfXPmR8n0pftPNPvM8ypjPwYqVL5ZfibK
	yxbdRWiGl34XaLldq7n4uMGqanJ4kD2CbRXVGnR9BdPREbW18qF8UREnKH8Y/424Gx3PrrVQK7f
	SBKbk8SZjdJN234/dIjiS+9iPi2l
X-Google-Smtp-Source: AGHT+IHPzr4IY0sdvXocyj/XL6Du+23H0ztIQzDiz5JA+sv+RHXoJQj9XCviYpfMdtltpBPy8ALGdw==
X-Received: by 2002:a05:6512:acc:b0:545:2b68:936a with SMTP id 2adb3069b0e04-54838eff533mr5287219e87.29.1740466863000;
        Mon, 24 Feb 2025 23:01:03 -0800 (PST)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819ebe18sm1393931fa.36.2025.02.24.23.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:01:01 -0800 (PST)
Date: Tue, 25 Feb 2025 09:00:54 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: Document the 'valid_mask' being internal
Message-ID: <Z71qphikHPGB0Yuv@mva-rohm>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2t/6T+yCC05nv9en"
Content-Disposition: inline


--2t/6T+yCC05nv9en
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The valid_mask member of the struct gpio_chip is unconditionally written
by the GPIO core at driver registration. Current documentation does not
mention this but just says the valid_mask is used if it's not NULL. This
lured me to try populating it directly in the GPIO driver probe instead
of using the init_valid_mask() callback. It took some retries with
different bitmaps and eventually a bit of code-reading to understand why
the valid_mask was not obeyed. I could've avoided this trial and error if
it was mentioned in the documentation.

Help the next developer who decides to directly populate the valid_mask
in struct gpio_chip by documenting the valid_mask as internal to the
GPIO core.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Alternative approach would be to check whether the valid_mask is NULL at
gpio_chip registration and touch it only if it is NULL. This, however,
might cause problems if any of the existing drivers pass the struct
gpio_chip with uninitialized valid_mask field to the registration. In
order to avoid this I decided to keep current behaviour while
documenting it a bit better.
---
 include/linux/gpio/driver.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270..fe80c65dacb0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -503,7 +503,8 @@ struct gpio_chip {
 	 * @valid_mask:
 	 *
 	 * If not %NULL, holds bitmask of GPIOs which are valid to be used
-	 * from the chip.
+	 * from the chip. Internal to GPIO core. Chip drivers should populate
+	 * init_valid_mask instead.
 	 */
 	unsigned long *valid_mask;
=20

base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
--=20
2.48.1


--2t/6T+yCC05nv9en
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme9aqAACgkQeFA3/03a
ocWu1Qf/Zg9npoNinOajhrBvsxKQo4LtxOmy78IOWILnNX+SEIH4e8VKLNMnOcBZ
vqKq2ZqUyAOUojsJv+pslsIcL6hVT/Evm9FLp6nAhtxHxLAihXIg1LP3tOzW1f/z
F0ljNXFMSWgrOObnBg2ym2TWMnUwrjnX7pwEdgm/OHnlSSe2xIfjirubRv+kCViZ
tuDxGOL5w+ydsivFituRhCK+RIkYNQvjp9CWhZvyHgEkgbEHIcCieUK+M7pieOET
opLAMKnrCrVhgZw9fBdOexW/3DfuqhxBu7PEe99QhF5+MwNyH75lVCQ5JTFARt8+
b2CJtG9N+gvl17s3Tmaghcnx0StxLQ==
=gU03
-----END PGP SIGNATURE-----

--2t/6T+yCC05nv9en--

