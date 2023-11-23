Return-Path: <linux-gpio+bounces-404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950377F615D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 15:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3180B21441
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 14:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A432FC4C;
	Thu, 23 Nov 2023 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip8+t4UU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B295819E;
	Thu, 23 Nov 2023 06:25:25 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b83fc26e4cso571284b6e.2;
        Thu, 23 Nov 2023 06:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700749525; x=1701354325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XODbNWJs6ANSpwkyWL+ByiCovAsp0w3fPI5hgeJVDEw=;
        b=ip8+t4UUEbyptha8ZTERXz5zDJmveq9UG7suwzUUTlAk2mFffcjIC/fxBmVjtIjdHX
         8EhhiDfp7agpRtFPSxTVBeZdw5sTkTNTl8LXqcebWJHmnwWuwtDY9IvXzqlLPtHl82lB
         +ZECAHLXzKDIHBvyoCZ2lNLFFXOVce5KaZqpuFqIWYd+sQv3wN0kmZlQK8dTkSAbs3Mr
         TkuZkkfaelLGIfcVH47wjEr7N5Qfgh+e2fITu+1kGM2AVzjVpUrYmViD+/fxrk/mT6sI
         UCFihZ5HsSdjvzlOnkPg564qLXVUXpPVJFiADyLF7JGaVolmchNMoUasHJNC5ilFdI37
         2zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700749525; x=1701354325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XODbNWJs6ANSpwkyWL+ByiCovAsp0w3fPI5hgeJVDEw=;
        b=IOSiGPZCoSr77Jrdd3CBSOEpELZED5CrI9Xp7AGNxv+627acZ3k6qezdw5BC8m3pwn
         ZvvXmNA/6v809r8HebN6ciXBIWJ7E7e4HxhdPI4kLaZVNcBMXN/lo/Tv6dEsOn+afRDt
         ognFb1Y4z4TbB4sx1Qhw17Tw+oJnjn6khX2KAfSp8wLR4TCiRZvohegNrNU303ReOIKf
         a+BsNMi3B/L1FauqDT9v06GClxi1hT+Q1V5o408ojXiDzg8ODmhxsEZy4hoYGZHNgWVl
         rjM5pR4oCQHlhj30vdlAmMcfa3J7Ui+O1tG+QQHFH5tAdI2zvdzdSqEl8T378Mj0jYWw
         eJFA==
X-Gm-Message-State: AOJu0Yz/OlccJR+q7IVZJHCFAwtWTIruETXxRtNgJyqU9qceVnwf4jgV
	lNt6/6LIMFNwv1qSnvAdJhOVF03A9QRcLF1YYV6YyCnpMx4=
X-Google-Smtp-Source: AGHT+IGHv7HCerKMPdxovHfxzdrRzIXJsAL2UbSq9AlRzcPuAjbZl2zjSbLuv8adlSKK5aeQ4BjqK43sSLUdO56+dFE=
X-Received: by 2002:a05:6871:d211:b0:1f9:6d7d:b27b with SMTP id
 pk17-20020a056871d21100b001f96d7db27bmr7437436oac.0.1700749525020; Thu, 23
 Nov 2023 06:25:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123132749.108827-1-boerge.struempfel@gmail.com>
In-Reply-To: <20231123132749.108827-1-boerge.struempfel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Nov 2023 16:24:48 +0200
Message-ID: <CAHp75VcBMbENVKhbdJnXHGxAP85_5CMNxoq7JqV5XbUyRLPoaQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: sysfs: Fix improper error handling on failed export
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bstruempfel@ultratronik.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 3:30=E2=80=AFPM Boerge Struempfel
<boerge.struempfel@gmail.com> wrote:
>
> If gpio_set_transitory fails, we should free the gpio again. Most

We refer to functions as func() in the text and comments (note parentheses)=
.

GPIO

> notably, the flag FLAG_REQUESTED has previously been set in
> gpiod_request_commit, and should be reset on failure.

Same about func().

...

Seems the correct fix, but you may also add that no existing user is
returning anything except 0 or ENOTSUPP that is converted to 0 in
GPIOLIB core code. Hence no Fixes tag is needed, but still possible if
maintainers want it.

--=20
With Best Regards,
Andy Shevchenko

