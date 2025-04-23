Return-Path: <linux-gpio+bounces-19212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFDA98803
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 13:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBC6D3BECBD
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 10:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EEE26D4CE;
	Wed, 23 Apr 2025 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cy6m4utv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB1E26C39F
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405999; cv=none; b=O7zSsEeVlABvFURNeAhTcQi9YtArQhNkTYaNGhoubSL9WXpPwD4e87+CjuF1E7Xza0K4LVF+b/n1zvyuTQ9bMoP5XS/dTxstENNaEAShxbTMRB28yvJK8Ra57YQgziR0vqCFttPUOgou/SKWLpBD9XOkOXTf8VoqD+iFlL+e0dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405999; c=relaxed/simple;
	bh=1yGreJeglvKuZD0fGUj7A/qJS7yybhnwZk+WL1e6ipU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSLUrf53ELrm3OtLhb+ECX1PJdZ4JHcyeuP7d043yqafVmT5R2LqyFnOSFpUTE6x/Dp9mcT4fnt9edC1UPFd4kypnu9mZMkOp/su9Ucvr3ocpgPpct/MjRIOvTJBsA8olV+ilsDT0f+d6VeCyyO4wHU/J4u+u8Kb9PC3KnGbsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cy6m4utv; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso8139673e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405996; x=1746010796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=Cy6m4utvPD+xBdA8LKOxfUSQIZ5rteDxmHyOiMvSAxr53hJvFrTIx/474M8UqPF5cU
         8GNQifmjLVE6I+R/JOP1C17I8iACQC+byTCBSyoU7seymtXbPQRKyCRBVDwHN+9L4tUM
         pxxTTrL0NnQLdWLb4W/MyZ3Hhg8NCl72xBThZtmkBh5jQhcLS86knf8AohtXOxRKrMhe
         Rgz5wQwE/4lH8FB/8fsLqEX/Kd4FUBP6Aqo5IJ0bzOKnw4EjZCvyXTJwkPl86jaJB7cs
         pbIooZVG0ZM9ldKfe/9Icuc+KbHA6y1jBX1fWPgPTHuLDn/ufuIgkO4hSZYcM2oUpsLv
         q+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405996; x=1746010796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=bp9cajPiHT0h+73nwORZotL5ddsgmkwNRjDX/K6GvkNX0rlG1mzfhCtqlWIYLdLou/
         ZYCE7RvBlx0fbYn2XHgoA7typBt0mHKhjk6d2T6xuzuT0rSfCdQbsBjvv3qqcWgEOUE2
         SLCh1tlC24DEwgoDal2b5DTtco83TNbC4rzisMVuIF9LZjqOh2Cwc3s7midDAs4gC69T
         bker7z5bOprj9qnPJv55V4QDnKA7R7udrKetcI1pk9QmmBWuoCJjNSJye9o/WERPCMTA
         usUfVj3J5fp35brdB+n9QK976hcgzmJGDd7og2B0Udhok87kGRDq+IxQSzn1F6D5ANG2
         LIHw==
X-Forwarded-Encrypted: i=1; AJvYcCUguBBgfLBRYriyIm9HT/dlIRuPo8oG/eR6OGGlCt+07VFZ4F5MmBIK4RfuZiO7DTUoQFd2cDEdjOhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2R/30lVfcAlE4We3PSV3KKKoqes76S8pXp7j3iMkGFbt1tSTU
	VJCIvj2xTiNrYD+yKjO9avkX+/MWI5mXlCntpIkZcdF0iuGbEWXgdj+CEwfcOqd0uAos6cZoEpA
	Axr/jfwSVFU1ZraO2to8grb7CbpJz5R6PdF+3dw==
X-Gm-Gg: ASbGncutl/gW3N0ksiI+CsYqTYUUBk9YRU6VkI+x6ISuJG6K+znJSwkNE1q6hvcJNQc
	epbBGR2CvvNf9Ik+sOv+jYoP4TgLF3JAbPw5nyFKQ/fDHqRU2rFyOjbD2daaE0BQ5el3iTauwVI
	IaowTSUTaESLjAPOM8oqg/oQ==
X-Google-Smtp-Source: AGHT+IFtzLtF0BmAxKelCLV2/wocCla2vyxucaLxjvgEw30Sch51eBsux5LzRyNp/HGiwEeiD7kURWUr//rXX69Cxn0=
X-Received: by 2002:a05:6512:318c:b0:54b:117b:952e with SMTP id
 2adb3069b0e04-54d6e66cbefmr4418385e87.55.1745405995686; Wed, 23 Apr 2025
 03:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aAijc10fHka1WAMX@stanley.mountain>
In-Reply-To: <aAijc10fHka1WAMX@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:59:44 +0200
X-Gm-Features: ATxdqUGhq-8Df0lmzkXAKLmMqiEIc6uB0ArJmTsIwn6uONHy8hOiVyiU37DBzSI
Message-ID: <CACRpkdbLwZuFKqLvdkuCodQrNb5h-W9567eA4CLOP1FrV+PbZA@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 10:23=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The devm_kzalloc() function doesn't return error pointers, it returns
> NULL on error.  Then on the next line it checks the same pointer again
> by mistake, "->base" instead of "->base[0]".
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied for fixes as a fix on fix.

Yours,
Linus Walleij

