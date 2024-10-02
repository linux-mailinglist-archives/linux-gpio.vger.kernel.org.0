Return-Path: <linux-gpio+bounces-10701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57598D5B8
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB7A7288DB7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA421D07BD;
	Wed,  2 Oct 2024 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bx8NkI1S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF011D07AB
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875969; cv=none; b=JgBq8QZ5l6CTFXXeiQgmM1wibI7mru5I/AxPTSZELePO1SbIbwIyX8wWsRyUDweiDUDE22/pmvzXoezvY8iyLZzvXpH0Miu7l+KYHy4SnrclRvFLYoT7istFc+iDMQnvUOoiFKm2mVrsVVta0q3N7PUUMsVYNuvPV63KZ5PSP/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875969; c=relaxed/simple;
	bh=MmVbytaRCHeK0GOf0K/308WnBMUo9XLVumkvmAD/D9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxoZnhfcdkvow6E5xJo48jlvJk5v8Py22g3ttkkZ7uLVBUoakPn3SPSsn+gNEJl4gqtUxqLK4KcXhS0XTtSSeJfx/5icrD8p4Av0R36AGTxaXkh9xPhteZp/r1rK2FFlNcyXpVfe3Wsw/zCsVWktuV3tDy2Qo+H0KN3UVDILGK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bx8NkI1S; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fadc95ccfcso20712181fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727875966; x=1728480766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmVbytaRCHeK0GOf0K/308WnBMUo9XLVumkvmAD/D9g=;
        b=bx8NkI1S1iWYEowcfwYcLgX//fWhncGha+etF/95BQMurQf8DmvzKVngTq2YIKXFGL
         vx0vpQvYV7jAWKzV0XC0wFwtb/j0IOuEflMRd3kmfeV6OMI+pVMZjaDAJdQGktelSawK
         mBhghALnlm0RL9XOtjIfJqRBHM5BO4aPlPMMZzkx3amrWTr3QWM+2EAYV9cS3+Ue9AkE
         fnPitMwNdcVM7DvcPCmf9xsq9I7Yf+uq37tefkciiHr2RhTn/uz06bVa1GNqkugzVOjc
         rxEi7jKeaIcwbGRmSimUFCxyFDH+FfSf8JY0H04nBpdf/YjC7xR99+6jq4a1kbwE/n8j
         fYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875966; x=1728480766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmVbytaRCHeK0GOf0K/308WnBMUo9XLVumkvmAD/D9g=;
        b=CpHRjZLbY1PxrWXgvFyO+eQ4Dh5LmPyl5uN7pVTcXEH97q1UenF3U20PD0H3R1OJ5e
         2/91+fZi1SYa0FdGEoHG5zBuWNP88t8WR+eJziEWotB5ebte38tQ0bZxz8pMmiWiB9Sw
         JHk4VvyBrxdCSlcM3EKUCiFQajS8nwMxGFtJrUVY7A6Jvt2yKGtlwGOzr9+Cn0bC5827
         ypW+ypdjHkja302B1yZ2DKDexUVJ4spC2hiK5hqG7sHrITEXOZupOQlDKI/GioKyihoE
         xxdL8SMhJCDmaxuSQBGL/6B1Jo3xOA0sc/RQAb4vr/0r1oS+CDuXBs1+G2MoM0VNL80d
         6uSA==
X-Forwarded-Encrypted: i=1; AJvYcCUY1+jeougfvpgvkFRVyew7nhU8o4Vj+0cs3pc9ZgWLrCzwNPoesto5TyWYbpq69NXz6rNAFaBL9IpZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwRpBiES8Q5+MlY0+y87+AiaAjmaUof8qq4SH4A1fr/gZSVlByB
	yBhzuHUE3LQkpQca6xKg0aBNQYcKbK8aBTc9llqh/VIcLPvVdL2gOWole9fpWYDmQPH7mXd+ZjT
	yoxHDlFQYlQQfCBkIElzzWhuHQUe/j8pZgx3eDg==
X-Google-Smtp-Source: AGHT+IGSoR2oYpSDRRYRSLGqKkMgx9JGiEy1OP0+HHmqnptfQyZ8E4IF2hcvOIYzFtye0Syh0VO6sL9EtTxJmT9YAZ8=
X-Received: by 2002:a05:651c:508:b0:2fa:c57a:3b1c with SMTP id
 38308e7fff4ca-2fae1016a1cmr23090481fa.17.1727875965921; Wed, 02 Oct 2024
 06:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925173504.1906872-1-robh@kernel.org> <CACRpkdYh22c08kLWDJ3wmK+i9-C2ngXdJwhg-kAXfdy2+mcB0Q@mail.gmail.com>
In-Reply-To: <CACRpkdYh22c08kLWDJ3wmK+i9-C2ngXdJwhg-kAXfdy2+mcB0Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Oct 2024 15:32:35 +0200
Message-ID: <CAMRc=McdAwEUCDouUeOENt36LZ+d4Fd=yeqzm9dn83XSqZpQFA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: st,nomadik-gpio: Add missing
 "#interrupt-cells" to example
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 3:04=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Wed, Sep 25, 2024 at 7:35=E2=80=AFPM Rob Herring (Arm) <robh@kernel.or=
g> wrote:
>
> > Enabling dtc interrupt_provider check reveals the example is missing th=
e
> > "#interrupt-cells" property as it is a dependency of
> > "interrupt-controller".
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Can you please merge this into the DT git tree?
>
> Yours,
> Linus Walleij

It's already upstream. I learned it when I tried picking it up. Rob:
any chance you could send b4 notifications when applying patches to
your tree?

Bartosz

