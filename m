Return-Path: <linux-gpio+bounces-28830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B515EC7081C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 143D93840D1
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD1E368272;
	Wed, 19 Nov 2025 17:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5+E8mx0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030FC2D0638
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 17:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573331; cv=none; b=cNY7N7E6sgRjc+dZhcyYS2LpKaVia2NFR6o49qCmI9h9JqL2ZG4FRgTCwnVpZSyaHRoUOiJIL5WHEkiuf51G0GhrdZ72TT/2mkfqm38YRB/5Tk7l49g64+4TAyuj1vAYl4afTd8JxzLl/ZRJa9LXQ3T83IjiHunel8uQRdULMMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573331; c=relaxed/simple;
	bh=jrbKGzArFBmY9INk5u4nwH7jIv6jIRd92L2Bdtw77Do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OW4fI4ASL+L0ThhesrmwAkoigS6Xy/g5XpXAg7fBsB3jDh+rvfI93RuB7tnC1MR6EhpFkZqST6joevCwC0QIFp1vvs5nyKFgq4C3WskErP1dVL4cl65x0/1FztLI16oQZisi9Kg4FjAwac44VrNJppNnK1I/hOEILqf9WhfGQkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b5+E8mx0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957753e0efso7300736e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 09:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763573325; x=1764178125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrbKGzArFBmY9INk5u4nwH7jIv6jIRd92L2Bdtw77Do=;
        b=b5+E8mx0VPjq3+uIBX0k86k3Bl5htpdLorN33H6hFHqq30OAvWudI940HUM0gLL3Ix
         Fpo3ShS7zrwA3RmdoRQnZL7+Nk1f832T3m2eYaKdNZwJjZlKuVb1n6nsY9F9kEU2M/ig
         cg+CR9EUVJIH6h/WBMVRplocR5gfqNbEqvGXHnJzgJT7+y2Lo9Yl4gxDUNJqFKNtmu/R
         L6pXhn8Zx34yAhdXWS/0MXWUeigMISnTRv262hgVd3rg9ZvaD4LZumpbn+dXi1wOT3F4
         8V1ILY0d1XBUsPlPu3d4umWQlOGKXISaL9I6vYgcY3D7e0bO3zVps02MdAdplh1Jo2tR
         6gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573325; x=1764178125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jrbKGzArFBmY9INk5u4nwH7jIv6jIRd92L2Bdtw77Do=;
        b=FmJ3mvlzmzE4YbR1BMRUJCg/md15pngptvcjxU3mI1fLL8oYKYtdzVeeBq2uAfQ2NF
         leVncAfMs+HzMnjrI4xpcpUiiEIPXcRilEaIMaF5THC69oScY7kVr48uR9sG1dAc3NTe
         PQQJrqtCsmenzuKjfEd3Uhqmby3T8WdtXeaVPmPILH7WQbWtayU6kyBjbCNLDIO6rmsc
         FytVG+MPMMMAd56yYqFg9zL5iXYy/DqauTBtKKtn8NS1vnvW5Fgtqstg2XC3qrOD0Hh6
         igoYdYNqBXvluZK1jOFlTO3M9ygDZio8mwXqFxOOUNCacinJJj/ec+L5NL8uyi2tQJnG
         ezzA==
X-Forwarded-Encrypted: i=1; AJvYcCV+QnGoBNWOr0WtN6uS3VZqnx7EN1ojFZlcL2iUttxwtTRtCGnDsdMl/M7nrjYXIfWyhJY0H+Lp/sqO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq9Rl9BzKnDJfvzdvk9fFLvJYw7i5C2+/UVhXww6yO/g+TYLQ+
	fh26Wq4Ft5uL1TsIsgsxYzfsSpv+xrYAViBpbzb9mCKTlEZeNsuVB7DyYctOlCIYei97RwpaRsy
	xd8PzpTQXUdNnb+afnKlUDRWd6aeuwhSWvCv8/Li1Mw==
X-Gm-Gg: ASbGncslctZIhcrTTy9mpgi/p5TRILtClv6pEw8ncIvWjJ+QWR3Vhwe3vj/lmWJabSp
	SPv67moTi52ICqRbTkECgjYKT5H+mJT+DuCl9J9XtCdrokMd/Rx4QXmQDGhyH1zDAi1V1o8l7hI
	FUm9ofXyBTuZgXTOKLGjyx5SOuNcoXaGCRoS31xx6mHhC06GYTn2TLl6TcZHBYg77PxpYAQTfYo
	ZhYqig1iVqWj9AE6pFjxbMX8Xl3sGHvGfu03e+O86s35NxK+2LBbJE0VzsVCeAeh5vpz7E=
X-Google-Smtp-Source: AGHT+IGBPH9sWGm2/6SPGrBct7rTorDaj7JCMd9MXliK/GrbLKKFAgWubSD/DP9XjnVDDd8sS5kYV0tauVoknOBKs04=
X-Received: by 2002:a05:6512:3d1e:b0:594:490b:4498 with SMTP id
 2adb3069b0e04-5958419f6ecmr7416667e87.11.1763573324566; Wed, 19 Nov 2025
 09:28:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119150049.13537-1-jszhang@kernel.org>
In-Reply-To: <20251119150049.13537-1-jszhang@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 18:28:33 +0100
X-Gm-Features: AWmQ_bkLv8V8xcifQi6NXER9l5eRFmMkfr2Ql7HUyYLDXi19l-f8bZUrL9K_p5c
Message-ID: <CACRpkda=vNOq+QUZT71VwkTy6qz6yhu7zA3hYWTfc2GkptXFMw@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 4:18=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:

> Fold dwapb_context into struct dwapb_gpio_port to further simplify
> the code. Sure this brings a tiny 36 bytes data overhead for
> !PM_SLEEP. After grepping the arm/arm64/riscv dts dir, the max dwapb
> gpio port number is 6(the berlin2q soc family), so this means we will
> waste 216 bytes memory in total which is trivial compared to the
> system memory.
>
> From another side, as Michael mentioned:
> "The driver currently allocates the struct with kzalloc and stores a
> pointer to it in case of PM=3Dy.
> So this probably has an overhead in the same order of magnitude
> (pointer + malloc overhead/alignment/fragmentation) in case of PM=3Dy
> now."
>
> So let's Fold dwapb_context into struct dwapb_gpio_port.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> CC: Michael B=C3=BCsch <mb@bues.ch>

Neat.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

