Return-Path: <linux-gpio+bounces-16995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA4A4D57F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E7077A976E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EDE1F8916;
	Tue,  4 Mar 2025 07:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0bS78ux"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCE18D65F
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075077; cv=none; b=g7iUHLEA1FdFepj//vwKvuhgE2SQkQ78MO0/4cHYDC61RFaJEruWa9eOMqNoW0Hm2z0KBPuGDvqsD3DWoaxlhti2BVphw+CRt90ndaVQ5uLifxvYojnMbwg9P1piLOobnjujAXFO6TidTjUJRdg0RBojv/rt5K31reFacxlkiKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075077; c=relaxed/simple;
	bh=uFSrwfAZqk41LBtysZsC0obSOGXPJGDgnLsmqfIMDK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+LjR9fDvtRteewD9cMleZod52DxPvF0esUuXaabdfLPkGT5QlWFJIZauM2HUWkooEbiis/OIK7R99y09pDkIt75UhvCXgWhkee27jUwi75RCS863bef+v4gBW/Ey9BNZUAtEuQZ+FP5lcY0gF/PmBC/KWdkNBEtis48l/3Hctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0bS78ux; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3072f8dc069so57782861fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 23:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741075073; x=1741679873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFSrwfAZqk41LBtysZsC0obSOGXPJGDgnLsmqfIMDK4=;
        b=h0bS78uxQEHqrlGBbWDNyWhOnfXHwswmQNb6X5XQwuRPExDKrGn+gxQEPfssC3JprW
         Rh1Bs9nvtLHa3P6gZmBaf08mgbG0PD5+DvogS0CYjuy1f8rbNDd74z2s+xioGRU6m8ED
         w7emGgmBeK/po3vvXx0Var4PqInQjhuOrtBl12lAlrLL21HS+VeWXpSRYmIFgfoxKEXk
         vFWWqSnE9wS3gUVUznZc6icn0x2mzC+sSbm+F162ykEcyEyCsRXRzbCvmQIczKFOWr2W
         CZi/t8vO+QhSpOb11QKHcWEawqIzNRGgJeM4osiucVIWWYEh+eyNJ2jUkCaW++h6oWcI
         iqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741075073; x=1741679873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFSrwfAZqk41LBtysZsC0obSOGXPJGDgnLsmqfIMDK4=;
        b=DeP5ZBciJcnJ6eSzs9KlaVgW00NjusL4yLPTdfQZlORtVOimhXKYe+6f4TR+ER6CEd
         c+oV5FLmz6D9Z/2WzVz8PBRDEuKaf6wr9aqFoJ5VQ0dngn23uAJHXv05I9HB5XnodTmP
         T7lE4tz0GJRZysPDOuQAGLPQBYKpH/rwa0hh6hnSv6fd5SpuTL5nDL3JniP0827DCKl9
         d8Nvzfp/njHUEVmJfj0SSvbqtE5p9JdVsBvqT9HTc4EqlRzVUB9Q3506by393+KJfguL
         4iv2EaHmT8JyRlfW/qOIOpGOwuRMdJJYwdAooGxd72o76H+o8wQPtQegfEgadVoCkevx
         LEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhlG6T4TQUVk2D+rGdRbIonMKz8+9gauNAklVB36F1UUohJ3ZjbHCILasuN0QpJ7OMeeebruQ4cJY0@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOmLRiOGZqzl7UTXlwxR7Q/8d4bcikQT455TBLCkxeHpaEgyd
	M3PpN6SYYxJZDj7qe1PDaZZHdH4uwj4de8pDW4vyUMNsTb2pupkJb18ApQFpce0LqsVnodnacaz
	QQpaX0WVSsgrRrF8ucv8AQSV+XM3oDkXbbM3OWw==
X-Gm-Gg: ASbGncsNNop+d2Damv8RxhvQ8E3IUxhtxsqGBH82eOxciDh7vjIzPTILdiItY3Va2Lj
	8qTNlYw64D5+PVCF0/mPNo7D69jGFc8un4K/MSOXAvwjs7AadCvBvdmhWHqxyyAy11sShmlfVCq
	5rf4n3cf5pXfzUXpJmu5U1qiCiFQ==
X-Google-Smtp-Source: AGHT+IFUItRedI2YhId4MQjoRhsnzWgBSgpMCiIIbrX/B01VKJvMgvQpYNmla4BoPUJ/iCM2iebgjYU/iv6QgkwIA2I=
X-Received: by 2002:a05:651c:556:b0:30b:c83e:721f with SMTP id
 38308e7fff4ca-30bc83e77a3mr14176531fa.15.1741075073573; Mon, 03 Mar 2025
 23:57:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740745270.git.mazziesaccount@gmail.com> <fe08d70938b63206421dd39ab71cdedd5dc458a1.1740745270.git.mazziesaccount@gmail.com>
In-Reply-To: <fe08d70938b63206421dd39ab71cdedd5dc458a1.1740745270.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:57:42 +0100
X-Gm-Features: AQ5f1JqqwwSDIbZMqDw_-etGHDDKdPgc4Hf7zcm5pk30Rfl1B9ZP_8HFgo8U7Rk
Message-ID: <CACRpkdYjfvSywb2=ppopk5W57jCbe8fj-HK4HJFS_cMLopJ9YA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] gpio: Hide valid_mask from direct assignments
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 1:36=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> The valid_mask member of the struct gpio_chip is unconditionally written
> by the GPIO core at driver registration. Current documentation does not
> mention this but just says the valid_mask is used if it's not NULL. This
> lured me to try populating it directly in the GPIO driver probe instead
> of using the init_valid_mask() callback. It took some retries with
> different bitmaps and eventually a bit of code-reading to understand why
> the valid_mask was not obeyed. I could've avoided this trial and error if
> the valid_mask was hidden in the struct gpio_device instead of being a
> visible member of the struct gpio_chip.
>
> Help the next developer who decides to directly populate the valid_mask
> in struct gpio_chip by hiding the valid_mask in struct gpio_device and
> keep it internal to the GPIO core.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

