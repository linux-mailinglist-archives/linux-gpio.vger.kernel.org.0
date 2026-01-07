Return-Path: <linux-gpio+bounces-30227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F9CFE763
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 16:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1C82308F756
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 15:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABAB334685;
	Wed,  7 Jan 2026 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSN4QXhf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C7532FA2E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795780; cv=none; b=g/iuzVPHytYQZPJvd6arGQk2By1DDI9Vh4aBfJh8GM89VD5xpH3/IL+CyhMDI5l9wo6XjhxnkKvDvK9j1rT1xoh2Ya91qob6nn9YOdKH8oOI/gFObKsNO47VY2EJEnZcj9ypPsnAn+sEBFiM/cau9Mx/LLP5c1ANnZnTVp6N9Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795780; c=relaxed/simple;
	bh=AiZmICtjiihMrOUOI4r4hzESsVzAjpUbdk8bNNC/LAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6ZWA/1TilY055jSU8jRMiSsHuUwaIeACevm/gm07xai37rZP92c9AUGHGEYaXW7o71Bin3CuYqLtIpLhtxV/WcHRPjkDDJINphOXOWiBetiju/L14bswdcqbVW8kH4r5c6C6giS0n9SUElqEA+db2C01kyb0ZBiL+tjfexnwLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSN4QXhf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B007CC19424
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795779;
	bh=AiZmICtjiihMrOUOI4r4hzESsVzAjpUbdk8bNNC/LAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bSN4QXhf5ZB3OgyaDaQJl4Z3yWfEIqQ+5DggOZFgBfnmQGb1TtTMDo60UfnAmioH9
	 xeCAMW6t5uRK/nAUlGO+OGYmHIOy4Cv0ZPQCI6MG0n4UprKV0nRzBGiyzoLj2dnwjt
	 OitxK8M9gSMiynP0e0iklPSnCmWEKyyiOZ91/OQSYLM9HV5GVpGuySi0kFk/eo6wht
	 YKIJs8ck2M3LRW3dzxIJ3fXqYTq0pPpPXHgjvTb6NFxio//t9O9A44pxhLpNcdsK1B
	 yRBI/irZQ4Q6LpqWTpqWzS7Sc6E2yEzB0aXVoDYD2R7LY9nzPtr9zWZLtSmgIxCF0U
	 hajKrfxR6LHgw==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-644795bf5feso2278145d50.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 06:22:59 -0800 (PST)
X-Gm-Message-State: AOJu0Ywj0rtlT4q9xLZ2ZGJNBbuavLp51r5aRrU194vOaj3qPzFvcKrb
	/gdGeD4hf0AI8ml3mKEPG4Ey/Hc+JTz9r49R8Q315bnBuC0JGDha8hIlE+3Ebi2Vd/vOld528G9
	HtD80S0Wuz2czJfTmSkgQHfL/gJXmyIU=
X-Google-Smtp-Source: AGHT+IHCipfXMssxG4xTli26hFbEQ8q7gEC83UFwO/CMNHBXDuYmrQ8xb0y7nL4VgL6p3CmeKxBpEZSZSOq0TepOOyo=
X-Received: by 2002:a05:690e:b87:b0:644:45a9:c0d0 with SMTP id
 956f58d0204a3-64716b35f17mr2044997d50.2.1767795779097; Wed, 07 Jan 2026
 06:22:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105095956.19615-1-nicolas.ferre@microchip.com>
In-Reply-To: <20260105095956.19615-1-nicolas.ferre@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:22:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLnXYh+kBumTo8pjQWQyxUs2p+9V+EYhS8X0EG8fuBbq-g@mail.gmail.com>
X-Gm-Features: AQt7F2pu33uByNbNu__Wc6oIa91TQ5TXX2lidmXsMkS5x5BSX-XEjSbTod4CtWo
Message-ID: <CAD++jLnXYh+kBumTo8pjQWQyxUs2p+9V+EYhS8X0EG8fuBbq-g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91-pio4: Add sama7d65 pio4 support
To: nicolas.ferre@microchip.com
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, 
	Ryan Wanner <Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:00=E2=80=AFAM <nicolas.ferre@microchip.com> wrote=
:

> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>
> Add sama7d65 compatibility string.
>
> Sama7d65 does not have a full last bank of PIO lines similar to the
> Sama7g54 SoC. Sama7d65 only has 14 lines on the last PIO bank not the
> full 32; adjusting the SoC attributes accordingly.
>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Patch applied for Linux v7.0!

Yours,
Linus Walleij

