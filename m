Return-Path: <linux-gpio+bounces-17607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14255A60F10
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6755118937CD
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7221F0997;
	Fri, 14 Mar 2025 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L/8FmuL3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3B1F4CA7
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948487; cv=none; b=H3OAC6Vg2Bqw4bBkr0cfqrrNORY1Tdg/JG5BeBa8BOArInznU/ITHoVhz0RdtkCZBTGON2z3h6T5W7UxFI19ttZroBiejA1TndBjcvRlVi6JJEcjSFEgGwrMafeAyJXBKIgky/UpLC7xkMEqqX5GrLlEph2Qs99rQljfwdfE0bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948487; c=relaxed/simple;
	bh=aL0gXB6mSCGXve79f+GXoCVzELUaAGFZyR3q5Z30UuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSkLs6ifbcIgsVzjTAD9m1PxuyXWNonsVtgP6MpV8SAFCjxbt9/K8IO19u6Y/vw1Az2v42ktRYuGtjNH54nAhZvwAq3KOU2+QqlRIzHv0Y0zVEttr01BugxMrdPgv/TjytsMAviWQas3h3c6bgjvw/3+NIVZ6B3pZftT674HdNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L/8FmuL3; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so2052095e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948482; x=1742553282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXFlL4FEs/n/rX4YOPitVgbikcIXGJdQJLDY1EsOF8w=;
        b=L/8FmuL3f1IHAid3EGYNfElweO601ecHo+1Xs6kAHjAqDaMrX8RnRwhJHnRkW1u4T7
         1bF3g9xNOYrP7h9Ku07UmrBhNuZDp10f1xLsOTRlSmMGgf12qGno7CZatu2NousSrdl5
         yNh5PSJ7FoGDYymPiJeLnEQB7M7PicuOwQD+CIqrT6rII4dgBAgam/EaC3qxArCON+av
         J686h58ZpUUcLYHRyNdgSdmzYEhCB08ETmwCaIs1fBoJ7IxviU0HFF0qtSKBdhzz6rGx
         DUwGpcals95bLPjjY1du+n0B0XECrl9vvA4bH38+slQwu+mF6/4fzccPAPZSL77OWSZf
         ZSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948482; x=1742553282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXFlL4FEs/n/rX4YOPitVgbikcIXGJdQJLDY1EsOF8w=;
        b=dsPYfqo9Z9ginwnriFWpKwFF4AUeCoz7SLKTVMj8alTHp5AU3NGjthReMHUE5xa016
         Law8joBnkYrBWcFM3GSeIfzJy7FBZmbHd4P/OVvrE7EfbcybljIVsvSkVNVvuItteUVZ
         lJGc85zbK6fZSt8RqL44/FMehVhazpO+SEWzpvm/Vr2w+xhum+DE/xzQdK1SlMF3/JhU
         KIIt3PS+Fgd7yK8E2K5hodWcr65dHfuYDJnL9wkac+Ik+CndfehMdF6leHWG/aXdn4Zw
         Aa/VfYFP2ey6DMBN4rkba578fpCDWqhnYlHNQGeIC1WI4daWSrE4hOiP0/6GG6cHlY6P
         6qIA==
X-Forwarded-Encrypted: i=1; AJvYcCVKbiUbGHUdcZJMezZIm2hlyVDDI4oX4EZsNjgmGh+/pWcVenFwgniLmPPPhjkfJc5BJZk1WavPKKTY@vger.kernel.org
X-Gm-Message-State: AOJu0YwfGUkQ1wAXm5DPn/gQ80FBrwnhow18RfMk8nr5nnGynVqwtTc0
	ST/ivA3DKdDLRiDAqDGCpe3ZSvEO0o3bsEDWvM810DFawzf8qJWk9BeK4ZKwySsI4LDBmEt1yJj
	3gCEpKMKcMXCvd36vRDs4Gf8KaG7WVv8r6qQ9ULfw3dKitCSv
X-Gm-Gg: ASbGncsJh36UNkgj31ODsjyjHfuqh8clRfWiEuAjFc+FMNOmcnwGgEje4sR4Scnlzyp
	FPJhtQAQWCansJbGBb1IqgS5hvzkDPhnKqxHMov1DBvNASnasZkByn51JNLp9T2mtUC3oNOmGua
	QHgXuJMI936igDsKiJ1u24w7Y=
X-Google-Smtp-Source: AGHT+IH59Nam3QzVYLK/m6Rs0Q0Qn2HE9pRubALNnpoj2NMRzj++gf0khsat6J38n/8gCO1y3XF2MUrlrRs2zD0uS3w=
X-Received: by 2002:a05:6512:398c:b0:549:31e4:9ea with SMTP id
 2adb3069b0e04-549c3c9897amr675717e87.52.1741948482182; Fri, 14 Mar 2025
 03:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <617f4c77-7837-4e24-9f4d-620ecfedf924@stanley.mountain>
In-Reply-To: <617f4c77-7837-4e24-9f4d-620ecfedf924@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:34:30 +0100
X-Gm-Features: AQ5f1JqMDr8pDqL2jIXtFwweqNigXKcsgGd2oHbNPaqU9RFqX-TDqejST3Ot0yI
Message-ID: <CACRpkdZkpJR--x=qgzXVmRsSexobBV9eRyQ0BecGZ4+dNBcXQg@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: amd: isp411: Fix IS_ERR() vs NULL check in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 11:52=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The platform_get_resource() returns NULL on error.  It doesn't
> return error pointers.  Fix the error checking to match.
>
> Fixes: e97435ab09f3 ("pinctrl: amd: isp411: Add amdisp GPIO pinctrl")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij

