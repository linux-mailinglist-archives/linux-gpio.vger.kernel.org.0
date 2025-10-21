Return-Path: <linux-gpio+bounces-27399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F7DBF72C3
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67420485958
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1926133FE33;
	Tue, 21 Oct 2025 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S2q5QIMA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3414F33FE21
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058159; cv=none; b=A1ncfxVqwpv1MGTbRZSwtek0jz8QK1rkUkIxnIfU60tgrz2P5bB/hx565DR+tfL2Ds6uR8w2PYfhRXTFD5CtbNHYwsY76jK0y7nYvNlB5YrFHxHuYk8uMBTwD8fpomJ6kIC/5xhZkxUeg5PkubVag2VpZJHflZjSLRC2+315inI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058159; c=relaxed/simple;
	bh=W2POVoQrYUSZPm1A3yimS9utpyJqHWo6t34zYlrDD9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwbWc8MJV1elMe4TOtnR67xnu5DXSRq2sqq7/iHzL2FeIbPhJ82qbCIZxQg2a/WKLz8xzjPKmyn4TKgHCNDyqUkw/IR77+n4j2k/sgMGZhf3bFCkgiuoC5JsmrJVD9NMQytycocOKC+2HBeraBRxIsh4Qk/7Uw8M7C+Opvnc2Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S2q5QIMA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57f1b88354eso6465141e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761058156; x=1761662956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2POVoQrYUSZPm1A3yimS9utpyJqHWo6t34zYlrDD9M=;
        b=S2q5QIMACELbpbw3BFkBp/ESgGRjNmUqDzIVGS32uUicB+JK9ljXMfHmxs+McXOoCU
         0UP1wC+Is2yy1abPxZmVo7zj5ySOcXaNSgMmJgXyomXLBECmjzEWKM5oPAwdzYi9fta2
         NwL0jk28BbuRXNHI52s2+e0kxLs9WSvOicja4pvzkMKDYEHpqUlvjmP/j/Tp5bdwoVqp
         gvUnH8GkCdkNEzuiaeeaj2CqJXHcNKz/V/g44BCf3+M7EYaYPCo/2lIiRDVtiXb61krj
         4tpMmCZJ88R0GUYlGvuJvRScYHB2M7o+cZfnHyyrORHe1xjmnC6ZVXnSTAdubGslsgqQ
         8ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058156; x=1761662956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2POVoQrYUSZPm1A3yimS9utpyJqHWo6t34zYlrDD9M=;
        b=eAlmNqh1md/Hhf3CiqXIYYAmmhFLZlVX/lTCumHeoGPiamg5wU3SYZ+EK9KWOddyB/
         CPLVIEAZYNOPWKtFgLeetV5b81KZI1jptTHAaBVOABRMtH67paJQaWaSt2qwuzI3z3NV
         L1/MutDrRh4o9W/DWVITyf+eRkASY831itjOU85tbrHfC21BR2Yj9QxefEhssmHnGH1Y
         SZ4b9wmM0UlLpiUmwwz3so2sdaHQOVOQPl5+aiVe5ogad2lrzjTOyRRUTeDCwI6bW5BD
         IYZw/Nl38q4U2sssY4CHXBCmf3VfsUaYcbkGA17TgwdqOFHxWqWbvshVDR6BEQKwG8Na
         3EiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8TvaeQfKlOClqFWRmhmMZA/J4a8T2hycA0vsWcNlAQTK/Bm05gemdUtquBweC6QOoPDVCFnsa/qrC@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEo+BWGQTojwwXP6Gqq/lG4Ytbb/NN2I2NkLmBKzgSsltL6Ov
	BEoEdRGXiVVlRqjtSbzFHGcf0j+zlB0dhdxx6ZpjvdwSoGf+jZ4uE4qdjzw13Sk4LqhoeOzSuAe
	YTkn4DYnTuN2ItEW7PDqkn1bIcZ+tCoi7VN8MWU/fkg==
X-Gm-Gg: ASbGncvFCoYTl1lxTQ2M4EjnZplAJ4RqsmpF6OZlmu3Qyg50rLtxPJOrlgeT6H8p720
	qctdkPLP0bRpPFaIBXeuqgGHljwHMH+Iquu3mjO+Tq+NG1/tS7FMpdmYnCCiboOyR4+smK3KB8u
	Ct4+kt0Na6d5lNOu5FDDqH3LWBB2+pLCRm12r2/S6tzVAcBuEdDk3Jd1lOjB9qACWM9v6bHKx+D
	Gab8Hmf5atJFAgi2lXXWui0Jw8ry/mphfhkjhLyGrHMmQwEKqE6YoII8lLQr6v9lpDiepFDBPxu
	SU3v31cUNve12r5CPNVhjfl+gFo=
X-Google-Smtp-Source: AGHT+IHHKA/c0dnWyRU1/iLjLRkY7tyq+bIgrghSWb7MxAig1bIW1157IfXsr8EXnJ7WeHo/HrV20fw8YRwsJS23Kmk=
X-Received: by 2002:a05:6512:3ca6:b0:572:1f0b:5ef3 with SMTP id
 2adb3069b0e04-591d84e398dmr4722237e87.11.1761058156385; Tue, 21 Oct 2025
 07:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
 <20251020-fix-gpio-idio-16-regmap-v2-3-ebeb50e93c33@kernel.org>
 <CAMRc=MeFZTDk4cgzEJNnkrJOEneFUBLwtKjkpV3-cLSm=xsxNg@mail.gmail.com> <aPebhGETy_3MIwkf@smile.fi.intel.com>
In-Reply-To: <aPebhGETy_3MIwkf@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 16:49:05 +0200
X-Gm-Features: AS18NWBSKJhK7qYwfMnb3aaDS0lyPca9mQ0P-5mXERBibCAphYq6tUO01p7bilc
Message-ID: <CAMRc=McPP6obWpnd7Y7duJDC=NLAOE7bjFN-iytDJ524nDr9mA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: idio-16: Define fixed direction of the GPIO lines
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: William Breathitt Gray <wbg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 4:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 21, 2025 at 09:21:38AM -0400, Bartosz Golaszewski wrote:
> > On Mon, 20 Oct 2025 10:51:46 +0200, William Breathitt Gray
> > <wbg@kernel.org> said:
>
> ...
>
> > > Cc: stable@vger.kernel.org # ae495810cffe: gpio: regmap: add the .fix=
ed_direction_output configuration parameter
>
> > Turns out, this requires commit ae495810cffe ("gpio: regmap: add the
> > .fixed_direction_output configuration parameter") so I cannot queue it =
for
> > v6.18. What do you want me to do? Send the first two ones upstream and =
apply
> > this for v6.19?
>
> Why can't this be pulled from some IB/IT as part of the fix?
>

These kinds of things should be signalled before applying the patches
that should go to an immutable branch. I would now have to rebase the
my for-next branch. Also: the commit in question brings in a new
feature, not a fix.

Bartosz

