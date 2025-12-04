Return-Path: <linux-gpio+bounces-29268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F0CA59E6
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 23:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AACC318C13F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 22:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488593358BE;
	Thu,  4 Dec 2025 22:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaD5CKhp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3BC30DEDC
	for <linux-gpio@vger.kernel.org>; Thu,  4 Dec 2025 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764886933; cv=none; b=RSf0+HbBbA4FU93ZUW4jmS2d26XS/r6LH0VuEwHDqfvYgz8DGE/mXRQmBCnADtEvaopnlCJXThIj0MAQ3cRbpDjdYjGvl1yWpLFyrJ4jZkltqGT3k3EqqdRT4GMo8QnhhcWWL7/SV6ml7rbiav/duaPEQagerd4wKHxZ7AH2ykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764886933; c=relaxed/simple;
	bh=D6xxe3fyua+TN2tZMgy2Gw80PyQe/N50HFczCYjzibE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9xOGvX2A9pap6aPyTuE6og4g0vp/lyl19jVjYvKvKkapwqvWkLWhUCwxEacawyFysY6SZaieE+/dTE54fuTv5mMAoks/+EEEFqJXIilyIFhc2brEygvnneSqX0JOONRIbRwXBNfYRFgIOSLN0n6fzbykyp3322/uU9r7FgWgZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaD5CKhp; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73161849e1so287649566b.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Dec 2025 14:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764886928; x=1765491728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XupUstTQcKQfp6Q5f2R4dwsrOpNjG+W+mOqffMiqwlg=;
        b=EaD5CKhpYXcP3CDF1eZZYnnEolEN4pOOOAc88koxvn2tYY03BjA/S31Fpv6rAi+KIZ
         u67N10agjF9wVRjAoWtCg9psyombmYJ2iUFeiI1k4tQV/yhbJdbyq0GsaFhIu/24hc+t
         XpA6r+DM0mA4iMx6xYAsVePFJaSJtZ10RTKAKeQ7nyluEJd91Mr7HkzQJCntIEIk29Ub
         hJR9B0KonMSUf2o2vgYkda7jfZZmG68hXVYrN3uJmYKvLi5zjJdbuQnOtScdtA+p9BIK
         JddlF+Pch8cxCibFW+zKrXq+5jcdcJwhhzBi3GX5mkV/Jh+nzS1ojvOIqmj2niVdDjuF
         Vrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764886928; x=1765491728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XupUstTQcKQfp6Q5f2R4dwsrOpNjG+W+mOqffMiqwlg=;
        b=BdaKaVEN2sEM5ah+u6L6MsCRgn4umfC5T6shTGNXnKWCO/DShG4reE2FHyD8OzslBb
         S5I36XHFlvQOf9M3JL/trjpYVW5XVqBbcwb1HIaNmU51lTN+5I2++7H7Mr86cMswkNLD
         RNF4PkodLihOIgrmktmN98P3oMFWX64O+SThch2RRLStWvUXwszxEhw53DGha0Oh1ht9
         PXwXG1E6jDzfG0Oppec1lf/gSjvJi+VPad4oH+0q6OIUW50mEwn8csKom/L1Evxf4WH1
         qilLSpRVOs166RAVL9DXP9g6cnd60tzJvtVQ9FDI0Gqc6Wzr+h+rj+SA06slvCeMPPp2
         hlJw==
X-Forwarded-Encrypted: i=1; AJvYcCXCmp2Y/hwUdbWnE8egrY2rqsTsxPJoDGSmjH66wFZknoc9U2ifwcSECm5xsCFmcJ3ig+4uZVXUTxja@vger.kernel.org
X-Gm-Message-State: AOJu0YzsyovwDBBcqaNCn1/aD+Yyy43N/+J8DURJsMoKQGSpF4sb+fZA
	9Dl3qgu84p4Ie4k26CYLFKQKKKxnX1QpNSnsjcTYvYJcFMjWbAm9+7A8hja087nI/MxL4qmsGd3
	/ByIYu0xWMMUkp+mo3whysGt7bCCw4tU=
