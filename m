Return-Path: <linux-gpio+bounces-3282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A5D8549E9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 14:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C03061F22A06
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 13:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B208852F9E;
	Wed, 14 Feb 2024 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k5S3FZMy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA4752F6E
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707915686; cv=none; b=QP5Fkn7iI/wjlv4fqj9tsuSyeoCkutFpznC7/VVTheKfhyo4J37241QK0tjCfVoG5VdQ4DxFHsCYnJeICSyHuITFwHSa8VpqhqLf4XEEiYY6KErCa85VWLFjL7Ir+kA7BFsUwZ8bBjZ6r6clBQFT5hE3uVRudd7a9k0AIzLoGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707915686; c=relaxed/simple;
	bh=fLVy1f7K0Kn0pdSgvUnQvwzHJ/wGtz6uPSJtJFm0hlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yfa/NmoaEHqWB+YfnIXECh9zkBrq9NuJxfK2ihcNe+yhbNmrSkjQyB7Grqn+fJF1VCSd/JBWfvbSGs/MeDbvMGeDrcRu11YqCgHVHl5i73wadpW/zEbn8xLUNJ5ydKJqOKM3Rw4ClVpWxqFyL3pSEkURmPzDZInuOS0MaS5ssxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k5S3FZMy; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-68ee2c0a237so4558196d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 05:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707915684; x=1708520484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLVy1f7K0Kn0pdSgvUnQvwzHJ/wGtz6uPSJtJFm0hlI=;
        b=k5S3FZMyODaPutCg7kBDw56NG4IHWQrwX0Ic/stdpWuH6msMkSMRv82EhJoyTmQRIe
         kQAtITTWr0yH8Ib4h3kETB50s6OBqMmrwBTpJ0oTA2GqYo5ub6USpx2m2DQ5kvARNpyu
         sEjTasqW9FJhBBr9MfsltlIeTjkMGyn4Lf691MHqmEXYcM04gBVUBCr+Z4C1gfkgARlG
         UViJ+DXZ4RsAZG0yOaAbmaHutDEN58onAIxsmZOcw8MpBrTIfuHSPC0Pgh/f1jXDfV/e
         PotsuXMOZBSL6PVioVT5ZcjoiyvtrBqwU3WHAZZAODRcT1BVfNrryyOj7HJjbd+RqULQ
         Zqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707915684; x=1708520484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLVy1f7K0Kn0pdSgvUnQvwzHJ/wGtz6uPSJtJFm0hlI=;
        b=Ky7B2VtxnF34T5ibgZPe+NEPNCDdQbpkZDE0HjL1dMSxLgIa/ybC0eqp1L+l+ku9Fj
         Hl1T+9w9SRI1vNcQh4xsZ6gGiysRrPJfUeB7oViLKmPmgRkk2a973p8pi04DWharj/Y6
         SNpnGT7Edb1NOnWUEhlLum9pBMJU/+G7fvL9mJNalNo30Fj6sQBXMN+l6LD8V4wV2zem
         sYTno0hEd242LlfLV/in0zHhABTDkl2Sc186WQUUS/7ZnVvZ1aJBB0eyNpVr2EUO2Ss7
         0X8qxHg5O21Euu/OiwWZ7sGR0kCpJsloeIJzQpXq/XLdxZzirxvMua5ceZMh2Z6fdfOA
         WFpA==
X-Forwarded-Encrypted: i=1; AJvYcCVlVXB42CeLVaOmTFrDNIyVvCkgnD0G26bRTckniw8WSJTHpQlzBXV/ArPr93BQILuRudvkXa1tTLYPaGIYCTXa5JlhDgrce6zG2w==
X-Gm-Message-State: AOJu0YwL6tXsZZLAv4xsOS3tdjkQJrG3AnIvdl6nlUQUNLrHGJy8GNj8
	cJJF7SjPQO3FkzaEJ5HZjZtaxKdPA1x9zSda89pWoZ7MNMwg1S6hrx7Msj5N6bYf0QkCyOsg/hF
	RX0nTK0bXgG7+m/KGbzEP1bOaR2cGxNkaajpnVA==
X-Google-Smtp-Source: AGHT+IGonhKXoPvsozKTZHzXlucbcYX9bg8Gg73rytHzYubU8rxNgnY/C6AFVJ/TQKBRXQr1jGNt+PCgi0Votzl81JM=
X-Received: by 2002:a05:6214:4186:b0:68c:7cbb:272e with SMTP id
 ld6-20020a056214418600b0068c7cbb272emr2843572qvb.19.1707915682117; Wed, 14
 Feb 2024 05:01:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214085248.6534-1-brgl@bgdev.pl> <Zcy3fwAZXwJZpqqu@smile.fi.intel.com>
In-Reply-To: <Zcy3fwAZXwJZpqqu@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 14:01:11 +0100
Message-ID: <CAMRc=MeiYe_QZexnYci_uHguChK-=a2+iUC5jtR_OharqwZS=w@mail.gmail.com>
Subject: Re: [PATCH] gpio: sysfs: fix inverted pointer logic
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 1:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Feb 14, 2024 at 09:52:48AM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_de=
vice with SRCU")
>
> I'm wondering if instead tons of fixes you can just fold the patches and =
rebase your tree.
>
> Yes, we still have time to let it soak in Linux Next, so Torvalds won't c=
omplain.
> It will be much less burden to anybody who wants to backport this nice wo=
rk.
>

No, I don't think so. Rebasing is reserved for really special cases
when nothing else can be done. Fixes like that should be expected for
a big rework like this. This is honestly a strange idea.

And I don't think anyone should backport this work. It's simply way
too big and touches too many places.

Bart

