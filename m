Return-Path: <linux-gpio+bounces-27222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C3CBE5A56
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 00:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E2AF5358129
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 22:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD532E62A4;
	Thu, 16 Oct 2025 22:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eOZnyuRT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD322E5B1B
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 22:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760652748; cv=none; b=Q/qQAwJMSd0Kg6HBVl/ELdo1DwMgaSMNuCrUG3Ony05FAMHVkHjayuR1O2+JSmXNJGO91N4+CLif8D5p6sXW5bmV+ztB/pQaJLSyF6+3zVbfBGG1J1CpE9MVN2Ht1TfHWfb+Qhmjm7/2YuwvbSSXXQ+Lp2NmNjJZSuvHNr5cFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760652748; c=relaxed/simple;
	bh=mQg/ICgMWrNLJ+qVKDXr+wEji85IYihnhnnRuN0F69c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ahVBo2/IDZgR/+7zK8NsvTWQi5FLsYqsP7boapcktqHkVkXYA9qFgE2RphejH5lchT56YAC52zn6d/TG4u0YaoSLjWwVMKyETx+s5v208sv1IJr4UKVmNGYWVKJcuO4+plKwQ9PmuAa33a4x25RKSB+dKj+C1WNDm8mI884K7xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eOZnyuRT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3761e5287c9so15490541fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 15:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760652745; x=1761257545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQg/ICgMWrNLJ+qVKDXr+wEji85IYihnhnnRuN0F69c=;
        b=eOZnyuRTjvaSscSdThine8D4RUysMa/y4xxZ0nzfuSRe2qs/xf6tNsiBCd/VViTc+O
         y6lUR/Uibu7xA79mWeQL96jYOELf6Z8v8OKFQ1D/DCnrfkzRiezC71Isodu74Sg4ATqC
         Q8vevtAzxZwUj4p6ar3KIPsZkxn/REV+CQB+lL62dDfndxpn2Dy+05nlQn5SUVn79bOu
         cltZVqXEMgyJeOSXKd3Lf3kA0Q1SZ5rrvR+Ki+XOHESaQCSehJ94jWYxfPVNOWxUxDex
         7d6U96Wz5JCJaWUlIRxSZT8sDxIN+JCrWaIDp7pjuQsTYaK8z/VmsRKmtV+8yANEo507
         p87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760652745; x=1761257545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQg/ICgMWrNLJ+qVKDXr+wEji85IYihnhnnRuN0F69c=;
        b=B3oKYmZUz6RjeMm+B6xWiUsLl0VhnYRXV0VheNgiSXV1Tz++uqow3ZcGEqLoMqWQje
         eS7Z1fYTc6GgwriuUzFl/+HLZR9BTQiec+YspOo2PjLMKATaqUZS8JPdkSiknc1qsih0
         ipwTxtzjdxJHqDxAkuX6QG4O2H2RlnatWR1FmyADHq5dNWs/AiYZ7f6eepG1KEVmdIay
         vBNy13Iwglwdpe0zqRoDc6E1Kb5ZSIb9bHIF+Z0G2d25oI5B3KraK7X7GJrbrr6l6ZE8
         wQCdYdfXrJTHhXanppTREnOyUMYeso8nJhU/PRssGR93ud/OqPTBBK3dTzWu+ffWwLCz
         EqRw==
X-Forwarded-Encrypted: i=1; AJvYcCUnmtOYtNTm9YmWr9Lr9WkB8EGi3R/B7m95o+GCpCPOfxbt1TayUHOMeRXyXKbPr4EQCqNEvxhJEdi+@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQUuJNTrA6X/2Q46HY5edrG+Oy3DNB6OsOwLJtvUTAFWt25uA
	OjLp1pwFBcQzXy6yoSO1qFC/4bxVWhgZJI/Phd/U3Rf41Wm3ypylQQHNp7hTEwDzKz1UMCoL1iK
	ym9KOyUdBd9vmWaJEJEUrvHpvitRAigS+rR9VC68t6Q==
X-Gm-Gg: ASbGncuLeUMPJfGh1gruYD9sKBJi39ftwdw5nW36su60od9gj6/oGRtvB4YTCgq+FhR
	n6p4LfOSizmIOBnWJ7JGzS1eYfF71Qq6N4M3yhEjwUrZbcmVdrAI7J7iEMX4MPrgmZbGeJwc3jj
	5NHwCyHncY451AN/pkGyS9kLomiw8Gy8L0CvhuTfASyo+iogBov/OXH2KRYzLYmfjmXrHawSG/l
	9T52dhIxoPRtjxERLbliWyqFFlLsQyiJH1Ra5od9NZArt+DIU4crIDdxrGdQ3pBpdw/13k=
X-Google-Smtp-Source: AGHT+IETNEjPulnwiJEaZdRc0wH+lGlrNLWsrrUjpY6RycGygjNZ/Td0MfEPQ6uNRg6Pg81UriqqHMCpfUkXWgv3ujw=
X-Received: by 2002:a05:651c:1595:b0:36d:501:76d5 with SMTP id
 38308e7fff4ca-37797a0e6fdmr6276421fa.26.1760652745154; Thu, 16 Oct 2025
 15:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009223501.570949-1-jelonek.jonas@gmail.com>
 <20251009223501.570949-3-jelonek.jonas@gmail.com> <CACRpkdbCw1Agnsy-aYPs+2PhQDFjj+=VjmGQBmxuCUfwRuWkfw@mail.gmail.com>
 <22a84772-0e54-4b99-9bc7-59e7e4633807@gmail.com>
In-Reply-To: <22a84772-0e54-4b99-9bc7-59e7e4633807@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Oct 2025 00:12:14 +0200
X-Gm-Features: AS18NWCQeU3PRrgCI-45m0Qnjsaps5imw3vWqXQ6TlIlAkiw0OaRW5Kow6BCtE8
Message-ID: <CACRpkdZ_UjOBv2JU3VfWZYa41LcAhRmUzQCpni+pJViFRjvFTw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] gpio: add gpio-split driver
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Peter Rosin <peda@axentia.se>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 5:37=E2=80=AFPM Jonas Jelonek <jelonek.jonas@gmail.=
com> wrote:

> I think this doesn't really simplify things her. As far as I can see the
> GPIO forwarder is more targeted toward 1-to-1 scenarios, requiring some
> (or even more?) "hackery" to fit to my 1-to-many.

I see hm OK you worked on it so you know better what
will be most elegant here, let's see what the others say.

I'm curious what v2 will look like!

Yours,
Linus Walleij

