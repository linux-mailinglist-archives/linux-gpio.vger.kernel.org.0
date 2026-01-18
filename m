Return-Path: <linux-gpio+bounces-30713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A326D39B54
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 00:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 807633001197
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 23:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BE031A06F;
	Sun, 18 Jan 2026 23:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmnXDxgg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F961FFE
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 23:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768778879; cv=none; b=QWm6VsnRzRKp/yufbRKz5w1AGOjKh6DHOi1gKMwqN5QxQ1qQVXhWGqtZ4En9cezRJ1wn8N1/d8zrpg63DVkOtkhoIMF01/P18WN+UXpyIdOhI2ADfVBGjp2Du34HD0yacm2LHRqmdndfAEd61mxEZJ6DvS5oHS/4+YTDqNP8Sis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768778879; c=relaxed/simple;
	bh=pe2ktkVTeRgUJmlfCWITcfdwYlf+TuCQiPLcpg8pk50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qujy73zt80UeDzGrRWwoo/2VskoLdi2GcdLioiSVr0/ipTEiZkb8QqKMo77/pTwNL7S9+0k0tlL87FLXZ7mUqSyoNtJAEC5y7kM9CNWQpLcQ6diqOeJbGN43pSNp5QVNe9ig9YbDpCnRsPLkwDcl1qvQkuVSw6WiLEJnuNqjF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmnXDxgg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D88C19425
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 23:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768778878;
	bh=pe2ktkVTeRgUJmlfCWITcfdwYlf+TuCQiPLcpg8pk50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EmnXDxggwKDjokex43yXcL8B522j2G1keZpB7EwNUUEEJPGXu6iA4XyT4Yj1m2/CF
	 or6sPlICMB/NV8AZUF0hWQztYKMfUZ5kDYtic9BMxh/BILv0cA8jYxA/ycdkHiY/3G
	 Wy8KjNVIC3zm36lGP2xyRdSVdICXskCbiTqDUZ9aRYSYfI0Z/u8XIw/36jayRGg48k
	 TEUbEk/sEed00I8PGHqo8ash9EG7liY0GrK+6YBbN1jDfHx/s6jtOwjG3IOZBnEfPZ
	 TLKZq4a5Y/gwAhq4YsovJdPlw7SbpFF+0rtLrS4+CQHl8/+ok7litEt9LM6tSPHfkX
	 vnC1CVCiL6hLA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79274e0e56bso33525207b3.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 15:27:58 -0800 (PST)
X-Gm-Message-State: AOJu0YyNUXbZBD44rDFWi0+beHIyj2e7eJXUJf9OhLvRVm+dIxml1TOl
	8fU6feqsI6hLsanWtcxMbuZwzXo0rNcBf/ZimdtRybN+l6FRSrdZw9v4bfq0NcpzHLZlQRhYaxv
	+/LefzvcsAB1ZGqGE9Ry1DE/4ozm/YP0=
X-Received: by 2002:a05:690c:2505:b0:786:5851:2b4 with SMTP id
 00721157ae682-793c5283a71mr77503987b3.27.1768778878119; Sun, 18 Jan 2026
 15:27:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768559969.git.geert+renesas@glider.be>
In-Reply-To: <cover.1768559969.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 00:27:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLmQ8jhdkkiigmE77HtD5FnG=CRMMx4FVAkvqkNW_FmzjA@mail.gmail.com>
X-Gm-Features: AZwV_QhnnugKXgMBxDCrcxIbrVfNwtS9-mFpnkySFSOdDiDCmqOl6T208V0LnCM
Message-ID: <CAD++jLmQ8jhdkkiigmE77HtD5FnG=CRMMx4FVAkvqkNW_FmzjA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.20
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 11:51=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:


>         Hi Linus,
>
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.20-tag1
>
> for you to fetch changes up to 829dde3369a91ad637ac15629ea8d73f3db2c562:
>
>   pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts (2026-0=
1-13 10:21:53 +0100)

Pulled in!

Yours,
Linus Walleij

