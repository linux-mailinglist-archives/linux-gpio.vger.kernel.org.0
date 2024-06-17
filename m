Return-Path: <linux-gpio+bounces-7476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01B90A731
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E714928342B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 07:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905B518C33C;
	Mon, 17 Jun 2024 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZE5lpYd5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1EF181BAA
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609537; cv=none; b=LXdhlCpoAornlIxEXnT4D+tYjk+gTN/6ZJ9hrIv8JrfBLQlJJhdru6WOjHN5UZJpV3da9xB1T9dpPUISY+gUZTACQVGuUQ5gIkIEpT8t4c0dShsJ5m06ENSm5BhEeik+R+gM/O+hST313XswvGSoaWqHVwTRonZxIFMrdDRPX6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609537; c=relaxed/simple;
	bh=izB/PkYn9CmRGEl0RKH83ESrDRe7DjkYfAYL8ocZl2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMQ1XpbQuKrGu37MaoHtqjY0vG4Vz+b3LjKvkARGXVhkBmUU5C2MxXyWPHk8ZXuU1FB1TtaNq4EdorOJkJMZFwaS60k6ZyLeqUHMK/BXnSYWvJF72b/yITJhl46K9LnfYOqK3EfwAvSrqsct02lRez52CXMW39mkxCxsa7RAqzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZE5lpYd5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52bc27cfb14so5049195e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 00:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718609534; x=1719214334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izB/PkYn9CmRGEl0RKH83ESrDRe7DjkYfAYL8ocZl2o=;
        b=ZE5lpYd5niqwg8scmkDJAopwtsTUPcxVTu+dOG4xCxHYjUWr+fAUPhaiVcWLoWU/rs
         qdtcvZ1yddeA6MPiOztVpjknDsr+5eZp8dwbocswJArRdADJNrpkB+mR1i62ai56nYQy
         WeNy1b3lbGduo+cLLFz1vpudYF9JXNGKb4aI0gJaBx9oceYs/p8fSkJ09KRL65/yJJ6V
         R19jq+suiVSQ7+DZRujNFs3+Ydz1YNI+cFfBzZW1zfNJdXP1E3senyG8zTURShd7Vqz9
         6jH7nVzrs5KS85X5oUovNQDPb4Pu3Z2CPSfXT4L7z+Xb31yh6xl5fd7YK0u5T2ODNOkE
         bv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609534; x=1719214334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izB/PkYn9CmRGEl0RKH83ESrDRe7DjkYfAYL8ocZl2o=;
        b=SIYaYfgQQHeyIiX/5Uqs9IxNCfGXiwOfuyoBz8nijqFIzUD8Yn3E3Z+O3haK2Fi/IX
         PT2wpaGB6lt1pT2uM9C09FgmGJMVxRcaEy0KyK/vJxDAwA8KJZTI+vZmpcG1UXF8UdMb
         LVSMVFm3uNRaruF5fteVFE9jdU1KaoY/4igT3Rby1sIyI1o9YNpd90MILdzl2TkvU6vA
         EmTuptZTzzSx/5iwjFm4sd4S2DKfJhqb677MMvMCa2z1NwziKgs0Vy6Dhu3+TakiieUE
         Ez3XE/1yKz/jYGGEi9IP0eRp/z2iJU8Ljs6q3xVUvFiBH8tbwNwz3+4QJPG2d6nfub87
         AwHA==
X-Forwarded-Encrypted: i=1; AJvYcCWDmTZ19g6LD1d6M9gG/EBi68+nwu2V23q8A/mIzXPB96irP7jvkvGdugW+EP2HnVfo1yUSEEad4PZhpV3Oe9FCD77CZ33RWQNqGw==
X-Gm-Message-State: AOJu0YyqqrKJ+r1ELN7G2mS9W3BONQ7bgw7HUjQmeeOVroEQBvg3XXvs
	YYqJ6NIEw7jdKdBmSLDmNA1g8raRzDD4vigTo1VC073wNDPsHfiqZhIXPeBU1yLkYdZbkB5WJpR
	hKvNZ5+62U00jL/BARNwnCV5Z+kDAjG9nL0gcSw==
X-Google-Smtp-Source: AGHT+IH+aOgaMdTi/LHDhO7GCjbGTHZ3DYDJKPcBfnNVqrjisruFyc66w/1I9dZr+KOs/UdgKKpsqeDeHqe9txRh0x0=
X-Received: by 2002:ac2:44a2:0:b0:52c:a5cc:27e7 with SMTP id
 2adb3069b0e04-52ca6e9dafcmr6487689e87.66.1718609533740; Mon, 17 Jun 2024
 00:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530191418.1138003-1-andriy.shevchenko@linux.intel.com> <20240530191418.1138003-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240530191418.1138003-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 09:32:02 +0200
Message-ID: <CACRpkdY2fxg6uUkbezaR8wAFEUnyOrOW7WqbTEjEF9SzAoQR3Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Return label, if set, for IRQ only line
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 9:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> If line has been locked as IRQ without requesting,
> still check its label and return it, if not NULL.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I'm OK with it personally, the perfect solution would be to catenate
"interrupt" to the line name so we don't miss the information that the
line is used for interrupts in case of proper labels, but it's not a big
problem.

Yours,
Linus Walleij

