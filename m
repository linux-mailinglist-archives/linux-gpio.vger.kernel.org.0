Return-Path: <linux-gpio+bounces-30430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C6D10F3A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 08:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80779301D0EF
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 07:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC170335555;
	Mon, 12 Jan 2026 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4Tu5sav"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECCC304BB7
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204102; cv=none; b=BAvJIoj21LnpLt2KsB40gKcW3NetvSZbqFC4zSEsRkg/hnwvZ8v2kybUwbOPHS231BNAmjv60Oh0wmaTJFzxgGW7ACZ+0pqEa0lEkS5RXBzWv4Plgl+9NzWxV5Na+nh0vOUkiNCi6Q/JICxBCGUxNt5zjoX/xDuwZkxRm3lpEA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204102; c=relaxed/simple;
	bh=Cq0+UUA+6/6u23x6KaUTnGeR+42yUfKTxRjDl68FpRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i88d+CW1FZ931IrEkSciqOKhlcsHc/kFU4tAVpKnEsysWMkCCvNKwdllXHOjaiSLt7YKUJBqW5qqdc+o2nlMf7ozzR9CtfNtUnykxpjuLrdKpYZkqAUoGyUCcdGRoj3BCX32c6wkEntvvP5UguGiKMa/qr24F+0sB09QIpBZXQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4Tu5sav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54753C19423
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 07:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768204102;
	bh=Cq0+UUA+6/6u23x6KaUTnGeR+42yUfKTxRjDl68FpRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N4Tu5sav0cykJenQj2OGlXJWvgbAiFLoWCzDTh1+efaMSgV/6pjmXIzTk7pUPw+Gx
	 8AHYaEwjKq/WpkWSukcJ861rNIri0JVprwQZxF6MLTt7jkwDrL5Suu32oEZOHpANpL
	 qB1iyxDjRQTdMq10uCVE7vvibaiPt8QtwXBe56KLaKRYVTKu0ns0WZ+yXSsMucEAMU
	 /RHZfyu8Mk689TuGsDSHRHiPXrh7huAzymbu/tPlxSnthE+KrLnavG+oiFCkMLSk5S
	 6mR/Jm2achDYIdlQ0/hrJI6Ds1hh16Ox1MnA718Ae6OmBTFH97rva7A7Xr1mUZcJ7E
	 eq3rwBwTavTqA==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6420c0cf4abso5364956d50.1
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 23:48:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqbNUT1eOfslkz26xWRrSq/OqXK374fesRm8zgCYAE4OQlm/Cu7L0HeMdW6jzovxUtLPIP2OC/FzB3@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1QSx18LjLuXk4AMNH1aiQavHzigGCrAuEXhYFrb769uFpXTU
	jNO1Wp79qgWA+dBaJhlkTvI7Goqa0XcDBA9qQYbr9vwqZzjWRMr47yHsbDc1cP9MFLOVzKaT6jD
	UGA6HmMXEoxx1yVkuqgb71qZkZ105t7U=
X-Google-Smtp-Source: AGHT+IHhkaHPJsO4ECnN8WVAQ9YwmH1uWi79w3ByZ1vZzYKVrW3HibQTlfvgekz3pFF9ymU+Dsuc6rskDE4OChgDnUk=
X-Received: by 2002:a05:690e:134d:b0:63f:9b00:70cf with SMTP id
 956f58d0204a3-64716b39bb8mr14402215d50.16.1768204101618; Sun, 11 Jan 2026
 23:48:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112064950.3837737-1-rdunlap@infradead.org>
In-Reply-To: <20260112064950.3837737-1-rdunlap@infradead.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 08:48:09 +0100
X-Gmail-Original-Message-ID: <CAD++jL=MWo3CnajooBr4Ocs_hMMW+bQpxEked23cm2=OfHMp=Q@mail.gmail.com>
X-Gm-Features: AZwV_Qhzc0-szILR_VwCGoTOnlEW0GRxX8zP2zOhPyxbqDN4GTOFr7Qsu4b6yO8
Message-ID: <CAD++jL=MWo3CnajooBr4Ocs_hMMW+bQpxEked23cm2=OfHMp=Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the gpio-tn48m driver
To: Randy Dunlap <rdunlap@infradead.org>, Robert Marko <robimarko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Robert Marko <robert.marko@sartura.hr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 7:49=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:

> The gpio-tn48m driver is useless without the simple-mfd parent, which is
> not present in the kernel tree, so delete it and all references to it.
> Also delete references to the (missing) mfd driver.
>
> Fixes: b3dcb5de6209 ("gpio: Add Delta TN48M CPLD GPIO driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Based on v6.19-rc4.

Cc:ing this to Roberts new mail address.

Linus Walleij

