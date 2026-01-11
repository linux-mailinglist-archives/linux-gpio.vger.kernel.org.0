Return-Path: <linux-gpio+bounces-30392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C8D0EA3E
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 11:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEE09300A1F6
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 10:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1BA332EC9;
	Sun, 11 Jan 2026 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3xkqanz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2886A279DAE
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768129167; cv=none; b=j3Jor7/wFF8t2REohG1CgZppHxJ4rkRRoL7gnnJamZ2WmFYaYUEQxsqzRYmlLdQIEfWThqpCg9pfj7odP8WX2gDWpGxkogaRhPx6oedfCZYhxVkRu8ur5Ds5YOX0jx5aBceElK+oSKCMp8QYig2cP8sOe63h5k20tlSqPvkA5TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768129167; c=relaxed/simple;
	bh=lr9j1sAsj+iX5/TLickqNJnqlbrgsYiJdXIQL1hST7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erQBCRDTmfaGc+PGi8sqrT4uYHH9n+/CE+AFVICTsAqJfis/VYAJlo4SPD4VPrZzbRCdgKN//quVfV9Hf5jiDl8f1HK7EdC5gBQU+GlAOCaeFzw1RV2pNn4CjLna9CM2HwLJ+Pt13UQPhjtLfD1ukYLD1YalTWKhrDpABa4odJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3xkqanz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1518C4AF09
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768129166;
	bh=lr9j1sAsj+iX5/TLickqNJnqlbrgsYiJdXIQL1hST7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l3xkqanz3iITQJVz8KFX12DvKTtZoQDDXPZeBi0yr1X2pb1GYslVk+U1T2pJsD06U
	 1PrnK0kV0NV++H2p6jUx5s3wxhLlCgryiqo+FmiJ+eU3JW6K7FatlLemrrJI9nMjgq
	 A86N+MEU5HB2zKlZQ6EwmInHZDGEqdfNwA/MspBHv+83do5gUTo7Jp1+1JqGmQRmq5
	 g88x6zcdKGiooKKP4r3Ik5eDe/U9gCodNejh0vjNCW4r05k1oE9zJgqvWWA4bCC9c+
	 k+CEFOxIIqWkToVVChh8LTtVhDFkfI8cCQbITMJhSY6wKEo/LiAGjHjD5fXm01l/ih
	 EBGvJgzdwt7Sg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7926b269f03so9443157b3.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 02:59:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxE1r5WW505xmTn6TYIKmhiFc5rT6Pj/wZFv37rEQYbTAk0e73p53YupgujCqNBPwXR5q/Dek9JWCx@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSA6nTTCUmzIzKuacNlko8G5e3b2dPyi/r45wItr8beH4XwFj
	F+O8gwqDjK0LHhzOXgfVElOz82eKbInfEEcd0LKltnNhk+l02OzP2/KCQ2oj/IOK9I+2ncmVjQJ
	xP0J/11plPTsDvrjuq/VfgzLaez3WVwM=
X-Google-Smtp-Source: AGHT+IF2Ycdmg3X8kZE1DimMHNHBKM1920rYiZ/5Fr2866a9RMj6dCyNTlrmWOuoaZR68tm9giaJ6v8oblS4SpPSafg=
X-Received: by 2002:a05:690c:38b:b0:783:6f8d:e7a6 with SMTP id
 00721157ae682-790b5828d2amr276540817b3.51.1768129166093; Sun, 11 Jan 2026
 02:59:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107030731.1838823-1-daniel@thingy.jp> <20260107030731.1838823-2-daniel@thingy.jp>
 <20260108233818.GA1466897-robh@kernel.org> <CAFr9PXn2HzkSRnX4X-X1q2U+zLxwSP=TxvRwmA5eYxad7SbLzw@mail.gmail.com>
In-Reply-To: <CAFr9PXn2HzkSRnX4X-X1q2U+zLxwSP=TxvRwmA5eYxad7SbLzw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Jan 2026 11:59:15 +0100
X-Gmail-Original-Message-ID: <CAD++jL=fM8QL-cYwRTWNetUsoWoKUOEcxE2+6VYQ4o50F-H1PQ@mail.gmail.com>
X-Gm-Features: AZwV_QhUE6u4ppZEoTRLf3C1_nScg51OUu71CLHUYVC9On0jgPVB2fMl2dz3yFM
Message-ID: <CAD++jL=fM8QL-cYwRTWNetUsoWoKUOEcxE2+6VYQ4o50F-H1PQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] of: Add a variant of of_device_is_compatible()
 that can be build time culled
To: Daniel Palmer <daniel@thingy.jp>
Cc: Rob Herring <robh@kernel.org>, brgl@kernel.org, saravanak@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

thanks for your patch!

I like the idea in this patch set. Footprint is something we need
to think more about, if for nothing else so for the increasing tendency
of RAM prices.

On Fri, Jan 9, 2026 at 3:52=E2=80=AFAM Daniel Palmer <daniel@thingy.jp> wro=
te:
> On Fri, 9 Jan 2026 at 08:38, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Jan 07, 2026 at 12:07:30PM +0900, Daniel Palmer wrote:
> > > In a lot of places we are using of_device_is_compatible() to check fo=
r quirks
> >
> > I'm assuming 'a lot' is not just 3 places? Got a rough estimate?
> >
> > This seems fine to me assuming there are more.
>
> In core code (like the gpio core, and not in a specific driver) there
> are only a few places. I think around 10.

Actually, if you look in gpiolib-of.c in e.g. of_gpio_try_fixup_polarity()
you find:

#if IS_ENABLED(CONFIG_LCD_HX8357)
                /*
                 * Himax LCD controllers used incorrectly named
                 * "gpios-reset" property and also specified wrong
                 * polarity.
                 */
                { "himax,hx8357",       "gpios-reset",  false },
                { "himax,hx8369",       "gpios-reset",  false },
#endif

etc etc etc.

It is actually a similar idea just clunkier, but maybe necessary
for these quirks since they are in a table.

But as you can see, there is some of the same thinking: if it's
not configured in, then we need to compile it out.

Yours,
Linus Walleij

