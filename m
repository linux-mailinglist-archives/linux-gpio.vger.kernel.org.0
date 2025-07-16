Return-Path: <linux-gpio+bounces-23352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063A8B0716A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 11:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8FFB3A5FD1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 09:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC6E233149;
	Wed, 16 Jul 2025 09:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzw825zR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061A026A0DF
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752657451; cv=none; b=NKJ4tDArPEY+kEXY4VSwDbXt9upgRXuxKZuZCQQ212jLZJwVacxqhtuzrEB+xZSaxCbBkHzr8dvRCeS8eMZvt1BWXI8tqNs1qeT0/3TMjW8cAVcusdCnmtE9p14KQPiuZwdkFVpT5NO0EMxUCfoI9Edl+HG4xHL/m6jIiIlrptE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752657451; c=relaxed/simple;
	bh=B8pIb3//fnjXonWNeyZLRydupO9ewvyQuQ9hPCmNGiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEdZSrrQH/5cCdZdfxbjPVI7Jzj8Tv6nlZQMbqmu4ZuJZILdHxYrp/XbWachgm/jpMTRTmgvYqVOpL5kF9iT8gyYBT0DByrCwuX+F/wIMJynq7zAjqsviTwnmACveaYi1P50g+JlyW0YDTgDsUB9agZ8Vm58fIrsh3kl7FPyD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzw825zR; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0dad3a179so1066319066b.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752657448; x=1753262248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8pIb3//fnjXonWNeyZLRydupO9ewvyQuQ9hPCmNGiU=;
        b=hzw825zR93U8meMWMbSDd7ue3qroR4OVM311abc3BYkGIqY+455nX8G3okfUpmodWz
         CASROvAQiJaMhC1VZY24kS8uSwkasSQu5VIJ4ZfjN5pRFJfi1KT4qxesGFNqbjgi42WX
         36SdmZRLE92Gvsx90w8SxfT0Z8iXFwMoeT3kWxl0sjD3kLZKZ06qWK7ySHKgbpxYXOpU
         W07fJQc2IgKroXyXf0CapyYj1Ginb8CGHpdqL70Oot29UXF2aZK459As2ONC2icQOYR8
         muja4afv1VfcCLHnaWXxDILZDzLKlLeBNx+/Exfoe+PMegCYBhDhDRk1JNHbxupjdhqH
         fGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752657448; x=1753262248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8pIb3//fnjXonWNeyZLRydupO9ewvyQuQ9hPCmNGiU=;
        b=hqVoEQxAmORMsP2ql0gfFJxR99MyWOts2l7rSOWIscFUuscOwiZtzNT6zn4U04q21B
         Ip0f78V6EKAzu9pyZSK3SDsLQCwbDYrfjeMw3hSbG2DC1Q0PGxLNuKnGK1E3QbpotYX6
         qITWTlZNmmAA6EmVnJ3X6NFyvUWSfQrC9IR6AhXpSUGVhEuJtKzDF6L2i6f8jU6C+DLT
         DzFlK3xwcfr2a46JWKstH17oCMpu8zWBkHvXMvem0+zN9Km3oxoh2PVTK3Bu6RJz91Kq
         tOnu93ItXqpjIKZW+WZ54qM1ozAWadVW1rofjfB2CXsO4BtX7c9cOVpjS3sGs+QXGb7F
         gTmw==
X-Forwarded-Encrypted: i=1; AJvYcCXPW6gfoH4ndEom1Ta6Bzy4G9SwSBZZB36y0akARdXzHDj/ifEeejOESvesk00pj5qhLZXW6AZcFV9h@vger.kernel.org
X-Gm-Message-State: AOJu0YyDnW0heDvF5Q3lhsko4t6jeEf/bgML8aDwRYIbXQa1NUJB9aG1
	dRd+gIZrRn7AfTraYYa6TFTvNAoqGvYkVvqMV8EDWQbFJwByfvSy2KRi0FiQxX2ms4cOJa7CO6D
	qPr/JRujkZtFROfcW5G+AQRjPGd8m/20=
X-Gm-Gg: ASbGncttgWQ/Fh/ifuAH12y/U2kRRhM6xORNdvIivZ0UbydDKbQdjOcLFTzNzad+wmp
	fZyDa4HPsaAvXBHaX1kS3J59g4+eyxDSam65qAz9n5yzcjUPLYzjaL6VbGmPrgUhEyz7+o3j43t
	Jw07KmAZZLzmO+ahUS2/JbYnAZuMfWK0/YZxORyvLTXeafBSJCwbtFlcO3geOF/kCU/hULYt7ei
	zGLgbnD
X-Google-Smtp-Source: AGHT+IHQDAzi45aRhCZnxl1bC8eDi6W6RNajDVCN3Gjrqf87+jCiAKUbzSzwiO0Qcc94Sy1m+4uuh6ImB3fwdzOZTFA=
X-Received: by 2002:a17:907:a709:b0:ae3:d5f2:393a with SMTP id
 a640c23a62f3a-ae9c9b218b0mr259553766b.44.1752657447367; Wed, 16 Jul 2025
 02:17:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714064542.2276247-1-zhoubinbin@loongson.cn> <CAMRc=Mch5d3=vbRqCohh8viPpp_dTOd8iQBD1fEQVeZrRJD90w@mail.gmail.com>
In-Reply-To: <CAMRc=Mch5d3=vbRqCohh8viPpp_dTOd8iQBD1fEQVeZrRJD90w@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 16 Jul 2025 17:17:13 +0800
X-Gm-Features: Ac12FXyLyRSH1E7-pxNtloxl8fOa7MDzIIBKW0_IRyi9AZAxHf-xeiYdWRW6Rbo
Message-ID: <CAMpQs4LcD3+gN54WUwHSU4vKgO=mWGiiZ5b_PCr7HZYWbLORwg@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson-64bit: Add loongson gpio irq support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Linus Walleij <linus.walleij@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz:

Thanks for your reply.

On Wed, Jul 16, 2025 at 5:01=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Jul 14, 2025 at 8:45=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > Add the interrupt enable register offset (inten_offset) so that GPIO
> > interrupts can be enabled normally.
> >
> > According to the latest interface specifications, the definition of GPI=
O
> > interrupts in ACPI is similar to that in FDT. The GPIO interrupts are
> > listed one by one according to the GPIO number, and the corresponding
> > interrupt number can be obtained directly through the GPIO number
> > specified by the consumer.
> >
> > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
>
> Seems like the message should say: "Extend loongson gpio irq support"
> or "Add loongson gpio irq support for mode models"? The driver already
> supports interrupts, you just seem to extend the support. Tell me if
> I'm right and I can amend the message when applying.

Yes, you are right, there should be "Extend loongson gpio irq support".
>
> Bart


--=20
Thanks.
Binbin

