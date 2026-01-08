Return-Path: <linux-gpio+bounces-30253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C854D020E8
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 11:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C57BE33219DE
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 09:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6FA3A7F63;
	Thu,  8 Jan 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVIooYzz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217FD33A718
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863056; cv=none; b=o540gS30qc8nvQNXzwXkp7LdvXMEMxKE9v/9OF9wALNcr6MP3h359XV0xs8RtmBU9UONAJkW/oQmj+16D0FOkrSpMHA1S91jeBxnVQj0DmughrvMEN8L77SAVMr49zlujGhlSHMkkaSHxXYVMcnbBb3QLydGy+8bV6ChNReKCpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863056; c=relaxed/simple;
	bh=CXye4V4yCGuXX+Yh6zLBGTO942MwnYAXfPhzjwIN0Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXEZWAs+yipZntbB42adm+BUo+fxV/UkR8QHtW0YyhFmJc+x+2kQyq4PZqrxf0HHr3K9h48QQhjjzk/mYacEQRMKj3chrLJuxOC9KuSlrkBCIbVSd2UYa0TI8psIx7qpn0i5jKzBouVG0ynyhN6DjooST8tgVTp31PVzMdUeAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVIooYzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DB5C4AF09
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 09:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767863054;
	bh=CXye4V4yCGuXX+Yh6zLBGTO942MwnYAXfPhzjwIN0Bk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hVIooYzzAoNf0azJyBrEXD/fTwfn4nyFIUCLwdA6R5Dbx9kMjbSVUF4a7H9MTBRDr
	 LfoPiA3M9AazFBgsm0wytFj3JYMdgsUYtFtsQmKQBOcPg64LE7HVGoVXbhwiHxcw9+
	 4FMX1qv3ETPOiuBLrv3576vVEX+Y5kuFHGHOfCYpihYfXtllnKtMCrKfYjDHdRbF7+
	 OeTAjwD4CvHJu3xGjVl7xGC3QNZswUYe6xt6lWeX0J1Wf6KPaZ//C99wq7tCoWo4fJ
	 1kllXhzaPTtvSfH+ACs+uCZZCtvzdt0vEEkKGy4CV+4nggA33tZZFEqAH5qlkbJ/DJ
	 75b4dNxKo9eXA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b79451206so222752e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 01:04:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVtHWCcSyV6HOQdMaxarOMBkuVN72wYsEqyTmVZAkPhxSWJzd2a7mFUKldDS/FLVoI/4vBvG/nUf9S@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoq+hl0SjWXdomEt7HGWIYEVda6IGQd43D3ZXqVd63uOpmFrwp
	td37wD3d1rkccm995gkuPPedNuwTQExR8KLwXxbS4qi9iil5/+pTqU25/eyiRhHnRLPd8pvC4wX
	BfJV+U0OPvLh1rrKoi0NurJAwv8A1hq7FOxoRhTN1jQ==
X-Google-Smtp-Source: AGHT+IFAK4kx2dU3M4f28nexLkW1J2UeJSomd8IyDXF0S2v0SmmwMwzxwKKUE+aMvKeHrebINV1vP8b+/PRBPdyefYI=
X-Received: by 2002:a05:6512:3b21:b0:59b:7346:2612 with SMTP id
 2adb3069b0e04-59b7346287emr1567053e87.52.1767863053429; Thu, 08 Jan 2026
 01:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108034217.2615017-1-rdunlap@infradead.org>
In-Reply-To: <20260108034217.2615017-1-rdunlap@infradead.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 10:04:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mcows9Mq9UC+307HzdV06zqRLgB9Bz=7igamT8k0mTCEA@mail.gmail.com>
X-Gm-Features: AQt7F2pYI05C9wmkCCi8YslLk2dddsuCcDPvlYJVa9ryrfYkAlzfG53xJhKQ4e0
Message-ID: <CAMRc=Mcows9Mq9UC+307HzdV06zqRLgB9Bz=7igamT8k0mTCEA@mail.gmail.com>
Subject: Re: [PATCH] gpio: drop Kconfig dependencies from symbol GPIO_TN48M_CPLD
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Robert Marko <robert.marko@sartura.hr>, 
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 4:42=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> MFD_TN48M_CPLD is an undefined Kconfig symbol, so remove its use
> in drivers/gpio/Kconfig.
> Drop COMPILE_TEST so that the driver can be built at any time.
>
> Fixes: b3dcb5de6209 ("gpio: Add Delta TN48M CPLD GPIO driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Robert Marko <robert.marko@sartura.hr>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
>  drivers/gpio/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
>
> --- linux-next-20260105.orig/drivers/gpio/Kconfig
> +++ linux-next-20260105/drivers/gpio/Kconfig
> @@ -1621,7 +1621,6 @@ config GPIO_TIMBERDALE
>
>  config GPIO_TN48M_CPLD
>         tristate "Delta Networks TN48M switch CPLD GPIO driver"
> -       depends on MFD_TN48M_CPLD || COMPILE_TEST
>         select GPIO_REGMAP
>         help
>           This enables support for the GPIOs found on the Delta

I see the core MFD part of this driver was reverted by commit
540e6a8114d0 ("Revert "mfd: simple-mfd-i2c: Add Delta TN48M CPLD
support"") years ago. Should this driver even be in the kernel? It
seems to be useless without the parent driver that supplies the
regmap?

I'm asking, because with your change, it will pop up in people's make
config and I've been yelled at before for displaying useless options
so I'm hesitant to make it visible for everyone.

Bart

