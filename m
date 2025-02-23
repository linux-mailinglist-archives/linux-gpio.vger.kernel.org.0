Return-Path: <linux-gpio+bounces-16452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911FA411BA
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 21:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4A9D3AAD4B
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 20:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEC21FC7F9;
	Sun, 23 Feb 2025 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vfuLvirY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B701FDE14
	for <linux-gpio@vger.kernel.org>; Sun, 23 Feb 2025 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740344104; cv=none; b=TXvDZ5vQMBSKxeBVGb2XTcL2sz7h60dpUlNYUbctU9Ma9+cGU7lmIo5TfMB+lphIsYJ4p0i2MJ7dv742aMwSkS4gRU/I4vYExLlvfP+y4Pzir9HLaCYNl9YJLrlsknjQXFYqQlqAeCGUrRhq2BjN+48JMPABMC9/GCizHmE6abg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740344104; c=relaxed/simple;
	bh=+HXFPjewlMNAg7XWH8v++wunTGFuJg/cfE3DU9ZIQHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TludP/MutbwwuGNxo8KWd2e8Mb+Ij0wRJl7yuNaqW6eizo87CgvahCOR8UTeSlAB43m4xNAMEyVJT19NvqmlzMxvJueqgklvQdS8g3Pl2AecjkgIzJxmeoSgJ6pceUdIqUi/qEVBJ7gib/3kvOT5S1ENCj+XhWEKymjpjXfQlBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vfuLvirY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30a69c1a8d3so9374491fa.3
        for <linux-gpio@vger.kernel.org>; Sun, 23 Feb 2025 12:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740344100; x=1740948900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4bxYkQ/nsKJRs2jIrffultr9wOz+jQ/89XsqJiCc2g=;
        b=vfuLvirYSmUEMyCebG2VAXPfG9tbN4R6byfFxRaRyj6dnrfi0avDn/Vu56NixqAwli
         OlLVTnD4O3abOIpLrEHS8zYegql26IygN71yjE9qhxSacKSxhG/65BGxkdOMwBlDMur5
         S+8wjr1kAFYq4XM183JS1Z3qgP9nBvjKuYYf/9IXfNi4gJYzRtzMhKoCrnDiL3kCq5eg
         DFTl4sK1UdBU9oxuWnAZpsSivLOX1jG0XRWbZbJY3gGXVcgAI8KtwTb5/nHCUEJLHaH6
         upY48OqSYx6m4JNe86YWuZAQRqwqG+t0t6s/9pDH3S1ZVVW4WV/32jI+NLgqZoYdlh1K
         lFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740344100; x=1740948900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4bxYkQ/nsKJRs2jIrffultr9wOz+jQ/89XsqJiCc2g=;
        b=eOU3pV6nzkYjBb1DDM+r1XQXpDZvpnuodMM4gyywNj8s01XuiNby/loYRZw6HimY02
         18J3t1JhQDxnrG2AYe38IfUyku5mDqJYhCg/QTr7hTcionNgJK1X7zq1GldUhpJAhVnT
         HTT/U3kykjLKa1gtiQRioifFirjXW3iIAP4PU/xcpd4QU8I64NWMRULUGuDWH9eV14n+
         qYYDp0Fiunxtyod5q5BiBM9TvfBYLEc0THDmTWf9P3x+VK5MWL0Yb2+tvhygy6PbtTpP
         Sg/fwikAnwGvBffyU8zQ0LOZVq7vlpz1z5kaRGe7wXrlWHsvebBzlDQ34+MXZE6qA0Ku
         HTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq5Maeh6PbzJUQe4m/N6uPqY0VWu1giazIy31SMiByfoU8gg2dkrztGommAyIaaOvY0kmjhVxVU66N@vger.kernel.org
X-Gm-Message-State: AOJu0YyVnKZ9uIQ1vnMtgX6JXLZp48lSUIEr2PlmXol1MvAoHn/5rtvr
	vH17mSIXYMUqwlCwC0F8HgqE1fmD1lyXsHe18sZCXh85G8Xw3sdIZHCa1R2MVzwnL8pb4K7MKZv
	4ejbkAOBA7VDN5bRtstSJdS5rx1XtKWxszZD24Q==
X-Gm-Gg: ASbGncs0PAAFQxbv0eOe7SDMCPKjWmy2vFMuUGo7hOAt6KueCopVLhkEWQbimjOdCbH
	S1l0LRZoE+pjf6cwJqo+4r+6oX/xgtRkEON5nWuV9q7hSj8hooYIuPQ1OgYFbGxjyTbyPWazt8P
	GQQDz3DJXw1xcscxWGA+UUXAcj9QuLdz+d1bnl5A==
X-Google-Smtp-Source: AGHT+IFDn780/w8soVGkUXtHpzGjhzs8+k9JV2usxFG+k5/j8YX6aH0YTVHnszJEk/w/4d+aG7PWG2yBwM6p4Q/Ab2o=
X-Received: by 2002:a2e:9658:0:b0:308:ef73:523a with SMTP id
 38308e7fff4ca-30a599a2775mr39360531fa.36.1740344100418; Sun, 23 Feb 2025
 12:55:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
 <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com> <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de>
In-Reply-To: <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 23 Feb 2025 21:54:49 +0100
X-Gm-Features: AWEUYZnDGB9vf_rZcGPk3HcPzJBryjbD6Lns6ejuWLna6xFV2KkIANI-1IW21co
Message-ID: <CAMRc=Mf-ObnFzau9OO1RvsdJ-pj4Tq2BSjVvCXkHgkK2t5DECQ@mail.gmail.com>
Subject: Re: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 10:02=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
>
> > What GPIO driver is it using? It's likely that it's not using the
> > provider API correctly and this change uncovered it, I'd like to take
> > a look at it and fix it.
>
> How do I find out? The commands below do not return anything.
>
>      $ lsmod | grep gpio
>      $ lspci -nn | grep -i gpio
>      $ sudo dmesg | grep gpio
>      [    5.150955] gpio gpiochip0: gpiochip_add_data_with_key:
> get_direction failed: -22
>      [Just these lines match.]
>
>
> Kind regards,
>
> Paul

If you have libgpiod-tools installed, you can post the output of
gpiodetect here.

Bart

