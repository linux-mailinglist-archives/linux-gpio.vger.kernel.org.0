Return-Path: <linux-gpio+bounces-7054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 849568D7F0C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2B11F227D4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 09:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A6F86270;
	Mon,  3 Jun 2024 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QmccE0OO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC5A8626D
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717407270; cv=none; b=M0cA50CT+Qig4J5XIY8h2fbEGGJ9dJDdiHEKsYXlpFFGll2pxbo9Jkxx4DPpHl5dmZ6EbrtwnRvj7RFpfnOYObm5bLbtbbsRJjdvRktApIRx3g8emvgawac5OYyuVf+YpuR95RNfgoGw600nGPvLyWIz45pDvEDfrPUQsvRPei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717407270; c=relaxed/simple;
	bh=wa6E/4w8Pml5u4HOdEjPMuzjTKaFUPGgA4CIdDkJ6t4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvLn387DSANkDndTCrE40OasHniRIxsMSfbwvpXJb9+DaJAuUVETpMs3F6E7KTVsWZnd88DOoUcT3yaknD8PXfqFcQvYb8xvRgCE3xYvtjJuVnfeegbzR6amQYQWvMqpPEQ+R/eXY+xshr3kfLvU10ciNP0scoymzFek9SA0LvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QmccE0OO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e95a7545bdso41745351fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 02:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717407266; x=1718012066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wa6E/4w8Pml5u4HOdEjPMuzjTKaFUPGgA4CIdDkJ6t4=;
        b=QmccE0OOgmq4t3R8HBeb8sWuSFmxg1Iwa4KghRYNEC5bRavma02GMLyf3zDX0ZXUZ1
         BFrkEHSZ/GbqXimM38n19+CKgUjdXlc4XmheHDFxoEyDXgvLNmt6GOje2me4bcNlRca4
         V5UHbChVhmNGg0H+uv9ZwQaij6w+dKMa1eeo6fm09boxeKOnis5fBVgLir3+6WG2kTix
         sFuluJNQF2tliQmVn1G4YI/91nbXc9Pg3Q4txqMtTn2W9h91c5aRRGQa8sbrv0aEpj17
         SJZb7X2QORgm9xEf2CoEfjsP5CZD2rv3WHgn2TmeYUdfshWQ/RhTZbfPh4rvusnIcz38
         ynYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717407266; x=1718012066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa6E/4w8Pml5u4HOdEjPMuzjTKaFUPGgA4CIdDkJ6t4=;
        b=FFxLwLK1Y9rFcy+d+WHXqsRbqh5olh8stry8bC5jDZye7lD4GSb94jDVytKr/Za+qH
         +DJ8qmW2+ydwEIAzHhNt6lfqdCxUl7wEl6xc7mkZTSbKDBW/TULdY1KMyRAybVUCqOZ9
         5zz1K6d/p8gjuCqNRJMXkvj9tDBUlMkquGwqR/zojfwHC7fmJyGaOdAIjQUsUM2B02UO
         gNtiYRuAFSrWWoqyxRvYJPBFdlNUjrkZjQ7GMm/LJuTIUYYdUfbUkT5CFZQzKxL4x1Am
         ExKOJ8HY2e3biT+O3vxVBKMvG2wnRx05ATZunidp7NcK1SOxt1LSaHhyD9+P2+O1VwYF
         SxXw==
X-Gm-Message-State: AOJu0Yy0NAmn9+JRDoXWHP82OFshF8/gnQ2UmhT/Eh4fgOZgIe1wohbF
	NzoshdVMBnjltw5qUzfC15dIFR6oipi+BlJXw+49MMX8ELhbnPYc7V/zBPqYUy91Lo90oz0eLfC
	9BBoUJExo9/xBrSCFmaHGgDyYFnxxAwUBbPuO8Q==
X-Google-Smtp-Source: AGHT+IETo1eMJQ0XQu67a0LNnKL+uF3GLLk1J4a7Uh/on9HcMJXL9J0FCRucPBvhpBwdnwOF/9YYjlEI5Pi8nxbyh3Q=
X-Received: by 2002:a05:651c:2203:b0:2ea:7fa5:87a8 with SMTP id
 38308e7fff4ca-2ea9512ca80mr61920311fa.20.1717407266219; Mon, 03 Jun 2024
 02:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531184223.3949069-1-raj.khem@gmail.com>
In-Reply-To: <20240531184223.3949069-1-raj.khem@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jun 2024 11:34:15 +0200
Message-ID: <CAMRc=MeLwYPCGrRGgXCaoqQGH0Q_6JKJFizR28jprd5TpqRTmg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: cxx: Migrate C++ tests to use Catch2 v3
To: Khem Raj <raj.khem@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 8:42=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Catch2 v3.x has API changes which needs to be addressed
> in the tests themselves, hence this changeset is to fix
> those.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Thanks for doing this, I recently added it to my TODO. I slightly
modified the change - added a version requirement for catch2 to
configure.ac (>=3D 3.0).

Bart

