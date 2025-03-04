Return-Path: <linux-gpio+bounces-17003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A9A4D6DA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 577931886788
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3191FC0EF;
	Tue,  4 Mar 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="acHnUO3D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF191F5845
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077879; cv=none; b=FzKjmeHAIK+sjkXyc1AY/wJG2qA4qO/RblALJKGsF7elmianurMVDBYRIeJ065x7MIwCAet3SXl+IloIb+hGfEZe6StSLszFjw9HgfosAWPi9j/7/kXDPSEhM2KkKvum1osZBC+1776oImYW+HDGVOnJJQ1YePMevkBS90XXgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077879; c=relaxed/simple;
	bh=dPMt8sQKcYcDHq3trJrxd+nQzsHylruteqNco7rulhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPo4dKLOF8pOR8V+J37R+ikXEgNmIU1EdtwSHhBDpae/KlP5nh88PhYCwrevemco1vns6KcGkdqOcyzaNTfOs/zX+Bc9YFWzbnp2da8vy2oRZEgMGxgE5mbEB0PF3+2e/gKUzl0KwMmRiVyZbRlEv1tS4KUhFeDVvv79rFayM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=acHnUO3D; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5496301c6afso2272067e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 00:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077876; x=1741682676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPMt8sQKcYcDHq3trJrxd+nQzsHylruteqNco7rulhE=;
        b=acHnUO3DNAApJzGhWaPZ4f0L4KJ7lPmfBgD0Ea0KWTCOiZbQ+u56qyvQfuEslTbTuB
         ZuXzS+Uwe99ZVopMDPVc82at8m5z/LG1X8weK48CO4HIH++ueURRcnBMK9YLl494gXfB
         He5j4irJvTxWuOI4ISzwXWUqqtrWpZ9YfdVB7Y7ARx3ZU60BRdkaRfWbLsRrTdi4Zg4V
         sv1JZCEPXPOnH8lvejfET0G7yWx1cYG0N+iq8Sb5Q1dvsK3+AcMIKA1iV5Mkjx7Yzhka
         E5CfZtFOByM99K8vwZ2hOm6gBjszbrEnJ10GsTBoA0QGl6aMi2lfqJxepG7y+401y7WY
         TvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077876; x=1741682676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPMt8sQKcYcDHq3trJrxd+nQzsHylruteqNco7rulhE=;
        b=fB3JuNG5VmPO0uwnhJn4lO2wFx+mi+g7fNEjZMxvUws10M6rEvJ88/iP3XQyh1Wmtj
         jYcAuWu2+WbzufiTCnB9RaeWkbSiQuahd/zKbbcWPvCsElg61DW3KkpH2bgtYyks80Bb
         hFOadW5kqM7ZIbAVplbKHGNXmEpiQnr9Lwr5elNc4XTIyZU3PVr1Bs7qhpWSXzZVNja6
         C+kipp9oWt/tZn0oR9s3VLa0Kh/49FEyDZPCFWyQUX7LspZYX0M+YNtdGJtzEQTVEPpM
         xUEl48ivTVvBUCpVA1w4nsTXzb85I1b2hTIFgn6LkJbe1u0KsRNvNYGf+27fSUN7kqgF
         qFtw==
X-Forwarded-Encrypted: i=1; AJvYcCXQmxHvisH+0WTfYSTw7b9WgBgIQjRFjxGo3N+rdl64bQdGBVNP1m11xCp+553Q50P1a0UqdhZuVxLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPSrL7lLcercKoK+M4thqZeHFwLiTkMuDB2fYG4PN4BDDZ0sma
	EbGfzl814jTNPwxxuL3H0MpH/WOyPIIIIXebYjLd7bFEtvkaO8F1APRq9ea0jhkWpQBfbpbJTcI
	rrXywLim2B8voU+t5z1i/2kebZnqVvjPl58lqEg==
X-Gm-Gg: ASbGncsJbUOpOl8pkP7aUuN3bNgAFedfOV/Prn9Qh9P9kyPMDRZe4Tp7FAAzcqyEoVf
	Or88cvB156qqy0NY3Di7ou7r4w1T8S9a63GUEaGz0BD5Wb9nLgQSiCh4hPV6gTq706e5Q3z//pI
	ePjHw4V97TnjDvRLNgCWO1pU9KFA==
X-Google-Smtp-Source: AGHT+IEsTpQ2JgQq73PIIi2BUjZ59IPNByHRdWpUpLhoM2TgmVIamV70BK0YXd/2ubvynp/Jd8VQltUyoga2R+pTrfk=
X-Received: by 2002:a05:6512:b08:b0:549:7394:2ccc with SMTP id
 2adb3069b0e04-549756e3ba1mr734501e87.26.1741077876026; Tue, 04 Mar 2025
 00:44:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303160341.1322640-1-andriy.shevchenko@linux.intel.com> <20250303160341.1322640-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250303160341.1322640-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:44:25 +0100
X-Gm-Features: AQ5f1JrUf4BLulGkluVvHzVvboNuHrbtC58uLx38uifniKVu4XCC8IXPLns3EFk
Message-ID: <CACRpkdbhhJ0+8BYpajdCSHHZZAYO3bOpFd-XCUxpdZyGCpj4cw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpiolib: Rename gpio_set_debounce_timeout() to gpiod_do_set_debounce()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <westeri@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 5:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In order to reduce the 'gpio' namespace when operate over GPIO descriptor
> rename gpio_set_debounce_timeout() to gpiod_do_set_debounce().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Fair enough,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

