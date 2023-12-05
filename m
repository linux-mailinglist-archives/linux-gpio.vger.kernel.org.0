Return-Path: <linux-gpio+bounces-1041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E7806217
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 23:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 416581F21707
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 22:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6103FE37;
	Tue,  5 Dec 2023 22:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQZ3IFub"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79954B5
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 14:49:51 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5d226f51f71so69481017b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 14:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701816590; x=1702421390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrFaCxut1vMUHEQKCkObXuZTRmt2Q25+qM/Ls973otI=;
        b=dQZ3IFubH9gI2jg/gp8HqU98fc7aBOrxFTcjz4dnBQUqkese2qhIhh7Y3OrkDHYWue
         D92MYGMHfDqX+lEqf4cEBeqDBJ7iqjOBjzZ84vgwfJP3dFkZvXUpf4wu3M0gmy9Gd3H+
         OcQW4yE3CS8Am4IXUG+ZbcjTVZyGY4GDwiUG02FQu8uS5ry+DX6yR1GNwdl1DQWKmquF
         yhaeHQMZKOe1O+Os6kaR06a7jNXRehDVOPic99k3JNPdlY91NP6IZrV5gOV+INj4lRqR
         ilMKgqjSySnvotwzQm8zWpjHXpez+ZG3wQQJoVh8otuvIjDDJd+wNx0Z5GmkMf9EFG76
         1gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701816590; x=1702421390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrFaCxut1vMUHEQKCkObXuZTRmt2Q25+qM/Ls973otI=;
        b=XakczIJSQA+pFYkyQ/RFINnXlIh8k3X1S+nNz5P5uYCCyQR/tQYJn9tBEHnqeYkwyq
         Wq67PIM/DxDykbLMG+/oAwT3bqEUNnbFXDvIX9d3SlHxsBXB3XtGe2G8NBxC92vPKjcC
         JygUhXXj/YG6ZGotQxt6/89GlrMcNrXyyGdPXDYBz0x9ww5RE2LpFbOcz5HX5nEB/RkN
         FejlOytJ7aopmae93S26b5mAYMzML5OEsXPRsUeCrXyDHrPt6aWFz0sfYinOPh0Gpc8D
         aTIX7D2MizAQqAYqLbWUsqyMAsgUA1Hehe5e2xBdK90lSXJI9yzBOjs61kMZAWVRlAKl
         N3Xw==
X-Gm-Message-State: AOJu0Ywstb5PpD9jaN7CZQgso4wHWWDs4b1stZghJ0eNCpyZY1QaYQNK
	tHiO3Cmq99D32nIhoB/h4nDBehmPa8NXnDLK3mhang==
X-Google-Smtp-Source: AGHT+IFEmFb+hr6nRdjNrf1j/t6+1nDZojjY2YlEds/9G8SBs8lIXxIchM5+Ia+fLcw0ALQ/l3k+kJcKL5pmaaIPjXc=
X-Received: by 2002:a81:b622:0:b0:5d7:1940:dd63 with SMTP id
 u34-20020a81b622000000b005d71940dd63mr5381287ywh.57.1701816590707; Tue, 05
 Dec 2023 14:49:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204093509.19225-1-brgl@bgdev.pl>
In-Reply-To: <20231204093509.19225-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Dec 2023 23:49:38 +0100
Message-ID: <CACRpkdYn16SbWtS=hSx0r=pmNR9MKYTKd5q9Btr=wft8n8CRFw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio/pinctrl: replace gpiochip_is_requested()
 with a safer interface
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 10:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> While reworking the locking in GPIOLIB I realized that locking the
> descriptor with users still calling gpiochip_is_requested() will still
> be buggy as it returns a pointer to a string that can be freed whenever
> the descriptor is released. Let's provide a safer alternative in the
> form of a function that returns a copy of the label.
>
> Use it in all drivers and remove gpiochip_is_requested().

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

> I plan to provide this series in an immutable branch for the pinctrl and
> baytrail trees to pull.

Nice! I'll pull it.

Yours,
Linus Walleij

