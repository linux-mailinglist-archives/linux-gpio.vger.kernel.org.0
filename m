Return-Path: <linux-gpio+bounces-23704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D643B1035B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38C457BC8B7
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51862750E8;
	Thu, 24 Jul 2025 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Frpe84D3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58F8274FF7
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345268; cv=none; b=gUI7eF4bMnGG7FtOKZQ/C0J5JaYjxerDpYS5u6B05wZUHkoQTVuUd0NPX8JKHqP5jWn43VpnJulmjOsmdM2DdyfvqZ581BIoe/md8y9JIamNaE9/xe4hx/nA7uDAFUoiF1ZZ3mf69KwonbjLKDNi4Nhk5Bj0ej99zY42D6SZo6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345268; c=relaxed/simple;
	bh=Jeoj9tglqbA1NMZVkivEDbgZNBzAjFEQXNqjJ9m7z5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCSj2kjK+90wI2IArTkFQcCS0lJq6aBQonctmi2O38+KXUd+ewDd1Jvdkhe+ZRITsL+bUDuHlHvlN/p7TEhNTrcniorTlX8a0swLNSpGXUYxcGpaYrzbqG/r3+3TaPilOl1Dktoz8fSa/S2ZU+4Zs2YLXpMzvY0LFlM8Bstvtoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Frpe84D3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553d52cb80dso830584e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753345265; x=1753950065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jeoj9tglqbA1NMZVkivEDbgZNBzAjFEQXNqjJ9m7z5o=;
        b=Frpe84D3xSlII3vYvrPxAwgIQtpabuQwWMFE3c3KUAXxCkfQrgGNUL7Sh/G7DEtuVK
         j2vjXMY1a9F7a5otz2369xL46/oJmDzWg+pmYMBq6mU2kQtJxzgtVPyaD+K0CK+pLofg
         U5ferSeiDPo/Ki9a2iCSfqSkPLyYH1w1R6x6898fnohYJjZ1Tyi+bDoMz3+AhgMxxwo9
         ylmaBJO2BAHseX25OGIMJ/hxLw0I3IWHo3BpzNEhFSu9UmmPa3qDVhaQQwmINDKFwjx4
         NAxT0Ql84W2ZN07NpuUoHaZX2BqkAfO6+FH496fUN5gT3m3Z4cTjhA0/GxBYgbZSH/9z
         UQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753345265; x=1753950065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jeoj9tglqbA1NMZVkivEDbgZNBzAjFEQXNqjJ9m7z5o=;
        b=bdrnbDbaoJ1HqFDLbFhkXRbk0vj/5h04tRFZZOR+98VS1J0oK7aDFt68HQE7CVjr7M
         MMn3ioN0MOx5A8AQJvYsxJ8mYp5MeidmiVHce9y+KMWqxHp3U5YRKHz1Ht10KAb1O4CJ
         rISAlVWBNz6dOhqgnQrC3OvgrTB3a5z/Z9j5uIlrSXPgC3ggjPTOpBglpslAnh5Xe8Jn
         8c+XgvBZFqVLxN4KA4cKB2xcNsN009EeDyx/RLN6phj4rSV7UlGEHa12gSLAULtSnNf2
         6eqhPagT+CRNLepap3tLu/mtfjY3HW5TYRsPnLicJdagD0urdoi04N3vlW6Qf6LNOLNs
         +smQ==
X-Forwarded-Encrypted: i=1; AJvYcCXicUTwQJhDLoumwJBLYBGn0eO7SbU1yl45e6QdkJBZC9wS8TceOsGZPrhPeFH0tKzBsp9h4O2kDddB@vger.kernel.org
X-Gm-Message-State: AOJu0YzbRUWcaBCb5jcKBYCan/5nrV5RlHwxROSOF+qNwnw52W+gAwEk
	c9Csi2P5KNLeuNs9/Tgkt2MS9NzXzYGBTQjFWa5FEeN/RWIvwWWsamB3scGuvdHERLVt7wGrlZw
	7vCW9LARtLgRld3N19SkOaLnYwYYeK0wGpGWntWVIWnde2u/8HQ6v
X-Gm-Gg: ASbGnctOr5tjhpq6sYClIH86ujHsWJ7DrWbgK3EdmBiSnl90E4F24LVjDgxvIZyG96K
	ovrmdshjyRGawzcvyiB/3Pwih0Ht4FUn7Vt+Q3sMNr8jqRgUjj+lWgDdOul24i70m/GON0af6Pb
	rLnDOz4v3TJ+xMv/5SSPd21QDG6tRcgRqRX/hJ68fwrcHMG2JtjqJuwl4goGmIaSCdlsL1BUO6P
	XQRNH7y9LbzWYfrQg==
X-Google-Smtp-Source: AGHT+IFgj4NWeTcCOklpWerO2NLRG1ZV07PkzHyWzYdoKpwy1nHtaHQiocPmCwpZPKGCesesIznxt7/Ce26GvJafkus=
X-Received: by 2002:a05:6512:4028:b0:558:f939:4435 with SMTP id
 2adb3069b0e04-55b558b8ed8mr426827e87.13.1753345264967; Thu, 24 Jul 2025
 01:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722071542.19030-1-brgl@bgdev.pl>
In-Reply-To: <20250722071542.19030-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Jul 2025 10:20:53 +0200
X-Gm-Features: Ac12FXwgRHrq4Y_NxH7wnxF43eHBfmddYtdiL0ONyJqVi-ngRTs-yiFQQ-zYlLw
Message-ID: <CACRpkdYzjrU3Rz08tkGOCBvmcdKe30zd1f0m+iJQUX57sjQoPw@mail.gmail.com>
Subject: Re: [PATCH] ARM: sa110/gpio: convert set_multiple() to returning an integer
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 9:15=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The conversion to using the new GPIO line setter callbacks missed the
> set_multiple() in this file. Convert it to using the new callback.
>
> Fixes: 9c3782118a57 ("ARM: sa1100/gpio: use new line value setter callbac=
ks")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

