Return-Path: <linux-gpio+bounces-4204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD578751F1
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 15:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87E91F2659A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 14:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEC21DFD1;
	Thu,  7 Mar 2024 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOdqDMS2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4361B96E
	for <linux-gpio@vger.kernel.org>; Thu,  7 Mar 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709822070; cv=none; b=A/Ryy14AjxGjuAu6m8yj7/myfiQWAEesORwIzdQBW6Tshaqg4JkkyTmcEJdrrHTw48MzpO7/DgesEPe0GdFMgig5uHUWWqs8K520WiFaXjjkEk9ZZZ5sA6p6lWk4FRnq4o5ujbYS9QvfLVUzA5etOK9vKdV86aCvcsbR2yMOVFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709822070; c=relaxed/simple;
	bh=f09FyQK6bbJpMAO+lRmbYEOGtoF6bKnHbS4uczC26iE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShMR9PzoRAM1h+nrzAUka920lohDbZ+7Y2SLUNUjLUXAxXn+851/AfQ7+ZwGnhmWYcrZBxENXyziHFITnUM8kEXWVhOmldtXmAD186CQ/EEGu6q/xGBdpmwIDvT8T5JotdTK2e7ELNXX4ITS3wWkT14a5RLjHyUNZXnkeyXHEa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOdqDMS2; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so992803276.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Mar 2024 06:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709822068; x=1710426868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f09FyQK6bbJpMAO+lRmbYEOGtoF6bKnHbS4uczC26iE=;
        b=oOdqDMS2MGMqVO3TvI/YP1+J//YTmRntjELebKv/GcJ7A+xTnHa7/UV3Ms8TYkgb+P
         D8pWHKsee2VXblCZbqtLKuUF9IbvuXhCsNljtTmTUZjT690FxVMF5+WV3r6uJyNbVCJs
         XYGO45vC25pKQE0NxV3K0gEXgJi9SMP/54guXob9L9sPmqazbx8f88ANAf7zS+2utPnR
         Z58fSXxKZu1Mz/9Esm9Sz0pYenNDow4IA391XJfgtufSaCIxg7cDExQrgFmb+041n8RM
         Zi0roSi9AMuC2JhdBf8o8vkMgx1v1z3cFPj7qmpjjfFd2nMMEEAIL+VLvmbT2Q2bzVHa
         er0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709822068; x=1710426868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f09FyQK6bbJpMAO+lRmbYEOGtoF6bKnHbS4uczC26iE=;
        b=LNUGGr+2be5J7xIgGzJVFgGXrl9mDYiZtnN+H4v6th0BPWrYaFqT1rEE6ANTneKMWl
         Km3ln566Hw/Cp5KksOM87DG4EQPqLjz7yTZdbaiEk5VJQlZ+EUI0NSJl3j3BWoU66zBW
         XePPXS+AM1o+k2aipbkUxpY/Ahj2b87pkruRp4Gp3P/W1351K9S8c0FGmZONBykpBKTe
         DGyd3ZcEgJNLcTlta4dlIoBNuvsQjdpmJxPhmtbxnmFE2H1RAobpL8JsFiZQU2OU8Eu/
         5KaWVV39lCEJHw+zlbdPU62nMCrdmsIo/nCuHHWCW7LBKlClUktwP4SfZOw5nE3o9rha
         Lcww==
X-Forwarded-Encrypted: i=1; AJvYcCUg43A9IdUcrWCFkKwJ6tvrA+KzycN4mA++rAkLl1+KGNK1Sz0sPHffG7jmAZiR4zXy7BIur4pfxJ5q9QDmlwhd/j9rrewUiG0Pzw==
X-Gm-Message-State: AOJu0Yz6j6eQ5PWQ1yuSVRBqkda8m8xYiBSI9GbMSJ1ud1gMF5ruZrDS
	zN0Nj/jCCi2P80CJCf8gqoizZNOMVlm26ogIWLNrwHYRXFKREZDWj+7ND22W0o7MuXUEWdtyPlq
	Lqk4xkjmyO/yarfwLGsLiiQJSK6iMFzeTE6lw3g==
X-Google-Smtp-Source: AGHT+IGtJf/U9W1EvqwT6Q6TAft9E+qFFl94fV/5gzwSC18F9/F33J4riY6vacrvZrkIUxqHcu1Irh0E1nLCimSCbtQ=
X-Received: by 2002:a25:abea:0:b0:dd1:ebc:ca2d with SMTP id
 v97-20020a25abea000000b00dd10ebcca2dmr3363260ybi.52.1709822067776; Thu, 07
 Mar 2024 06:34:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307140729.2278907-1-arnd@kernel.org>
In-Reply-To: <20240307140729.2278907-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Mar 2024 15:34:15 +0100
Message-ID: <CACRpkdYOofmWd6=_XN0+FWDJjp0W8vV_deUZbNOr2n5BkGaL4w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aw9523: allow building as loadable module
To: Arnd Bergmann <arnd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	David Bauer <mail@david-bauer.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 3:07=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:


> When CONFIG_I2C is set to =3Dm, the new aw9523 driver fails to link:
>
> arm-linux-gnueabi-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw95=
23_probe':
> pinctrl-aw9523.c:(.text+0x9f8): undefined reference to `__devm_regmap_ini=
t_i2c'
> arm-linux-gnueabi-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw95=
23_driver_init':
> pinctrl-aw9523.c:(.init.text+0x4): undefined reference to `i2c_register_d=
river'
> arm-linux-gnueabi-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw95=
23_driver_exit':
> pinctrl-aw9523.c:(.exit.text+0x2): undefined reference to `i2c_del_driver=
'
>
> Make it a tristate symbol so the dependency is correctly honored.
>
> Fixes: bfa5aa367a82 ("pinctrl: Add driver for Awinic AW9523/B I2C GPIO Ex=
pander")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I sent something similar yesterday:
https://lore.kernel.org/linux-gpio/20240305-fix-aw9523-v2-1-2dc50bab2b17@li=
naro.org/

Thanks anyway!

Yours,
Linus Walleij

