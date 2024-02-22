Return-Path: <linux-gpio+bounces-3644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC385FA04
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 14:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446EA287C39
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 13:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2644A134CC7;
	Thu, 22 Feb 2024 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BfBuqgXr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E50F12FF73
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708609218; cv=none; b=NcbWmDLaz5GudOMLd1ssKnDmf+cyNF0ekx50gLpBd7IrBpBLCpAly8A6HfrCXyOBrSAy3WK3J/FFeQ7kXluc+Bvc//CyOomrIXqDEJYUxX9PTe2uwvooKYcUGTb9RhmS1oK0Nbjx8b+YbcZ3FGI2G/nW2248CkrYW3uQVUBltpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708609218; c=relaxed/simple;
	bh=1gr/hTtT30U8SATEDa5hLfWyfBkXEGCfW3iCRwmw8KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AE5PQ+ZSr/jdiyWt2nhhthU6JUTTMnRRNM5pgwFD7HaGzMEI7OJXNgZsznuZoJLYw8E5LhEEYgtyenN4w6zk1Bf4JvPLtez0MkfZOy6ITPJHLxvuk1EKmlRdp3lFUi+Hc1Jr5BTlgoHLOms2pyK9ltDTFMZtZ3OzYKtVlOJC5RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BfBuqgXr; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7cedcea89a0so4931038241.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 05:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708609216; x=1709214016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4lcxM687g4sT2DyqtyUvURf+hO4FhryWh0WzvdoRs8=;
        b=BfBuqgXrd30eK6kgvi4SIkaTKYwbVVuoFNySzkebWRHuRIP6gvzXXkfljt5sPXV9Kr
         WVZOgOUoCr5fJ9dcQoxaJ530dlpKn9AQk8VDeffZg35fG5MVHGYTfdSTBsTC2gvSXwju
         3TcV0kQVMC2ItsE876E28Ke0wolp3aPq0bs0sPQEDxu7lWHyzpq9WmKeFcRM5zZEYJTH
         0ugseXJ7xGFWTul4Nj8RynCgLUiHEFno60m6ouBOII7N52P0BdAUDawvT+Z1xo3ds8RS
         Jq+o++W/nkIJ4eaaZloRr8MqyHELQO3vyPqmvseBt7m3Kcf9cfGFGDnalbQXuku3FXyK
         UmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708609216; x=1709214016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4lcxM687g4sT2DyqtyUvURf+hO4FhryWh0WzvdoRs8=;
        b=S8K0yV7axBXOdzHjA6Z0AwIWACkMemMujCG8gwwYMOp5sRSDcYIgWNZQv0UIbrbDEO
         W+PexITuzBqk2JCe6bU7UWebyQbin2fDuREOogmeXUQ3GP79I5ZzPYfBrFowR57zvF34
         x78NYTC5AOUqefpkqYc+iYbIRNLHR7NpkynGoLZv/xi/En7t9VRoUqmk6AIlOX8BVXJ5
         YbnXVlphIbZ2n4uJRVG0RutSBZd8DhaRhMaqUr4QHiLlTcCgaMLNfdFHfbXSQheYYYBV
         OmPQl0exfy9V1Yc/BVQRuy3JGSGrTGe4Drlelnh6H5p+95vlEx75S1dcwcqT41hIkSd2
         c40Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJGYjAd937Q+5APIUAv9PJEFxxJtt3hqo0TUiMqqRUFkHabndyk7sMGFXNN1YCk3ieo5TNx1YKii5G1H9SjgN+sFXSFyKrZksu1w==
X-Gm-Message-State: AOJu0YwdIgz34trx3UyuMhBAWZCG8GCF6GOQLw0/6SAeV1Gd9zsjevhe
	C43WAQO1zj6cEDCnQfomgb0LzkznKw7xD1t22B7+3XBt+hCZLkOS4CyFvBRp+K3TXAd5FDZAHH2
	WmDZcasj62B9lbrisNl8kiZPyQFbsSpOc4gfr1w==
X-Google-Smtp-Source: AGHT+IEu9gPXjyI9syhzevM9mu6FCSlxGCfJyDizNzwUMmTn5FtrV0Surfngl1XNH0/9WzxJVdJGneAnfE8IGJvDf7E=
X-Received: by 2002:a67:ec0a:0:b0:470:4dd8:b18 with SMTP id
 d10-20020a67ec0a000000b004704dd80b18mr11774606vso.19.1708609216601; Thu, 22
 Feb 2024 05:40:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221193647.13777-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=McECxKW+uS7fQyGtYVfcSZQaAJZFi+s+wNMoRiHxef0zw@mail.gmail.com>
 <ZddL7L24RXoqR7sN@smile.fi.intel.com> <CAMRc=Md6d19hhySFti+vSLV9pfyzuHNUDmHN_XYV73uCWDAY7w@mail.gmail.com>
 <ZddOcJrYEANc2B2Y@smile.fi.intel.com>
In-Reply-To: <ZddOcJrYEANc2B2Y@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 14:40:05 +0100
Message-ID: <CAMRc=MdABvY8dC+UBpkoLiHc881UFKv0VAQsCUhqnxn3f5LKRQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate cleanup for-loop in gpiochip_add_data_with_key()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 2:39=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 22, 2024 at 02:30:03PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 22, 2024 at 2:28=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Feb 22, 2024 at 10:48:00AM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Feb 21, 2024 at 8:36=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > > +       while (desc_index--)
> > > >
> > > > What about gdev->descs[0]?
> > >
> > > What about it? :-)
> > >
> > > for (i =3D i - 1; i >=3D 0; i--)
> > > while (--i >=3D 0)
> > > while (i--)
> > >
> > > are all equivalents.
> > >
> > > The difference is what the value will i get _after_ the loop.
> >
> > Ugh of course. But the first one is more readable given I got tricked
> > by variant #3 at a quick glance but the for loop says out loud what it
> > does.
>
> I disagree. `while (i--)` is very well known cleanup pattern.
> Less letters to parse, easier to understand.
>

Whatever, I don't have a strong opinion, just rebase it and resend.

Bart

