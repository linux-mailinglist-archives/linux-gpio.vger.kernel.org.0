Return-Path: <linux-gpio+bounces-10632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AF198BF94
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C8EE1F24794
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53491CCB47;
	Tue,  1 Oct 2024 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ci2pfD2u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1CA1CC14A
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792042; cv=none; b=f4xyFfcWwVExnbAvhQpeboZOA+mAqcMWMRacsxahHi9M6qzhD3SOUhJNY5AQ8Y4t3RtzuA978VaRqpxf7nzgIwK7Oy/Bm5Lmxlx/kuO14F6ESRvt+nmHcLrQpNXQdg5Kksk/sO6Dlrm9WmmgZ6twt+jyLWNGf9+kqeI6oe7oJa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792042; c=relaxed/simple;
	bh=c9k27wF4HRgpLueBG4Pf2APtXo6yuM+OkrBzV15ubFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDbVvb8S3m2p9TG01Dgv0yGEzrFg7p0tdqft6Ue4nbAHPY/1puL5nFnPm0rmuqMqoqk3ntFo2Yhc/BPOd2XuSzW/gGiNCtU1pNOS98FFhcUDGaVHCWEw0TxGZqNbdIB7i8eB3QdFOVBZtC2q/yuz94DtUwSVK9XcMAnw+A/EQeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ci2pfD2u; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5398b589032so4954608e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792039; x=1728396839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bsrbSdX6EPWFR3XqD525RkRXnDDB9V77qUREJTrLp8=;
        b=Ci2pfD2u8q7SAnZGrqRyOV7JMcWMA6pjrixXJIiRKbVjERfUu249QJV4zn0gU2dEP6
         VRUDrKAP3kPYFxV1tROSVYcekOw5tQeInWHXxkbYZzr0ZY4vOK6UbG6nHOOdnNQHB+r/
         sN/1D/2OmiIPyG3PVyHVbDDMyhcVlGu5cMl5PRdRy+6Xvy7Iz3lZsfikv7fIiEXsRBus
         t76l2WFJygiJxa8fJP5+KDt9qsOEek9TictIftOov9VXqE5qM49EfXWrGHCaLeumnraS
         37eMeLOdEqP8eOsIa0NTEGAYkHVGgvBV/hK464iFdwPgPBmW5pvxRgf0jqpcjlkSzCi5
         vFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792039; x=1728396839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bsrbSdX6EPWFR3XqD525RkRXnDDB9V77qUREJTrLp8=;
        b=X9pCQWt2OkZ63uFmUEJCK0KOZcu9gY7PyAyniHacVXbEUK37ywNBQrkcNNefF9lyXv
         Cowl9rTHXnmrC0lKtsJdvLIR0IAUdjgP7YHdGYrggGUdmfyJ0Bne2P/bImQGd3LKwQzV
         9z2dKWQkVM0KcKojCLGkQrYOH3k2VCUqb/Av0lut+6ZsyuALWNjrjK8ikcjQz+3FK+wp
         IetQpVLtqB7vroZkv++mvly7Qc22359QUnhIfPOZiekT7190bPMRTBR+B/zRAw9gpuQu
         ti5dzJd1oMV031FicSjAj5R7fHZzKoDD3uyHF6Yb4lu4vIap9RYkA3YN61UgHUdVVdpu
         2itQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/5ftJH8f07ZARnIA3d147kpIQu991AHWeLkL43+ZBNXDJJUGyY34kAW6tmG8SFn0+YfxsArYkOVKR@vger.kernel.org
X-Gm-Message-State: AOJu0YxAcYMsWhtQWaQ9Cim4vKwwqAxlbsAMaDldkEkGCtekUmw2Bg0g
	2I8VXiM2ePG+syeCiZCzib0VKhM9FzgugcdtK6lIc3S8q4u4I7XuvPIpN6kOa4CzcHFAEi6vT+F
	G4IvOuGcC7z69JwyHVo1ofsFDzgsowsJjqiqrgQ==
X-Google-Smtp-Source: AGHT+IH6ZblbuHzeWYNgj0qMbKQe6HIgMe33csaXGbHVMylssdfO2oRVeVcy6SqujgFdACrOi05i6ciessxhYK0oDP0=
X-Received: by 2002:a05:6512:108d:b0:533:407f:5cbd with SMTP id
 2adb3069b0e04-5389fc3445emr12362507e87.7.1727792038590; Tue, 01 Oct 2024
 07:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928-gpio_device_for_each_child_node_scoped-v1-0-c20eff315f4f@gmail.com>
 <20240928-gpio_device_for_each_child_node_scoped-v1-1-c20eff315f4f@gmail.com>
In-Reply-To: <20240928-gpio_device_for_each_child_node_scoped-v1-1-c20eff315f4f@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 16:13:46 +0200
Message-ID: <CACRpkdb+C5u4cQ0EapgXTzuwL-9CE2MrimRd11U3O8c6vajjNQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: dwapb: switch to device_for_each_child_node_scoped()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 28, 2024 at 9:47=E2=80=AFPM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:

> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for a  call to fwnode_handle_put() in the error path.
>
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Neat.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

