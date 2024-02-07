Return-Path: <linux-gpio+bounces-3044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3184C8D2
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 11:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A55B5B25AC7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 10:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB49A14AA7;
	Wed,  7 Feb 2024 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="urhzt818"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EA817BB5
	for <linux-gpio@vger.kernel.org>; Wed,  7 Feb 2024 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707302437; cv=none; b=qPgGf9QivrP8tCEce02yOFPyIhUF83f8sraHiswiDoQ5yhf79BtztL2H/D1zNwoZVX/tuSu9tq0UnMTuQ3/pRLE3uAmVHs7YXUKEl9EdA58Jf0D7C1HkoSAoWjgAcG+V5mfKkb3ur3kPZIrR3gN1ztOSmSq3tnxC3SB8GMUju/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707302437; c=relaxed/simple;
	bh=SBYaeaIuRnUC3w0K5e3nyt12xvcEJ6H6M2CDDRVw8Nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFEX7ZDC9HFP6EA9NRYd/CoPV9aajIhEiamx/Pfkml3V45wDn+xz203vmqex8js4lih4F9ja+zgNvKQgHB14WpFXfi53qM9IJRTkLpCf7cq+EWn9+G3DYhciolvQjk+joJMExKXvgqxwOl83snjVC3ZQqMZo8AFYve0kTlexyLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=urhzt818; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60492003050so3879647b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2024 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707302435; x=1707907235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBYaeaIuRnUC3w0K5e3nyt12xvcEJ6H6M2CDDRVw8Nk=;
        b=urhzt818Z/86GUdsrtUuQa3bShsHnDSqIhR3KcX4GBwJx7eeZK3A2bVuHU5rG0K+BM
         tzJh2tbo20IrXxFDagvrNL1b7cO2Ah8qhw7vpckqtQmaIvUZArokYzkPIMIJjAtWjbYV
         gdGKQKRlC405SaeZmSvdBBpa+ecA+J83NhYzQTsGtsucab0XNhHsQse4CIyGQqBGvrKp
         TZvM2uEAgdudXpCECbi4j0JO4PeE0W9XvuDWfkQb1jG5Tli/w2FWfZhEJoK1/st2VV7r
         G9mQV/GfjHzm9bvSovu7YJpbcEsAN1LCPCmjjVvdVIZmo04OT6AHks6U0t9MuI09Qzxk
         julw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302435; x=1707907235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBYaeaIuRnUC3w0K5e3nyt12xvcEJ6H6M2CDDRVw8Nk=;
        b=DPRfOBhOKuZdHqOVsHPrJ/WMt0DZQ8sNkYxjKdNP+mXoMJBLbKyYBQhHZUTwGEcAK+
         15OfwcjKoZeiXezHRGExQm7Pq1eKu5jYi2cb4E+8IKFKwq2OXGDLL0d4qkXW7/W7VIrj
         zZKqxg27C9IpHimG6yaBilxRihHcnJh5GG8D3QUPlb5tWiXmZXjdC9cqi8lmMwgWWpeU
         /62R9pWV8aeOHrDWYjHfx2rRw19VkSLt0D69auaXNGy8qvJE9eUNyVigLY5KHy1+VpTN
         RNh62T30RFzEiyXyob7HPLRn0ld+R9Ai7fhCeIOC5WQUGzSE4n1IAlIl3y3MsFIkCtgX
         s/yw==
X-Gm-Message-State: AOJu0Yx2f3pvdBasshQFiLtKkbMGgX2oEbm9UfuLC5+OVIwXyTpbX1mQ
	nmMfShYMxsOkjguBjzGwmYzErGKf07mveWosXZtSP63FLatuib0E5OUnojlJ5lSYOzbx/Muh94S
	XndCSBD2ZGwsmwQrHcsH3zJNd3ew8x9/iwdBg2g==
X-Google-Smtp-Source: AGHT+IEz7LQWmT6JbJREKGnbwdfQXPNZ58Y4gBzTwXRC1OvL+RlYu/fuYoEdElXzdsKyWagQjMcXUqHmCDDHbwhFeCE=
X-Received: by 2002:a5b:b87:0:b0:dc2:2608:af74 with SMTP id
 l7-20020a5b0b87000000b00dc22608af74mr4439839ybq.26.1707302435177; Wed, 07 Feb
 2024 02:40:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123180818.3994-1-mario.limonciello@amd.com>
 <CACRpkdZxOovTOF0rOjyU1WwaRLZqML41hfYcC7z=HsAQjY8BsA@mail.gmail.com> <4e9e5ec1-e040-49e0-84a4-9f86c0fcec1b@leemhuis.info>
In-Reply-To: <4e9e5ec1-e040-49e0-84a4-9f86c0fcec1b@leemhuis.info>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:40:48 +0100
Message-ID: <CACRpkdZ4pyFh50imdgL6ZxgAyRYCxsuz0DbmssELZ0mAxVcRcA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Add IRQF_ONESHOT to the interrupt request
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Christian Heusel <christian@heusel.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 9:07=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:

> [me]
> > Patch applied for fixes!
>
> Hmm, Linus, that was a week ago and I still can't spot the fix in -next
> or
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> ; am I missing something or did something come up?

Something came up but it's just illnesses travels and other such
excuses.

I have merged down fixed to for-next and the patch should appear
in linux-next and after that I can send it to Torvalds.

> Furthermore Christian seems to grow impatient -- and I do as well, as I
> recently couldn't wake up my laptop due to this while on the road. :-/

Sorry, my fault :(

I will try to get this upstream as quick as possible.

Thanks for chasing me!

Yours,
Linus Walleij

