Return-Path: <linux-gpio+bounces-13374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E4C9DFBFF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 09:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17B1AB20C17
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 08:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958A51F9EB0;
	Mon,  2 Dec 2024 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Mv4K15SF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE4A1F943F
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733128546; cv=none; b=niNxU2yE3p6qrSbFrQT7Ya/8Ao9O7jSnk1DBXOBJvRNM4VIywV28QsOU2PRLQPrQPtreNv403hMhYgZ2jldLeevlJnogVpBFvSXycu2NWDNJ1/0lQzgheZ/ezy765tFkuISrgWaKwe9FF7GomD5l7JwehHKL49Qr9ZUKyHejtmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733128546; c=relaxed/simple;
	bh=T+36bmZFV2UteDU9SJyLu2f2WXyUYuFJ2gLguzruUZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EC3bPX2Ewt/InBlpxXb5YI88XPe7LNuo1zwAGFoesZ+5Swqhzb8ZipfE8Mt4AiUJ4Q85e0e0cjdI7pcbt3E6b05cCB86EQoy6k1hMEiqjp7ktEFupvKE6Ccd+AsV8gbaDQMhpC8QK1AWWRLzNuEJ5cejwn4kH+K14w04kBbum/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Mv4K15SF; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso48692821fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 00:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733128543; x=1733733343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5JA2+z1LXjW7PcM8eefY/g9snD2A+niddlqsLb2UnE=;
        b=Mv4K15SFRbtoCEwt35LXYLgTNb3jTMWiipkLqhP+oWx9rFy3n/abqwo22zsBhdnV7e
         VZOquiAFcqn36EcWEPFCTbjELTCgz7JCbnZ6o1jNamzISKwAKIJfBw2AwmyedopraopE
         lBeVOG1aS1/3CV5CF4VRgLrjjM9V+CuokXqcMHOiRQ15IMvKzt1/eqv69iTcafvMm0Ca
         +Fy13jqzAUOeE2BNYRwus2fFerRpYaER5WuB+qxveU3MJie8g0h2vKpmBsKzBsvNsveJ
         rFvY5RmF7UM/ZqZqhCxRNB6H6MZtUNKVUdPiNj5sxOdHOZX1Xz8k+ZVlTUt7LANNT6+p
         /edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733128543; x=1733733343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5JA2+z1LXjW7PcM8eefY/g9snD2A+niddlqsLb2UnE=;
        b=pBJxillYI68veWSNnzMaf5O8QtZLYgvHaUMTPxZPPQ0xPPhMUXf1nofLVsi+NmymzE
         dciTj75oFVRclzA28cSTdxTr90Z7tOWU99BOtGv5R+B5q3ERkhntqOBFx0GTRtYzII/b
         2GsGCjcEPseByjBBPNRELdcD6DfQ8RMKsGurPkownLueKunBWJvpcvPNuMBpAn5VRPqQ
         4CW8QDop0qjAZL/3iq8991mD9bb7Oaw1xVAtZfW9FVBzSTmJffPsMinWI6RA0Hh5D9Qw
         vr+SOreCNHxqrhthlI0g2MXorkM/IEADGOGcG7R0jF573U9MpG5L5U8LCHO5D+WRS+k9
         GHOA==
X-Gm-Message-State: AOJu0Yzk94AR0dxEKs70qi8EntgNG2SbhN/jRAIV1xBZEyAZ3/l0kqCI
	tyR+sPkCLMqxfprodnz0Bjmuwjom9a0I4Nig/VrV2Cx82uMSschTHPKT9vbMLfbuwZ2Io+t5fpo
	7z7T6HmNUVMn9jT1f43wbsmbBZwKVi5Nyv5t30/Qvt4PmbKbZWOM=
X-Gm-Gg: ASbGncurqT1q0wM3Kf4CpDIlKnPHj9NphMDe5/uLeRkKo2HDVCjKnwvVDyQQ2jDGZB7
	SZsIIVZtcY72PkgKu0/la8hhN+iNLXk9VO2EqQP0/WHnI9ZcSsVzAxqbpfA/RQnU=
X-Google-Smtp-Source: AGHT+IHf4jGeMqLvj6hRmuUea/Yj9bXmlhrLYybbdC0qhf7iDB96Gh6gvnv38PT/kZcSrzecKkDXDYY+uXTusQB2OuI=
X-Received: by 2002:a2e:bcc3:0:b0:2fa:ddb5:77f9 with SMTP id
 38308e7fff4ca-2ffd60efc5cmr119278081fa.40.1733128542870; Mon, 02 Dec 2024
 00:35:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241130201516.18034-1-george@george-graphics.co.uk>
 <20241201231313.42935-1-george@george-graphics.co.uk> <CAMRc=McBtrPAkQoUS9tW74E3DgSv1RMH_dR6FYQCdeiSadkm8w@mail.gmail.com>
In-Reply-To: <CAMRc=McBtrPAkQoUS9tW74E3DgSv1RMH_dR6FYQCdeiSadkm8w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Dec 2024 09:35:31 +0100
Message-ID: <CAMRc=MdyYV=UrtyTHya6V_FK2w+XqC=BU19LrYFeJCLYi9O6wg@mail.gmail.com>
Subject: Re: [PATCH] libgpiod: bindings: python: Fix PyDict_Next contiguous
 assumption and pypy
To: George Harker <george@george-graphics.co.uk>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 9:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Mon, Dec 2, 2024 at 12:15=E2=80=AFAM George Harker
> <george@george-graphics.co.uk> wrote:
> >
> > PyDict_Next does not guarantee pos is contiguous, and pypy increments
> > past the end of the dict size.  Patch fixes reliance on pos for constru=
cting
> > args for gpiod call.
> >
>
> Just a couple nits below:
>

One more thing: the commit title should look like this:

[libgpiod][PATCH] bindings: python: Fix PyDict_Next contiguous
assumption and pypy

The [libgpiod] bit should be a mailing list tag.

Bart

