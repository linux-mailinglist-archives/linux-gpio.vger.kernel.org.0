Return-Path: <linux-gpio+bounces-12113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0AA9B096D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 18:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9760B1C22DDA
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 16:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF69917DFFC;
	Fri, 25 Oct 2024 16:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G7D1/BgQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6433C17333D
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729872772; cv=none; b=bh6OYfP+ZcCbET1InCErQ95MmQjeF08uJD09ZIQI9eMiuemyJJXjtvdCVC/vfTIuezdMzIn/Vlq/6xUwPYSjrLl7ex5FdMx3t0o2gqFNLgBdBLpNKHPyjHnibKQyyp/q77iCY9I8nZTORFephhxw1E9aY+t8TipB+KhRe6xPiTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729872772; c=relaxed/simple;
	bh=QdfycrU4qNv5P/4o/XdIFXZrimRY1SK4EjbPOYIla3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cdo4QCwOPDwOB8rk5SdiRm5xczcDvjqU/8fFZSv2y/LcQbeT42MUgPxy6MliLIrCJcc8UQLYULRkaqQQGbC2BPIcul3EykH5i4BGxVzFZLnH26WfECvenF7wuGHF1qCACvOrjGF281MA5zQs9hK1LpIcXqmsVFz8x9FWLvCe0sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G7D1/BgQ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so19741741fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729872769; x=1730477569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWhPbujoTeXjAR1IZPF7VHey29FQ0x02eE2BStCRoqs=;
        b=G7D1/BgQntzw2Z75L4ph8np5MEe8TCZMbG8VMhr7me/f4192568zVZ9nEZmYMwNNrY
         qU5h+kzLSVSpC58rvhEHi0EykwaDHMljG2sS8tvmyYHs+EqXX07gR2WpLLqf7RqaIMiu
         nyIHoJUgFy77xjFZ2VDy6sCOyttyD8hA9VszHHZ8NMS+T8XjRqVUT0yFvVN1uvzGAv0h
         qfGCNjilkPJNt4N0muHOIpI8Swu4/ZP6X+KnZCFYkeafOc2V9DVhxUqBvNj7RFcAAjk+
         NdR6YsM9E/1CeC2oKJnXCkoDtlT7xfr3y9bsMHSW7NGGzqruusJUHJnp//EViVvaNnVu
         18cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729872769; x=1730477569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWhPbujoTeXjAR1IZPF7VHey29FQ0x02eE2BStCRoqs=;
        b=Rm8ROBGemJrhkqF7mX8vurdh/zfgAzLdLw37E7rKI02ds4/+9cwijF0RD1qdwpQpYG
         IUG6N1EmU59Gh0oIMXbvKN6E+m4AZWIFXo9ez4Rni/4ZTLYFK+cLcX5Qd0ogLESm8J4z
         DxZAolkj5H1rH4CGfM5sScX2p1tenICtVunuzueBmhY0R51unUndhCp864UqrPiJCwTK
         0HnHgol3wgAWC58+XINo6ECy0rkpPYIkIR65R52yWo74vmOPxCldNoQN6DltmjAb+y5b
         ug4oezhSy2TlI6RFu8giQvWvsA4Jrm2pvzgvVF7OXTlnDKsEWp7/R6UF4p9+vhqVL4p7
         AJow==
X-Forwarded-Encrypted: i=1; AJvYcCWtS0ki6xTYqn+I83ZqaQmP9VR6auHaggsjf19tTCJBxg/RhDCnyyrU9R5Qjm9iiPWgUw6t05r1IxYB@vger.kernel.org
X-Gm-Message-State: AOJu0YysmIRdMwymMKKsuLPCFYaRq5LliyGaYJXPybB1pZY4sGeupSHm
	oNMEIx113b3onI44kzwdbW5pnzVdK/g+0GMKfCA7sdSPK4NA9JDMj9+gtOGZpPeQ1KwA2WB+gkn
	Pc4ZhFV1lQCBrhR3EelkqRJiTh0Bch69PMmme/r14ZSHaAS8o
X-Google-Smtp-Source: AGHT+IE5IkSMdyrwCY1d+qHB+xbJKmNLrr2usEDXKrMtB1BBeoZeIPxIj4Z2y+F9iigrmQNx6mNVc+tpMzrFqGm2mvk=
X-Received: by 2002:a2e:b8cb:0:b0:2fa:c6b3:bf1c with SMTP id
 38308e7fff4ca-2fc9d317e5dmr54839011fa.8.1729872768475; Fri, 25 Oct 2024
 09:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
 <20241025-gpio-notify-sysfs-v2-1-5bd1b1b0b3e6@linaro.org> <20241025132420.GA155087@rigel>
 <CAMRc=Mcd8vVCwDvRysMxB00xUD77zmJK1EApFuAEfWpwOhkviw@mail.gmail.com> <20241025153424.GA182871@rigel>
In-Reply-To: <20241025153424.GA182871@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 18:12:36 +0200
Message-ID: <CAMRc=Md8zxoQB3gJ9qJ_EqgNn8JFhi5vkU=HBhAhM9KGxo2zSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpio: sysfs: use cleanup guards for gpiod_data::mutex
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 5:34=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> >
> > Yeah, I don't know why it was done. Typically you want to sanitize the
> > input before anything else and this is what's done almost everywhere
> > else. I'd keep it like that.
>
> Not knowing why it was done was precisely the reason I thought it
> should be left as is.  The fact that the checks are performed in the
> other order elsewhere makes me think this one was done intentionally.
> Conceivably it could be used by userspace to test if a line is output whe=
n
> the direction is fixed (so /sys/class/gpio/gpioN/direction does not exist=
).
> So write a non-integer to the value and see if it returns -EPERM rather
> than -EINVAL.
>
> Admittedly I'm speculating, but I can't rule it out, so I wouldn't
> change the behaviour just because it is more aesthetically pleasing.
> And if you insist on tidying the behaviour then it should be in a separat=
e
> patch rather than piggy-backing onto the guard change.
>
> Anyway, that is my 2c.
>

Ok, I'll restore the order in v3.

Bartosz

