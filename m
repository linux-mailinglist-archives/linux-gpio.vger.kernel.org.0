Return-Path: <linux-gpio+bounces-203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9F07EE1BF
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 14:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58B6D280E6C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 13:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1F830673;
	Thu, 16 Nov 2023 13:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTBAXsy2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1907AF
	for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 05:43:54 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5a7c08b7744so8978777b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 05:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700142234; x=1700747034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZjmt/D3S5lfIFGtFJl+O58Jlf+7TNGbj07bIJh2uQ0=;
        b=bTBAXsy2hCIzeBI15VRO4hd6kgKm2rJMyobMYcxpW2XH5NtI3BoR5qJw64Ta+Cz6Dp
         YNJeaqmEIL2MLgeJyGOlf8vCGUnIaKSnTFs9f1Ix/9RqKISu72qj3TS8GydXAwlKSMC8
         4QQqfsZkp1eLUJYkhL80lPi6QdVGqzUbAmdxC5o30hITwPMdWclQZ4BO9ZcQZdKyMtYD
         b7pZ4RmayGE9JR98TqH54hgjfWOCe5EyuprsODIxsiwE1Y+vpVgtuG8OZ7vIgpWTIXfd
         QxBg9YOe1LqUY37l431H+IRDOZCTMExmAnBGO8WiU7u7ohLxuXO80DLXQMW5bTE0Lf0Y
         pqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142234; x=1700747034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZjmt/D3S5lfIFGtFJl+O58Jlf+7TNGbj07bIJh2uQ0=;
        b=WsxU5ZTPGo3FP/gHv6ZuqyXN1HSHqZERqQNwo3D1DagmbDCwSG/Na0svgUiJdFeFIv
         d5sJXnAiZJtFGmLYoHbDsJy+LECW/Lm1VMEkQ6xyGTiAvPbG2LxQcU9k6DwOZmaEBqua
         L5ZfIio/DVsC5AAJIf9+jhyGnXLvNKTp8/HNTFRh8i2mXmP/U5UzzL9YtAAoWDHx7ueF
         911IYoo60QpeW4c6RJF6L+X1wjJzW9G2hHjTPERADDOUX1ObHGzz/D0bqb2PcsGw2Jly
         3QvrbFXRh5za3UncnVEkhAPvu7D6GWdVBEPO27UA0llcwxxty0E1ljNFFjELW7QASh2x
         ZNig==
X-Gm-Message-State: AOJu0Yyt+nf1vLccIVuJKoCP6+e2h77CBpNOedcfxSG4KrzcC4XdXTYx
	tLosmwhqaTKHKqKbtf19CBCW42TjthUeEcjvZCQGaxEs+zY6uphP
X-Google-Smtp-Source: AGHT+IHTheVVa1bG/lx6ddMArSjfKb7XbiwwuCkbnCXPq4s0fXQ3Xn3Rk48p8Bczi+2ndbCUxf7vIcj3riI2Cd+qR9c=
X-Received: by 2002:a0d:e8c5:0:b0:5ae:732b:ec21 with SMTP id
 r188-20020a0de8c5000000b005ae732bec21mr15855507ywe.34.1700142233950; Thu, 16
 Nov 2023 05:43:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115165001.2932350-1-brgl@bgdev.pl>
In-Reply-To: <20231115165001.2932350-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Nov 2023 14:43:42 +0100
Message-ID: <CACRpkdbDny8X3WB_qJ4h_vbwrjno5ytAtNMgTeXg4jpegdUH2w@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: don't use gpiod_to_chip()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 5:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Let's start working towards removing gpiod_to_chip() from the kernel.
> Start with pinctrl. The first patch should go through the GPIO tree
> and become available through an immutable tag so that we can get more
> conversions in this cycle elsewhere.

Fair enough, maybe an immutable branch with all three patches?
Probably best to merga all three into both subsystems I think.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

