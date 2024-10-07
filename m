Return-Path: <linux-gpio+bounces-10945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF6992ABC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 13:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E08E1F238C6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 11:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D3C1D0F78;
	Mon,  7 Oct 2024 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxEPeKIk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908218A6AD
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728301894; cv=none; b=dEfxqn3nHxF2QxsHdIgacoYMUPJe5K2Y5M6W0TaSKpJcgJ0u21NIXXhWAcN3o2Ce2cGULFiBv2JxRPuoMrwVwdazTrGeeuUbPFZp5Q/+iThA5jXjwTvQ29PrZSRbzKv7pV5w+nOmkxCWOIa+q6mEuKilazvTHV7mhjy1krTbdoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728301894; c=relaxed/simple;
	bh=Rar3gRgYHpcgBLUPr1prICpjuU8qRDOzk+bp/0TNuBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1vCu63HiJar78VWihqDhTyKtPmZY07x4CI/ZqbiZ6v1X8MCUhlPqIB8ILjFYlsNnqBRyvOLPtlUwtRBFM3Zkbh0VR4+kCOdUftXVoemU4eydJbb6KUTqHdBOy+gTNdWRKZGV/Oc7rWSpzJGbS1iJ+NxnTMS5lQCKCs+DpFvtSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxEPeKIk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398b2f43b9so4968279e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728301890; x=1728906690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rar3gRgYHpcgBLUPr1prICpjuU8qRDOzk+bp/0TNuBc=;
        b=FxEPeKIkv9ZIuzp1r7jx2WeiJOETkjr3QdmgDZTfs8gC3bQ+bYvHJqx/jT3JQTyVSn
         zeL8i0urAJM1faMKc7A/acNrLE2Vo+gBhUHS3jbybZJccaJ7xlfPhmxO/5YUax2r4eEv
         pBlSawH3KUviUw4UHpYD9f1L9jIA7z8PaubtJvMTtcce4GeNlEZMo5/V47DB++aNixGw
         4kWXwuvfH7t7+h5b7POYUz3gx0rffvC5N0ywyKkg85wdzRe5KR9M+RAet6dEbZ7uO996
         lzC5wfrDDKcCPAH+x8SVYXzyXnZ7ThVZjKJzOFIMzVnje60zmzZaBGry0Gpmkm+QXBE1
         lG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728301890; x=1728906690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rar3gRgYHpcgBLUPr1prICpjuU8qRDOzk+bp/0TNuBc=;
        b=aVt77jAciQ8EJ1D5RpeaVVqD4aHxcXiafpxpw5Tc86lbcFX8pQuIgCVAY5H5Ma1LVQ
         vmb5zU3vFP1FHCc9CrCxDBU67QECwv40zItyYHmzFqKN1H6hwZzxwZt0JDGqEbcwnBmj
         Pzcme+0lNBmsUn1gfedJdQbkb88lc+She/M/V1yg60yftp64rkpQugHWRpolEbdFTLKC
         WvvRYXgZkCANjzIFOZ2mLk7i/sVRLt1CWksmbMCvmTE+HAOjdhEoQUYfo10yN9bpwSdG
         IjKei8pgIwVIm4BsLO0vzRbSvmoJ/6/YAw50Bafy9mVIrvYVpk7EKu+EDe294G3o5BzG
         q2xw==
X-Forwarded-Encrypted: i=1; AJvYcCWRmQsVmDg6RF3/e/AvWEKaeeiQ6sYxtAJermPO5BAXUyfjroq/snvrV9y0r047fEZVUr1U+SVYcPzj@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCv+2jelO76Wbpapq2zwqH5g2N8EG6SUIvWz0GiQvcDYtwmZY
	MBH4NP+vy/QbDRTT5j2EPtB5Md+Zh69kaamOumQG9JtvJGtj+QcPHYqkkmNZy/XNsuyY3iq7/y4
	y8FatS6qukXUeEFnP8X+nQn4ZUgIMDw==
X-Google-Smtp-Source: AGHT+IH1b7AtDRdmVaSfJv3J1FI2YdaXAbDlTylH1s44fuUTjzLJGm/Lz3zXQL3hhmC94ehxBHKmM7+qFNFRaW/3CWo=
X-Received: by 2002:a05:6512:6c6:b0:539:9155:e8cb with SMTP id
 2adb3069b0e04-539ac0a9e01mr3723679e87.0.1728301889319; Mon, 07 Oct 2024
 04:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003-fix-imx27-pc-v1-1-0e78d1fc6175@linaro.org>
In-Reply-To: <20241003-fix-imx27-pc-v1-1-0e78d1fc6175@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Oct 2024 08:51:18 -0300
Message-ID: <CAOMZO5DqwcM1U8FtybUHbHYZjLi-5BO6nGfifHXguKtcEY4DrA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx27: Fix too generic defines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 11:16=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> The "PC" define is colliding with the (apparently broadcased)
> define for "program counter" on Loongarch, so let's rename all
> these 2-letter defines so they don't collide with stuff.
>
> Fixes: a55222b7a132 ("pinctrl: freescale: enable use with COMPILE_TEST")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410030214.dPrgmUqd-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

