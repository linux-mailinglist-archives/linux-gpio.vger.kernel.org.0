Return-Path: <linux-gpio+bounces-28443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEDEC575AC
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 13:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF7F3B651A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 12:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BE334D4C1;
	Thu, 13 Nov 2025 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j57X4rR/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB58269CF1
	for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036172; cv=none; b=tMcnixPnd/Tt+xOADpqZbSQC+ClhnRe7wZosKiz6r6aHMbiAc8hxlsyKqZSuxCRXb1E9ozMZ8zVaKKCJK2PtHbgHRLG+c5k5ZWvd18749wyRZdyaewru6fir4oZktiqc3sU7UrdUV6P8FBKriKxzxE8c/8tfugTaJpl9F9qA0WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036172; c=relaxed/simple;
	bh=vU0vVcdj7jCdwUcv/gue+zO1DQjdA2TBS31EUlfSDg0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JD/HFceBIaO0d1NHeMFn73Oic6Y2a9cpsQj8IT7oBI05M+Hfi8TD2h/HtlaJqmiFUulHDI2VlBlfKrudnPfBkQHRNzKIK4+weQVZrwzG+/6NYws8DeI+2FH+RGBaIopBTH0NAZmUMi3K08CaGpeMTOZB0AUyse6nFwmVQlCDJnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j57X4rR/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59583505988so135245e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 04:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763036169; x=1763640969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l60Ejo2T3NWsKQGzNLhTDzj0QFomTxhzdJot6ahjhjk=;
        b=j57X4rR/BDRd2kJENJ8TIEaMBnzBplNYPwmy2+vUZTr1WArZI1gRwzQGeVTraqEnY/
         NpDD+F0rXpRMJtss17Ofv3EXj8b1fN5CLeuwzV54qL1cwcepclHYlECVFWiwfkX1a4t+
         KzE0HC62ggt51dy9l2iboOERT5XVhguwKKn7L51ozbYra7nHvfUNZ60z35XSxrBKmlY0
         SQlT80QbXai0A/00YtDahUmQzhhsPZpsb3vRqFctM9cI43/H0+jbeCVNW1sqhEfNvBxL
         c/IkhpCJ1Kj+NZXml7nS02vE6KRcmu0K9jSzQgeknWz0N1L1mTjaqeR8Cm3nQ04nM7Sm
         5nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763036169; x=1763640969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l60Ejo2T3NWsKQGzNLhTDzj0QFomTxhzdJot6ahjhjk=;
        b=ZjSVXOsequrX8HughgIENeSEWRdAqI0anXzXMbodvhxMf2pGi0UBGXb5m2+D1YMfGi
         l3jDXz5OLLnweQWW+ChL+wRmAXNUzUIBOA/QXRPVpfKRQLkXzwf1FGTsCSCtrm6RneCo
         a2mM1iRKucRKNARJcziwCDDJjq37BNxKA+wXlCp5moJG9SEsZso6Vj9kgSE7N7ku48K9
         FJt6w601FM1ImYeEaTdXI+wthJjLOml77DI96giUt4DF0+8E0zir1LcHfC6Yx4YJG6/y
         N3TXdFZWCkwOLnGBKIKBQkCI+SWLC6KeKPdRqsbWXiZxEBMel1Ua3EBHUZLiGgpnqX14
         bs8A==
X-Forwarded-Encrypted: i=1; AJvYcCXm1SgWa+pQdt0vxiymEGO8TBE5MNkcxYB/61A6qvz0tdJenRoWioakxuJVLWv0UowMOr5mHRtcwVtm@vger.kernel.org
X-Gm-Message-State: AOJu0YwpVr3IxT6UtzPKbxRmgmRM+Ao4PTXvddOs3S+eosFnXxQdsaNI
	t5e049DrBtdWqBGlKP9l23UcDlRON8Fc4lwapT8GPUc8nW7bWCohUD3joqoJv+aTDp2+pdI6vzF
	Ag2wq1MzSlQBt+sKQxDOc4s/R71QVdDWkWDM3F78Vpg==
