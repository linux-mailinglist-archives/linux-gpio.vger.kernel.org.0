Return-Path: <linux-gpio+bounces-113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D73D7EB7C8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 21:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADE1D2811DA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 20:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9000C35F1C;
	Tue, 14 Nov 2023 20:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ah68fmbY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7026AD1
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 20:29:59 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1E1F7
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 12:29:58 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5ac376d311aso67352887b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 12:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699993797; x=1700598597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Iw6Kyx0GVgux1oiybqWj7rSb9AKtITiomftgoakzH8=;
        b=ah68fmbYciy+owSf6/BZShEy4P1mSTTTQAxSn98wY8VVsmli+lOk06sFgebb+WHUnc
         a4kGwOXfaYdkbVWUIIWXJRtrNeurV7S0h1N4mGupNZ2hG+FYK94bPvzyrVXGL62UmtLJ
         7n0+sLwUHDAn1v/NjN6nxueyPMxuK1i22oBNirycHskG4XEel5Il1yNjnrOXar+d+ZCG
         nGpggFmN7ULQTmmTzxTLjxKA083x+U8972ARqO68IYIV2QIZobBltW1iPvlh1+Tip95Q
         alDD+PkRb33I9BO1v4ZEfH6e0TlVcoBshZZPFZakGLwCqeZdFmvnwrJbcj+gXY/P333F
         B1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699993797; x=1700598597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Iw6Kyx0GVgux1oiybqWj7rSb9AKtITiomftgoakzH8=;
        b=FyV1uxxpdknG9EryhgnrlmgW3ZfInmXDh792t4r+fb2aojHtyHpnw+9vZKzOulsJBl
         y+FG9o9yHYMjj0nhcioeHOG0X+SJzfbpXsBLsTqQBPsHtngWy7jW07kYa/wogjPw2xDX
         HFiAgUxmJpKOLf2KusHxv8tavQqoBE8Stus3uPx2HldaoILUqdkJEwEJ1A9U6nJAXKKK
         DqIl2VhkL+zzqlbEO64UpMJbLUDCycQhOgRkgzcOgjOtTwXHz4t5b0UmdppXTHJPW1aj
         cUVaUSWXT8b1uBwzdXbBEHbvKpaGbsQPktX62znky35oXGQdz/rsv43OtxKUwkWks1XN
         IYXA==
X-Gm-Message-State: AOJu0YzyR8YFvXmB14mJifEEDT1kTBceVXfS3JsSzWCd87y9BRCJE2lZ
	VZu82d1gyV3voiIa7D9t/GgfGdB/OPIiQ9MuE3gIYw==
X-Google-Smtp-Source: AGHT+IGnAgAwcOZtyNdt38wKmR89NdxYVqBL/NyJdBSb/IUoAh35W7Vxx6weYxpj7OFNH8OHTEcuYhKPPlSw3alHaoA=
X-Received: by 2002:a0d:dd0c:0:b0:59f:72a6:da0e with SMTP id
 g12-20020a0ddd0c000000b0059f72a6da0emr12058473ywe.41.1699993797361; Tue, 14
 Nov 2023 12:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231019173457.2445119-1-andriy.shevchenko@linux.intel.com> <20231019173457.2445119-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231019173457.2445119-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 21:29:46 +0100
Message-ID: <CACRpkdb+m1y85SG0N63zRqjZGSoiSO8zNNHCQUr4gpmnD8uX9g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpiolib: Make debug messages in
 gpiod_find_by_fwnode() less confusing
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hans de Goede <hdegoede@redhat.com>, Ferry Toth <ftoth@exalondelft.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 7:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Currently the extended debug messages have added confusion,
> but value when con_id is NULL, which is the case for, e.g.,
> GPIO LEDs.
>
> Improve the messaging by using GPIO function name rather than con_id.
> This requires to split and move the second part after the respective
> calls.
>
> Reported-by: Ferry Toth <ftoth@exalondelft.nl>
> Fixes: 8eb1f71e7acc ("gpiolib: consolidate GPIO lookups")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

It sounds nice and looks reasonable so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

A dmesg example before/after here would be nice as
well, if possible.

Yours,
Linus Walleij

