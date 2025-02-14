Return-Path: <linux-gpio+bounces-15998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1DBA35B81
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45FD43AD4BB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850F4257AE1;
	Fri, 14 Feb 2025 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dR8dTbRQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDC12222B1
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528733; cv=none; b=EbyZzhptGTlQzDdQhJCTJxI+xazfzrek8OnXfn+f7Hzy6huYq6yJapbhJvaZDyWvkWdTp01dBqMHktpnq8shB9cbuIFBog807qj9lxDCoJytUtFAiEyBnpXVD2GLRHS4UsxGRJZCv/lK3dMdl8yPGlo5vSJ7l9R1rBfOAFaku1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528733; c=relaxed/simple;
	bh=k0ZA9ZOZTnv0fajLPHLG7bzzy2Bw8GSC45UzvaKQ3pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ix3GOfJZ7rr/Kvl65egvW89PL7lXD2r6K4N9WPpGywmhpG5oXqe8AZ/xXP8R2xAs8wZCVEMODHJpINckvZbAjgEqYbfb0i0lxzNvk9fyNAzZvE/7KgfeAldnO/9sN1mua38vS7JY/a3cINBMxfnBlWtkB0vmBSCmEmCspCOpRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dR8dTbRQ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-309191eec90so9638451fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 02:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739528729; x=1740133529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0ZA9ZOZTnv0fajLPHLG7bzzy2Bw8GSC45UzvaKQ3pM=;
        b=dR8dTbRQt22xnk4ZypUGOO7iU+X/uwhuyRr4WIN28RMqoYqktRDq7M4uuMpz0WJXMO
         L2vt2QOsdc3iVGTUndnZ3rTdbiz+jM949+7Cm/gbf3/b1hGrvg08CX45OsW3KIHB69Vv
         N1csjluvm2OULfmEZJ1OHqsRgHGrLwD39n8oxniR2CmLoJQBLvmXbmLvLRiqdA0KR+kz
         aukezJVu8kGNDCGMwLCkcvd24TgFztKI3SUWIdVOm1ihdBei/T2cHirCqvABa8+oDcN5
         BRP5OkgTNi6weGUkUqaQFXhUFYj+9inOUIKIGTNn2uU5xzZ+oweKdA+rkJ9zXzyOdL2j
         D9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739528729; x=1740133529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0ZA9ZOZTnv0fajLPHLG7bzzy2Bw8GSC45UzvaKQ3pM=;
        b=dfB20oH7X1kAMbZeffAzIwESoDKzWGnwSYjU3pNqtsYpoE898hpkuXVBuL6CSI0DTE
         TqRrUYCSwyGPYgr4rze75jtUrYiUTDK5PPojwPjYNkveKb/nJ5fjvfviEjbiEb5KZ5ou
         8JsiRkkK+DcRj6h4HLlL5gc+NpO7XHilv6N8kStJYx9gpSjMJ4xkmnAXD4ufSOf2rzBy
         xmWlGcQKc2B/v2hugnhu9bIrD8p7WUxFwx78ant8RmR8m18hKRRo725+9SGPMqX0ksMI
         F/FQ+U9xR8Z/cUbJAMYBjOuG4kL44MycwG+6XKe9TvmRMmMrC3gFfSzCEYdZzZJCUGw1
         0l6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNSK/woiBj2g85UHlyRqOCVlqQZ3U1FYZ3EVO0YihLIgM6YM2KP0k1k4YwuwUVinmL2TDql/F20gY+@vger.kernel.org
X-Gm-Message-State: AOJu0YylI3O4yiiwdZ2ktuC+j4KS3ilj63sYPjyNECFYH6kqZ4imiViC
	EeW5nnaYf8hrWa5ZAyCFGFRj1AEp2r6QOW4joibmhK7gNHKMV5HFX10808XqC772/1U47ou+iU0
	XbQHJEcoqY5tPlhc+erlQ2AGBHu9rwHmqUOcwsFdURviJMR7L
X-Gm-Gg: ASbGncsaTK45zDdyfSo7a0vdBbVBJzhOC90oYjrlRYFACzBolEt1McBVoBUn+/8EJ8D
	ry7miLKz6cVTU00Ep4M9X2txKUsHEOSRA4VwfTbrKw96IpY9o48+mMoCc9iAwTC14Ejzm8uhk
X-Google-Smtp-Source: AGHT+IE9Hh8FY7yC6rWfR8h5HiUv5X+JqNPHfu9DuGImiZxAFDUtqBx67po7/8F/mivoIIRcv6W3Us9lZpgR3fWcZMk=
X-Received: by 2002:a2e:a595:0:b0:308:f580:72a4 with SMTP id
 38308e7fff4ca-3090dcb712cmr21363841fa.1.1739528729288; Fri, 14 Feb 2025
 02:25:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212100532.4317-1-hanchunchao@inspur.com>
In-Reply-To: <20250212100532.4317-1-hanchunchao@inspur.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:25:15 +0100
X-Gm-Features: AWEUYZm3QlH_GBZnkUEfNjfulhzgaPXWxFksRd157QzemkZUnJaOAOo2a3cEisA
Message-ID: <CACRpkdbiNg66sToZ2X+G7J_qJSTpkRj1BgWbYX1_YmbGKdCmGQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: npcm8xx: Add NULL check in npcm8xx_gpio_fw
To: Charles Han <hanchunchao@inspur.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 11:05=E2=80=AFAM Charles Han <hanchunchao@inspur.co=
m> wrote:

> devm_kasprintf() calls can return null pointers on failure.
> But the return values were not checked in npcm8xx_gpio_fw().
> Add NULL check in npcm8xx_gpio_fw(), to handle kernel NULL
> pointer dereference error.
>
> Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driv=
er")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Patch applied.

Yours,
Linus Walleij

