Return-Path: <linux-gpio+bounces-17877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C658A6CC3C
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 21:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3D1188B012
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 20:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD62B23535B;
	Sat, 22 Mar 2025 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwBBj48d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF7B191F7F
	for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 20:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742675326; cv=none; b=FcLU1E28Nuvyp3LM2QTHwvUfDOsWzf7hKdFqLgXh7OqBrNQgMf5i7s+oAAoiaA2eL2/z/xvXTt9l0xYKMz9CtWLv0oHFaoD6cwKUF5/NF8ubClEjgwqm5DCDlXqNuFj/5SOIfFA9qdCc/ORYlT4g3MWAD0MTgaK40/vW7XSpL+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742675326; c=relaxed/simple;
	bh=qoy41eTjz+zU+vcXx6zDiAyHbq9HK615Oucw0WdIAEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROEz4Ig22DGCoGI/R1PHjzJYG0AJpD8jj8VfysmicFiN/QkrwYOY5gveQ5DImOgEaR7J0JC90/6i48Th8t9+5Bf/MZ67FIjw6yCcv/FsKzwfXvAtRIV+pwyVoS1PfX1hkbV91WJWvjGVYD7lIMzZd5upzgqNXMUxEDjt7JxNXuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwBBj48d; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so3218935e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 13:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742675323; x=1743280123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoy41eTjz+zU+vcXx6zDiAyHbq9HK615Oucw0WdIAEM=;
        b=kwBBj48dl9rr2pi8Gkuq2b5cwgvRhEXiBJg5G3aHIawLODpXjIo8ieCZY+zL3Pt/BR
         RFu35mCwoIfgcULqjydOtfAzRlo2/p0PsNX5YiTJ/eJE36Q3mAf4RsFeJ4v/R1v/O7ym
         5j0farW0XsH3asSYJISACnfymM3iZBaitV6L7p06zk7pDEaHEdvpbiA7AQAGTccdDTo6
         X7tNUv6cUS21l3yfXIhFGBDJx9MIf+W4Yf/XdzkzgD8wdVr/jwv9rHuMu3Va/oHJlVMu
         44gcKYt2UiUOYB5X7nzavkMugm3iRBWIaKIT6hJUdyWo0NHSDFeHsE4pRWG2M/qGhlwh
         Frfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742675323; x=1743280123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoy41eTjz+zU+vcXx6zDiAyHbq9HK615Oucw0WdIAEM=;
        b=erVCEdoeVfj+6ipUFOU1a9vuU2lBOSjSQHwHtbdSqG6y/EK1wYFPF3bG5DSIyorLEi
         7fY2biULQIWdWpnaZOQcAPWpsY+RnWQw3mI4rzJ78F4C3lT8NFi1cjGR+bH3osJrpH6l
         G1t1Cq6eVQjdRiG7km2ZOBae0N9lYyltLuGz3Erlw80yMTkxfDPku/IXJMmB7zsOAGxb
         9w2IUaDzFlLovHZI7OQ0Bwm68jjnXpd1ptnxTU//HNiHT3HZYwAG9FQWrHCQBj/80lPM
         VqoWi7VQZFGh3UyBT2FCA1bfEe4At5IA2d3YZ1yG+ajw1tvhkKdXCKWznRAniNsJ8Un5
         hvpA==
X-Gm-Message-State: AOJu0YzaekKC15s+vvhuqIW7NDJtZFvdOxh6a42uKpJal575hOfZsDhH
	dtn/WzDXlpMXpmof8pE8WfwBuRVgYBZoDVLVQdc4i4vDgV7JI70BGbvYkZe3NU5yr7hyTbfHx9I
	lw+NGJCztkI9E/ss3juqdonXxEA5Uf6fzs4Mj5w==
X-Gm-Gg: ASbGncva9X5GquspprCqqyj09/gA3PK7OOVxDBBDw0ECOjY+IZqcn6Du/P0IWXoinsn
	9Cg3rzg7UdziLjPN0ycVWWpm0nF0WiHZWGTaakiEqNXvI1Pd9te6S0H9X98wIPSXVNd03tnEGNR
	MUatVG+B7mNVNc7/79XjEjjNo=
X-Google-Smtp-Source: AGHT+IE4YaVn8O5HTx91hOFiEMdCo/J5WCSuzto3zJwnJCBUWOe35GFdFErZFbtVPKIv8WOTTUj3ocqnB6AVw1vhVq4=
X-Received: by 2002:a05:6512:a96:b0:549:8c86:740d with SMTP id
 2adb3069b0e04-54ad647d120mr2705961e87.18.1742675322823; Sat, 22 Mar 2025
 13:28:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org> <20250321-gpio-todo-updates-v1-3-7b38f07110ee@linaro.org>
In-Reply-To: <20250321-gpio-todo-updates-v1-3-7b38f07110ee@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 Mar 2025 21:28:31 +0100
X-Gm-Features: AQ5f1JqDiMdr7uJpfkKzoEZn0OXtNghH4_y04lNCoEDhdTzW5DQWE_ZqFNuFj3c
Message-ID: <CACRpkdYqCpyWveELpi7reME-oLCq6wNhep3S6V_O_-cOO8K9Vg@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpio: TODO: remove the pinctrl integration task
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 4:49=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> While there are surely some arguments in favor of integrating the GPIO
> and pinctrl subsystems into one, I believe this is not the right
> approach.
>
> The GPIO subsystem uses intricate locking with SRCU to handle the fact
> that both consumers and providers may run in different contexts.
> Pin-controller drivers are always meant to run in process context. This
> alone is a huge obstacle to any attempt at integration as evident by
> many problems we already encountered during the hotplug rework.
>
> The current glue code is pretty minimal and for most part already allows
> GPIO controllers to query pinctrl about the information they need.
>
> I suggest to drop this task and keep the subsystems separate even if
> many pin-controllers implement GPIO functionality in addition to pin
> functions.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I used to get this push a lot in the past from users, that it should be
the same subsystem, but I haven't heard it much recently so I
guess they have finally given up on it.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

