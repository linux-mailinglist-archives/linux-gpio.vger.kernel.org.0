Return-Path: <linux-gpio+bounces-16836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85FA4A0D3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 18:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06B557A9625
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 17:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05CD15ECDF;
	Fri, 28 Feb 2025 17:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtAcMGDW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEBE1607AC;
	Fri, 28 Feb 2025 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740765024; cv=none; b=CZ44Ih9bGXmVxqNyD1Vo7pWzt5o9sTvFCXiMjYZy5HWX9PcxZSjXeXy4kFdHC50+hadQVy9Fp+S458Iie11bEy0yxUPvvFMHSpa6x1K4jvqVQRAd7AcC6/Q7KnqHkg3Ygay+MoME6QpffLvaJZKJ6jPBWQTkbdfyoOiWDYBxwpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740765024; c=relaxed/simple;
	bh=hnOk019W1poBZEjy2vm3/EJTsClo6vVO+RXg2y1l1TI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kiD5aU9PCWMxswd8dvnvaHc/1EtESIBJ9/VEIdRVE/nz6/BfD5PwY1qVlgrO/poQxBXYBVimYDNdZMaLCW1H0jjTNrS2+H3WtOvVzP3x4MCmJsyF7BLzWlvxnn6J2BQfrBbYm9igVXkiAGYrFRz37914mEVAVJbd3Fdd+LF0KI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtAcMGDW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-439946a49e1so16041345e9.0;
        Fri, 28 Feb 2025 09:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740765021; x=1741369821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDLbBkbHYErGQm9XcoZMwvCUZSurlKDW5yd9+XWZuRc=;
        b=MtAcMGDWk9GnEJlEIx9Y8VdGizl115hvr0WLfuzhX53Av+CLu8593tCVOU7Qt89ija
         AkrSHsJE/j41AYwQpshNawlwCOGr9gaXHbxd1/4aLbJq+qXkOmxR4SmqPsUJ7SInLcCS
         y1oJtWmV79/cujorXQgEQRgFVdRnPFCNkLxkROudxQ1IW/7zvtRe67acTkVRKVQbsZIJ
         Is6HvPa2AMFueLpr1p+RfpVuDtkUcNLEiTAW4C49LLpZ6P0qHfR52MVJqefkdvnWqspo
         w17Emr3apiTEIRF24hD3fX2lbRB20cOlREQuXe/k2Js5nDtfJAY1NyxJrXR5SzMT/W9n
         bDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740765021; x=1741369821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDLbBkbHYErGQm9XcoZMwvCUZSurlKDW5yd9+XWZuRc=;
        b=lgWs8gTiO2aPBa0kx53r9Anm+JUrFwCRQ9r07aYYU6NRyMwSxUMtdEwzyCGBL78I8g
         kjSaL8hwd3Y9ZBK3oeYqTwhhrkoRESKSTPUAN0bSA+QpjBTFS7nUvZOomYQyPdGJ2xXs
         UQcU4FnYPyW7fwyN1B8HBGVY2PWvxBDn8aR5wU6mGPBp+xuF+v+IqV1z6FDj2HZT6mjJ
         gP8tR/5HDrjKtu8TtOxruhpmcUp9Y8DcqyJ7mxGwS2Z7xh6gJFdyEF2fuXFTqH1+MTqV
         HsXwMK48NxqCuAGNDQ8cCIvgqkrmHvbRyyrTTp6P2Re1ouYaPkVPIXbvYPVcbAQJV+8B
         1vUg==
X-Forwarded-Encrypted: i=1; AJvYcCU5EJFsDHjgwy+ffadBdc37KMRJDNJSUm96zwGUSIiuJHaK4fShfxGbeMT/5dSVz/Pe9DSwcNOPsD0QL2x+@vger.kernel.org, AJvYcCWkQen7Ckzrm08lrGJyuDvcEquOMArCV+WbtnSeS/b0uQ2gwXNhSmx553WpvE1Wb0lEUK9CgBV/w1/b@vger.kernel.org
X-Gm-Message-State: AOJu0YzDPaHy7dlwZs5NbUM1VqJJwa2ZnutDz2N8gesmdtr+JBbqOG2n
	TpOutuWq8hKElkUE9ddXy7c2mNtUDbnwQBfHDnUJwrlHQrTvZnt2
X-Gm-Gg: ASbGncu1LnVi9CXxKUDOzAOdOTVKoC8daGdw0Gb55MM5zt3SzBum0mRnw15tGIWYxOa
	hqgzz1jE59/4vZjGJuZlFhxiXN1hZ5nFldQSH3DrbtIvJ3ALnTJZHz3o0WzF19/syBpUGyAlV8T
	yFah5p7+8AYvqGleiUEVJ0ls1wyYWH6Wm0WwFX9euuU8ND1sVA5NEyBrv6eKU9hGZi2hoZuO7I7
	mVWiaHsX2z1sHl0DRY2xTrHRMgzt2vbK5G5jQ5nrxNGAgCzkCXgoP8Ljn2yl28Itdw5EEiJwnrJ
	rZYJg2PzKVgNn1FtKDTkVpolu5dlgKqYhMNXYF7GnpmC2pnj8Exi+Ojkb76+Dm7Z
X-Google-Smtp-Source: AGHT+IFk9V6EQ70f5RvIOklsaIdIXOqrW1kiOZK7qmQpx6zBAhjRS9bgdlZr/OAjpSNhcs/aWEuJTw==
X-Received: by 2002:a5d:6c6e:0:b0:38d:c2d4:2399 with SMTP id ffacd0b85a97d-390eca4827fmr3916146f8f.41.1740765020726;
        Fri, 28 Feb 2025 09:50:20 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532b2fsm94813405e9.10.2025.02.28.09.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 09:50:20 -0800 (PST)
Date: Fri, 28 Feb 2025 17:50:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: use the required minimum set of headers
Message-ID: <20250228175019.1a01e698@pumpkin>
In-Reply-To: <Z8Au4WwXDlPQwfn2@surfacebook.localdomain>
References: <20250225095210.25910-1-brgl@bgdev.pl>
	<Z72fBfM4afo5SL0m@smile.fi.intel.com>
	<20250226214613.1e814f9a@pumpkin>
	<Z8Au4WwXDlPQwfn2@surfacebook.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Feb 2025 11:22:41 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...
> > A 'fun' activity is to pick a random file add "#define _IOW xxx" at the
> > top and see where ioctl.h is is first included from.
> > (I've not got a build machine up at the moment.)
> > 
> > Then start fixing that include sequence.
> > Moving a few headers around is otherwise pretty pointless.  
> 
> Have you tried to help with reviewing this?
> 
> https://lwn.net/ml/linux-kernel/YdIfz+LMewetSaEB@gmail.com/
> 

Not seriously, though maybe I remember it.

'dayjobs' makefile first deletes all the SUFFIX and builtin rules.
Then it copies lots of headers from all over everywhere into a (fairly
flat) obj/include tree to reduce the number of -Ipath to a minimum.
A 'create' dependency is added to all the main targets to ensure the
headers get copied (the .d files pick up updates).

It then generates explicit rules for each .o against its .c file.

Definitely speeds things up because make is no longer searching
directories for all sorts of files that might be needed - but never are.

(I've not dug through the bowels of the kernel makefile, but probably
have the skills to do so!)

But that is all different from solving the 'all the header files always
get included' issue.

	David

