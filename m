Return-Path: <linux-gpio+bounces-24656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 937ABB2E2BD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660EDA05322
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78571334371;
	Wed, 20 Aug 2025 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7jaQ9BX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDE432A3D5;
	Wed, 20 Aug 2025 16:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755708987; cv=none; b=pvRSmNoMi4rEWmTgI4cPNMI2DY+rVrbyFzkJk9uhWDswwOR1vGF82FD8x61pq1oadxXAD/KI1a8yjnhwqnVqbD5UfjEIuYB085jWHxnGoTc9wPJzfhFHD3RX6rSWt5PFiEwb4PIYtZ+aMiR91Zs6d8LiqXMbuPg0UeIr13oS5+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755708987; c=relaxed/simple;
	bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZXjkYTWLGGuUAYjJLyvRwU1uAiH1qFs3egpCwrJGe0bi8sDGuC23PKFsxia79NKv9K64YvfqXfPD5MnIi+PcjvaAOBKF8oLfLAW7v7u6WWSXhi1pqyNngXrbMK5rdGAOXwoC5U65qMPNXfIyEJi/QnmsKz0zfjqaQPcgwq+Z+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7jaQ9BX; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55ce5253a57so10302e87.2;
        Wed, 20 Aug 2025 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755708984; x=1756313784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
        b=f7jaQ9BXyGN4ZeVLPG+6E3LT87Ln34EzFVPIwQ7ul4cGkNfrjAvuvt21tntHQylWQs
         i6FXPlbsGpOxM5fNXameit4swAYtnc4xoY/6ZZ+0gODwbbWwTfjcohTRSW6jpwDCReuZ
         nn6m4auSjM2tNlR+pG0yA4Z/FGV2+cUu21nx/1Ik2B1lwyjczdnudnYMTnarQYrY2oQj
         IMbMrN/coV7ytN10rF83XmX4dZ73Q01znCg5llOIjCAhdIAara4Fc+aVXPk64XJKRXvz
         XFSeu0mOFBb/ZLZffBjlAEefKo3VpJsa0tu3AuFwFlJUcXJtbdwPDNX5Lf8+mCf3LPpC
         EBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755708984; x=1756313784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
        b=LUvb5/pUyz3+Ap1RnsDp39dFeGRRR2LpKr32FNKth8tFcUlh6fx4Kc6R0EX6FdDSnf
         H8KGRjGW32EMEe/WRfyWPY600PNllvEM/vs5KdlsESA+LhCwms5OXiNMIHzn51GCG9iN
         j5zSoJVQoh5oJyZNJPwXq+NgYFmqAaN451pFaubhBoL2b7LcXabuTHFnz1cHkWO1/ws+
         t8Jebrdt7FbCXxiPDY/3Ht5c1RJnAFykltKKqsUCUfsjCkkChRnD1krGNOr/HaX3n3kx
         ONB5x03vVK7vA9yCU13gBrqKhWErAEKklbjciur4AJvpAw06jfi5MkGTP/GYV+Nbpemn
         9DsA==
X-Forwarded-Encrypted: i=1; AJvYcCUna8zvkMXC+6Mtv/u6AuvYVHZlk/LqMivTMKQiIozhFQA00b2LHQ2ui0MTjcdxupxIVRxc7TiMh2UI1Xf9@vger.kernel.org, AJvYcCVY8m+iDxfKbbfqTZNpZg/RqJPNH3GvliNYkfmIu26Cblm8E7i7DU3mJCn1eAWVUtuMSsBPte6nAxSc@vger.kernel.org, AJvYcCXo3lF4JgPr9BrInZPizbJjVxmYaP4QXGwQ+kwRHwcwqnO+5YSWC+fz03h5SxGoHWbIMNK61rDouUnCFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/bWfeGuY01zdsTtq4Cb6GN3EAiZv/WE593lzCYsStYkhMWjz
	ZGWcMzjGoYUAOq2dyqNx50lPezGZwfC/ui7eQRmHxQyzTmMR+elGhTCbupD+ntJwSfn2z+hUkdT
	R8NOwnMIhz3lSt/TGqxvsdLmXma7TvvShgLOs7n8=
X-Gm-Gg: ASbGncvbARXL42BUZiLd+dOJCaha2zc83J8KVoz7v2VeGhED32XCIQASYzLAOOmSQ4J
	0XN9J7xBZQ8FNZx/SZQpybEzVcCrHCAzrMVcEYY2Xf5MyA5Q0JHx8Sc3SuxSwpVUTacDC3yksVN
	44oo5T/sB67O50gsFkHTkJacPtD9pYu+V5gAMJiR5b7DfDz4YHW6ymdFkNnn8qps+J7LzyxvBgW
	NVYDUukng==
X-Google-Smtp-Source: AGHT+IGmodnm1wYq74YzPglOPvXyQr5up/V5mEGaKVDAkvR7Dg+TlJZu10zwCOJcEV+C0cZezLHnm5mS90/y0lwenNw=
X-Received: by 2002:a2e:be26:0:b0:335:2d39:efe8 with SMTP id
 38308e7fff4ca-3353be8faf5mr10467741fa.44.1755708983407; Wed, 20 Aug 2025
 09:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-12-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-12-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 19:55:46 +0300
X-Gm-Features: Ac12FXx-9y_y3mx4aPn80hP5vp-84DxStz6Oim2QEFPCpy3GlveGPVdRNscDeQA
Message-ID: <CAHp75Vee0OCvLTnHFWvf8SfAgKjF9GRwzcp_G==ha5S=OJ+Ocw@mail.gmail.com>
Subject: Re: [PATCH 11/16] gpio: pch: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 6:59=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Acked-by: Andy Shevchenko <andy@kernel.org>
in case Bart wants to take it inside the whole series.
Otherwise I can take it via my tree.

--=20
With Best Regards,
Andy Shevchenko

