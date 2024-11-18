Return-Path: <linux-gpio+bounces-13090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1049D1B58
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 23:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EA62B22FDC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 22:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065051E9067;
	Mon, 18 Nov 2024 22:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2ecawth"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCCB1A9B34
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 22:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970703; cv=none; b=fJzNWNF8HfbdHr5HVig+wOBWY2bu2Pxlbc6WSgaOK5NyYsX4DubxFqbR/fRmpDv2U7R1dERystgSDWNEYQ37/mT8Ie2vWnAOTPvj6k+878/sgE6D2HLCh9vEGVyFllmbQPdnisTuPBgIZcCWz+qHqyOrSLKIkk6CBUXxEa3IEko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970703; c=relaxed/simple;
	bh=KY4WxOLcZt5kBfIvov7YUd866Ca+PDF3e+qAL9quvo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWw1zQUtw69ktjMsyaBx0mI/wfIxUnMZzrs2hl1AKd4+SFCovKUaw1p6iwhtzZIyNtfEJvUkF4pYHkkoKv1eyuP/qTJW75gdBYH5HlDuAVYSG3eFpic5BXH+RQ5Cr6Jv2DL11rU36/9HtTvuMio5GxicAc22mlvcrEtTOnPXcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2ecawth; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso3586829e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 14:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731970700; x=1732575500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1MrAjucewY12Q379yzg+ry5RVZKlVViQuKVvFxefR8=;
        b=g2ecawthztD1DIpRmOGozXTaqbTUk/n0SZTe5FzNxaMqexTubAnBKJY3EUm+nBeW/s
         UVPquMpT/Hxxpa9D5wVs/T2Q4aVpYqB+v41TSI4kPRG5BKC+2CSkjX4dlTNuiRmAsPjd
         15wNUxs8MSU4YWPX8/vr6KlsnjGhdCNfJcyuijc9ADkJtyj1lT9Ovcmj4DRv3jisyEzL
         Mh8cLWEMuQia5Y289Suw9BqRkYR/f7Kri51yqlFCDrYryA8Eg00uwyLCBDMhsibWAj9l
         T/d4GbRHtY3LswxBz7OzlalV4aWsxFz12SMAivVr3P9M8biWkx3FLr0jtgbxr3hs1SrY
         wRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970700; x=1732575500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1MrAjucewY12Q379yzg+ry5RVZKlVViQuKVvFxefR8=;
        b=VY2a0T//F0ecTCEsG2KZs82a4qkfpnVr7JLE7IMNCxWKniEANeWAUqqyPBorBimu7T
         B5hCV8aYETfqRNPfOhMSXIkXvC4Nkrc3muHkCK9mIrigAVwS1PyjF5D2fsQ/33vEeJg2
         KAKeGLKFpyyCMdJToBf0hruvkBWL5LzjBlBphS8vfxTwTDG6tISHsS+axfmoBsCCIGfH
         ru866/lZb8EeAgXglVYzsUg/BfDh71mo/fcIq3r67PXMa1MdO2pi3GzJNhCExFe3usgQ
         5FTVlvc3vllfAtlpTKfbHD/HpUQfsPgQ99VGuq5rguTHCabK+F2+eBKqBcO463M5cubf
         DNAg==
X-Forwarded-Encrypted: i=1; AJvYcCVooegfQG5ZibB+xA3J5Oaxf9Aw+6y1MxvygV+qpPbgsEiP0Q6jp6n7pL6a/bzYtqblvDgnmCSqSTn7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm51/EJ9YnvESLqWoi1osQwuMZa+Ztotf/X74Tl2mp9A62qC9D
	/LUc7eVYMisg0OxWFtvpPykbnSvUHWChdJWxShXwxzlXpT3zQXc6Z9EEXQZYh9AstgriITKyr4f
	QMYwWD89Y/PT5kWf/g75SYMZrqJJhrZljgs8NOA==
X-Google-Smtp-Source: AGHT+IEFiYb4rFpuGVaBbq8epNGwPhP6IH9nm6hyP3jkslxVQLOCjV/16xaXHTQ8qSTvbVzxGCpcSv4sYGDo3Nb1YqM=
X-Received: by 2002:a05:651c:1b05:b0:2ff:4ce0:d268 with SMTP id
 38308e7fff4ca-2ff6064e25fmr63970731fa.2.1731970700292; Mon, 18 Nov 2024
 14:58:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241117114534.work.292-kees@kernel.org>
In-Reply-To: <20241117114534.work.292-kees@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2024 23:58:09 +0100
Message-ID: <CACRpkdaBErgRrFDWu2FSrnX9Hr=PnHvfccLgAzhOOwTdXuRjTg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: Use unsigned long for bit search
To: Kees Cook <kees@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2024 at 12:45=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> Instead of risking alignment problems and causing (false positive) array
> bound warnings when casting a u32 to (64-bit) unsigned long, just use a
> native unsigned long for doing bit searches. Avoids warning with GCC 15's
> -Warray-bounds -fdiagnostics-details:
>
> In file included from ../include/linux/bitmap.h:11,
>                  from ../include/linux/cpumask.h:12,
>                  from ../arch/x86/include/asm/paravirt.h:21,
>                  from ../arch/x86/include/asm/irqflags.h:80,
>                  from ../include/linux/irqflags.h:18,
>                  from ../include/linux/spinlock.h:59,
>                  from ../include/linux/irq.h:14,
>                  from ../include/linux/irqchip/chained_irq.h:10,
>                  from ../include/linux/gpio/driver.h:8,
>                  from ../drivers/pinctrl/mediatek/pinctrl-airoha.c:11:
> In function 'find_next_bit',
>     inlined from 'airoha_irq_handler' at ../drivers/pinctrl/mediatek/pinc=
trl-airoha.c:2394:3:
> ../include/linux/find.h:65:23: error: array subscript 'long unsigned int[=
0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-We=
rror=3Darray-bounds=3D]
>    65 |                 val =3D *addr & GENMASK(size - 1, offset);
>       |                       ^~~~~
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_irq_han=
dler':
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c:2387:21: note: object 'statu=
s' of size 4
>  2387 |                 u32 status;
>       |                     ^~~~~~
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Patch applied, thanks Kees!

Yours,
Linus Walleij

