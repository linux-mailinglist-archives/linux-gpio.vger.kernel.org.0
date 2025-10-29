Return-Path: <linux-gpio+bounces-27835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E7C1B2EE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48316585037
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C4A2505AA;
	Wed, 29 Oct 2025 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2g8vCBS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C6262FFF
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747319; cv=none; b=tOCLRI5Y3QgZ/zPM4WOfyYfSzoG+SmulXDiUGHZ6vFcSJUOxozYghViAc4t/mwyOSbuDiP2PQ1LhY45ZKiM5T3NEmquxMeKrQjXMlhCH/RX2o007adHxM9ydZJdUSrUDGA3enl3UxOia5tz46cWnvdD0FW/l7ASafP/JueYfeyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747319; c=relaxed/simple;
	bh=JnGN5D18R/9fVPC4aATiOOBzgu+WBuLqDytyaFyTYec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ape1MMHHhOLR4V366eR5RTfnZUKaB3+r/lzrDrPOmSD7iVFFgi3/FZDw05o+PiKIMVl3/guuDOduDj20xI0ozUzcsqRH1ujHvfu1okhc89Kyc6H+CJigF34vtFf007d+7CE9CJHctpoB0dHv1eVy+V2DI8vyBwgymx1EXSGUQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2g8vCBS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-592f098f7adso9393059e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747312; x=1762352112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnGN5D18R/9fVPC4aATiOOBzgu+WBuLqDytyaFyTYec=;
        b=P2g8vCBSKm9qQSx8QMCRipO+Xunm+j0kPjkxsG64Pa2AOUwbg8kkHaKAGR0ysqs4ZE
         7nCpNOO4ghqFN+9+aZtZvEolZbEwDWhY72CBEXuKZuzIe0kcLpkrDGivAWWaJt/cjixC
         ChVGaU/exsl35QMJWjWHqe8BgtmKJTK0NMiFpH2nW91PFrzqGRYdkjTWIq65qchYOGQD
         hVihrAC+CEAHE/utWhWqNk6lzGVoNW/3hlKFs1oUxQAU+mAzk8o8epDhvTu4zMsPmzNA
         qrPd4IcYiE8TK7qOQa6pyi5mP84Nx8R5M3toFhZ9450iSivFZQrPlt6lnKZd98d8Zpbo
         DFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747312; x=1762352112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnGN5D18R/9fVPC4aATiOOBzgu+WBuLqDytyaFyTYec=;
        b=mcJJj1tOml0KArSOW8HQGIXWVJf+PmY4mY/38lELlCSkSmF411P/4Ma2D5QTRGrDcF
         dNx/Ojj+JVOjjoY4FVEpzDNl5KlcqOBTDnldJT/ULWW7M5Z4TTBVAnxwTYlW7ypUf1nP
         aGZLR4f0dNiMFWAKEIvFRq+x5OK3NzXid1h3bwq+0Vz9YC2M6wV+5cl75CbDIxa2Ra8q
         Vmk95R0d/89tUFxCtk+AVOV7oHKFHHpIYnZ+PaN7ung+cSrdxDOE9N9qrpBEyp4v82+h
         JE2IM7oEnQidxiYGY0c9pxjF6mnfNOZ5/FctkkvELD/0d2za1ezSzAB0/sD1bjCw5GxV
         g5eg==
X-Forwarded-Encrypted: i=1; AJvYcCXQAdSeLN5RsGeb+o/7IVMD6lyZfmdPvumJ3QMhf68TZLSwhiXp+lTfuYc3osdcA/U/BD2f3yiPM7Wh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0r1ONnAFqGG9AzVyIaMDP06WcO7DYIUpOsYH+XfGbmH3CV1ok
	2t5OtZJFcJGcPbmXCgEoZ/17Rs3G+syAbbrYWaYoBj0nJo8H70Qz4ZS6glW8+vlmD+HTP5z0gz8
	rI6NRr0brQ623Uc3CaQ/DAjkkMNmPa4OfUm5VccsClw==
X-Gm-Gg: ASbGncv6mlbpFLvyBuRSi1OQk6yyQwBYhm8cEHqkcY/tAnaIl4jIo4TY7eP43fdXIJT
	45PyVlZiT3FAoHBGJw5ZBZfRfNrE/BiHpP8+IdRKUV0PS95iBifc5j/QRnGiOdBLVWdSmrZx8f+
	FI8Gx9kBNnjpClC6/4PEa9md5xXm/neh25jPBJng2vqx+ii5vO/SW72qSso8taCHMkaEmyv/OdD
	xftjqElXjwOzQycUclm4c45uTG+RQbPF0eJxSXisd8SZO3t3/YPiytn284Iy7H4nmtB6M+KWxDp
	NYzpUA==
X-Google-Smtp-Source: AGHT+IFHbNWWVxA87snhrR4IbvJu5TGV5/GUfJgAIFivqMT+b8PLCXPg6xBSIPiXG/dy8RZjJuiqgOtncZYWj0XE3mk=
X-Received: by 2002:a05:6512:4027:b0:579:fbe5:447b with SMTP id
 2adb3069b0e04-59412877a64mr997730e87.25.1761747312519; Wed, 29 Oct 2025
 07:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:14:59 +0100
X-Gm-Features: AWmQ_bnA7g7AcaUJgpDisQ6qYyEHOuq4LuFcqR2x-CFiQFCGVVARLA-FUYgDIHk
Message-ID: <CACRpkdZMj84AJu1ZgDLin1Ef1JaBRHsevB2auTFvn4h3M66yGw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 1:36=E2=80=AFPM Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:

> This series adds support for GPIO and GPIO IRQ mux available in the
> RZ/N1 SoCs.

I think I sent some review tag at some point?

Anyways, here is another one:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

