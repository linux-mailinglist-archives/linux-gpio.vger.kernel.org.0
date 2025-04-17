Return-Path: <linux-gpio+bounces-19008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4881A915DD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 09:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 598563B9A4F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2756B21D3C7;
	Thu, 17 Apr 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvr4TQm0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA031A264A
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876637; cv=none; b=DMLqe8NeXbf0K12wD8U1OEHBYMJGdFjUSU01b8/ioRQWU1/EYl/UMlduFwAgKHXVbZLfbeeBXmV4tRfMVqn0XGEnR94ltIFcuKjaxnjkBIBibHEwaxllX4ZeuAMbx3+uqTPxsgyAe5Ws+U6eQZAjBKwZT7QXK8CV/nn5XW03i+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876637; c=relaxed/simple;
	bh=H9C3ShvGEXD3FDi73Pb6nidSwsvRSbYWc02XP8/91pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5bYMuAfPbqK30EjqqVc4v3z0B35oqZWSvEH5qdQpElYKOP7TTMKmgBAPoCl8X3585eJv0ACPyLEQRd8pxul80XfO/zZSNJGVB03xUQM7MUS2do1M6TPdt5xkT1+4Sm5Fggf66R6PbYGaPAJVJpLmQ1MWGXTgNZlqDzRp/T3nkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvr4TQm0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3105ef2a070so4790381fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 00:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876634; x=1745481434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/Jl42SonUBh7uWEDi8GR/xF1KhzAcVX2ukREj09fKE=;
        b=xvr4TQm0tJdTM9IqKzMdOI0N6PLfe09A2/JISDy+jRDvL1deIlCJAFjJAY0Zni1XPN
         +QjHNPebArcv6suLlx5I7mOyatc+kHZ47n3/JNTRN/5Kvwde/Zal5cA/u8bq9BZ8Cc2I
         yBgVKqO5yVt9WEzHbr3vxtbhwZqxkqz1I0ObmRH8foaXedQBC+HSavptzVlnwRIBo0+E
         JthpKZn7H50pjPHFJLy/iijz5fszqq36FuIBNeBoD1hSbYwbNVIXhO7cWpONa1hOobZ1
         VNSDUKVFngldsVsHsRTn8FRJAZBZMoaCaTpXDTUUQsHdeS7a4WzDjlWW1xqDnPZEzBl2
         qGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876634; x=1745481434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Jl42SonUBh7uWEDi8GR/xF1KhzAcVX2ukREj09fKE=;
        b=rctVpvSJLY2ja8KUJvXMDvXKqMfrm7HadCcnaAtFUwV+viGFbwR0wp/fALDY/Dw46w
         DlupYPs8QDdtK+obdkb3WaEjsEWBjsy+bvd6sMlARfkUFGbRUXQQv03ZuT5FkHXX7lEi
         ZQMPHvIHYQh0J2LVA0kfmd+4um7u4GAxZE64r4TlnEwiE7cxSSnOgxCnprItEPiiPVKM
         U4penp0ng1LsaMGMoVzwTHFnQrqS5SKWy7eYgd1YX8e62QwvqjDyRmOurt7W4+sl4wrd
         06FBH/0nZa5V2kuLsx1Cyy6kHQyWPx9cbUNug9idwf3kSgsIoz7Ax7hwhA1wLtcazByo
         DaIA==
X-Forwarded-Encrypted: i=1; AJvYcCU/FwQKVo52rDYWz19VQ0dL7LNAARMjr/Bsyj+9AaYi00QrrPHNxremy8ZoI351oBvxNNM6FfHCyFpT@vger.kernel.org
X-Gm-Message-State: AOJu0YwZLjV0yCHMwo9F2n00lOqCOZh8UxBhcb3WfLjNem/QfCpkxzLk
	WZ/IcSddBTjp1t3pqsyFdQmf7kQEZVzSropQyWzx04opBReDgiPxnATjL2FbgMydYbVC/pSirJf
	014zpxWjXe/NKiJ/EYNIrQCbzChhD+cefiN3Ncg==
X-Gm-Gg: ASbGncurIGQqforx46xasHDyBbOk8XLadbisoP7TPAQlGa0hnA3uYAT6Og2XaL0CG8q
	v96gcBBgP/YugQkPRHaLZbmLfxAX/O4bEMWKlW2pWCqYmFJdKdqp49+gA3ZiNN9T96SYO8sT2eK
	LuY1EG/QCydbN79TZfh7wZHQ==
X-Google-Smtp-Source: AGHT+IFbq7ZcNiiPt5sbevvUX1breN319anukYgU/eYzOsa570CJPpK8YzBEG5vusdZekARs8CQoaMTOyB0+fg/Ao5U=
X-Received: by 2002:a05:651c:1247:b0:310:8258:c09f with SMTP id
 38308e7fff4ca-3108258c126mr11913731fa.26.1744876634235; Thu, 17 Apr 2025
 00:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:57:02 +0200
X-Gm-Features: ATxdqUFyphNfFRPd_Qt-ltWr9LjJT8Eu93B2bQsVaMpP0d1EbU0HffBXtAWIxW0
Message-ID: <CACRpkdY1bu11Gj95DQQBirkPDPzhQvCTqk+4FP+WhyuzxuLVAA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] pinctrl: Add pin controller driver for AAEON UP boards
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This enables the pin control support of the onboard FPGA on AAEON UP
> boards.
>
> This FPGA acts as a level shifter between the Intel SoC pins and the pin
> header, and also as a mux or switch.
>
> +---------+          +--------------+             +---+
>           |          |              |             |   |
>           | PWM0     |       \      |             | H |
>           |----------|------  \-----|-------------| E |
>           | I2C0_SDA |              |             | A |
> Intel SoC |----------|------\       |             | D |
>           | GPIO0    |       \------|-------------| E |
>           |----------|------        |             | R |
>           |          |     FPGA     |             |   |
> ----------+          +--------------+             +---+
>
> For most of the pins, the FPGA opens/closes a switch to enable/disable
> the access to the SoC pin from a pin header.
> Each switch, has a direction flag that is set depending the status of the
> SoC pin.
>
> For some other pins, the FPGA acts as a mux, and routes one pin (or the
> other one) to the header.
>
> The driver provides also a gpiochip. It requests SoC pins in GPIO mode,
> and drives them in tandem with FPGA pins (switch/mux direction).
>
> This commit adds support only for UP Squared board
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

From a pin control PoV this looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

