Return-Path: <linux-gpio+bounces-19447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F9DAA05EC
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 706BF1B62795
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 08:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF1A2973B0;
	Tue, 29 Apr 2025 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n6RwMuSp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201C2973A0
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915950; cv=none; b=dDQsuDZMXl1G4ClOBtdSEx3ubpjCEDkAov0qsw3JxhjaZN4qFZgw+Qw/UE7k7V1pOsJOaLGah4XYWN5j0xvXhevKVdHOexGoTfbJYudRNE1LptZQPzQDZITBXAKxGWA4fhvV1EfbUEp7hmmwsx2Qjbh8loV7ELKZKz3yaEZakhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915950; c=relaxed/simple;
	bh=UXd6ZBRFfyXJOZgQdgT9dBLzGRXvPHd03emOjSyDqxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szR5H7NylxzVYpKGGvrZZEhAnEttF7ycwNYj3CmIbC0nq4/YYhR4w0o5jkmf/dKjd2vVUpgOeMTcrzu00VLXO5gKa60l6aI/UN6qqkTm671YxXdVjShj66mOzL2EO/qbjTB5Mew6Jl+WQwQuiFclkNO3OKwzCHy8RpwQhtHaCAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n6RwMuSp; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54e816aeca6so6074426e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745915947; x=1746520747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXd6ZBRFfyXJOZgQdgT9dBLzGRXvPHd03emOjSyDqxM=;
        b=n6RwMuSpP6AkmsI/2yevJMtpE6g9Kd1dNdZ5AVb7T6G+NJ1G+k7Az5ONBmmtpDYHf0
         Lzo5QA7fdy5orVNAn/hh7qEXcM0PtI3wh2pIbqMPfC66nbwABl1K5/ymMnhv8Q+X9Kq8
         3F/uJf3JrHg/VEhbX4Ms92lbZ3i6O0lo7M2w4AwmOLBcmRg1DqQj6wbGZC06XwQj7aF+
         Mr6/3/cID6/FL18dwlqIXcHxaCCakrTxmksKWAMfTZtp3iDLpCqqOQOkfonYE09MVKi1
         BShVXIDgLWRbclOEoRgb5lPPLlYbr3hZmhqwcc0jVjTfWF4/dA6fYY9Z7Z5He5+v1eWf
         9rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915947; x=1746520747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXd6ZBRFfyXJOZgQdgT9dBLzGRXvPHd03emOjSyDqxM=;
        b=cUJBoQRvhjDhE6gvUTUXtTuSl2lPfIQhpvdfKFnFx6Okz0Fk0Noz09+YZpF9MNfCrr
         bnfiKkgrF32J5/0nYgN1qcPNXHsHojt8FUFmgQmtZTwsk82Uez6FkkiQNXIYIact8O9t
         9spcxg06wD4fIto+O1GoFyWhXdbwoSxk+Cn1XGa8WbGLsyPyD8nNDCjEIiEf7FlsDEa3
         6YC5nkcSW+3oXxiASL/mTgiEKweX+9sJX+jZK7d85Jt5/+t1zSi17Hz21xG3tmHdQdNh
         PzO9iHRR68Jr4jQY67+1ENtNiURqmwGp0o92hBiKgwkaCkM9g4UP+l/zTO5978unCbD/
         c3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXyXq0h1Lo5NHmsZASrrvCqPTOsiskrV1mQbPHl8ttaPy5FwRpoybUPAikDiLubna/zW0MDdDrmToj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1uQzE0NC4p1Oz786/I2fNiBpjGeIIV5cEr1ShnG9HdzicSEyd
	SRczyU6xQ4NAdlGzPuw2Ekhk0u89Fzzl+3aNC3LRw7tOHmUICz+f4uDQ8pf7Gzm0WqXCXWWf4cy
	QPc9OtKB4gsDLMU/uBo2iXkoVOL1FoYP7K6Dt6Q==
X-Gm-Gg: ASbGncvWF1vT6iC0mj0czlGYJFYS8eCc7J9oeCBAIUyl08ZotsjmLXvYW0m/eOL5pZW
	GAYMwypptgFcZ5hZ4NHwYcRf+CmPziN+MwpA33rjWOI/o/NCbMPzQTBgUBmpBrtYHO3vvM0e/Qy
	6QkpTFHd7LQWA5lo0C4AjS3LgQ2eRwfATE3a8N+cqk11JO83PgNEuc2O8QhneWX/MP
X-Google-Smtp-Source: AGHT+IENnVjqUwXNLAYDfTiNrsEIWwNs+6d+NpV5FHnYd17iK45VPUqKM3XyJFL4hddosaZTQWV2RnYYV/NteWYUjPg=
X-Received: by 2002:a05:6512:400c:b0:545:5d:a5ea with SMTP id
 2adb3069b0e04-54e9e537c34mr615854e87.3.1745915946982; Tue, 29 Apr 2025
 01:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org> <20250429-max77759-mfd-v8-5-72d72dc79a1f@linaro.org>
In-Reply-To: <20250429-max77759-mfd-v8-5-72d72dc79a1f@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Apr 2025 10:38:54 +0200
X-Gm-Features: ATxdqUHQUcFHUAFI3-nZJt5a9IRI1ekBnea7Lczn1CqKEhZ8m8SpsIrkkBLDoLk
Message-ID: <CAMRc=MeizZec6YkYhNDEh4kE4hRO_wJccE=iy0-PKu7uX52u1w@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 10:22=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

