Return-Path: <linux-gpio+bounces-29238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B867ACA1EE0
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 00:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 113FC300503E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 23:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288C12EC57F;
	Wed,  3 Dec 2025 23:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhTiuZGK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E3A2EC0AC
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 23:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764804215; cv=none; b=sYPiWyh6opquO94UmwXwhY9l5EcuGiiTy4VpsD+aKuy3b/0A6bI1E0/3yCt393h+V6/zeP7gfMFq7NUssF289YbsncdqsKg3e6Bg+Y+EMNeeJBRZHdj5TqeJmbt74p2zuB60sxyHaW4Vqsj/kcnrh/hynCddBvFOUlbAUBh7Udc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764804215; c=relaxed/simple;
	bh=OvB6atd3qlrAMeB1T2M20Dy8N/2NenibQAg6tYZ1LwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxGGSE+ZKY39PUFxTmR3yK6Sw2DEcPjBzU2dvQMHVlkQXwFx1LsyOoc9rhM3rBaO1QSC5ZdUq0f0dzkXZ1+1m68q66i5p8UsyqtOsH/xMW5EZjyBkHXCS5ewxjiodmYG/+WMkI5IRzoNqYbASD246UEz73aAKnz7HhtOn41UOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhTiuZGK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E0CC4CEFB
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 23:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764804215;
	bh=OvB6atd3qlrAMeB1T2M20Dy8N/2NenibQAg6tYZ1LwM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KhTiuZGKp1iRm2ZwFxkY3phMXMtJQHq+g35hLHx59quJfoyvkRmEIKm6S96EBc/dJ
	 3JoboC3Wpxtum6Rj6CmQYnUTdpT7eLnVvDU4qt1QeJzXd9xtGNy3Bkq2gMEAB5W5fh
	 At0LlS6aCHmgtKnTAZaAq9V5tQ0nrtpEUHyinltC/1mg3+tCvCzSxSq0eSGoFt7JX3
	 aja6Bhfi726rmsb2Wvpxm7QrO+GnpqFVQsMVUvBeZ78Lj4dP9p4dzsh6zcbnjvF5St
	 Fk9oYcloFZCIS/NcxZhmc76j5KwJWdnZlBfhQ6Z32/QkEOXLcV5o47TTbZaIJQUwgN
	 xuW6sQjW6GcnA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78c04f279c2so3100757b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 15:23:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNUmlsaYpEzAaVku8AiuV5pr6+y9jteUIZ9CdTyDByftxJzQ84s++RCUUUiLwKzXojvwnuuKn2kQt5@vger.kernel.org
X-Gm-Message-State: AOJu0YzUBcbObKjcL+IrPWCj6ATDm5dbiGwObvU+207scPK3n/lqgILJ
	1ouYPCgXxighIH5QlheJ42goParhIyWYaWcRfL0V/xh0Jp6WUCdG14KMAYa7fr0s3djuHmwFh2+
	Zsdz4HQF4mSjxWpaSGhypySjNdMH9RDs=
X-Google-Smtp-Source: AGHT+IGCnKHLQ4g2mi9Dd3KnV4ajiIHIz6YV/9enuMJkJTTLilGlonVxEnvTYIBr1K8YTaLFm3cw8J/K3UOuCmKEy1Y=
X-Received: by 2002:a05:690c:30f:b0:786:5851:2b4 with SMTP id
 00721157ae682-78c188338fbmr6912907b3.27.1764804214875; Wed, 03 Dec 2025
 15:23:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026114241.53248-1-alitariq45892@gmail.com> <7b7145a9-cf3a-4feb-b3ea-862b9e98ff3c@gmail.com>
In-Reply-To: <7b7145a9-cf3a-4feb-b3ea-862b9e98ff3c@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Dec 2025 00:23:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLkGz_PQ9TDgLLyEOOugW90CkyM0T2UEXwtvUm=YnKJA7g@mail.gmail.com>
X-Gm-Features: AWmQ_bnBs_sDz55T5-8KLu56_hJDFKmmKrUiX87UYcFsAMrXmbhWukbEiSPh00g
Message-ID: <CAD++jLkGz_PQ9TDgLLyEOOugW90CkyM0T2UEXwtvUm=YnKJA7g@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: starfive: use dynamic GPIO base allocation
To: Ali Tariq <alitariq45892@gmail.com>
Cc: kernel@esmil.dk, hal.feng@starfivetech.com, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 12:55=E2=80=AFPM Ali Tariq <alitariq45892@gmail.com>=
 wrote:

> Just checking on the status of this v3 patch:
> =E2=80=9Cpinctrl: starfive: use dynamic GPIO base allocation=E2=80=9D.

I must have missed it.

Sorry!

Patch applied.

Yours,
Linus Walleij

