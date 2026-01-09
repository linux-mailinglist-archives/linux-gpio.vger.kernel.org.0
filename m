Return-Path: <linux-gpio+bounces-30318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3905CD083B3
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 10:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FAD130263DB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 09:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087F13563D5;
	Fri,  9 Jan 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AH/W5KKF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AE6329390
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951326; cv=none; b=UayMLojHhpRCdBYUKnRaO1tEfW2m1LGLyKJ6gs46zY5Iqi1L3INW2kiYYy0AS1uznb/bHrXu3QctFdF2dTZ9a0KYn81WP7W/wGuqBmLjtXr+04O7d6rJfipAYiSzDZjMChtDzQEGlYMrFRWbDPgKwLNlXronbcfCPg9V9+R/sX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951326; c=relaxed/simple;
	bh=7L+vSRDTKzVhMW5uhxK2UgtWU6MpTyHtxzs1hw/M3/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/b+yCcpB84R7PR7Kw0ai3X++cMJM8T7fXzY/8D5BmMDRDrfW+ClXp8rr+EaqsfK4M3uRLUdWMBfrXHVaiXOJD1WmzEYvVGSQx1wfskZ9qPxnVQPEaIheyahNDGsoEj/+fcOsmq0HgghRp0fdNZ0z26lkfZbEfhQu6KuWiDicLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AH/W5KKF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470F5C4CEF1
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951326;
	bh=7L+vSRDTKzVhMW5uhxK2UgtWU6MpTyHtxzs1hw/M3/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AH/W5KKFf44NZgtKCeRwscvcd5f5OtMnEYBV1os7Xp3PrbVfqE5O8lmxtHr+rO2yr
	 NcAgyZgBU4IMHzy3s0wz0/R7f1WwGy0v3zQSRSxCGkoAjzg2Ifl1gozBMs2DGIwtUA
	 vNh35bPc7x64nokZhbHkMqQt3xbw+/nYKREnhzMJzWrVQVnpumY+9ME+PWH445hpXY
	 0DsB9Y0bLVcpLaeDXTBX446uTpplwpcMUcrdkUGCj9AVvMxfOblx2kcHG+0wR+mnDF
	 UEL1hUhhcM3FrpoFeHzKePOUEDOz0DFw6FckEIm4I6Go6IPaAjnl5eHXTq/KdIgGi/
	 8Hrn1qmumtNhw==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6455a60c11fso3400143d50.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 01:35:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbn4rterP/4H3OoyHBWLNZCsxAxb8P8SuaX8h1KLZ1oyDT4epbuidn4MeaUdCrB/TqcJJnBFEgMHn0@vger.kernel.org
X-Gm-Message-State: AOJu0YxfEuVXH2yHQL4uLzwotAA9+P6J6O57rAOGdjhWDYxi6RW4YZUf
	5pj6q2UfB62zh1aEdDtbIa9Y/s96+9YFGDXPRBz1a0Gm3nC2ZMIDU2OkKYjLbnsSOzzyGHEYuCB
	yuvP/x9FgmOLeEPRy6L82iwzLb35c+VY=
X-Google-Smtp-Source: AGHT+IG1nuJdduHBaBbJWNLEpBHS/0bPJdMz2cSjVZpwv/kW086sM7bXE/jQGK5lNaXH05HMk/BcWVmQ+kqn/43rNZQ=
X-Received: by 2002:a05:690e:1516:b0:63f:b18a:7819 with SMTP id
 956f58d0204a3-64716b70afcmr7942611d50.23.1767951325652; Fri, 09 Jan 2026
 01:35:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:35:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
X-Gm-Features: AZwV_Qixm-JNI9h7N_giBE-Mr4reCD8lf22oFl6XaRV7hyd7tvwUPsENCkrLvCY
Message-ID: <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 9:53=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization. This will cause
> lockdep splats when used together with shared GPIOs going through the
> GPIO shared proxy driver.

BTW it is a very *welcome* side-effect of the new shared GPIO rework
that it just happens to find these old bugs, I'm very pleased with this :)

Yours,
Linus Walleij

