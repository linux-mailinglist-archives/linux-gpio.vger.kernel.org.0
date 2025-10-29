Return-Path: <linux-gpio+bounces-27825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC5C1A92A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138601A261FD
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 13:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC663469F1;
	Wed, 29 Oct 2025 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PCnagt6o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C92B345CAD
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761742546; cv=none; b=nLxIQ3qo+TSFmhziYkNS5UycfSWgFsJy72/Amg7xh0HKnrscDJdnqVOVu++DY+zTwW8K1wAncGt6tAa4czVQetKGfjXKCcOHr/EK4L4KSzelXWNm38dfsGHyXtYvGvtquYJ0VqRocBTDP9dtucku8qetJ+4uFDRFZnLrbGVmNq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761742546; c=relaxed/simple;
	bh=oaiGrX/ykXacoXQRvoz7NUmAFH9tG2T7WIpf9HIZMgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzO8zPGI8BSh5Zqs5BcOBDZAYnS+VBEUygVqWaWOq4YCNN6fBmp2p/5Lm6f/Pz2dPnJ2/M3U0Q1cqhku0v/XFBvYqp26mI1kMSnt6dupM1TGWkEKqHNCz1wSlDfIUV3z2Eu1jcmd6T0FHNFhUiqXlV8b9f4fkd/SVE0sJisYT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PCnagt6o; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57992ba129eso3823531e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 05:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761742543; x=1762347343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yNabgZGkHY+Qgm/MWzqFABw0v7t/r2KBAY0H1eEaJs=;
        b=PCnagt6oQiL4AdoemRErcawzke6rCoqzFAbBiTQSQff6svXZJPF5DEDLbG1QcKIFN8
         wxsGwp52U1Q3Gecz3c5ge0j6zUIme+WcxReM01eyJXfTb/ubPPNFJOUVJl9Xm1VenbUV
         t+429G5175sVyO7zBIaeDBZbrzm+3Kya8oIPT6b93eF5HGkN0Z41aFvPegVvnrl4iel3
         ACw/1PioQhV3lTz2Z4ad/8I4tVTs+BzphLtBUGFFZiJWdKtWjTdDfSs+5lzNDMBVLzAw
         V+HfowjYGfDX6toSZd1Zu6JLyYlgKhWzkFmtTy3CPNjiN59vb1Hx4Urqr6Q1ivtECp1f
         RPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761742543; x=1762347343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yNabgZGkHY+Qgm/MWzqFABw0v7t/r2KBAY0H1eEaJs=;
        b=NezVVHcH4l3Q6LEtzFQ9S1iptrKcSldodOYxOXkaETcNyovwACVcT5JAAXETIlI5M5
         aZ2jAKEcBL84i10VWe/YTYBTQIXpZy0jKEuxgYP0efdqXpr3+KhU3O/5hd6c6zJlFShf
         54qs3MdVTeG61EjnAqcjCSB+gvTOgU/mdFjO3Vpz6Df0JdkaD+lNbUKlUxuObUmapXSV
         i5AcYN1dkSebwYbjNwNSY5cy32g9Aw+ZtF4xK17wTRa01rJs+JaUmYTDchRiagkIS45F
         YGudY7bk1SzPC1GtvsWj1BxkUdjrps52aE1gRo93B6Kv4kRoXGF6cxJ4R75rimvaamsA
         fZig==
X-Forwarded-Encrypted: i=1; AJvYcCUmtqkbPlU5iFlXnVGEWOR3l4jzW/TsFiUnvHrE1Sk66X1gGMU3TqyoIBxSJSXWyXGp8Fl/kMUBrHDp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rocKD+3pzSqpZ4/NehK51h7GfXXkATshaxn4Dil7QZqgkqRF
	7D5CZ31rQgp2fRdbmtELaNB5QVogOwBE92lUME2S5s5hCOw9YNzZ3TAaOt3upog3d8qG0gLSHZ3
	AhYogAfbqE+OQYH2v3eOZf6zddlkS86fGiOErpNdKiQ==
X-Gm-Gg: ASbGncvTS1W08cfAhrkZtPVKA5is7QaRPikMRmZrsGZ8ZXKo+NnnqIeVe0byynBTxQq
	KopuKTFhkCGpRHZXR0YFAOXcmN+dRMluUzm60/Mf/IXAUMuJauiuAafrFblovBCYxdcnsgrDmTo
	5ydh/BV5sx0t9FnkkeOhRsMbva4F4hFOsVuzmMqtIWuXWkxFYXhT+A7OQXHlprnzi1hTLF0yNEr
	YVzbQpbQSogdd0tt+oBtvT/XM+h4XwS6HHXWWjUgYZ/2+kZESctSfahgnw9BqgHWzzmz4T7TylU
	qlo6zpry1T6if8Cg
X-Google-Smtp-Source: AGHT+IHVSlcZcRFweD/CsA6OtT1TIVhjc5sVUzGgiku4ascUdv/UmnI9MvaJYPGFR/shw1/3ylKd2GmpjO/iAE476gk=
X-Received: by 2002:a05:6512:3f09:b0:55b:8273:5190 with SMTP id
 2adb3069b0e04-59412a3db0amr1107474e87.18.1761742542582; Wed, 29 Oct 2025
 05:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
 <20251029-reset-gpios-swnodes-v3-3-638a4cb33201@linaro.org> <06c7a64647ac78cfc5366a073ec12ccddda49572.camel@pengutronix.de>
In-Reply-To: <06c7a64647ac78cfc5366a073ec12ccddda49572.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:55:31 +0100
X-Gm-Features: AWmQ_bluIn90sOwg9DzJfIRKjPB4JCG8HCRF9jGS6ZP4TOd1qCJlUatPTeG_3uY
Message-ID: <CAMRc=McmA9M6gMzpJ1pgQG2+6gGQ5GgTV6mB_X95WxGCgv861w@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] software node: allow referencing firmware nodes
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 1:51=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> > @@ -535,7 +535,13 @@ software_node_get_reference_args(const struct fwno=
de_handle *fwnode,
> >       ref_array =3D prop->pointer;
> >       ref =3D &ref_array[index];
> >
> > -     refnode =3D software_node_fwnode(ref->node);
> > +     if (ref->swnode)
> > +             refnode =3D software_node_fwnode(ref->swnode);
>
> software_node_fwnode(ref->swnode) never returns NULL if given a non-
> NULL parameter.
>

That's not true, it *will* return NULL if the software node in
question has not yet been registered with the fwnode framework.

Bart

