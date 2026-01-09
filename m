Return-Path: <linux-gpio+bounces-30377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 676ACD0C875
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 00:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5B4B300EA0F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 23:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AFE11CA0;
	Fri,  9 Jan 2026 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fG6J/COS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E7A22B5A3
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768000892; cv=none; b=YrVgJ4phyCs361FkxzT5ejMtD54D+DEnpNnKAGVo3XtYJHa782hpVRYw/7rdVdd/x/8IquURV6O4T7s8IymZ8UfA3gZ7KCt8JVzqWBFluQmzacxh/yAFlq9w7QTMSXG4MglJKlerbwL3xE7EsgC7g0Li9AJ4RVLez3450jPcJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768000892; c=relaxed/simple;
	bh=uvdR7r59FKUaW78KQHB72Cl/f9vfJAJTYyJhPhMtCf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCkumtVIh3cltEvKaUWabS5zklhEXUyxG4cy95QOLySCzVC4s2hNAQBKJpGcEqV9s62ufBVQ7j4TFGZkTtJIst9gVZu3nY30kuLhflryJn40C3wx3oqhC4VuFr5NdwwnNscLK0yX4qwjTyEZNVOgl6sy2SerZSTSbD4KlfNxpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fG6J/COS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFC9C19423
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768000892;
	bh=uvdR7r59FKUaW78KQHB72Cl/f9vfJAJTYyJhPhMtCf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fG6J/COS2MRojToR9og3/QXU+chj5T+FFxNXb3GoQhwQVgBXOXunOCGZ05Z5K+w1b
	 G2drRrodWAL6i6EGbEpdL7WxdTlnOWL0TwqPKGdnNJUskAtyy/3M/f5kz7pmKQa/xZ
	 7qoOozSyK8j0uAxaP2O0jQNmmGrwgG78Md8B5JxU09T3jOi8VdBytKZWM3vYt1AUy4
	 g5XRcCto8vxCa12FXFZ2sgPzCguwVtWZF+pI8/BIfzmExUyjeUnxtKizLWvnvGaIM8
	 XF3qjpqJbi+opXXw5Pb+0CJhZ8u01o1r9HQyhr3tXbzC5/gYKS4T7QXOFKdBdjsxhP
	 9eBTEKNvdlD0g==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64471fcdef0so4590573d50.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 15:21:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUF6IWY4Oqwc4KuZXu/zc3l7aYIbPSiDtKbiry1ayWk7yMBfoebFbSE4dfTu09tgzAexFfj5S4tmXzN@vger.kernel.org
X-Gm-Message-State: AOJu0YzzL6e2k+k6v0eeBu0Vh8OwxyBmwSsEekB5y6WGxoz36EWv0dWt
	KFWFWyf4sJrSA+S+dNXqYnl4YEW8Uas/IztHEnEuzvvkcVOA6EovuHBhjnLi7dlyDu3T/EfGG6M
	OEHjt8rwReHzvaijod4uxSxy2Gdge8DI=
X-Google-Smtp-Source: AGHT+IEkBLq/lAAdOeX43YDvqmebeTfxKMv+A5cSEvJCNt569S38es3u5lB7LBS6bcr8KI97iNecxJxjOG3acFdkAwk=
X-Received: by 2002:a05:690c:4449:b0:78f:ac82:51e7 with SMTP id
 00721157ae682-790b5802185mr219222787b3.40.1768000891922; Fri, 09 Jan 2026
 15:21:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109143910.645628-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260109143910.645628-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260109143910.645628-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Jan 2026 00:21:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLmxZL=S+b8x6JqKQqmMF6JCvdZFH5JjQjN-3=UxSgz3ng@mail.gmail.com>
X-Gm-Features: AZwV_Qgmj2xObTYPNp62A04ypx-HjwejVPQuEHhehVURYUOOPPbjFyxmgmTi8Uw
Message-ID: <CAD++jLmxZL=S+b8x6JqKQqmMF6JCvdZFH5JjQjN-3=UxSgz3ng@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 3:40=E2=80=AFPM Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:

> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Add a GPIO IRQ chip to the pin controller that can be used to configure
> these pins as IRQ lines.
>
> The pin controller places the requested pins into IRQ function,
> disabling GPIO mode. A hierarchical IRQ domain is used to forward other
> functionality to the parent IRQ domain, the ICU. The ICU does level
> translation and then forwards other functionality to the GIC.
>
> Wakeup capability is implemented by placing the entire pin controller on
> the wakeup path if any pins are requested to be wakeup-capable.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

