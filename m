Return-Path: <linux-gpio+bounces-27960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC573C2B308
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 11:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 119F03A623C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 10:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99253301032;
	Mon,  3 Nov 2025 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GEjDmM21"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAA73009C4
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 10:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167376; cv=none; b=h4jH8yuCNiOv1nHhoYnF9nZcAfSEmb3E8y1ysdlIigAhDAolbpuIXckYW3GZU+9EXAXrw1hc+AusxsYdEFhRnpLmYTt1DdSZpxye26QaM8RkDG/K0vNQBZiX72hJewAX+6KQ3g6V5W7sJZBprJQuWcUI6mMloPqxRy/X9wuz9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167376; c=relaxed/simple;
	bh=qXd1oKO85msYoAVXXFRKg+REL5mVmucUjgWVubyCwzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejII+4mdJe1tT+epCw4N2PmazlcGm+UvD8IbbzhsJqokMFIlRvMTuBvUAWUch+GOEZw8X/snJpn3cF5vKwUhlmQulFio4qbJN4sc4oTes0j9ilApjDYLXz66ol4KbY7YZ0BMGoUYOohQHkRKeeCdR28HGNbO2q8ITA77TCi0lFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GEjDmM21; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37902f130e1so43556541fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 02:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762167372; x=1762772172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok14Sy5kuYnk485Ftwy7kJP5xIgoR392fDNYbBDnVsc=;
        b=GEjDmM21brD60IDPvOLK4mVw/J58f58NnHnBLBc3eSK7EDPtCPIkrx1lzVOL7ny4NG
         ueMQCmyBb5ySLVGqqeUWmQ6L+5KrSRYSEyaviljmmxcJZWx53bQ6HbtE32r0UuxpR1aE
         HYyGQ+qHThCkNtxLsMjMaL2NgRwjCPS1did9aII8lIDDa1hf1h2Dqe1qyWBAjQvc/jZw
         MuW94y+xfITOAk18nnHwb9my9xpckl53mBGhu6X192TRqlKiCNvkAMIWX5otU+3v76Gw
         YW5wKCMv4shQxT4W9Zbnkyr+gWF9AdHjIT5sTJXd9Mt8unMvoJCl68CBV6VOnLGzFm0K
         X+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762167372; x=1762772172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok14Sy5kuYnk485Ftwy7kJP5xIgoR392fDNYbBDnVsc=;
        b=CXAQ/mZJz1VJDM4dAwW2c83q592xd54da9zCENd5QhOpgElc9Vl/D/YrylD8tPaf76
         iHIVAQs7gKhTSGzEOooZLdh5UnRf/D1z/I1C1r9k9Vt5Z/HPFoAjI/fp92m91luSJGf4
         1Zx+bAAz03Sd7/w18GcG0PGXSJeCqXjABiNWvKHV+Y50bY6xt2y622jcbdsYFJ4k7NdA
         M8GWxvEvBZHSoVpdZPZQNEx519eX03OnsABPuyyMqsKD9+iIdRbtKN1vAqW4fAVRW3G9
         1Cx0KmDNxMJ/a/H1y+2cpZ3fCbEJFlJqozf21hSL15B4DV1mdhWjkVkRYRUpdALIhpJF
         Bprw==
X-Forwarded-Encrypted: i=1; AJvYcCUWSz9Ow+H8e1n6YVSE3ZPUN5sfz+lCFe314/Lfd+jY40pOCrSWdEwnQXSi9PlmsqZnYnkYXqG7ADls@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz8UBUKTRQ2rm2yVKA54KFylW0NIh3lXY8u/3fs+U799sp80ct
	qhPdqWtbyYA0lYbaTLY5rQ2fF/zZ6KN7Fc/lzlAfbpnJKXRgSOfdK5ozEMlh3CbiRGU9WZ2xZrA
	1Tn2AG5O2/lkEeMi/it054Z3/WS89AEg9QaVSw/W8fQ==
X-Gm-Gg: ASbGncsAmtMIBg6o0HgWVfzoXFHxecfSw15yHcN0T4KnB7D2SDHINTJZuYBV+VxoPJY
	HnrBIFvVfomPXqiTDeq8kh2pFS2d8r6u6xIbaLJ0PVxzgV9xUJ+q+OVKs0Vb+T0GmFZ+JiyA30I
	ayuPrUBFgsDsm537gbmtsFXYxX3BlKruwG8tKvgUEAb26n4TuHfvS9AOQaSfoLU3w/NWMNz/RC/
	JxkKM955BFgAO4F2/Z4bbsSRGrLgLh3JwG495pG73hlRloWXcSkDo/hWZIZ/3g+eE+NSCuCo0vz
	59XfOwW6WGPjz145
X-Google-Smtp-Source: AGHT+IGCNFyrRkoy6fXh6ZFQgn7Nyap9sPAn3749NMDYc+KPJNXNFZcWuq9hVUt8f+/CoqxAouRL21Fy6SGUSNRsLi4=
X-Received: by 2002:a2e:9284:0:b0:372:9c25:7a94 with SMTP id
 38308e7fff4ca-37a18e2d703mr27723701fa.41.1762167372364; Mon, 03 Nov 2025
 02:56:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
 <20251103-reset-gpios-swnodes-v4-3-6461800b6775@linaro.org>
 <aQh6n2XuI0oayg2g@smile.fi.intel.com> <CAMRc=Md=r7GaO3A_7de+EqzboyA2cqNSTZx7+64VSMvRBb9gpw@mail.gmail.com>
 <aQiJgRDm0lZYqSmj@kekkonen.localdomain>
In-Reply-To: <aQiJgRDm0lZYqSmj@kekkonen.localdomain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Nov 2025 11:56:00 +0100
X-Gm-Features: AWmQ_bk3gj7buQnHcMQ8QrYYR-_txSOE_pOOdJ6cMSRz8o8pL2AgO4lkThKstzw
Message-ID: <CAMRc=MfQ6n0S4RCPMhvE8kx5w4pc47=M3pwMH6c_CCo1-uZMKA@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] software node: allow referencing firmware nodes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 11:52=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Bartosz, Andy,
>
> On Mon, Nov 03, 2025 at 11:36:36AM +0100, Bartosz Golaszewski wrote:
> > On Mon, Nov 3, 2025 at 10:49=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > > +#define SOFTWARE_NODE_REF_SWNODE(_ref, ...)                  \
> > > > +     __SOFTWARE_NODE_REF(_ref, __VA_ARGS__)
> > > > +
> > > > +#define SOFTWARE_NODE_REF_FWNODE(_ref, ...)                  \
> > > > +     __SOFTWARE_NODE_REF(_ref, __VA_ARGS__)
> > > > +
> > > > +/* DEPRECATED, use SOFTWARE_NODE_REF_SWNODE() instead. */
> > > > +#define SOFTWARE_NODE_REFERENCE(_ref, ...)                   \
> > > > +     SOFTWARE_NODE_REF_SWNODE(_ref, __VA_ARGS__)
> > >
> > > Now, useless.
> > >
> >
> > No, why? With these changes, SOFTWARE_NODE_REFERENCE()'s name is a bit
> > misleading or incomplete, so I'm proposing to start replacing it with
> > SOFTWARE_NODE_REF_SWNODE() which is compatible with the former but has
> > a better name.
>
> Given we're already using _Generic() to determine the argument type, coul=
d
> we simply use e.g. SOFTWARE_NODE_REF() in both cases?
>

It may be possible, yes. I'll look into it.

Bart

