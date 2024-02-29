Return-Path: <linux-gpio+bounces-3918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E586C4F2
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10D161C21EA9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E22A5A7A3;
	Thu, 29 Feb 2024 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="skO3Z3ES"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44D45A0EF
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198656; cv=none; b=k5+OJW3h/RR+xddvTHtoJFThstRr9GT62mItWegcRQFbc167Az7J5YwXITw9YDP0uGshm/e9GFJ8hR9Ijtf0cpJEzX3p8aOBUQJEGPu91P91ynV4cjGE88g6t+9vEkjCO38KpejiBToMez6pdZSxqCS6Ktt1kho8GBMO+9MNDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198656; c=relaxed/simple;
	bh=acHOjUiE9FcyTIji+FDfgzffemwW9Cnt/rCI5e+Lozw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bM+EAMRbkuz/5GfvJSP083b01sxuOSGovhJsW9KmOMYvVxMeKK0c3Srua5AQfsR8/NC0lq/RxL0olDSpiKzJl5ps1HFn5xPfnrmR8WIgeiuHlAWD8XpIxC8q/JkQ9Q7Wh8lozO1t0nh1Xn5zvUiPZzI5aV3hXA6P774CSrJrPOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=skO3Z3ES; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbed0710c74so649000276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198653; x=1709803453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acHOjUiE9FcyTIji+FDfgzffemwW9Cnt/rCI5e+Lozw=;
        b=skO3Z3ESPncq3Vthb3+r5exm/XuSrp6A+qR2s5irtnvnDWUm5nE6KuFMEUclWl2Q/j
         2CLDojI6Bk32/F6itPCKktSc7D0rAend5rD7kom9GnaWJ2JtwRNfYCAjrFY8ZCh1oBR4
         xqO60nNKbFwmuxviTCgzJ4qGdX4A8dow0iB/o6khzT2tmG/+Nhm006+1TrPZSzLZzyo9
         iezC1RLtV096WW7L5yp7Lg8z12E1b0o2t4MwGZdeiXHqDsUmaW7mA5hWxLluNhZLCI5h
         I1YNSwE3AB708JSOJyROvVyOeqnaN+c7xg7CdpWYVJk9j+Tayp1Wq7bs9X6JOdJ6y5XQ
         7W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198653; x=1709803453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acHOjUiE9FcyTIji+FDfgzffemwW9Cnt/rCI5e+Lozw=;
        b=JljgFSb+bX6igcNcnmmi8kLx1d/FuDQDY6edxua6AKjKICvHq9MPOfoJVhdnxBuVMy
         OZrkF2XwSjrpI1WobeVUBY7jm3gYc+JgzIeZja6VkIpZ5T+dBlC8CJWh/inA9SzfVJA8
         zzqLbAAChsleJgvuOWcyuY7Ag8ZEWjBkVnHvgSFfHSATRJ1hV3vJiQuQijDYuJ1EPOKp
         +6cwRXggVAJpW8fEZZryxIm6jat+SdiAzpBbXPvHD92Uq7RQNqzBDReb/FWo9U3KWzMY
         wpq4olMaKHL3yzJRuhex3qAHFubh2Rvc5NMs3oEwtrMElvWEUc/F1/x6brJiq5GiFK5D
         WRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo+bVvaqrdRPpI4OKnVzrfDRXSwgX5xSYeHsDw4CZ3/FHGHyMn/9p8EG6qkk6YfEUT8A1pyB/Jblu3KwgVoEKMPdY7CyqNcJdEjQ==
X-Gm-Message-State: AOJu0YwCP67ci8/SAuNRbeNJpvZGTtS5L4Sc1MjmgfDb3k+FSurqXyEa
	TJb1DatP8OAQEAHWvq+SVluZoo1YJQyh4MAEi4CcGoLRmykCCFDY4MFDTKdrhk3BAQBkKo8i2I9
	JxfBmC1CM3uoCciuEeA/MtEhsMLA2bucVPBbtBg==
X-Google-Smtp-Source: AGHT+IHuxs+y33+QXYrS7v42PbEsIL492f7ErZQmwtJt+UzdJGQk5GkoOqe+C/FQ0kYdzZUyDoNwliFQRIcjVaMqD4c=
X-Received: by 2002:a25:8451:0:b0:dc6:b9d6:1542 with SMTP id
 r17-20020a258451000000b00dc6b9d61542mr1619157ybm.48.1709198652964; Thu, 29
 Feb 2024 01:24:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-6-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-6-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:24:02 +0100
Message-ID: <CACRpkdY+cjU__XSxrSnKtZjkd=jRT13OWD8RXh3JUedNk0TPWQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/30] gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Previously, drivers/pinctrl/nomadik/pinctrl-nomadik.c registered two
> platform drivers: pinctrl & GPIO. Move the GPIO aspect to the
> drivers/gpio/ folder, as would be expected.
>
> Both drivers are intertwined for a reason; pinctrl requires access to
> GPIO registers for pinmuxing, pull-disable, disabling interrupts while
> setting the muxing and wakeup control. Information sharing is done
> through a shared array containing GPIO chips and a few helper
> functions. That shared array is not touched from gpio-nomadik when
> CONFIG_PINCTRL_NOMADIK is not defined.
>
> Make no change to the code that moved into gpio-nomadik; there should be
> no behavior change following. A few functions are shared and header
> comments are added. Checkpatch warnings are addressed. NUM_BANKS is
> renamed to NMK_MAX_BANKS.
>
> It is supported to compile gpio-nomadik without pinctrl-nomadik. The
> opposite is not true.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied.

It's good to get this move done, then we can iron out minor issues to
the GPIO part in the GPIO tree as we move along.

I will send the patches to Bartosz with an optional pull request for
this immutable branch.

Yours,
Linus Walleij

