Return-Path: <linux-gpio+bounces-2152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB282BDAF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 10:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A71441C2103E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 09:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD975D8E7;
	Fri, 12 Jan 2024 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dzr7fuNH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0B0634EF
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7cc14b91230so4048554241.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 01:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705052870; x=1705657670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZbZu/WnZkT2LeYpSRgJ42Vi660fgJJrGZDVLOl0B0k=;
        b=dzr7fuNHgUokyg6iWtkwloLxBVoRYLX/uDSAoV0IuUMMpX5A/fIkMHcLG47zTdroBe
         lZCzmNx1o38DTJCRQzHyl501k3LojCy2uvbZWmpVFFYCJxIxFtSHKNUgPto6fA4qFd9I
         0Z4blMQcA9m+vWKxneDbqLXaYPpjg3dGOxsUxp1ckOLzEuq+i+2xSvS4OemP2wj3/VUM
         Slj9yFCNPw1qbtfgWI1cbvX4ZPiKfgmI63EYaL5d1SbLJJ90W70NudY15ULKrQXBTIJf
         Rp7eJu3/vPguibtpVT1D6fTUgPm/F9w7lVN6R01BsY/0O6JX3H7Pdo/7Tfo0TupMPTAX
         AAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705052870; x=1705657670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZbZu/WnZkT2LeYpSRgJ42Vi660fgJJrGZDVLOl0B0k=;
        b=NEj0xr8f1m58o7kSyRb5PkFzI5nESLVf/mkv0FaQ/ocjdbenYth9MQjJNvzjRKTKVe
         zFvspO8wv9Bt54rReodtOem8qthfVAKqNYORXJtRDuA0vX5w/QW/D5q2FxECEE2w0m43
         RTGbz/aJJCm5iMCyLy6vaqNOYrTqBRCPDsQkNZRvQw96vMFlaxvplpYh7v/z8QCXWcdF
         /hY79e+KvYBJ9K0qlUNzPerP8OmozDr0x5v1CN2YyrygTlabaYm+bcpYzMJYTKNUnkST
         DMfXHF+NHkB+vADXD/K+BFOjEvZUSwiiX6m1zF/0/geT1vX45DpYZ8yzdNYDY0u4aguN
         veXg==
X-Gm-Message-State: AOJu0YzregbWmD9CmcGBVkbnjiR47MDczx4D9IFrzZRDWLDOPsRdc+Hb
	soY/vXyIwVpIBbd66ZVFLD8vMDZYZwOvj3iR/dkVQTRuViqFcKBdxEwnLbPa
X-Google-Smtp-Source: AGHT+IHn1PtBMLGWaM5c4AGYrO0LZwIBj4ZFpfMW2JrEEPXD5fI+BpeIsv8Zjn7/TGIVUiUvXUHDS86upR7etUQoWvA=
X-Received: by 2002:a05:6122:1687:b0:4b6:c780:ac90 with SMTP id
 7-20020a056122168700b004b6c780ac90mr1028482vkl.0.1705052870517; Fri, 12 Jan
 2024 01:47:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <128a831f-6800-48e4-862a-d76b4dd0bb56@moroto.mountain>
In-Reply-To: <128a831f-6800-48e4-862a-d76b4dd0bb56@moroto.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Jan 2024 10:47:39 +0100
Message-ID: <CAMRc=MeGxBGZS=9bnY4Bx9CH8uQdQhWrM8ZXQHrjFZjLL2jHPg@mail.gmail.com>
Subject: Re: [bug report] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
To: Dan Carpenter <dan.carpenter@linaro.org>, jjliu0@nuvoton.com
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 3:31=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hello Jim Liu,
>
> The patch c4f8457d17ce: "gpio: nuvoton: Add Nuvoton NPCM sgpio
> driver" from Dec 29, 2023 (linux-next), leads to the following
> (unpublishable) Smatch static checker warning:
>
>         drivers/gpio/gpio-npcm-sgpio.c:295 npcm_sgpio_setup_clk()
>         warn: why is zero skipped 'i'
>
> drivers/gpio/gpio-npcm-sgpio.c
>     283 static int npcm_sgpio_setup_clk(struct npcm_sgpio *gpio,
>     284                                 const struct npcm_clk_cfg *clk_cf=
g)
>     285 {
>     286         unsigned long apb_freq;
>     287         u32 val;
>     288         u8 tmp;
>     289         int i;
>     290
>     291         apb_freq =3D clk_get_rate(gpio->pclk);
>     292         tmp =3D ioread8(gpio->base + NPCM_IOXCFG1) & ~NPCM_IOXCFG=
1_SFT_CLK;
>     293
>     294         for (i =3D clk_cfg->cfg_opt-1; i > 0; i--) {
>                                              ^^^^^
> I believe that this should be >=3D 0 otherwise it seems like ->sft_clk[0]
> (which is 1024) would never be used anywhere.

The report seems correct to me. JJLIUO could you confirm and possibly
send a fix?

Bartosz

>
> --> 295                 val =3D apb_freq / clk_cfg->sft_clk[i];
>     296                 if (NPCM_CLK_MHZ > val) {
>     297                         iowrite8(clk_cfg->clk_sel[i] | tmp,
>     298                                  gpio->base + NPCM_IOXCFG1);
>     299                         return 0;
>     300                 }
>     301         }
>     302
>     303         return -EINVAL;
>     304 }
>
> regards,
> dan carpenter
>

