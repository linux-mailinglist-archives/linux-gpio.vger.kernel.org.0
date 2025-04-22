Return-Path: <linux-gpio+bounces-19128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDD6A96887
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 14:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1768C1886136
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 12:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4133927CB21;
	Tue, 22 Apr 2025 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gk8cqi2j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C714A4DB
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 12:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323505; cv=none; b=MSvfN9DhLuEJM/Xt50MN8ajqtTjz4Eyp/ZQN60OUXdGQaOvX4CeLS2480XSfY4/mC9lZ+IUfVqEEezCS1F4OQPKK8SvMVi1f1E5IApw3sOFe1iwFC04no/wsZ4YjaVhNLvPFxs0TNPDLWTg16IRZmjuJsX6ztZiV0grYJV4yuas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323505; c=relaxed/simple;
	bh=uMQRw7xKMs8KQeCWyqYOOMm4p/Ip2l9um7whf1MJYzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSyYBjqncnmlwdra8Jy6HOr+0DThOnZmcaKSZw/e31powoCkKYeXgKAA/hnYkm0oOsq58JtIucr0TagiMUBUIMTCwnpx30b7OLcSbnIJx8RUEmJKvWfSqNAazjjrLfu1+wTooqQHewb0zWPfF0enjNixtEoonEudQtlcamuNE24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gk8cqi2j; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c0517142bso42062561fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 05:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745323501; x=1745928301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMQRw7xKMs8KQeCWyqYOOMm4p/Ip2l9um7whf1MJYzU=;
        b=Gk8cqi2j/M4kEmshJs8Z2W/H/ut/ZMRvy33Y7BvSq5MWKtLTfDXu+9W0vhsPp2s3yC
         30ntB087YmxwHVtrvA+HEz3eubcfmW9u6KvMwwnCBQ5EIjI1wjVKg+ALZGQvcHN6CjJC
         v+8q45MVHXdqQnU9Ug+7Ek34+X/nfxsmvq6fTFfkbQVjrlEGgLXLPsMpo+lGpGO2QIHQ
         yLEZK2Q21tHnJPOxixcNPhVgsXOU8WYwGuzo2UlDUwNFaCGtrn/QQoHZ4X5dCLV0Xl72
         IbAKTAbrPU8wa7tYXBjVIq/Iq/zlqL5nTrDqYRyleIlGfFur/plaS21HOJGe31qnQHQ5
         LGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745323501; x=1745928301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMQRw7xKMs8KQeCWyqYOOMm4p/Ip2l9um7whf1MJYzU=;
        b=nv0/Y2tW8wYnGWkc6WbGSyI5WpjDq7oZUWqlHwZMN7/gS7qdIMiCtxJ7DJZi3oIJ7m
         0gEqNWViW/mXCxi3ImfZwkPSGnxfi3L9dd6LYz1j4wuRsIQ4wTqhprTiR5SL1GVzuGKr
         bbNNMjrHgHA5j0JVszQZ6adfaI7boc+TR9wyrzBIY3Qex14bD/jAt91d+RDQraKuVqMO
         fm5yI5s9LJ0AIHhotOIHCTR1lk2TK9wumAE3tAPj1q0GnUitBTDy4WZHT8xOQJ4da8Jb
         ZqeHGgBtHonTYU0EJ7eeKJ6I0Y/EPz4N3P+q4m/SCfhMhhe7pzsAZiJrHhxo5I28V5Qt
         LOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIpJMdQdIA5lrmK/k6BJhKRK9Huw76oAGker72Ea8mjkzQ1fC9hZC+KuPEFivHj7is+7Xy+dusAHpP@vger.kernel.org
X-Gm-Message-State: AOJu0YzdvsLJgf9wY/a+cb+YGSzZoj97z0KdoKw3SjgYM4BU51mgrEi0
	BVXh6f/WGxRaWlZGq35AhCQEXkMKscE2ht93b3yuv+BeDYeUShJFengaK6hao6oAh0ZOyF6hyqn
	WluL1Q7GlbWxKejkfkQjFGOcJAUcjnOfBRMfEaw==
X-Gm-Gg: ASbGncsAfne/96WhiXYoAOYGRwS8d6VkwNE2LNY3roWwrw7K45paVbUPCOWLj0HzEA/
	BMNQpcHLxzWTdZRdNwTly8cbss8fGpl22s4/wMhI+iPNrflRc8OO+gY/ku/kOE//raTlYBfAnzl
	Gb2O/z6d9JpGUZiQAMVAqH3NF89eMU8JqA
X-Google-Smtp-Source: AGHT+IHPemK22DPFUms0mXXumZBMh52fGsTWqcUIGVBNnn0m+3sy8nwfSvHGhSNlw69psauekkZ+b6kCc0AjA49RJXs=
X-Received: by 2002:a05:651c:1581:b0:30c:2dbc:6e1c with SMTP id
 38308e7fff4ca-31090553fc2mr46951441fa.31.1745323501235; Tue, 22 Apr 2025
 05:05:01 -0700 (PDT)
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
 <CACRpkdaBNVyXUwErHTtGBnUjh4+6Ojb6fu9M4E7LnRCu_Oovpg@mail.gmail.com> <CAMRc=McFBAG9Gi3UBfsdoQ=78fL3sTK+ZMToXWGF=KOw6zwPiQ@mail.gmail.com>
In-Reply-To: <CAMRc=McFBAG9Gi3UBfsdoQ=78fL3sTK+ZMToXWGF=KOw6zwPiQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Apr 2025 14:04:49 +0200
X-Gm-Features: ATxdqUHDZZ_pSamUXFaenCh_Qh4IQISeUuWIAJhxw_2OOQLqEYUntZ7bYYx1dL0
Message-ID: <CACRpkdaKBDyd44xPA_kBxR9HVFqfLgcSnd1UDHumyB=m5-B3xQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Tue, Apr 15, 2025 at 11:33=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:

> > There are precedents for this type of semantic IRQF_SHARED
> > is used whenever two devices share the same IRQ line,
> > and that is something the drivers have to specify, i.e. the
> > driver has to be aware that it may be sharing the IRQ
> > with other devices, and whenever it gets an IRQ it has
> > to check "was it for me?" and in case it was, return
> > IRQ_HANDLED else IRQ_NONE.
> >
>
> First: this flag has existed (as SA_SHIRQ) since before git days and
> could be considered legacy. But also: it's a bit of a different story
> as sometimes you get an interrupt and need to read a specific register
> to check from the status bits whether it concerns you. This never
> happens with a GPIO so I don't think it's a good argument for this
> specific case.

But at the same time Mark describes that drivers using a shared
GPIO cannot really be opaque as to the status changes on the
GPIO line, as it may or may not need to update register contents
depending on whether the line has actually been low or not while
being disabled. Maybe this can be fixed by a per-consumer status
flag in the descriptor such as bool was_toggled;

Yours,
Linus Walleij

