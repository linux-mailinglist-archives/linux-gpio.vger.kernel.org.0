Return-Path: <linux-gpio+bounces-18892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE7A8AA29
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 23:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06953B996A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 21:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D27A2550B5;
	Tue, 15 Apr 2025 21:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcCfDXKh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B6E2528F1
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 21:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744752793; cv=none; b=qoYyfLVB3sfaEyaGQXwhOpSJJSTWlqSYze4ela7j64P9XuYl2OV634PZZS7C66VsBwX9fZlZ0qvuvry40cOGjPqSA0U34R1vbtIkcjDNt+lWaa+zZXhzy2VPb/Ujxh+qTR3aH+656pP+J78Q4CcuISo5cOZqFkwNrf5Oo3Jz1/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744752793; c=relaxed/simple;
	bh=YFZbjOYvL3XWX9zYO837GJEEHfNhtkIC3obvjgRgC9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9u/6E31LoCduVenEvc97XrJuJrCutNurR45mV6eS+jfDAdrjE1lde8QN5jBK2h6OWppUXlHVyoBJJgg8cIMiPOgrEsjm3jbikRLeWx5vgkiKdQlayieiaOOmGbNCtAaDrRMInTUOcs27iZ2RSy8s7IloaNV9r1Y55s969A+5j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcCfDXKh; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso30556431fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 14:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744752788; x=1745357588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFZbjOYvL3XWX9zYO837GJEEHfNhtkIC3obvjgRgC9M=;
        b=EcCfDXKhkEseCVqVobSv+W2S8zfWuQuLn7dA9RuHxiSYcCLRq+uMd2oMlCVi7IomU3
         3EeJ3Bh0hDaPyIPw1aPjyQwu1m73lJhSkAslYgfpSsLSOYNw7EIz5LEvhJ0ugHoldinC
         7HBmdGmi/1lEj1pgzJAEBHTsMo7PV1QHZDQHyqRlZvExw/8Mc0r5vFwoUn2A5suOBAPP
         qQCU2/ZnVRReshiIJgDuAp4p+OzVrM3jc3lIEP66MiNdcu7B1wYErFJ3C37FY9Ke7kML
         4VGm0lCJ7B5B6obycSgb4+qxVvcJY47JrdPjZehd+6pqbDA2DeIdAMsA0YVFdFTYdDbN
         txMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744752788; x=1745357588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFZbjOYvL3XWX9zYO837GJEEHfNhtkIC3obvjgRgC9M=;
        b=ihDZol8WKSpZYGc5K2I+KEii3ll9/UoHSCIjBfMPLtTqm7X16TtNE7Fz4bBbMUsZRx
         mGZuCZavw93k8jW0ys9ZehNhNxbw755XlPfBx+vX87eD38fUvG/bxGkkVOUQvpm0tvnm
         ojKlmCM530vATWNOyAfFAQUI/SA6OPbq6hEBXCGSgIXFvf2iC3HWyWP1qBR2KealfYGZ
         kDVgq3by2YW3TdHOeo6LVyLW7UO7Q/SuPefUDVu+bQS7kw/aKNA8R+XFdE5AW/4nNiz0
         UhWxf0xpX++cR14euNXh1LnF2YzcPmg3XIEx9jNaJKo4twOppXRu1I3OrhEwXokOhHfM
         tXCg==
X-Forwarded-Encrypted: i=1; AJvYcCVmxIaVvTYmYQ/8gQWsrkMxIOqXboRjYe0lZDYNDIT/CQRjNk2SApnk0M0gHC1mDfapvyQUzxp8HS04@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8yYqyJ+tWBEq3L19DkgbzujEsp08pks2d3V9SwxY2uhgaemXS
	9gGEcbrCm2Een0BeDhYAQB/kGCZHanjIUNAwCRUOxmzPibGtgoj19/1lW5O8E6yxwf0Vrmi0Uqv
	F8/k911TGgLpmpM51A7DOCNHVTrVL1onVOCa8QA==
X-Gm-Gg: ASbGncsD2EO6GWsX8Co5blC3yiGUnX+wpdBq1E1ZUaYHSTjj+KNjPuwvQJRX11aksGz
	yuZZcqaWtlkH2XywlghU5Ios+M8hnH+p4V/ywk1FMG20e0QU1cdOvki4Vbbe6WzVPuWXn8tpT/n
	t6zNq0OWkclndf80EH3LOXL7Hq5W84Spl8
X-Google-Smtp-Source: AGHT+IH1fPwXoYdrYrXs1HiLQVKcj1Nwq0ZaBfB+nrG4HDkRYGKbjDxTH83CFz9bMaIy6Rb3CT8kdAniAZ27nk0a6L4=
X-Received: by 2002:a05:651c:312c:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-3107c317096mr2058281fa.32.1744752788108; Tue, 15 Apr 2025
 14:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk> <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk> <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk> <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
In-Reply-To: <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:32:57 +0200
X-Gm-Features: ATxdqUFVO-oOAadK97uz-Zvz-g6yn5__IY5aUh4Sy7yRB8wzgdG91TigfSAKxqk
Message-ID: <CACRpkdaBNVyXUwErHTtGBnUjh4+6Ojb6fu9M4E7LnRCu_Oovpg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

this caused me to think about a thing:

On Wed, Apr 2, 2025 at 12:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> This is bothering me. This is the abstraction reversal I'm talking
> about. Should the regulator drivers even be concerned about whether
> they share resources or not?
(...)
> The part where "the higher level users want to understand that there
> is GPIO sharing going on" does not sound correct.

There are precedents for this type of semantic IRQF_SHARED
is used whenever two devices share the same IRQ line,
and that is something the drivers have to specify, i.e. the
driver has to be aware that it may be sharing the IRQ
with other devices, and whenever it gets an IRQ it has
to check "was it for me?" and in case it was, return
IRQ_HANDLED else IRQ_NONE.

Yours,
Linus Walleij

