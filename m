Return-Path: <linux-gpio+bounces-21709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D3AADDD1E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 22:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EEA5189FB97
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 20:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C657224E4AF;
	Tue, 17 Jun 2025 20:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0JSUnRq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33F02EFD89;
	Tue, 17 Jun 2025 20:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750191651; cv=none; b=q0em9k07D/ucx8KG3BettAS8F8rHQ6FV0wMuWRLk3U0OzOokwyyJUluLFcWYIGxauOlL1CrNGsFGp6Md4/yJy78skyPYNVIUdmrqUrM2UL/mgdRd2MmHtRt07y/MwhoMy675WdfktwYeoZHUF3KAJnb7AMJ7VMjeMGFkDctpdMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750191651; c=relaxed/simple;
	bh=PoWkML0br1CB5IKrik82J2Iqxt05XtbYr/y6VLetGDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=saMIOwhzQjxzFrvKZNknlKZKBB8N6Zx2pZQLmWJZ/YdFHMX0QIoumsoyIjVYinVKgVRipl5WUfFviWGBvM+ab8Ufs0WnYERGyzYTmienkSan7xf3xRZjEf+HViuC2aQ7S5IFMqnlajhq2YLJ3iEzqStajfuXVrFRA27d6A4ayaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0JSUnRq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade5a0442dfso1166831966b.1;
        Tue, 17 Jun 2025 13:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750191648; x=1750796448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoWkML0br1CB5IKrik82J2Iqxt05XtbYr/y6VLetGDo=;
        b=g0JSUnRq91uWK1e9N2u6KiKHVAK23ZnB94lWy8paIKVtulMc6TuFPmzPPWjpV3TTdB
         2RvjKtPEJNcMLu3c24reuDH7Ppyv2LW6scPgZJidmqF0aa/yLHpQfBtwQLYaRQ69rLt6
         Xi+MLZWbzs7xKY/VRlBW7vSwHa0yc0soYRtjEJvPD6tk7FYC+3szZ6i2S7MdhhEurVLs
         vRrXGTjpf2VSmvwU719eikqRw+hitFDpi0/72C4ccQD+/J2W7ai1m4P4fdNMpfLcG7f6
         ede09Qi6Fh/waBfiVXCA++/7OjmV+NMBR+LTb5XTcKPwDG7BH8EuU3mdNwcq1mKhWjui
         f7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750191648; x=1750796448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoWkML0br1CB5IKrik82J2Iqxt05XtbYr/y6VLetGDo=;
        b=mFOdhpnJJRtLevV6Zg2fOGrYB06x6hSHlqYfrBEP8aoJ7iXlKTaDgwSFCv4nt1IIXZ
         Q0oNsjcCwdWTaREE/2m5QdlKbY+FoUlB0rwaZXTDkxkci1yEa224KoAb1r+7UuXCrS5Z
         bqYOrhy7RsuORYO+LzP31k7KDnb0t0S/t8Tb4JCak5dGBmEZNmmZTCIE/JSw8KsZi3Rl
         eV6ugvemcaYBjhvPpKaMpNZZBN2JEnKVOOKgi/levh40h/zUYl96iJWGnd6bYOlgl1Eh
         W0OMHayEOJo+lvkvElR6dDY2uyOBDDzeW5XVhx3sAbOvX0FJLNxKMqZkooHf1Dbpktey
         C5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUNfDbtZRt/yxgyh4xad03TbrozfjPCQVFGqCnn07/muQVpkstNA06+IxdzHlDXNOf7D41nmdcdvXjbK+Gi@vger.kernel.org, AJvYcCVgr/1UOOpo+QCsMuIQKjxOyXF2SQgXsRzUCR4EXHBCCwPUPRuaI6ApbJCzGvyVmI7sj18qqq1pgXk7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2UQqSHSHRzbR2k+kq3EjCJnrqFvlQxLg2kZA6Jss0H4XcRXg
	S8WKFgJG4RP2oMlDHp4ec+M/lalmPjCpETIreI+0ePlnWNLgTWiUdYOeiIfROzkod2N5UD+0Gkb
	BLe6LpP3ZPpiXkJbKf54mZpHrRdM/H8Y=
X-Gm-Gg: ASbGncviGbG/YAfrdLCPxqxwN6hiWzu5mOFG7kEPTFyCA//IkOfrwI9Hd2IZ8FIJQ4D
	m1OjuA8cARwx9CSrRrWM8SZdMBDSfd9fxbF5qbCLQ8YpECA9chaPLW+oraBJxBA/FhRUrICZgk8
	SQG15ae43Bs9oJHhwYVN1Vx3w94IBD7r22ZFuKJpkFm7w=
X-Google-Smtp-Source: AGHT+IH55q2E7WN90zlOR6v7MpoEZG1ZkgzQBcnVbtaOcZW1nXjzThJdLm8vxQ3uGqz1hgnih3z7TEc6CNrqy3XXCpk=
X-Received: by 2002:a17:907:6088:b0:ad5:5302:4023 with SMTP id
 a640c23a62f3a-adfad5a09f1mr1412781866b.44.1750191648049; Tue, 17 Jun 2025
 13:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org> <20250617-gpiochip-set-rv-gpio-v1-3-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-3-903703881fa2@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jun 2025 23:20:11 +0300
X-Gm-Features: AX0GCFv4-ZOYtBYGK94NP7YGG7FmZo--RTOkdcfKWd4WwJAEnvHM4GXHaVOeSrs
Message-ID: <CAHp75Vf5DhkNL3pb=KW9CsKr=9Cxr6d3Kwi4R+raF0T0h20x4Q@mail.gmail.com>
Subject: Re: [PATCH 03/12] gpio: pch: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 3:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
I don't expect any conflicts in this driver in this cycle, feel free
to take via your tree directly.

--=20
With Best Regards,
Andy Shevchenko

