Return-Path: <linux-gpio+bounces-21332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B91AD4E11
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13D3917C83A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D281623643F;
	Wed, 11 Jun 2025 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KWZ82OQG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4FB21A45D
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629788; cv=none; b=s6QkXGRq5bY178wXoElF9DSAtPlcMwVMsySLPLRSKdtKb3StVdZVG4m8F5W7MGn1AdIfDuO6A4FST9RjEXr2M+IM1eL5xDeUlDXHXWtivLOc1WJQvNIsQbKWYpIHeScXqZsHw08wCd38TIkmVadC5B2NsIT+W1Y8CuxH7OmhcWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629788; c=relaxed/simple;
	bh=+edy7qtTEHG7Xpsy7/yvwDq9/uQxNLsTOhXcpVrSwkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2cJpecL0hFVFddwNStQwKWfky2xKFa8RDb8nvvXe9knSjLz/FeaVyDGNEwuzB3n/GI8uDRtU/9H5IPIWUnbA9thv80TGGeXaG7pddt03irNw+ibnW7V/bdmn5YNPeFPKQ+IhEorDIijNp17JpprVj1gwhdZqJIBpg9QQYqPFoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KWZ82OQG; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3105ef2a071so66685681fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 01:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629785; x=1750234585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+edy7qtTEHG7Xpsy7/yvwDq9/uQxNLsTOhXcpVrSwkc=;
        b=KWZ82OQGOYXUpE13AsGbNPyj274UEdKczArgUuRf7/p3129a78YDTJ1qL7zFc0aP+X
         Le2bXf7Sm7okyLQQIa8Q4WOyHMec/ppFRLHadwkw2GPNmrc9bLdqe2pSE9vFSkWV/m4+
         dKn4MAnoT8MzCx0CDO50gbAq9bCLxkvFEw3YpEfX5YMCwzQx+CiR1BjnBODd3RH3B0hm
         Vbwgq/HYGUwg3H7dlqB7Zu9aovHkYtUGdy1G9lqx2/DRetWClrlMudGDhoeR5F2C0P/o
         FfA0QI+iB0EgR0LwMTyDiVAPhIakrTdKDLXPXkTtcz+YgHw/bDzdasz9Th6rGqFZNl21
         GseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629785; x=1750234585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+edy7qtTEHG7Xpsy7/yvwDq9/uQxNLsTOhXcpVrSwkc=;
        b=jDdIyulsB+BQqpb2Xcl1WNkR1rHZKuIGQmKjCWskSgs9swNpOTP+S6PiQ5Ouoq6VQZ
         xkQOk3HGzSB3+sTssqhFwElIc/eFN5iXM2H5WSVUHPfU7DwcFuyie4RfJhJvNv5h5NcH
         /aomvVRPU7fCc+HGKUtlxvC5FBLvo1HAK9uGTgoYVt1iVR3MdiCOZa0zFiQ+PPd4pr0D
         AQiNxwxgRCb0AL/y6KlUI+uWcDP9QSRCJR7XmHrHb1tgheTGyLvImRQFiuuLk+IcWoXH
         SCoChGSXHEFy5B88qxar3B09JRa+dyscJFp1xw/5x3v0b9G7dGxgYufkkzGANfZLLcK/
         vl/g==
X-Forwarded-Encrypted: i=1; AJvYcCWYrzr2g5jNjHo3kzzcVSgxxXinyDCSRg7ma7bdLEV6aeD9vrewvk+MBsZNTPUo65pIStM14ax5vdE5@vger.kernel.org
X-Gm-Message-State: AOJu0YzGLmDLPRF7Fe06j/vYCtDv6iwWwJyGVfzB9ZC5r1aXtTKxI9L1
	TtxDrWozZE8nReFQe33jIxKdEyvn7o4g5mnE7OYfLrNpj0MG5vDwL8kB+vLlQxzusX3H18pthTq
	LuacUsJZpagejaJ3EoWKXYBb8nDNzzVJjOphQZpXLDg==
X-Gm-Gg: ASbGnctmPJezyB+4DtaD8cmT+7vtL91CfPMzbog5bgRUC79YC8KvNebDuEe0gqxnmQL
	oJRsH3AgVVpsEZIG8abXL+Zh2ctDP6wFuypg2ZjoIw58DhJLL9fUNDxF2HFcO50xke6+nGcyR3c
	uxVyW7F5/B3Lu8BP1aAf95A/6Nha4EJLaJhs4To1sAfw0=
X-Google-Smtp-Source: AGHT+IHH1hH6JchkbIAW/Na/IOT2Q+HO0uX/zRCZwBszAKd46SD8mCleQoRNeDZFhr9ICFVN3eRLzunR4Iu+iOrppWI=
X-Received: by 2002:a2e:a781:0:b0:32a:7e4c:e925 with SMTP id
 38308e7fff4ca-32b223d1f3fmr5281631fa.21.1749629785160; Wed, 11 Jun 2025
 01:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-3-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-3-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:16:14 +0200
X-Gm-Features: AX0GCFsmra0zAZkpI3W6daJ90z0p2NXXoO5pFUNGj8TbbcP_336w78jjco6DTwo
Message-ID: <CACRpkdZnwA+tEuthZXKaDPobOMCM5K_SJFZHfhErcO6uRoV0+w@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 03/15] gpio: sysfs: call mutex_destroy() in gpiod_unexport()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> While not critical, it's useful to have the corresponding call to
> mutex_destroy() whenever we use mutex_init(). Add the call right before
> kfreeing the GPIO data.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

