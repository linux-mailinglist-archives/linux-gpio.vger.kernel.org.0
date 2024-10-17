Return-Path: <linux-gpio+bounces-11490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8C9A18DF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 04:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30A761C225EF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8A34D9FB;
	Thu, 17 Oct 2024 02:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="o54veFtX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED066A33B
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 02:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729133675; cv=none; b=UXqY0jQtn8wCMFwGWLVkmc501v2CdxzgQ+RWvIqjnT4ZmdWQKhcU92HSSts5VzLhUXX8NX8ixSd39D3hzDruvvN+P0q04jJ3Yp4voFtC7reoE6jjpuBLDxEQqc6HXgsHRF0K5xQuC+aP9R5NKa62Tf5wjTqlP+WMOPDoUv0fLgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729133675; c=relaxed/simple;
	bh=QOxGn6HUGUC7agxtcrT7HyZI+wUqBau396XTdEeY4VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dW/uf4JNr+tcXAv1grP719DZZ37tqTncfjh56I4JVo6N6MP9cZqjfYUZqTdbjpdzVgUPvvNXz1BhFjeTFCI2/jA1OM2wPGfbiL8whSSvi7Ge96s0Qr5fQ66OhzXoSKdffcQgI8lEZylIfF5rdITeorjgQiE/v1j/CjP969eoV4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=o54veFtX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1e63so382358a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 19:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729133669; x=1729738469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLxmOw/KJpTCPuMZfngsa+JDKUmVUuEwD65qtQ7UoWU=;
        b=o54veFtXNeC2tYD9KaP1Uqs1RfCVyOGJGFwl0Df4MMt9K6nxCilET2f4X3j6QUE1so
         uirs3k/XbilyLhpTIySYwbFHb4LAxxZA1SUFH3G/A7rx968X24ix4R0cTHnrdZyICFz4
         8AnnasaGqreBP67KV6Vc8SlA6tTyEh+zU6DwPw5MOaqBHIHYRouz/zv2qQoacLPJqfeA
         78qalM3LkIAhJ/GUUzzT5l1JYe9F654Qj3siUr65HryxKXN0+63jSmkI8BltBDQYMUJG
         lqljGEcHhd/fas4eWnSf1mimmwFsSJ8tJA98s21ELC9Wcn+l6ijf7wmjDa3M6BoAB3oG
         Y0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729133669; x=1729738469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLxmOw/KJpTCPuMZfngsa+JDKUmVUuEwD65qtQ7UoWU=;
        b=UDyL49lKkY8BDoGGxj7j2aoDtAVBaS173Szm9nzKCYQjq0xsiIcvFuRtpdK3MdEyEk
         kKnUHi8xGx/bXwxje6EXPnBBvR23qaEU+StFS/P9GXJIe2q5Uo2WbNTjOaURTOqu9XNe
         q0/12aJ+Nj3RWklk6yeDsV7/1i7EEV3ZF6vJ8PJY+D4zVg8hEJG3DEXdsBFK4oM1xfHn
         6LIQFcefES+s1AzSXPRDTRkZnemke9JDPaiITZa6jQM/w9b3fMJcOWpzKVkFiF0jKx2Z
         6I7X0PP/Jw2At66B4M98SdZ/CFcbbe4OXXx4fB2TedW3tD6I8E2oAkrTKpeXKFie5D5C
         f22A==
X-Forwarded-Encrypted: i=1; AJvYcCXMeonVUPua8W1Dni2y+AHJY1ytgvdR26Z/4M4kLK551B+Zi9WW9YFWb79G7EQtMAXKPYE3XN3Tg9hP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2zbnNRlkcYCRe72O4XkzaWf7hiS2Q4c1qu6nu8cT+jfbwXdbG
	CoZM85p/N5lSD7wLnuz9/JzBI5DlowvA37mIF3oulFkTQOVonGha/wjy7XighESJFCVOYULGCvN
	orH1FDO4hG/LQmobMeVI0LoCvgLOCAL8HY5wTTPY8tp3ZBB5sH4kmbVbzw8A=
X-Google-Smtp-Source: AGHT+IHJr0xtyYJ73R4TB29Xaxtuba8FwbpRz+j+A4yiemcdfoXx5LoOn1+I+zgJ2gBD6GfkFXcv7FUmqsgjZ2m9e3Q=
X-Received: by 2002:a05:6402:1e8a:b0:5c8:957a:b1e2 with SMTP id
 4fb4d7f45d1cf-5c948adff84mr13751317a12.0.1729133669244; Wed, 16 Oct 2024
 19:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016134223.4079-1-everestkc@everestkc.com.np> <2f82fbcb-4a3c-4dfe-8852-7fc0b27c38e4@linuxfoundation.org>
In-Reply-To: <2f82fbcb-4a3c-4dfe-8852-7fc0b27c38e4@linuxfoundation.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 16 Oct 2024 20:54:17 -0600
Message-ID: <CAEO-vhFkT6RwR6h7KRD0YyQphhuqm0d53xj7xp7r3gco+DxwHg@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: th1520: Dereference pointer only after
 NULL check
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	linus.walleij@linaro.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 3:00=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 10/16/24 07:42, Everest K.C. wrote:
> > The pointer `func` is dereferenced before NULL check.
> > Move the dereference after the NULL check.
>
> Change log looks fine.
>
> Short log that clearly says it is a fix would be better:
>
> Fix potential null pointer defereference
>
> >
> > This issue was reported by Coverity Scan.
> > Report:
> > CID 1600802: (#1 of 1): Dereference before null check
> > (REVERSE_INULL)
> > check_after_deref: Null-checking func suggests that it
> > may be null, but it has already been dereferenced on all
> > paths leading to the check.
> >
> > Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
> >   drivers/pinctrl/pinctrl-th1520.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl=
-th1520.c
> > index 7474d8da32f9..07f8b51fb294 100644
> > --- a/drivers/pinctrl/pinctrl-th1520.c
> > +++ b/drivers/pinctrl/pinctrl-th1520.c
> > @@ -803,11 +803,13 @@ static int th1520_pinmux_set_mux(struct pinctrl_d=
ev *pctldev,
> >   {
> >       struct th1520_pinctrl *thp =3D pinctrl_dev_get_drvdata(pctldev);
> >       const struct function_desc *func =3D pinmux_generic_get_function(=
pctldev, fsel);
> > -     enum th1520_muxtype muxtype =3D (uintptr_t)func->data;
> > +     enum th1520_muxtype muxtype;
> >
> >       if (!func)
> >               return -EINVAL;
> >
> > +     muxtype =3D (uintptr_t)func->data;
> > +
> >       return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
> >                                th1520_pad_muxdata(thp->desc.pins[gsel].=
drv_data),
> >                                muxtype);
>
> Otherwise looks good to me. With the change to short log:
>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
The patch sent by another patch submitter has already been
applied for this issue.
https://lore.kernel.org/all/20241016155655.334518-1-colin.i.king@gmail.com/
> thanks,
> -- Shuah
>
Thanks,
Everest K.C.

