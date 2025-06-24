Return-Path: <linux-gpio+bounces-22090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4FAE6F9F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D7AC7A2A80
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A755424DCFD;
	Tue, 24 Jun 2025 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wsa/htUH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDA3074BB
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793592; cv=none; b=ltQrbLKEpoOIGRdsNsSdUStdJlLAcAHE3QfuxI8RDmJ8AJXNmewDmVWCId4IuXX1P6S3TcAwo4k2hORf+8aTKmwt+SzJP903Po8hI2Q/q6er0V4Ue+mTy7OJ9MYYSXAsdYzd/74tuWqQjHPhrz39I0t6DQDM7Oaig2HEDv3wzcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793592; c=relaxed/simple;
	bh=+FJOqQLjKA3FPAz9/u6VSLqCQ/dFJns2Rrsa9m0Gy9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsO1RopXxDjVszE3YzZIeWCiAwXqF2usdfyqOdg5aOo9zxkRnZBY9Ydx395E0+in/HlgORWoF4q8GnuQK4aplmmn75aUm+9rg2GtrjIjst7NQoJ1FVLqcs6m2WqVwPy7cUvhs2kTb6O+/dR2KembcUa+IBW5NT25nJIdUlcMgow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wsa/htUH; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553e5df44f8so4293679e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793588; x=1751398388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FJOqQLjKA3FPAz9/u6VSLqCQ/dFJns2Rrsa9m0Gy9w=;
        b=wsa/htUHe9gSi9XPBGrBWNnjwlpKes/cqIlTI4N2hWACc3FNgXf1ko/ObhQ1c4xD4b
         hIZe0PkBOESMZyVu+ka9oNW5Mg3SdKYt+5LluAAVyNJDwdKaDRTzYgPdII+J0wUDzlhV
         3XPYS1vm7T1KZBKzJf4q+AQDiXLJVDZ5qutbWFRexrgi5JPD4Q7HzZLqoanLweq13tuc
         AxxAgyvBuabMgLm4Htr1YlRqdSPcPQhNfEd4wssclMbC591W48SNe9MAp4+mvZB66WGH
         d+ZyWifiP9tN+/pyuAsL56pmzV8MdQ3AQ/Oo5/ffgGCcbcD2URdoKUXH6xpu/HaD/ecu
         Le/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793588; x=1751398388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FJOqQLjKA3FPAz9/u6VSLqCQ/dFJns2Rrsa9m0Gy9w=;
        b=JrIc5dsNXrThCOcBA/IBWOHTn6DKjnv2yIzotQ4Rd0l+qkgZEB6+TcRN4xW9uTXb5Z
         wfoSK6N4Vu8cfGmJFlTmKe5s5VOzInIpTH/sugRpPS7kuqn7Sz8WZTH2fT6MW5bmWr60
         NkehN0e+tD2RdilZ3x96O8c1DkzZkYOF61/P/1xae6wk9DcC6U83MOvmNFzoYVb97Z+l
         /9qasqyXkJ0FNz4/49VnBlKfCyZLFIZaV6Ki238p6a23+FMYPeuX+zSSiCvR52kboSKn
         srcYpbs/VyFR8+SZTXCaLqwj8AlgCp9fMM4weehyEOB0f5ktimjSGRP1nyQ22CbVWxRn
         4jMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXXLj511qbr76L3ub3VlT+E/jJTNvASZfx3IRamubi/5ph5rqEGrPglWBYxQrbapdzAiLnIHe4FSKO@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9gS00COYzAlaONV4gNv4Ahe42CD/QGTtfa2B2j0wt5ng46Hm
	6/Awd1WdK9SpuBGqe/Z5wCsedgd5Nzepm8xb6IBOuth/m/CqaAuCIAHjhNcZNqSrqawwBC0ZqH/
	mxUKoJC1Gw8CARbeoG/TLhHeJGqNz11AObT0YBDILzw==
X-Gm-Gg: ASbGncupjF9TGJxmBT64q1gjpF7HW2IfjkCDSRYTRJQ+tKmoJtJmHX0oU0pepxbrV83
	pZ4W4uhtb9P4VijFZ2Hzyvj5iEVu+JJbiLwwT7NFrdNC5tHb44jRdhEkcNU73KhpwFSJauV+XkD
	z/S72VpmTO7fSriFh/gHQpE2qHMxGXfHgbLeNjWO7pbWU=
X-Google-Smtp-Source: AGHT+IGZ80jgQ5/QaQU6b52jWtgaL9I0ZMEDcbGeKLbU/YqRy3STTYOhxJTbm3ezdLgBlSaDRi5TUbGoCbNvvI8AGuQ=
X-Received: by 2002:a05:6512:10d2:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-554fdc6cc68mr54809e87.0.1750793588187; Tue, 24 Jun 2025
 12:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-3-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-3-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:32:55 +0200
X-Gm-Features: AX0GCFvObqqxUzSNF4PEsyFmzcRMOPhN1kQfNrt2apYQSOJRHnBBo_oA9pknBOE
Message-ID: <CACRpkdawmYNjWqeSnYNzdX6OB-avhBs1erydaW9zo2pa2ZB8hQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] gpio: sysfs: pass gpiod_data directly to internal
 GPIO sysfs functions
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> To make the transition to not using dev_get_drvdata() across line
> callbacks for sysfs attributes, pass gpiod_data directly to
> gpio_sysfs_request_irq(), gpio_sysfs_free_irq() and
> gpio_sysfs_set_active_low() instead of having it wrapped in struct
> device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

