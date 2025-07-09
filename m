Return-Path: <linux-gpio+bounces-22966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A05AFE198
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 09:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 895DE3AB018
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 07:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3857E26E70D;
	Wed,  9 Jul 2025 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+/9BIyP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D5B221282;
	Wed,  9 Jul 2025 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752047194; cv=none; b=RBQCLFiKbp5CroVgi/q1F+6R3FIoAQZh83T/rsWZR/tRqpmCFYDJ3uJEvlgrz1zyzVZAJI0h1bo7HHVzxhNGAZQeISmtH35hKsYEKmNO/zuxVYUCpp7qN+MoCOE7AcNFNd1SLgxFx5YqhbPRpxnTp18GlCkKUlCV+dapy7me4zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752047194; c=relaxed/simple;
	bh=mRT6Rx7Qww8LyJu4u9N9tkJu9ASaymvfPiXsGIp7lxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVxjFybhVkSWD6/2dPQR8CrvMUTNVkoawToK6aim6CV5W++nzMPjy88/26C267VQmDHCZCX9xF1L+Jwk+AqRVtTI/Lslbg2ffdrwwTSLLy4VRUkzG2/y8lbaQXA+995btFx8D/ZVH8+bLC3xYLWo31w1PHJKGuLLezOrQmJjyKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+/9BIyP; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so10268454a12.3;
        Wed, 09 Jul 2025 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752047190; x=1752651990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=05ls/TIVTzEqK91Ulv03Khd011EHnIA0GHHkneM853U=;
        b=j+/9BIyPj6nVKjMWbaXwN+Zyqw2V8Q7ocAAjJnrx/LThSMZZUM38QtZZxmXrFRCs/a
         AqzPj+PwA5CpYcqSNxQY3uexz+dPipUHkl2vyE2cSDHKJ7FnBw6VbFkGW1ovkvsGOaeA
         xx0QTIuOugtZBoEmKRDqhkTGMnkYYYnJ9/8LMqpaf57i3XbeVNp0Ijn7EW3CL6BjBhCx
         jaVP8gOGDHMVOdLFYyE87WDQJvc4qWnrWE/OgfVWWhJ5DkW9MffjHUj1cHj6+CvCZUDx
         /gqIw3dRYRVzAcKH/LPtD36LNcBN6OPHYmg2rWsn1IOgXDy2ExHnD45QR3dauCr2qpHZ
         qlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752047190; x=1752651990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05ls/TIVTzEqK91Ulv03Khd011EHnIA0GHHkneM853U=;
        b=Y5dV2u4a6/U5w1boVXD52eEV6q6wGEW2VEAGERX8Muf4AdulWMZ512Yhju9fsPXA/k
         ZPzuLlY+M9LogNphgQIG46LixUBketDGQ4GJA1k98otP/BiRriE5xEmnLx+XE6PIMq1g
         DmNXzJIeVB8U9mX+drF4U3BdB0m8bU1QXJE57T9QZSBhuecuR6+/457lFcqQ1OVc8ajh
         WumRAq4mfOAuMRc2M4Uz0quE1O7VM7IsaFF45KAFoPG0iSx3r7b7bo6y6xYWk533C/Do
         uqUd2IRfH3GIrVGD6RDRpV0sOwLDSoTogroG7X5QHmUGgCewvp/eJ3xynAvkpinHuFbc
         Q9bg==
X-Forwarded-Encrypted: i=1; AJvYcCWhD5TVc5sksop1chCaJMwrm2TNgk5NtqelefxW/3SCi0AXKnHSYidOuiwVFu5dh0GcR0qtqkEF8DG2aTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6V1KjLTR8kVMvU9ctQufqpO3C6+6t0GymwDiO8+y0sjjF9v67
	q2rM/s+l8jD8MsJVNqJrHqHt6veT6B+Q/MyO9hR9/uo7krmbJmHZDE7Xrv+cYw==
X-Gm-Gg: ASbGncuvtfwX2BT4KyLAf3cGFhAPhUk9yI/mNNSTdUjF69hI53EOCLdBMuRM3r0yFO1
	WJtCzAJ7aYMKYJRv2KFrviDFErXsFp7jFMcn6Ac8pV9YmqYTex3zpIKGLChiQY/2sn89787NdmS
	i/6W2h7id5swgfQPuaBwF54GQuNFPhyZj3yQ/wJ5f5YyI5BS+6kbje48N1AX/ZBxdz7ugVf0TZK
	iHYlXmJO27idU2yeBC7iJ1JGjpjxxhFABaz57I25hIUxjltXfjmTiWJxqKVLnjJKMbB9UzUr01K
	hF/PpkjseXr/is3EkPFkkCLdlrmWAMRTGuUyDzwnQQIYYJ+HSw/0g76exCoDcQ==
X-Google-Smtp-Source: AGHT+IGffJCqSF/CMbIuG57p2fuyx7LmK58Jxk3KXLTMDgY3yqkElDAjf1pCpFnR+T2YdigqIaXuFg==
X-Received: by 2002:a17:907:2d1f:b0:acb:abff:a5b6 with SMTP id a640c23a62f3a-ae6cf5bc2c5mr135488366b.13.1752047190138;
        Wed, 09 Jul 2025 00:46:30 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6d8b49299sm28532766b.164.2025.07.09.00.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 00:46:29 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D3DDC424E298; Wed, 09 Jul 2025 14:46:23 +0700 (WIB)
Date: Wed, 9 Jul 2025 14:46:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: remove bouncing address for Nandor Han
Message-ID: <aG4eT557hI8AT38G@archie.me>
References: <20250709071825.16212-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0uJFV4fLsoSQ4T3b"
Content-Disposition: inline
In-Reply-To: <20250709071825.16212-1-brgl@bgdev.pl>


--0uJFV4fLsoSQ4T3b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 09:18:24AM +0200, Bartosz Golaszewski wrote:
> -XRA1403 GPIO EXPANDER
> -M:	Nandor Han <nandor.han@ge.com>
> -L:	linux-gpio@vger.kernel.org
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
> -F:	drivers/gpio/gpio-xra1403.c

Shouldn't the driver status be orphaned?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--0uJFV4fLsoSQ4T3b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaG4eSgAKCRD2uYlJVVFO
oxJkAQDS8bBRFgcwq+N155tKrci/YCyKKy1d917ibKgi8olm8gEA9zJP2DoZYfAr
HIDit7FenDruqGNFPaiU6gr3QBm/ZwA=
=pcgV
-----END PGP SIGNATURE-----

--0uJFV4fLsoSQ4T3b--

