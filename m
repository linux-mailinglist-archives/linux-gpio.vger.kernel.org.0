Return-Path: <linux-gpio+bounces-2824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6F7844652
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 18:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03B4A1F27485
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 17:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821F312CD86;
	Wed, 31 Jan 2024 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlJJHXig"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6DB12DD8D
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706722783; cv=none; b=dQDGcrUHLL7lLuKVlwTyDTzKEwPvgdQ/L40m2XZBn1mBNz3R8I0EGh4QasddYOLg8O825nv5wZ/IuU96EapMtiDNSVhbHKTsmM9kEfiMPL79S+Ekbw3yrKfugFhncxFZweb5NJKNVu9sfCXw0cwCYcWnrbOL37NU1ef2wZxCI0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706722783; c=relaxed/simple;
	bh=Wmr6FwUgKE8e2RtVUlgvM+N2G0P0c9ELvtsRNvj36p8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ff8cA7WQqkXlxm+BNl9o0aKHb2MwtdJVVzbB5JHwlxDnw8GIUAp2qKGzwsRXZN8AiJ/p67EBhxqeEerDgA1oANu08jnYAcL6iCNJ67qlDqieDfDqx1cQiQW0wNR1G4G4UCM/xXby5OwDK7R+VV0uRQ9wa1lPbedljdd7IeUNoPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlJJHXig; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60412a23225so6080187b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 09:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706722780; x=1707327580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmr6FwUgKE8e2RtVUlgvM+N2G0P0c9ELvtsRNvj36p8=;
        b=jlJJHXigVIcPFK7gTRT8HMuvAeP55PvCoSx0RKQLr8BAFVxhwtTFBl3EsXDXJFzasl
         yV1ZCc+WU2XU+YJrKnnvJmFaoXw0q65WAaVeCFyo8uORpX/98UveRSRV4FkP6UY9+wq8
         7C0eOLc+eMI6v89o01764spa6Vm8QOs9SkTgyT9T+EW1WelhtdgJdaR3S1RolpxQTYdO
         5i2d03qdzqdRXngsyRrLyKo3hZ7HWhtwcy0dlJO2KQYOiZ3ma3glMik1MFPZIJ6ssHDP
         Sr/1mv98H9Za0FCEWomYBb25tZXBf1KA87KQaqrBOgb3oRtuubxdSg6WUTTB8LsP5YBU
         rSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706722780; x=1707327580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmr6FwUgKE8e2RtVUlgvM+N2G0P0c9ELvtsRNvj36p8=;
        b=OiY9X+bwmi6HXgx787aH3WhNtMwnPzi4yuQb2QsSlGVX2JWpBWOihxuV0ozhVXdJAj
         0rEeNxpehS6Kv4sFuTRpM6H8iCqdXTM48ovcjFQZ/niH47AE/tWfjBJMwwFu5+nVQ4FU
         qdseQjQjH/YC0WD/U6ibLepBe+fblogzXjO+sfnIROH4bP4CN7889DzPZ4U2Xio0DE27
         GQm54NVWzmA/TuKDEBgdLtbpTvUcgHOW73lvH5x/avuYzPJuWkPgahWaU6iGZOZubUEF
         RHIHXkh3tML7MPV6Y06vq6zdeq7po++mX9tRX7F8ZP1RWKopTiXDfQKpR1MT5ZOeCUha
         90Cw==
X-Gm-Message-State: AOJu0Yzo0EPsVP9vQwnz/sHw5f+J+B1akRTqQk+0NyCyj4bLRLVhSAQ3
	qj5NDXsqMj51XJLwrhTFO1xRxiVpVRnRUYkPMns4TzfIIoyg+LZYOjkoKn8Dzh/x+GBI4Srjumc
	mOby99RFaxp3DioDTsNSmzKGWdVqbRFsBvaOwng==
X-Google-Smtp-Source: AGHT+IHe6uZTnZBFqy29JxxD8jZ18K9pm4CFaqrzg9KcFhM7UsJcIsDHdUFfaVm5bEAJs/0FTd3gLJSWuL2GLPeEcmc=
X-Received: by 2002:a81:4318:0:b0:5f7:992:b018 with SMTP id
 q24-20020a814318000000b005f70992b018mr2190237ywa.5.1706722780568; Wed, 31 Jan
 2024 09:39:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-4-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-4-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 18:39:29 +0100
Message-ID: <CACRpkdY_9=2Uqo9=ZEDrn+RFGdPkq73ZRYLVCbh6BLMzU9LZ_A@mail.gmail.com>
Subject: Re: [PATCH 03/22] gpio: remove unused logging helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The general rule of the kernel is to not provide symbols that have no
> users upstream. Let's remove logging helpers that are not used anywhere.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Seems unrelated to the rest of the patches but OK.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

