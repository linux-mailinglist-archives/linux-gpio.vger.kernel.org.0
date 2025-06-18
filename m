Return-Path: <linux-gpio+bounces-21757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F69ADEB6D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E09A816749E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD022C030D;
	Wed, 18 Jun 2025 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcNaYx9o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840B2DA753
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248558; cv=none; b=A5OBCVCDqIDE6Ytdmk9a7OB5kwuU+CF7UXODHqoYqQau1LfgJb6K+TiNKqlmyEc5ZtewRYJnpsUYiACwil7AAWSVrSTIxeNtRpADy8ogdIAOCqwwveJ6jP4oT4zK/qjQYjRyYiRAsNJQEauLa2OdAXCS4JXiXrcsazIKoQR1PFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248558; c=relaxed/simple;
	bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKMPu9tzrQTF8KfaYtnjw2yoGhA0AaA+5GddaJyryVijOLKaLE5RRitEy0Ta5HZz3kp6GVYvd7XixoL6ijbkiOb0Apu0iOfAU3wRvExvbb++FPhjdubDz9okul3atnBHBBf2AftQNib41wnBDA9Q9fxnte3jC5Jbv2pMRViWlF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcNaYx9o; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553b6a349ccso4471495e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248554; x=1750853354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=fcNaYx9ocTR/+8hYqOW8FhFboXUL+/OQgeECOYXbcA53Qi8IqsOXoSpOo+6oDzPrP0
         pCLE+4yrCBHChGIen5vnic+pvfxEB9pE+5T3hw+6AhG5x1eDl655GTt0SRnBfVvQ2gmf
         b7h6Xe2GOTTf8OtPz3n28Odx5zfYI6xWqZYos037aFunRWgxxZsshgI/Gnq55H1rn5WR
         zpsCZBue4eKlZ9yh4qSopKRVUp8Zc62GyDmMqXjQgNvMyrK8+huzk6upXdzPab2cZvcP
         fFYHb45+yFbYmaejUBnaCUhVi8BpIfdD0netIFmOnhZgsqOovX5Y01sORd8rjq7csFfj
         GOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248554; x=1750853354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=hHiqWtLPiN9haTVzn0Y2Cc9vlLziVyM0cFqIbjzN5p+JKfVqgwKrPMKTTLvLz3njhA
         ZMMQ6rvYsA9K5vU/V23rCUb66ebdIf7gUrLOsAy/427fxvZH6KuXyVQof0ieRkwn61tR
         Pt6jjj7sZYc8bFcde+aj96i+65gkTspNhhb9NQYBq2EGVpMYOgvvTTk6LAmYDCM3uDFH
         6QlFOEgZnJZLtpJDNRUTDy3xTsjWldE2cqjrsoY6yXmtH8XovmDxyHrNiTehXPMSzBJF
         bznrqm4NIogQVe0sGrUclLtyDYF/PFQDZJgL5CZAaGWY8Q0VzlWlsqj5NR0ofoUnXynH
         dQ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYDkB6jNUXJZkktUqXfIE/Lq1umWHzXyqQk3zzjoCE5QSlhCruby/m97+UxvGbc2QIbnghX0KtO6/D@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7BbYAuih1SmZ38sgJwS5gOTM+OzWEJ0Vk/hkEMsuejhYBAs1
	h5/YGxFfLp2z9VNAu3HYms7exFhV5TsdGcDn9lEC2/GpqkdQI8X2tExGjsSJ3edIoNCQ8gMPFlr
	SqFth4d+pugFvU6bb2lpN7GKjzLwETi2ZVi2XJ8VcDA==
X-Gm-Gg: ASbGncvHt/Da2BdBr1BqAHyaY6xZ7b7QaOOtNFW8DssbsALg3zZ7jje/SS4SkEW1FzA
	fU6faLPp68xmQbQbqtGCNJo2xabzI94tWzpmkci4EqHc5JwwgWjVaGFBlLEuMwaSS8OBUQN43Qh
	+xO0qhd5OkOnOSeJAbknF1lrbJaUL2BN/Tc5nc4Ito/LM=
X-Google-Smtp-Source: AGHT+IGC0m4FXYYQm+k0AXFCSy3bx6F7/2cTaiKhBBnuAbB+6N8ybTZnHZCukOOueaHxtyfLbUpPRBURy2oO4IVfhl0=
X-Received: by 2002:a19:5f17:0:b0:553:ca33:46f with SMTP id
 2adb3069b0e04-553ca330808mr1234493e87.29.1750248554215; Wed, 18 Jun 2025
 05:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:09:03 +0200
X-Gm-Features: AX0GCFtzAwHH-ht5UUznh81aEY-DCCdnUYFURG79_8pBHXv4vb2M7QItIyT5tQE
Message-ID: <CACRpkdb3+uQ=PG+ne48hyvdTFeEQBxXtq3CwxpqEmd1m9o9fNA@mail.gmail.com>
Subject: Re: [PATCH 00/16] pinctrl: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Support Opensource <support.opensource@diasemi.com>, Baruch Siach <baruch@tkos.co.il>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 3:15=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts remaining pinctrl drivers that still use old APIs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij

