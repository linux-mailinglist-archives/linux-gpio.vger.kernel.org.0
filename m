Return-Path: <linux-gpio+bounces-26807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD0BBD693
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 11:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED03618928EB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 09:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94538264A8E;
	Mon,  6 Oct 2025 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jfhYAq9E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CE22745C
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759741757; cv=none; b=WWNCLEpbGXa2LbZ+vKL0tQ6L/tWyUs5o3bYbpQF5K1p21OmpFkZTEQC4mEn9S5n6ZAparDx7LEQ8WPCIA/DrPn4+W2DlSsRGRI7PMkkXGU+whErh8/uhm8OTXWYLo5o5IcLckU7nm0YhGviKJ2F5hkdRwzhb2cTmsf9FhNqsI7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759741757; c=relaxed/simple;
	bh=YUML59aU/N3+IbVvbU/UOdKZI3EV60PQbP6/evD74E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXr9mwyM0g/OMlimoMbKOr9grtb02PZ3Lmk3AAiPkI1UrOP0XWHQB0IH6E8YzkPt8iBtmYEbt4Uvbwc6Mdy8AcjfP4ddlP8UKli6+A8QMvGh31qZIbiwqNZSdTZbOkV26Nhv/dD+tDKdsc7rFh3Mcw1TQLNq8w1+9T3o2l+hd0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jfhYAq9E; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36295d53a10so40913661fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759741753; x=1760346553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsBznNRluYQ7XuvPEjh0UKcnKpWDk6R9qa4Tp3O4MNE=;
        b=jfhYAq9E3u5E83TByg1dhbbqEhesDPLoXiQCuaCLHLi8287LudI6vTh3A9XYZuDt47
         RKCrLFVCQe3b7j+xfyltX0ogCkZcFEybopo2MXgoYz2WUBKCadbG/K0toJHUn7kpTtni
         IscJQ68inR01E7bLAEnH4Od0pR++k4AVwpdNVe+piMAbT2vZJUXSuV5wbEYspwDbDQR0
         AimawTEtcr1Wesi5wPsbOZUtXFRjwoS6r1Ye0O93gLIFu1NEk4gYqAr3EM0c91tK2bv1
         MP0rmf2Kwhb59+YcoIfTS/EF48XwUBqTCT6FXPeI9JOVhoy27gm1WrfkldN+4ANMe7Bn
         bP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759741753; x=1760346553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsBznNRluYQ7XuvPEjh0UKcnKpWDk6R9qa4Tp3O4MNE=;
        b=iYU1m+TQyU1r9JTqt5LLu/HsXCagOJaHzmggljWldPbLP6/a0puPapbCfb6Xdr0zfD
         qLT/qiwbB+SzVpz+Y+aeXqXQF5cA5o44o6Tp4L6chB/dj52IYaygl6Bym2xL/2r6vR4F
         l1gsdTN3G76tDjDyjESxSluChhGBoV7Syx9Ng0wxRyExz42uwOw9wO2gns185IwuMODN
         jyJ6LJqUjP7SPrP+D+MORt/WC+FYBiYzR7SHZnm5mdrr/jKxJsfQI1MjjMt3+Ix76N/c
         4cbAlFQ2b3tOp0m5McI5T19xmO6zLTdI4HNhxlKRnQ5gP2+BHNBQhBwzRH8QTLmd25V/
         Xr1A==
X-Forwarded-Encrypted: i=1; AJvYcCW+lgMppQ5v2rFufZDYSXekgNrqRqXdWkU/VeGkGYEHmjALNYbmm/vOEZSzH1RICuNMfPWaQpkpwX65@vger.kernel.org
X-Gm-Message-State: AOJu0YzicbZDW9V3h2ysYsGm1IvCnCbPxapdwEB9OGzH9QMT0Npku1qE
	Wp0Ahht3+gNAyQHzfDMOJJkgcWx9Jb3E5QayDiigR1Evv3zi09LzGJSCWsthODUYjpKerumRTco
	8paez+skNhTf/5fe5P6ofJrmdmfH26bYTLZWynsACuQ==
X-Gm-Gg: ASbGnctEdGgUf83g4nzx7DASSbTizXJl5Qlw6zW87/vUdRNzCpukL7i8b1vuqpyWRz7
	gLQ3tvozikuf/etTON1wgTOal7WGcbn1m8vlYlWrB5QmzfrnfDQqkMdh2dWplNcc9eZckqnGdkG
	E+Yba/MEWlpPOxq95K8II5Jw1hqiiRE+okjCh9lkYXW83fpQbdr/pjF3/nfCktJNJvR30VtWFyZ
	0oQnatVz+mD/5F8hrsBTMjEAQurUlfhP3YDT4juYUVnEg==
X-Google-Smtp-Source: AGHT+IGlucg01F+gb3JV6UjaZGrg0qXUJn2hTGyuFhNh31irV0HP9JR68bNyp4NxLCV5GwGDBXfCTDqBJRwt7Mkau9Q=
X-Received: by 2002:a2e:b888:0:b0:36c:7a86:1a96 with SMTP id
 38308e7fff4ca-374c37956d3mr29939701fa.24.1759741753468; Mon, 06 Oct 2025
 02:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003195036.3935245-1-mstrodl@csh.rit.edu>
In-Reply-To: <20251003195036.3935245-1-mstrodl@csh.rit.edu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Oct 2025 11:09:02 +0200
X-Gm-Features: AS18NWDqVOHajWvTpaoMD2IvfKZq9S42szEEmT-kwKD0sXmmuanfWWpIkK5NWH0
Message-ID: <CACRpkdZpFvzu+UFkQjCLO20P0V=QOY6dC9O15LP3LJx6NuifWA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] gpio: mpsse: add support for bryx brik
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, tzungbi@kernel.org, dan.carpenter@linaro.org, 
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mary,

thanks for your patches!

On Fri, Oct 3, 2025 at 9:50=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> wr=
ote:

> The locking changes probably should be backported even though the actual
> device isn't hotpluggable. If this isn't the right avenue for introducing
> those fixes and it should be sent as a separate patch first, let me know
> and it can be structured that way instead.

It's fine.

If it doesn't have real-world regressions right now it can just be
applied for next, if it has implications on deployed systems, they
should be tagged for stable@vger.kernel.org.

If you have some idea about that it will help Bartosz to choose
whether this goes into fixes or stable when he applies it.

> Mary Strodl (4):
>   gpio: mpsse: propagate error from direction_input
>   gpio: mpsse: ensure worker is torn down
>   gpio: mpsse: add quirk support
>   gpio: mpsse: support bryx radio interface kit

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

