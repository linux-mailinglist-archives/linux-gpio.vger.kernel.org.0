Return-Path: <linux-gpio+bounces-22599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7CAF11DE
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 12:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06224A663B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 10:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A8425A338;
	Wed,  2 Jul 2025 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Iyx9of8R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365BE2571B0
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452095; cv=none; b=haDBBk/Sk1lTiTpO3Hr2u+zN/KpH0a3R1P+HINr2CXb4aDA19LUMFVAjluhgc6c39JyaMdmGnW1qqHL2hReD3TbyduK46MTlKb4pIeJQ6SFss4m1cd/mPf7yw1OT+sB9xmp1iIhDXKNqT70eK+L/5DbOhFi9q/PBLUOyaZidiyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452095; c=relaxed/simple;
	bh=gZ4Xvmc9S94aIQ64a3m42A4JCQszcUjp57tsUgaSW7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXF5qn/zqZTw5KEebgL43cGVogU0F+4IeF74TXa3mzHXAc853x7D6lon2xcaDl9PmmzSogy1G3ENmWSlsxjyLKn7NVL1sj1PO3pSnLs5vsmPWrpRd6oNCSz4+Pa7Z2y6CjNX+7R+UpF+VD9PJTBEH+9GIwOdlIpyo0k9AvJRo7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Iyx9of8R; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b10594812so4976948e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 03:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751452092; x=1752056892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YURhLQGbiJLurCUHW9OjBh2JnLsFmL1/bKNVdvHx6FU=;
        b=Iyx9of8RsSPZPWGMwvPbj7hUvmlz45uzy6gNtp4WdRW592hCbUI/i7CYaWASiTjSaA
         fJNYrZoyvUCyrqvvPZX9TB+V5/XxnXP6HXQlTNU5zAftmVbOSTZ8o6ASg8uRMEpEvNKf
         4D+SS4976UK1l1h3rzSbCZhoS4Dw8FFhi79h5ap0lF1h14zbQK/cp8j7YSKAsuLcxFye
         epr9GftyRO3bUVKID1vLDNLDYfjVPPcwtIu+mNkbqVzok8yIVyh6+peb9z1/53pEhTeo
         MHSkFT2xADrCuaCBOl2iI97yRveUn0JHBgbmMaDe7H1z3JYv8Y4kTHS/hxe4+BBKsq0w
         IhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452092; x=1752056892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YURhLQGbiJLurCUHW9OjBh2JnLsFmL1/bKNVdvHx6FU=;
        b=SK0+ys6a2OYBqV3CBUxs/PhyaQQvXwE3AUaSpPU40lQJTeqI2mnM6Eneh6GhZfQPAx
         xGhjfO3ROVkRSi3tFpeVyRMf0bXoQu3+bTCtZ0sazs1mlKnsnzyqk8VgNMbSIkh9sdoL
         vKEBwyn7TfsMztfEUqxxNh0SHlKuK0EwOf4XszACLGVgcgGHgnAToKgidTQgWbLEipO5
         rKdK8WDFmbAFZ0jTMHSRTKRjC1hC4INk0kulYadBwBTevypaR57krb1o2lXq49zx1hjq
         E+owrG4mBmwZhY4mSQiusU7aCkjb2TIAnADpzBF86rsTzXVJU/uSGFzPdDRFwu5TkfBK
         feVw==
X-Forwarded-Encrypted: i=1; AJvYcCU7B3nLDp2b3UBHYYFFFcqO6X4FJrJcgNlWp+SLJqC+vNUwnxcyiIzJdrw46INo7hT460ENA/8DmyMO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61Xxql2zZ+MazpI5XsqqQMAWSesZ9pO9mjI5RFJOrAZFYGflq
	Wm3kAYDX922Mr2VGE/s1vcqwaLtr2rwcYHdNqhERgE4dPRTT9sP8HSyFYeepTznBqi1hMnHubDM
	AgaKN+6vlO5CbSxF8/0JLKbp9tkujDPbyDevjjnH4Kw==
X-Gm-Gg: ASbGncvlTODD0/U8fna2qLJw+YVWJMmerGPJeOFYSqcsgqi9cM8j2lnY2so7SvAR0i0
	9GE7zIGZm5sklIDwkvYNGCK1fNwrNML+wyGVTr2y3vExNwVseF8y2ved0yUk/Oz5w84MY7fpw9M
	/lLqgd5zSZX9ps5ah8MpDkOuUWIunPVvj83K6dXeXvlgHN9xdRPxAyvAbG3PkrHy717erEvu+y
X-Google-Smtp-Source: AGHT+IFntWaR7vFiqwag2txbIDh3chfIk66OTxql0lBJBjsS6lAjyIb7XHFo+882Qd6JpS1AFziatnOs+85N+zVDVwM=
X-Received: by 2002:a05:6512:3b9d:b0:553:35ad:2f33 with SMTP id
 2adb3069b0e04-55628350802mr820922e87.37.1751452092289; Wed, 02 Jul 2025
 03:28:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com> <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com> <20250702101212.GA47772@rigel>
In-Reply-To: <20250702101212.GA47772@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Jul 2025 12:28:01 +0200
X-Gm-Features: Ac12FXyPmng8A4Rlf0uBzP9jyNCMy8S7A5BxDak3acqfBrHs1V8IX7jP4eUyedg
Message-ID: <CAMRc=MeuMpo0=ym+FvDh5sCNXM00+iOSNFgTxMqagO78ZS64_g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 12:12=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> >
> > I tend to not interpret it as adding new features. We really just
> > *move* what exists under a slightly different path when you think
> > about it.
> >
> > So what are you suggesting, remove the `edge` attribute and polling
> > features from the new `value` attribute?
> >
>
> Exactly. I'm not suggesting ANY changes to the old sysfs, only your new
> non-global numbering version.  The idea being don't port everything over
> from the old sysfs - just the core feature set that non-cdev users need.
>

I mean, if someone shows up saying they need this or that from the old
sysfs and without they won't switch, we can always add it back I
guess... Much easier than removing something that's carved in stone.

Anything else should go away? `active_low`?

Bart

