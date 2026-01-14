Return-Path: <linux-gpio+bounces-30546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD92D1E39D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25A523082AE2
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA1D393DCE;
	Wed, 14 Jan 2026 10:48:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB56038B983
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387714; cv=none; b=tyakhaPkbOQNWooNXHP3NptSk886+EPqyzHNv/YZkaHZxHs48PECSxf9CI9GZs0n2N721HU6R10cuN1XvP8m523+Bh89wb8pAaH1Rz5lCGtBRu5iV34RWOU3L8h4ItuU0JF31TTGglcbuatY+J4cHr0K+FfnO7s/32xc8e32R0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387714; c=relaxed/simple;
	bh=E0LywgZ6Y5OBOHF1U8Vz1IKUxUwFm8uKutML5xWZ8GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYgMYYmLfAnBn+qWVb1duDuZzLjIAyT9KN2lMT5Bw5A+tjX6++dQOibuXWX8w9FuG4wlvVCMUXAHb4RwyqPaJlOryBdDicrje3nFhUNzhfSiEBNi42Qd5mIUYe15Wwdd8dzYHMlJsf2+QfCn3Ty5IzfJC6HhWhdOfTTvDMyREVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c52c67f64cso130936085a.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 02:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387697; x=1768992497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1Uaum6XUOb9s+vI8xOa+5r0BhzYwNGBohqUTsxTR+M=;
        b=nAEjDjOSapWWoQ5uBk7QwOFIH4DvsC1DPjktCtznENC6y6k8gvBsb/c/rgP725Lq12
         2TC8Ew5N4BxktOb0DjnIJk7KNfVYy25cx3q3znojf/o5SjDTZ1BcWlZa4vVhFdcIGFL0
         /WFjOf2Kh08LYN7YlqZN+Z2AzFPEyblJ7DDqTvQZrLNg6FVusXW8HQmM3j7qkKqm8q6Z
         V0X+oFlW/Sl4e5CtnKKDpOI9ughvqiJgfY1DgJ/tZx6LkbFRbgyvOqPGgEOD79QpexsQ
         A2IGsIhHyjSgH+5UYGnm7LGXRUFWGpMljOgasfEYR+yKR5hRGvbT0gNZ6O+ebcvX7sZX
         gcng==
X-Forwarded-Encrypted: i=1; AJvYcCUzfTGxSq9bqSUE8/4U3VJw9pxIf3hKtIhTWdZgfdbWP3AmBkUHA+QinZonjDj62XuzuCnEeoNzZqN2@vger.kernel.org
X-Gm-Message-State: AOJu0YzH0RvZXHVin9NIyuT7+R9hdpLnCKGrqjDAG5NTn91m7133LEjG
	NdsPzuYupb38zzDGsVrJUR3hnXuyCS2BP1UZBvq3Xtegle876y5F+GvnOC3sMvF/
X-Gm-Gg: AY/fxX7rBQkIrzjqjDZaGaVawsFNtdGOEZmou9G5XuEHjXz9G9lol8EEjkO5uiAroUl
	kzM2BrK/9YYFQPzIaJ/Imao5w8NjKAAZRsnevYdXgW+Uxu5tLBr12Qw9utHe/Z1oVPEmpWCP2a2
	K4gRhrBqmQo56xBvv3i2yOZPZSF5TXV9yQE4dZkoqsJ/No1JafrqRNMtNSum/JAXrbvgM9gJeKq
	QSLG30Uc0Ixp9O4whG2mFHuPVOBQ2itAIAoTb8rCaXti6mMY/qA5HPftoGbQRskOzlJ1qHPWk7F
	YTlABBxVP7+KUNOHB7ma0Y0qhQBn4ToejSN4iSoI17uCANRcU9DOCOG+d5qK/RULfS0Pz/JXFzo
	APzOx2/ypPwY3NpcrKlt1vjV8UvQdcWJzxnm900lWajiDJFyYHyZIU/T2YhqorvTuWco+YTGvy0
	JagU8l1yATvU/xC7gZWh6gZ6hG9ULre7Hj92hPH0gW2y7eV+I/
X-Received: by 2002:a05:620a:1726:b0:8c3:7e05:db01 with SMTP id af79cd13be357-8c52fb2f6aemr263931285a.2.1768387696609;
        Wed, 14 Jan 2026 02:48:16 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bc0723sm138034185a.46.2026.01.14.02.48.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:48:16 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a2d21427dso83290546d6.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 02:48:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9ZInrCZHweMVdBxpPc4+GggNDWsXr+aI8oCSIiqD7JC0EHKYcXM0ZRmjsuPgNKXrJlvBRvqWdl45B@vger.kernel.org
X-Received: by 2002:a05:6122:628b:b0:559:58a5:f6cc with SMTP id
 71dfb90a1353d-563a093a463mr686310e0c.4.1768387348943; Wed, 14 Jan 2026
 02:42:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com> <20260114093938.1089936-9-herve.codina@bootlin.com>
In-Reply-To: <20260114093938.1089936-9-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:42:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPJrqem_pKkQKU7qjkA6-6OEYW0Av3EvDr5hAO1U5ZQw@mail.gmail.com>
X-Gm-Features: AZwV_QhQn91-1OqqAw-EDfsNXlhnKQ09Nmhqb35fWgFytnsII83O23rtSSh3XAo
Message-ID: <CAMuHMdUPJrqem_pKkQKU7qjkA6-6OEYW0Av3EvDr5hAO1U5ZQw@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] ARM: dts: r9a06g032: Add support for GPIO interrupts
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 10:41, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
> Interrupt Multiplexer.
>
> Add the multiplexer node and connect GPIO interrupt lines to the
> multiplexer.
>
> The interrupt-map available in the multiplexer node has to be updated in
> dts files depending on the GPIO usage. Indeed, the usage of an interrupt
> for a GPIO is board dependent.
>
> Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
> output interrupt).
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

