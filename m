Return-Path: <linux-gpio+bounces-14566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27D4A043CD
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 16:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E7733A388C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 15:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDA41F2381;
	Tue,  7 Jan 2025 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAr7ywJM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945724C85
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jan 2025 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262717; cv=none; b=N01+nhnSZHYemX+yUNiulzbYutbNKiSNKLKFQYFh0XNoALnCXd9QSWOzomwts7Es4+daz1Ewd3EzlZNW4x0S4UwUQ36V2hByxgyq+b351dWJ6eiyE+0W8B1eyT5Coyfs7Fa09ROOfYms3P+CoXAgfV7NThcWEJcE48rdzCTFdCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262717; c=relaxed/simple;
	bh=QZm9XMFo/ciEBfGF3Y+lnkNF8U3UY3ReBsxl649KajQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWA1GKpA1xcAfsQrNDeh3BqjzyHikz4RMbv8OcsL7DIZWsnO37Bmj7RlROBQkJUm0VTZ/ZEMqXKo0WiYHTL/UZEZGR4KcX1ijHx3YMAlJMEWD4RoMs1ciBcxI6pc9nxHgnxVHFC29Dc50aZwjpF1pjDpQwmXL4NmNvSAipUwLEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAr7ywJM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540254357c8so1498950e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2025 07:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736262713; x=1736867513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZm9XMFo/ciEBfGF3Y+lnkNF8U3UY3ReBsxl649KajQ=;
        b=DAr7ywJMPQGbV/elNPrOLKnIE6k0BrTDODg6AGkM23oUBHYdwmkB5N3WR9fcnxWrNU
         yJU/L1enTix1xcVYge/BWNMhyuFP1ecGhSpZstl2q81dapvV2KcTpfb7HLCwB8PHRW81
         tJ1ZSdcbwPo4BzBbPGB03KOEER6kFHA5DicswStuzOMNAKTr4ggyU3ku2NhV9+Siz80e
         8cfe3IT6P6EqmuAE3nMbtourV81LfxyfWVX1KBl83zaZz1yt9CnkSDnMapFJ/vZpXWG2
         wFbtML3c590Xecxjg/+alSxo4wMav/5tIikNamoxaBmIc/C61XJu1HYPZzeETajkI2Qc
         ScYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736262713; x=1736867513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZm9XMFo/ciEBfGF3Y+lnkNF8U3UY3ReBsxl649KajQ=;
        b=tTZo94ebmcqh4HeFT8dS/UI/yg9cDWFpdkFzayT61TjCNFneCYo9NU6Do14a8PLNqC
         zaAM9GVf9x2z7TFjrQMhasHTvo4mDOYMRWQCCKDEOrBhYW+2in20QxzElaxFaIfj/7Np
         d7Z5NgPjlKYM2GXfsqrCC4Tt6dr4JoYpqAvUT/rh0YR6NrBsvQbRm4zhli3CtmOf/s9A
         N5XiEE24+MVcrBE7GmzvB8Us75R2bSVOxhSqP2VI9zfsVcbJEzS3scHvkpnjr61G17nV
         rwjIvj4/MkKQYosC/6PRrBsjOylgfTzA3sV7qd9Owl4UQaKZuBvpuXZKyVy+dGWpcbc9
         oVAg==
X-Forwarded-Encrypted: i=1; AJvYcCVGnOo51j0C0Owstccvw9mXq+G8jFtDin3e8w3mn1uw8Cx/DPKiT0zdovlu6Lb1tvi5haYuRdaeacqD@vger.kernel.org
X-Gm-Message-State: AOJu0YxHNE7G4Gx+jAt32pqPocuQA9hS9SWnC6rvS3oriwbu1FrLshI0
	NiX0Ok5nJT3tUPIn1ePpPXdWPr8TlWKGQ3MG8eIMoSq3eLFr792DPvxsW8D9258zZZDGDDbmTb7
	u44jj32Sj4ZQUkuilmPkCg/vkrRwvG1JPSzGI3w==
X-Gm-Gg: ASbGncttjycdRUYHjOMMQO1PE8ancG7hC9WzJZfeRIOXzD0ZcL0hpOsTtvMQlhXxex5
	4BTE7I7kxvCMvnH1LIHpM+gf1H6m+QWMx80SI
X-Google-Smtp-Source: AGHT+IFehNeFi1I1U8aRoGxDWj9mUKo0jrkw2SzoaqZnp8E335DNw61G6ky+He7/h1LD9gQ8ZxOLYHtYW+T3a9Y3M0g=
X-Received: by 2002:a05:6512:33d1:b0:540:17ac:b374 with SMTP id
 2adb3069b0e04-54229540453mr15473106e87.25.1736262712723; Tue, 07 Jan 2025
 07:11:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
 <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com> <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
In-Reply-To: <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2025 16:11:41 +0100
Message-ID: <CACRpkdarstoQW+ZBi+MWxEff_=h8bPo9+fwy=LW2uhWRuQ6YSQ@mail.gmail.com>
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com, 
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 1:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Il 17/12/24 14:45, Linus Walleij ha scritto:
> > Hi Chang,
> >
> > thanks for your patch!
> >
> > On Tue, Dec 3, 2024 at 2:13=E2=80=AFPM chang hao <ot_chhao.chang@mediat=
ek.com> wrote:
> >
> >> From: Chhao Chang <ot_chhao.chang@mediatek.com>
> >>
> >> Change 1: change EINT from 1 address to 5 addresses,
> >> Eint number is stored on each base.
> >> Change 2: Compatible with 1 address design
> >>
> >> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
> >
> > This patch looks good to me, as preparation for mt8196,
> > but can one of the Mediatek experts please
> > review it? If nothing happens I will just apply it I guess...
> >
>
> Linus, that's something like the fourth time that he pushes variations of=
 this
> patch which do break all MediaTek SoCs in a way or another, leaving only =
MT8196
> hopefully-functional.

That's unfortunate, and I see there is some annoyance building
up.

The maintainers are here to protect the code and the change
would have anyway just been reverted soon if it breaks stuff.

How can we get this contribution on a better path?

Chhao: maybe you can split your idea into smaller changes
that can be reviewed and tested one by one?

Yours,
Linus Walleij

