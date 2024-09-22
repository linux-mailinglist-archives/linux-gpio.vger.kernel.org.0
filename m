Return-Path: <linux-gpio+bounces-10353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD097E416
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 00:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 585BFB20C9D
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48D574063;
	Sun, 22 Sep 2024 22:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hP4q3Fmy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC00D7E1
	for <linux-gpio@vger.kernel.org>; Sun, 22 Sep 2024 22:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727045071; cv=none; b=Gkg+m5GjvQl9mUwv8g450n+ezCY6yvAJF/45cqf5nAG8QeDPzl2FQdeuT40LpuIhmozsyaCp/y9R0H1UckxqYUfxwl3SV+vaA5kmEBCOIJ1ynjJQ6bX3P9tGxt9SUM+wUIIVOeLKNW6Ayh1XeWmrGqn+NndPrBilzxBXcRJjuVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727045071; c=relaxed/simple;
	bh=AxoWEMSF2afrRNVb6Le3CZZO5OHhKg+oAtVREcH0qMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPo8o0e3No9p+TPhDzHOcgXDWs+K1u9t7KqGkM30Ir5+Vc9tp6eFe+n00hrdcVnYWVDBLPeutseLq7EXNS7Sgw7grOndFxfhlhe5WoaDaRPc8WYqrNhoVPC/CpG3S5WVsY8atbm5hmLtWQ+sYDClFsxGyGjAVXlaL363bEog4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hP4q3Fmy; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5365c060f47so4361122e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Sep 2024 15:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727045068; x=1727649868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zi37GgBqt/FMeQcWw4DSw8fPwbO9oh8if3fpRrLyOAg=;
        b=hP4q3FmyfKVqOWthG7yabCSIIKrVEtpYaBP8po8M0eWztPGbFANwol0US76kUS5WOD
         /IOMQ9w1OOVEvtnCEd7KH7IVWfAKe8UClqLkyOl1qQnjh6zP6bFrSfvvdb+Y+hicEQSw
         h4HhtgafWEww1am8/p527YZ0ewn0sFpTAIBOLvrem+0Q1JReCeWhNW523AbCN4segyvq
         ayY7RsF+2MsLjzJZV28Nrnv7jtWdgxBxTB/8hggnjQD1dcxUrARZpDDkX+ErEBcsuvhh
         reTNaXGmK6vqNFTD4zIDBCxM+osPkB3eq+/HnlVyaFcOn4fFBXFwn6QeozFdk7Ono18/
         aesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727045068; x=1727649868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zi37GgBqt/FMeQcWw4DSw8fPwbO9oh8if3fpRrLyOAg=;
        b=ugTSOBYIbIZp7WDLVgJlGqtKeWPlVMW0HCDcDCIheb/J38K0ywSVFzPejMZstksG35
         12y0VR1ezOlWVZ4MspPBeturxi0S0sGAeoiqKFvCSjGuw6hJIedZ7LqKP5EoTuCwHwbN
         9sTCaF5fFkGh0eg//zy+nofmE0gQy8h/pELKtKkURAHehvWrJAc1kNWQLJNegDklmGgb
         G3JCFAmZF23ajzojraWlodXn8Xgbyd4Socr4BNPzga1jA65kGroZpEV+UQweb5My7nPY
         kJHE6mmXZZONBhZYmZFiz83ihxtjRaMzVsOHeBfnp73fUQ7uzSKEkTNNSteTZcjq1C33
         PD8A==
X-Forwarded-Encrypted: i=1; AJvYcCUspobvBUJOOD8FftY5mjZN54Uhg+ZFDu4EOgI1cwTxnd3kpzcGiWHxflNSbtJn/XTaySSwXZYdaQlS@vger.kernel.org
X-Gm-Message-State: AOJu0YzOB/rl9p9PvCV/zsDMhsaRxLTqP8kMFkHE7e07CvnxSiEVN6FB
	GONEEGcKQQSRdVCOiIUIZUEiU5vrWlkurqR8cJBocyvj3MEe6SUY+RygrJAf8KD4DQDW7JOcZZm
	tAfIHUz694S2fjwC85E7/dk9ow7wmY0TwK82qyb0VRmpe4lgU
X-Google-Smtp-Source: AGHT+IFYyiKW0YjXtC3WqpA7igtfMapwMNpsgT6Z9Qia35DBOVqyBloMNmFoU6ubCESfoRQywEHBcgfLyATmibHJjJ0=
X-Received: by 2002:a05:6512:1309:b0:52e:f907:1023 with SMTP id
 2adb3069b0e04-536ac3400c0mr4386324e87.49.1727045067265; Sun, 22 Sep 2024
 15:44:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919141014.4000958-1-mstrodl@csh.rit.edu>
In-Reply-To: <20240919141014.4000958-1-mstrodl@csh.rit.edu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 00:44:15 +0200
Message-ID: <CACRpkdYO4Y_1ZhCw40_2tz70D728hU8aGCThQCiewjkbwboTQw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: add support for FTDI's MPSSE as GPIO
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 4:10=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> w=
rote:

> FTDI FT2232H is a USB to GPIO chip.

Just came to think about:

> +       priv->gpio.owner =3D THIS_MODULE;
> +       priv->gpio.parent =3D interface->usb_dev;
> +       priv->gpio.get_direction =3D gpio_mpsse_get_direction;
> +       priv->gpio.direction_input =3D gpio_mpsse_direction_input;
> +       priv->gpio.direction_output =3D gpio_mpsse_direction_output;
> +       priv->gpio.get =3D gpio_mpsse_gpio_get;
> +       priv->gpio.set =3D gpio_mpsse_gpio_set;
> +       priv->gpio.get_multiple =3D gpio_mpsse_get_multiple;
> +       priv->gpio.set_multiple =3D gpio_mpsse_set_multiple;
> +       priv->gpio.base =3D -1;
> +       priv->gpio.ngpio =3D 16;
> +       priv->gpio.offset =3D priv->intf_id * priv->gpio.ngpio;
> +       priv->gpio.can_sleep =3D 1;

Maybe you want to provide the gpio.names array for this
device?

It makes it easier to use the lines from userspace if they
have meaningful names, it looks like those may be printed
on the board on the Sealevel device.

Yours,
Linus Walleij

