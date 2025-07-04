Return-Path: <linux-gpio+bounces-22790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A953AF8BEB
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 10:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A61E87BAEC4
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 08:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE797288C82;
	Fri,  4 Jul 2025 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZUJqo3K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD39B288C25
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 08:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617320; cv=none; b=OvairVFFDvhXVc717a00ze/tuXwXV2FyRrQcBkFfPQ4vNJNXQFa1NWYQFzHumXPikQTH7lSetWELO7DcPyTqr8SLFA3+70URyNBZgbJuHhKF4n8p/zq22PEJb00OtZH72wKOaCF4x+LsGxfdoTwXYIn1MaLS+b4bQOm+gfiZhkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617320; c=relaxed/simple;
	bh=BqF93+TAjohew7xEc+xhLbJwBdMg2ZtKZkD6/ZYDjFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0g/znrUS2K8by2IcdqP+VqA/R1oOvDRS1ykQm2PJSEDGoAL28aKQnMI2aWl1MfhupuSztBuqh1c8zEyg/pcFWp4lI9cpQQqor0a2yV5AQQqXObMzHGWGx3Y/PrqWv809jk6vABD3QXbdvv/i6Ftxr80GF3CMQ/wvmlslES9U8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZUJqo3K; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553bcf41440so829558e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 01:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751617317; x=1752222117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqF93+TAjohew7xEc+xhLbJwBdMg2ZtKZkD6/ZYDjFY=;
        b=GZUJqo3KLL8gYQ3Rb6umJI92QObJm/vnWe2jXRA7jwBFz5IeUq0EpdAtGvYNU28gBP
         6HoQvx38Rllu9bZRErlOzyx+5c7PiMng4T1OjdhoGZuhUR7ZuUqVVNPjk88OD4cuGgZb
         9uxGXyV7Ui3H35ReYfqENPx798Fygmo698V0AUGd7TKFPnKWyit6BKheOklo7hvFHJdO
         sZYshB7gnl6/y1PRtCNT5D6UQL520Rsbalz4lCDia58eC7cyxSvDVI6UEgHjj+ugrIX9
         21D5mTdsLnOU6RWa+u12Vs92UFAU0b6XzToJ1tKvMspuOiQ0vVPSL5nAARUX5/8kaExw
         1tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617317; x=1752222117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqF93+TAjohew7xEc+xhLbJwBdMg2ZtKZkD6/ZYDjFY=;
        b=W0Gazy5KmrejG7Dz/4UMkyvdVmyZIJ2lARE5N1JeE8DMqQ6fPLPCNjIFZrjokW6HkC
         VklCDT0zI5/6RKrk5S5ydDZo6nrcmwO8Uz1G+u+E9DUo289Kh3LUDZgsCUw9ROjS1aH8
         KdHihETNOk8c92Zgvq7YI1OUuRfBcXVVh5vZHYBKvu2r2Z66w3YY+gtdhyQKO1+/iBc/
         kp0pkV1eUBN4ldsH7ACU3SatFgO7B8s51ltEHHXU8esmx1jHPz5OuSaMUBXUFs96Jp4u
         Vo2PihMdkY81xzzgckPfsim1I3IXG+kYxVRLLTokow5Ns2JlaWzd8m/+boxGJLKuXFV/
         wxJw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3UQzKa8EJ6F9ek9IMVU7dBXUNZaLGdZdt46nuu8w0kjuorBPOnrKL1FNj3OUitUNn6XrMbbTatmW@vger.kernel.org
X-Gm-Message-State: AOJu0YzUdvX3DEa4E6+piTfI6yC4y/5p48wzOrlJJzuBtMyzxUhvNiTp
	Gnur8YfBksvq63nHXu3yyeOMhe0w1fg4PuF+zgQDYP+lpwwp/XmyziAqNUHiZvV6D8HC1suAFQC
	v2QejrUSJpxzViyvxuOrnTUMPV8CtYjVFkjrNbkAFlQ==
X-Gm-Gg: ASbGnctpvFL0Y+fTHGgYXVW9q2aHSqvSNzxUlUW/3jf7og9QZiRPVmnJWeLEsYrLytD
	Q+3w/9EntZ06nn0uY54CUrxuGe+ahjT1oY9l4pYweaMOZcdCjge5NQw2nWGUvwKJk4/QrG5L+Ue
	JQF6iYqdpQj0w1ZYl0gBZWjfW/pvtj2O3TaKZT8gfmuBs=
X-Google-Smtp-Source: AGHT+IGFwOhG8+m1BfQFADC0UUWHtQFbQV44vnBFvtrzNfXOTMJLGYBZ3rW0/F4C4PngHF/NaTUtYXRmX+TsiW/pxqQ=
X-Received: by 2002:a05:6512:110d:b0:554:fa07:c56 with SMTP id
 2adb3069b0e04-556f1f62fbamr490777e87.26.1751617316841; Fri, 04 Jul 2025
 01:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com> <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
 <aGUeRczCNJLg-KON@smile.fi.intel.com> <CAMRc=MexjmozQ+vkLz1L4_Vfb+aqqwNSxKtNVA7zb-=r5eCMQw@mail.gmail.com>
In-Reply-To: <CAMRc=MexjmozQ+vkLz1L4_Vfb+aqqwNSxKtNVA7zb-=r5eCMQw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:21:45 +0200
X-Gm-Features: Ac12FXyekbDQxpchxSNlzOVJJqHOd-HyTMawzBiFpK1wdDITbhXtGu3_5sBoCBw
Message-ID: <CACRpkdYD5nT=f-uCARniUvBScu2gA+oY7ALgjYrdX-T_XRxEVg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Kent Gibson <warthog618@gmail.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> Whatever your opinion on this is - if user-space wants to keep the
> interface, then we need to support it. We can only propose
> alternatives and hope the users will switch. Please read the
> discussion, it explains why people want to keep using the simple sysfs
> ABI and why those specific users will most likely never switch to the
> character device. At this point a bigger concern to me is the global
> GPIO numberspace, not the existence of the sysfs class as such.

I agree with Bart here, the global GPIO numberspace is the big
problem we need to get rid of, if we move users over to the new
sysfs ABI and disable and finally delete the old one, we can get
rid of the global GPIO numberspace.

This will be needed to conclude the work inside the kernel do
move everyone and their dog over to using GPIO descriptors
instead of numbers.

We would maybe be able to delete <linux/gpio.h> but without
also getting rid of the global numberspace it will feel very
incomplete.

Yours,
Linus Walleij