X-Gm-Gg: ASbGncs1ITJajMyMcUz9v2ILzLetc8GJyJ+UB/PG7MAvFEX/a+JSyS2SSj0yiiU0QGv
	M+ZwJszzlM+cYQ43DqNBqe7Vj6jIlfKZzjkwlKGSGVRLvkj2Oz2uMasNkPXoxsY5rVsmz1rMSUX
	EBCGZYWaAmtRGYtsBH+oP4GyQtBIOYZmBe+mG9cmCH3by7jf3czaGRtOsjuCw9sIrMEhYGxXVRT
	xmqLha/MKgB/pLPOr5u7KV4LhRSiPBfKeYfOkKj/b0cs8sdq6v+reEIdkbcswFXU0h6NbBCghhK
	LmvuENDkCuxOtOLsuRRlYV3ZvYoddNuqpTzqslzIrw83BbJKFb7yg2PIHAcdLkdsnFnBykM=
X-Google-Smtp-Source: AGHT+IFXDSgZzBVz1g8UK31AUP8phQfiDKgwk3r9slHtleurRlUBKv+w/ggRRvanZGRCWmJHejrKRrmxiRrqkTM4yJM=
X-Received: by 2002:a17:907:2d14:b0:b76:7fe7:ff37 with SMTP id
 a640c23a62f3a-b79dbe8bdc6mr841679666b.18.1764886927851; Thu, 04 Dec 2025
 14:22:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-staging-ad4062-v2-0-a375609afbb7@analog.com>
 <20251124-staging-ad4062-v2-9-a375609afbb7@analog.com> <aSQ2JUN05vmMQC1I@smile.fi.intel.com>
 <rk4hmupbrb5ugxft6upj7ru43x3z7ybrobax45rorpwbcwleh6@vzxrr3m7r6ep>
 <aSgX9nMBwBtAlSyj@smile.fi.intel.com> <3izg5lyxjye24pvzoibk4tmnxbdfokr53abkpbjo5epqjoz55j@6wc7i4wsgwkt>
In-Reply-To: <3izg5lyxjye24pvzoibk4tmnxbdfokr53abkpbjo5epqjoz55j@6wc7i4wsgwkt>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Dec 2025 00:21:31 +0200
X-Gm-Features: AWmQ_bmbCUOw3LqhyL1NA8ZmvoQjfRd9vbO6kMBuNW89E9IZztlzzePVnfkiPE0
Message-ID: <CAHp75VfLd46xt_2W35gjoTCoh+PqExL-faZ8snhzfOx=65qXWw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] iio: adc: ad4062: Add GPIO Controller support
To: Jorge Marques <gastmaier@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 11:38=E2=80=AFPM Jorge Marques <gastmaier@gmail.com>=
 wrote:
> On Thu, Nov 27, 2025 at 11:20:54AM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 26, 2025 at 04:55:41PM +0100, Jorge Marques wrote:
> > > On Mon, Nov 24, 2025 at 12:40:37PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Nov 24, 2025 at 10:18:08AM +0100, Jorge Marques wrote:

...

> > > > > +       return reg_val =3D=3D AD4062_GP_STATIC_HIGH ? 1 : 0;
> > > >
> > > >   return !!(reg_val =3D=3D AD4062_GP_STATIC_HIGH);
> > > >
> > > > also will work.
> > > >
> > >     return reg_val =3D=3D AD4062_GP_STATIC_HIGH;
> >
> > Hmm... This will include implicit bool->int. The !! guarantees values 0=
 or 1,
> > but I don't remember about implicit bool->int case.

> I don't think the implicit bool->int is an issue, grepping `return .* =3D=
=3D .*;`
> matches a few methods that return int.

Yes, the Q here is the value of true _always_ be promoted to 1?

> Experimenting with the _Bool type (gcc 15, clang 19, any std version),
>
>         int main()
>         {
>             int a =3D 1;
>             int b =3D 2;
>
>             return (_Bool)(a =3D=3D b);
>         }
>
> with
> gcc -Wall -W -pedantic -std=3Dc23 -c test.c
> clang -Wall -Wextra -Wbool-conversion -std=3Dc11 -O2 test.c
>
> also doesn't raise warnings.

Of course, because before even looking into warnings the entire code
degrades to return 0. I.o.w., the test case is not correct. But don't
hurry up to fix it, you won't get warnings anyway, it's all about C
standard and not about (in)correctness of the code. See above.

--=20
With Best Regards,
Andy Shevchenko

