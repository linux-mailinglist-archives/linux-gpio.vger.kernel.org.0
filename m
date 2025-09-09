Return-Path: <linux-gpio+bounces-25801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD13B4A804
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7887216444C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512EF2C15AF;
	Tue,  9 Sep 2025 09:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1YeLW+AV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8C285CB2
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 09:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410004; cv=none; b=dLp4FUh+HVtmT2bFNoCX3nGaYuruX+TanJQ6DYoCwOdtgUset7Ymapr/BVEkSkpQVCOsPRkSV63bLdHd4kt1Klw6f1Dbe16CRQ5NmZqyNdV0Sen4Kws19GuMbyvl9t0BopbTsU+8U1kW6bzta4pFQyEhKJrR94JwcPdWFW5wH+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410004; c=relaxed/simple;
	bh=BozG1w7KKU20yF3No3P5X5Nzxb030zFIxnquKlZtGlw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uco7axFawMn6EeuVXjEI42daJldd24wfsodQVyxBtmUAhxzCkj04Bia23yGYcE8SqusyjFZPq2is1gFgNKsWP+W7WApcUr7o3HpVW/LustS85vbOZV1mQidCWeDhsRui5qaExWOTcXhd7z7fN1iUQ5NZdQjbXE3S0f8vEsUqha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1YeLW+AV; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-336ce4a8bfcso44507881fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 02:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757410001; x=1758014801; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OV8bSFJmRK7fz8aWi3QCz8VqBu+IMqcItMYJBMd0a+o=;
        b=1YeLW+AVSKzhpJzqXSejhEH4i/Q3VhaME9uo8wYMWk1SJJpMLWt8JQLyuNsYI9gUDb
         e+yMZq4+aoBawgRxwseDdZJocRvWIAkRqABHxDEnpnG+R9q1j5/9MPyejY7Nm03CX0Ru
         eU0egkL0QpkNCzcZKsgHa2D2j4pmqxiyhXN87Y+2VqGsHcPmoLuRQqjYibI7NlkLuU4f
         vbnKyJ5Z3EzDfu8GRwUyGo31wnFvPgyr1gb5HRJmdlHJMIiWlVd1HJzYagpn5tRiLdnL
         lQ5NPxbVVF6RMEtdsfwksZvfMlozUZ27AkxQj3A60LxLc+PmXY5+YL3qPAPMzbpi3Vhg
         TmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757410001; x=1758014801;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OV8bSFJmRK7fz8aWi3QCz8VqBu+IMqcItMYJBMd0a+o=;
        b=EhKm2/54iyafNaItc0pFLErcou0ETtO4024AAjMNepduu8aDwRN84/rBAEZVm1LUas
         FA7XMaT5pEj4zyHkYlcaxlN+xBQKYtd/TZLhI+Ud29/Q/SwFNF7JDlZJxr/os8NvTxrz
         kWe4rOomkR4Jlp1bXQOKHGtyN1j8G8UMAvhjjrZAkzkNfsd3GWvH0t69Q2lbZ8duz3YX
         k5XmERyT0coLTm+ZBBA1/b7Nd5NgkRvqp8OaFy36eUjloRcBjL1xbLjX9wXxfGtd9c/7
         jKLkMQoqLblJT5kldBcGeXJENYN6YyI1B6+ZY9e7jsNjP/SOEXYlkvWKgOkWx8tAFVZ7
         MJEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLp12gIwyaILidcBbKgneqksnVyNGcRDSaEUzdqA/veADdngT9nRT//IN54wKFV3R4hgQDcIukSYJY@vger.kernel.org
X-Gm-Message-State: AOJu0YzL1XjNSs6Ufos+Xb77dhXA6Nvb5iUuQJ9h7mUs2DcAGBzFYUIS
	m5VQ0YHfdvEH00xu7Ia0kV1UvpRLH9Qfu+qOkrHyqNQL8rJyvKOVg8PVwkhf0nhW+d80zCJLSjP
	ROIKcCg9ZRUr0Drsr1Je2AVafEHMtyklfjnTxArlJcnvQZtekTawN
X-Gm-Gg: ASbGnctpVUGePOlwpmnIoQzKx6ssZMgVuwm9obB8dnKeeJklJH6a736498LQDO1mS1/
	4cTJeApzsZEv+rRw4Yzs7bId0R1o6lkLlSrTnLn4D2hYftEhthzSlI15QGZR2ZVdpfkFOyDaKn+
	ZX2q86InDGVEIfFTLraeDd69tMLsfwqIVaEtNmMh5Li5aXBMpaSBLT2g4Qwkxaw92jD9wAsc3ca
	0YekaTwsnpeX2wP7JYaIeWKwfa2UhohzFFcSI4=
X-Google-Smtp-Source: AGHT+IHeQfIXoMXd0UqNxfQr1H2k17uADQ9DroXFD+VzjSfe/yZKPOV5OinUr6YXfL6NtXyYjZ46/cuUWZCbJoWimgg=
X-Received: by 2002:a2e:a591:0:b0:336:e1d6:88f5 with SMTP id
 38308e7fff4ca-33b608c6256mr28491011fa.45.1757410000683; Tue, 09 Sep 2025
 02:26:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 05:26:39 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 05:26:39 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250907142934.1382852-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250907142934.1382852-1-vfazio@gmail.com>
Date: Tue, 9 Sep 2025 05:26:39 -0400
X-Gm-Features: Ac12FXxAy3dZiC_EPYGWz8H9rmZefHJKLy3E9jdBFRa6AnokhUw2LIJYhCburig
Message-ID: <CAMRc=McCztF=tMzGYQbAZM06K6Yi9i_gFxRwUp6qBR3hj4Jw+A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: use quoted types when casting
To: Vincent Fazio <vfazio@gmail.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Sep 2025 16:29:34 +0200, Vincent Fazio <vfazio@gmail.com> said:
> Linter check T006 [0] recommends using quotes around types (making them
> strings) when casting values to a type to avoid the overhead of runtime
> type evaluation.
>
> This provides a small performance benefit at runtime [1].
>
>   >>> timeit(lambda: cast(gpiod._ext.Request, "a"), number=100000000)
>   6.4817840601317585
>   >>> timeit(lambda: cast("gpiod._ext.Request", "a"), number=100000000)
>   4.369633618975058
>
> This also allows moving some imports behind type checking guards as they
> are not required at runtime.
>
> [0]: https://docs.astral.sh/ruff/rules/runtime-cast-value/
> [1]: https://github.com/snok/flake8-type-checking/issues/119#issuecomment-2511022212
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---

Hi Vincent!

This doesn't apply on top of current master, could you rebase and resend,
please?

Thanks!
Bartosz

