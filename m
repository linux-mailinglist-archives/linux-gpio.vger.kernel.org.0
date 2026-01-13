Return-Path: <linux-gpio+bounces-30479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEC2D185B1
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 12:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BF1730A8B8C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB18E389DEE;
	Tue, 13 Jan 2026 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjd4hw/0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C748E3876DD
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302116; cv=none; b=Du18MV4A4v+Kf84KdCfrAZc3O+EuUy/DpBvislNJz1uBKgZIKxxkVcQvStuslhCGIs/zdXKJlzafaPKizeEWHjp/7EjNuUZWBHJUHh9a4RqeiTtpfEGRlS9qmlyANQEBRKdm3JpYehPAqhdvhQecC0PXooeL4NwsNt/pyN5wOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302116; c=relaxed/simple;
	bh=GVsMnEOzYYxyK/Bmw9/LZKFKCUQEOopSUtCeSRaoT6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cc4WvWBDVmBJ7jhwIs1eGHqopAGFkmoEnEjeCN+boyakbizRDYIZRmGqs5icv7ST/h5oIlMU61b2ebSkNLHz9JHcgEuGUE7B8jjAppmcvAgi31U6TOvMATj9Un7OnmMS76sRoFBVYClWkSwFdlxb99lG5wD3UlkjhcuELYm1JQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjd4hw/0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFC2C19425
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768302116;
	bh=GVsMnEOzYYxyK/Bmw9/LZKFKCUQEOopSUtCeSRaoT6c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jjd4hw/0pC30x/u8dVKcM2KbdYRkstOeHKJmo+F0W7nvG+r+vCZ3ZCKZXh1xNdXBL
	 bCd+FLiySCw2UPXU9nCSjxAUEdf3kgqpR+Lkc7sXAYiTDiJIkCPNjyw6K1bazFxHIE
	 yRsv7flHekl5cuDipYwjWn2qB7hpwgwCN205/hpu1OzLRwYJyBZQ2+d0AQEqN6zlgV
	 KObATxUaMcdQ3ynqPuwQTkvGCIJLwiL/acKguttme/59S5f6Zq7nUMolG0E30KTb5b
	 KX6cVmTJ4tB4LjlzK+KNcTfkkom/oCsIeZaA8hnTQ6wB7DBOfPmS/L5ItOyPh6wkKn
	 tB1I9AqgFkuiw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-382f9211cbfso70157021fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 03:01:56 -0800 (PST)
X-Gm-Message-State: AOJu0YxXv4oBYYdHedS6onsA9UuLzzRIAeDazJDtP7wZhG7qDAq51ajA
	rpvPDZ2GNBGp0Y+rfgJb4XcOmZ3kZfa9DhzF+ScNXGV9ZWJ2P7FMEgYXDHhyXE2AjLaWAvfO2el
	BbpCOVTDjSjKzNmz2ca86eGp9qi/dXaYegnomgPzwOg==
X-Google-Smtp-Source: AGHT+IFurjH7k9cqa4uWzzLoIyTEsWY6lnpn4xSc7CZZePSapzvOVsL5+vBkMhjsmjMX5ijBrvkw/q80RTe/5Sc1Uak=
X-Received: by 2002:a05:651c:30c9:b0:383:18aa:50db with SMTP id
 38308e7fff4ca-38318aa5227mr44458781fa.42.1768302115346; Tue, 13 Jan 2026
 03:01:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com> <20260113100913.136777-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260113100913.136777-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 12:01:40 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdngvVWs8KZb+bOkS=qEcMp7FTPQArAvsAHxbei8RJq=Q@mail.gmail.com>
X-Gm-Features: AZwV_QjERMXo_vxN5jKzoITOu06aHMP6JIXFz9jobDrgyBubWmNtoZWaBcD0s8I
Message-ID: <CAMRc=MdngvVWs8KZb+bOkS=qEcMp7FTPQArAvsAHxbei8RJq=Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: pca9570: Use devm_mutex_init() for mutex initialization
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 11:09=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Replace mutex_init() with the devm_mutex_init(), to ensure proper mutex
> cleanup during probe failure and driver removal.
>

Well, I can almost hear Johan Hovold yelling at you that this is not
about mutex cleanup but merely a useless debugging feature.

Though personally, I'm fine with it. Just reword the commit message
because there's no actual cleanup happening other than freeing the
memory allocated for the devres entry. :)

Bartosz

