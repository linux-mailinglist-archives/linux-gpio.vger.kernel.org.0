Return-Path: <linux-gpio+bounces-6356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3D8C4DC0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 10:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B17DD284126
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 08:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0278718E20;
	Tue, 14 May 2024 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="DD+1X918"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359A91097B
	for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715675954; cv=none; b=hgXuXdOyJL9EKbeNxNZoOltu2rRKR6qoQVvcAGIa0cgMAYiJWZFXmHZK2x74Y9EdpKaC6ewzBodZPod0kT4XhZcu4Je04OfBd64ri4gzbNoWKmKBLebqN2Pl+oGqtIRhs3os3uBwWlK+jUdcz/YuhJ7HGVoFvbwquVfPIhpweec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715675954; c=relaxed/simple;
	bh=PpIsu2YQ8LKdplBvqSkaGF3UZwOWDSw318bSDid1J80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THgQRLmhiQT9AV9fHJTEIMeC+XtR+OpFd0a5lfUWby3eod4jc02YmHGbFXXgHfBtmUi5egO59zmdtACvTDr5IoPPi+rVdEZZ05bFfXqurgoTLeo0YCkaWZgjXyq8KY01lKmgT0VFnKl/I7wBRNWFLiyytKh5fIUp+idSFCbbrbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=DD+1X918; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dee9943a293so1379529276.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 01:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1715675952; x=1716280752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8OfBUMWw4vRfdJG5yIvPigGCabXSzHeeUlvg2+VyM8=;
        b=DD+1X918NuP42LRHIK1ScvzkFyD26YyCHDwahJgRIRo4BTZeOuadliEZKoaRJmq6tT
         4w6lloaJh+kE8GNXXrUItYqsIbEoEXLL++hRBGgLZmQRIuyxg5FEAvNFxc74O3tl13rZ
         iODKCkY9MQC2vo0oDpAEilVnYL9DV1qkK36coNSW4ibBTrVULH5a0yg4U+uUI8BwNEoP
         xwyXGUD85DJ6RvcgO7aihNJBXkAeWS1xPjQA98crvLb0jc9MxpJqC1xYHw6NScgOafff
         Obg+c4Z/J8niUTB2o95IganJUwILzler4iYeS3EmWh5eLdrJtnDa78J7Bh5O4XWX4FbZ
         h/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715675952; x=1716280752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8OfBUMWw4vRfdJG5yIvPigGCabXSzHeeUlvg2+VyM8=;
        b=t8YglL54qLe9YZ5nwuFi10Fr/eddwPuHbDMS1yOtdTaYOCBeKsUmX03sYRmc7UTo2N
         h9swtXjj8TLH3N9307l2zSHtLYA40QM3Ezgxr5HwfunXFk7yra8rD39/vy9j1i2r/TTo
         2pagVIqP+ezpC5OLD4YMmaX7zwKXDz7QF/Yy5RvWYymlyUE4ZvM4Yv8AdkZjUS7BdhWy
         YiRc9ayydIN5qoRCZnyyX+jeoNYKbVpkjrJtJoSjmVpA/pyJxFPcNk0DJdg6AYNgWSPZ
         mH73Dwgnoja8OejWutRK9x3M2/2lipHfdz7vXpHpYfvYS80dt5zOLh0ChCeITPZgX0C7
         W8mg==
X-Forwarded-Encrypted: i=1; AJvYcCXqB+keWrZ7YAr7IcU0z9DfyTsEfkpSgL7UsWflVIyX7J3EKzLwdeks31kgLCnsa/23D4KM2gqhjIVw3XTx288uuSFuFKYEC2vHxg==
X-Gm-Message-State: AOJu0YwYfE4s5KXsjuAGGdSo4yHbk9G1IDrQu+b0cmgvSiHko1geDNoY
	zCx+hrzXSfVDjnDyXlIPlqyFCow8F7JRcB/3yJPhCQxuoda/Z8zQSEQBWv1i5H6aL6E4h89loq1
	xr8eHBXrkGxXo7+Xd8+U8lwijJ0nNkpzTXajyGA==
X-Google-Smtp-Source: AGHT+IE+i8Kx49jNAKC7DYTOj53slCNQaVb4nzqYGYIRKTSSy6zLL/hu+hHyIeZlCKLoskbdnjTAh/+WvCzLiGlNKFg=
X-Received: by 2002:a25:8b82:0:b0:deb:7eb7:c9ce with SMTP id
 3f1490d57ef6-dee4f182a92mr9653925276.1.1715675952187; Tue, 14 May 2024
 01:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
 <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain> <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
In-Reply-To: <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Tue, 14 May 2024 10:39:00 +0200
Message-ID: <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, naresh.solanki@9elements.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
sure can do that.
Do you have an example where muxed registers are used in a regmap?
Is there some documentation available explaining the existing
mechanism? I'm not aware of anything.

Regards,
Patrick

Patrick Rudolph
B.Sc. Electrical Engineering
System Firmware Developer

9elements GmbH, Kortumstra=C3=9Fe 19-21, 44787 Bochum, Germany
Email: patrick.rudolph@9elements.com
Phone:  +49 234 68 94 188

Sitz der Gesellschaft: Bochum
Handelsregister: Amtsgericht Bochum, HRB 17519
Gesch=C3=A4ftsf=C3=BChrung: Sebastian Deutsch, Eray Basar

Datenschutzhinweise nach Art. 13 DSGVO


On Tue, May 14, 2024 at 9:49=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, May 14, 2024 at 7:27=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > Tue, Dec 19, 2023 at 01:53:49PM +0100, Patrick Rudolph kirjoitti:
> > > Currently the port specific registers behind the PORTSEL mux aren't
> > > cached in the regmap and thus the typical setup time for a single pin
> > > on cy8c9560 is about 200msec on our system. The hotspot is the IRQ
> > > (un)masking, which causes lots of R/W operations.
> > >
> > > Introduce a separate regmap for muxed registers and helper functions
> > > to use the newly introduced regmap for muxed register access under
> > > the i2c lock.
> > >
> > > With the new cache in place the typical pin setup time is reduced to
> > > 20msec, making it about 10 times faster. As a side effect the system
> > > boot time is also reduced by 50%.
> >
> > Interestingly that you have not Cc'ed me on your patches.
> > This, btw, a good reinvetion of a wheel which regmap supports already.
>
> Also sloppy reviewing from my side :(
>
> Patrick can you look into making a patch on top of this
> that switches the code to use the built-in caching in regmap
> insted of rolling your own?
>
> Yours,
> Linus Walleij

