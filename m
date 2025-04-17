Return-Path: <linux-gpio+bounces-19005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E5A915C6
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 09:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9801907140
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0B8222581;
	Thu, 17 Apr 2025 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFkf4dvL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830E9221F3B
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876411; cv=none; b=gOAWDRROXB7G8XjN6QL9qjIIGgwnxWfdCSyLQhiPM0w0dIycopTVSxcxS6FeHs6BRAwU6keBeD2/0Wz7qLPpAC+8Frr1VcB/lCTSIoCWnLGcdW4iWOFrfepp7NlFZY1X75oIdDysrDxEqJWkViu9q/A/mMQdBwwuMlVG/e4r2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876411; c=relaxed/simple;
	bh=Q3+YaSQtPKXC0cuE5RjCpyH+Pf71thLokmXHjSKya4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBe7CAviEDieRh842abjG6meVgigDtoRQSNKDMAzaWe1ea9C0me344MW1ucXiNBxuDZ5jAhniPsblgYCNpVxDOBojsH5+W8e+UOx6yM1/y9Vq9hQM60OcM8c+lHaBJJRyW1bQU6r8wTZNtCW+L0qR2tR66OGdW0pQf0lRyR5AEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFkf4dvL; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bef9b04adso4688301fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 00:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876408; x=1745481208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3+YaSQtPKXC0cuE5RjCpyH+Pf71thLokmXHjSKya4A=;
        b=VFkf4dvLKxbatPWImfVfFhvjNhlfjCdJu7/w1DE/80tzosAQTYLLi89ink/uzEnaIo
         r0vA+MsYx5HR0C/6oUwgGNuR41Oo1+qP5QiOPA8eMcEqCYav84trJCq2k6Ga9u+CdltA
         RgINGCtHhm2WTDKsuxMiVM7vOPEP5zyClelnQ/vyvrrrbcfTNDLS+bpLx7RFkv3nE868
         nOAljNlMP3F437YD7qkAuJZ0VOVig8ZXIMmqaND6hSqsTjedZqvdAJyIrWXW/J8xS2be
         C6GPVc+i5gJsl9q0/Jm6WI8vo5phXiHz8QvNQT22k3ZBlmJj7qpAK9w6N+wBxss1mF1z
         MeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876408; x=1745481208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3+YaSQtPKXC0cuE5RjCpyH+Pf71thLokmXHjSKya4A=;
        b=k3XDCp+b7hnR3Vg9szwDuq/4mTQbpO78qImrM0aVEaftYSwtn8G8gjtuCijJyJQt3v
         +ZHrwQAMjBKyNjoDyUd0pIBoMdIRz/kTZ0GFsUHwCYcAhR40xUrdTWtmt8rFqk2FIY4x
         z7nEWG0MlVUiUGWuQWWhD6gTRtXO67e2AX0n0IlKvr+/7SLQ1mLpU3MDvrblyo4VT4kG
         hw8ghnfytfFJ8Xp9ucU8kd58/a8cjycKwv+ppcxcLigMEpUYC7FZIPX/2O41xh7yiAU5
         C9aHddDw5GoP1Xqwn4IsMs6v1oD2IEBnajuJEQwCJHu98cKzMqNWDXtrlbopvY+l0+Aj
         sTuw==
X-Forwarded-Encrypted: i=1; AJvYcCUINEFcjPaNq6WDO3+PMRtxiiEggBJd33RZuEMMRnBoaAOU3h7n5LrxmwzoLVoXsIYSRsoHRAoDz0WF@vger.kernel.org
X-Gm-Message-State: AOJu0YxdzT2XrEGahLhMlD6S4zJbmHL2GBM3EbrhC6EZx4YVS2l+mj4g
	JhLv+K9sSmitDdH6/c0mmn5ilSgNGZWl/ABkJ4cSEHXWmRa9onBl1BFJZLQsNYM8CY0qAV18fhd
	ygp6NswHwsYukvgNxeVOvutJGsKI/KUuIQ9A444xO5prYPW9W7pE=
X-Gm-Gg: ASbGnct6v3R8YvKX46aOBBrkC4f0xFKALSNiZaEhS2CMRM3A6CL673Wql9ky25lsD+1
	cU9cqoUmt5O4PlbdyxxsR0fbUhaX5CnPSydvgb0n+a8xhquCfEXHwK5pjlTZ0+PfJ+E0xXViQ40
	wZSmcV9f0H4sGXrHM2Um+dGA==
X-Google-Smtp-Source: AGHT+IG6fH8i73HZcByMHNF5RXrO9SAK28PBO/AFODMukbnw4fFfbSNlkijjqFOir4rIjJV1QWIs7u0W5Rh/Tw30EAQ=
X-Received: by 2002:a2e:be1c:0:b0:30b:e983:9ba0 with SMTP id
 38308e7fff4ca-3107f6cd893mr18106361fa.23.1744876407724; Thu, 17 Apr 2025
 00:53:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:53:16 +0200
X-Gm-Features: ATxdqUHbFi-Z7SI6e_TKuBrx9cROKcb5-SqU1LRW63Sr0A6JqXuYgLtul-_YeLE
Message-ID: <CACRpkdYo8bHYKdkFLLqkCTZzy44pk=xPri=E3ogXP=BiywL9zQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:00=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This is the third version of this series (rebased on v6.15-rc2).
>
> The gpiolib part has been reworked, the gpiochip_add_pin_range() was
> renamed to gpiochip_add_pin_range_with_pins() and a new pins parameter wa=
s
> addded. Two stubs were created to add consecutive or sparse pin range.
>
> For the forwarder library, a namespace was added and patches were splitte=
d
> to more simpler changes.
>
> In the pinctrl core, the function devm_pinctrl_register_mappings() was
> created.
>
> No big changes in the upboard pinctrl driver, only few fixes and
> improvements.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

From a pin control view this looks fine, I expect the whole thing
to be merged into the GPIO tree, so I'll just ACK the pinctrl
patches.

Yours,
Linus Walleij