X-Gm-Gg: ASbGnctrimWr6smYWhEu/GF4sNbjU0IPOq00/HxiU2Z2+cNt4+Ihv37S2Z8GIq95dov
	q73kFwpVpptX/YwFBrab5HvkrrIg2MiB2ZYNgVL83sBIOzFF6F/ouHwGbrUJbh1RfLgSBVxhIjy
	MJwleDE6VzRSlr6cBGeh6xXcgl8KpZaZ0y34cTZo0VGdyBO30gPNDbLQEXGbj47UtxE2wiRnXjL
	E2V3DRARbL6tnu2C7UpTcuigXQA0eJ01+TlXHvkw+leGDKAYVDkFTj7knrQGrri6TiYh0nFe1/8
	6oWUvUGeeKCzj8QHfIsfZgJUDLk=
X-Google-Smtp-Source: AGHT+IG+SB5V0nyOHRjdiqtQoBEkzTsyBhfKzRDkBcnIkyOZxi4eXUP7KS/OG7XRhpbxBrkJtFZ01bW/wXaiRrz2LfU=
X-Received: by 2002:a05:6512:ba3:b0:594:1279:dfc0 with SMTP id
 2adb3069b0e04-5957ecc4170mr813091e87.18.1763036168751; Thu, 13 Nov 2025
 04:16:08 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Nov 2025 04:16:06 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Nov 2025 04:16:06 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <7aa5a0ce599f86cc29e5075aa4e35155dfcd013e.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-reset-gpios-swnodes-v6-0-69aa852de9e4@linaro.org>
	 <e0e81310332cfdc075bf13f66d7be712b42964ed.camel@pengutronix.de>
	 <CAMRc=Mfcir56ZizXgZZpt4nQY234PA9jx3CQ24YCVQJFBQ7msA@mail.gmail.com> <7aa5a0ce599f86cc29e5075aa4e35155dfcd013e.camel@pengutronix.de>
Date: Thu, 13 Nov 2025 04:16:06 -0800
X-Gm-Features: AWmQ_bnrvTMvqLZX1u_e8HTISsh5pEaGIMQQeIw6rqdZq7jFkd3zAadXNSoff_g
Message-ID: <CAMRc=Me3mOaFpn=xwpDwBzLWjOqS0Gx4rV0E=v_aEg6s_uJyvw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] reset: rework reset-gpios handling
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Nov 2025 11:30:39 +0100, Philipp Zabel <p.zabel@pengutronix.de> =
said:
> On Mo, 2025-11-10 at 17:57 +0100, Bartosz Golaszewski wrote:
>> On Mon, Nov 10, 2025 at 10:02=E2=80=AFAM Philipp Zabel <p.zabel@pengutro=
nix.de> wrote:
>> >
>> > On Do, 2025-11-06 at 15:32 +0100, Bartosz Golaszewski wrote:
>> > > NOTE: I've picked up commit e5d527be7e69 ("gpio: swnode: don't use t=
he
>> > > swnode's name as the key for GPIO lookup") into my fixes branch and =
will
>> > > send it upstream by the end of this week. It will be part of v6.18-r=
c5
>> > > which tag will need to be the base for the future immutable branch
>> > > created by Philipp.
>> > >
>> > > Software node maintainers: if this versions is good to go, can you l=
eave
>> > > your Acks under patches 1-3 and allow Philipp to take it through the
>> > > reset tree, provided he creates an immutable branch you can pull fro=
m
>> > > for v6.19?
>> >
>> > Now that -rc5 is out, could I get an Ack to create an immutable branch
>> > with this series on top of v6.18-rc5 (and merge it into reset/next)?
>> >
>>
>> Hi Philipp,
>>
>> I assume the Reviewed-by tags by Andy and Sakari under patches 1-3
>> make them good enough to go in?
>
> I assumed I also need an Acked-by by Greg or Rafael.
>

From MAINTAINERS:

SOFTWARE NODES AND DEVICE PROPERTIES
R:      Andy Shevchenko <andriy.shevchenko@linux.intel.com>
R:      Daniel Scally <djrscally@gmail.com>
R:      Heikki Krogerus <heikki.krogerus@linux.intel.com>
R:      Sakari Ailus <sakari.ailus@linux.intel.com>

Looks like neither Greg nor Rafael are mentioned.

Bart

