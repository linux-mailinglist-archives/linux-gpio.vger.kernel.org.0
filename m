Return-Path: <linux-gpio+bounces-144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9186A7EC585
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 15:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46EF21F261D6
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 14:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858BE2FE07;
	Wed, 15 Nov 2023 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hTE11iOj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85672FC3E
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 14:40:18 +0000 (UTC)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45607A9
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 06:40:17 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7b9bd9f8bfaso2591252241.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 06:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700059213; x=1700664013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4x+AROzqaSUGbYJGBNTViIpRJb4Xy2XNSOVc+/9rb+0=;
        b=hTE11iOj6ao2XPi4e9DcWvG1W8ZZ0jSmv7m9GH0m/pYz68ZcgowEo1dObT9bRfjMbq
         YZw+bWAHTIP/wk2aKg2SXPfF9/4T5JvhrptviHtcTlILBEO3aryZHl2g7g+iuzQ/KqJ0
         O9wR1UvI5oD5WOb1fLQmrb1nXpiYBcsCA8ThEREVAgyJD1+ngREb7Qafp2lpmF4XOBUg
         s4lwqOp7gvvl9SQWkl8Mv9CNBSkTHJ1mR1kRlAm7Rji62sMKrTeR4FHw2YBN2PAVcxcV
         cnb/P4QcNCDPvt+f0U5h7fzpzW+GdjI4A2vTd43fPFw7xOVTQGHlAnt1k5AEXQxquNLr
         eYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700059213; x=1700664013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4x+AROzqaSUGbYJGBNTViIpRJb4Xy2XNSOVc+/9rb+0=;
        b=gLJl9FMm+wqvOBH/eY5JriJJcc7XNjxDAo5QDA2p9Ar2VYxiSGdqC61BOan+auFCwA
         73STACrCfip1epotafaf9FPG3Vf9PEiuMQ4px8nYxRQ4H8jbRplfqN782DWayMgNoPjH
         wRKqqemqTAWXagdgplj8nlZME50/1kB9l/zgsk1p1E4h9znQJOVbP3jV1jSJ6HyPLqeV
         Vz2dZcgC1oTssYzh6PjK+KjqOZeuSaHqJBjdCd90CwoL9L2GNKtLvovQY/ouEGvlE3py
         0gLx5muFJw+NCXQAYvi26q21RvTocwNpZMsMVle5GrPMtYBxHpBk0WINkxIgPJjwvwll
         /VNQ==
X-Gm-Message-State: AOJu0YxUbubsFIBMtOKelgrPUkccGAvz28ny+YcGqFe+dn0ryRDCHOke
	cmlTsr5U1Z/p+owEnoqS/nUhUnhgUSJI29nMFj8O9A==
X-Google-Smtp-Source: AGHT+IFSBUM4YtIzlDwxJKuvSy5YJ1owFz4UfEiN+Yb8y94S/oC+n4+FP0cbt9m2DQBQkPYOvzbRxgVd5sfQol8jHiU=
X-Received: by 2002:ac5:ccc7:0:b0:495:febd:9187 with SMTP id
 j7-20020ac5ccc7000000b00495febd9187mr13178237vkn.0.1700059213161; Wed, 15 Nov
 2023 06:40:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113023434.1186043-1-samuel.holland@sifive.com>
In-Reply-To: <20231113023434.1186043-1-samuel.holland@sifive.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Nov 2023 15:40:02 +0100
Message-ID: <CAMRc=Mc=nzkTxVyYkg0y8r5cW9MDKD7LZggfmj2jtaq68yamFw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sifive: remove unneeded call to platform_set_drvdata()
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrei Coardos <aboutphysycs@gmail.com>, Alexandru Ardelean <alex@shruggie.ro>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 3:34=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> From: Andrei Coardos <aboutphysycs@gmail.com>
>
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.
>
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Applied, thanks!

Bart

