Return-Path: <linux-gpio+bounces-2834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 361ED844867
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9BC1F27125
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB623F8F6;
	Wed, 31 Jan 2024 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y6YnjW53"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15BD3715E
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706731598; cv=none; b=lqGddAm9OfPMRb7MNS/FI5EF9MOkqloH7O0A6vWDeXF2+rr9pZGZKEPd678UXTHjQUkII62pa+mjPCS9CMwek9ZzXr+v29Npp66o4jt/U3K417LhVU4wHkvJ/Ug18QuzaHblHndLvq13oyIj+1HrhQY/EMdr5ZHEHRQRcYKQRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706731598; c=relaxed/simple;
	bh=8ItXQIkQttPChHbaKqcIBbqwcZ1KdszXLl9Uwy7Sr4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLebwsnmnYPvMNn12cJCq7HX+NGxmjnLGCuvovfLhk7Kw5J1FfGOpckMHEaH8bNcakL0VGpeqrPZLYCyhKvs8m5/ZH8kVekJjLEZMVQ4JRPpOaYbhlakjkWeLe11HGwRuk+noXv0uKZfsoJmnr8yZdY99QmWJBXiePQcBT2dTYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y6YnjW53; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5edfcba97e3so1790747b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706731595; x=1707336395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ItXQIkQttPChHbaKqcIBbqwcZ1KdszXLl9Uwy7Sr4k=;
        b=y6YnjW53LxyMfQFJSdY6lwbVIPX8uJZCen3WCanqeHm9XtrlY/JHfMaSLQRyV0hmhj
         cfwtQFLakcGPcItrY/P4QdrvCy6nV+2hvZPmbW1XvMdRwvHiGpglPIf6rjqmjy0BAQNH
         YHMOSfEdxiw9uiDIumByzImNeOaYMAj81G+Z3IVXZY7uilOlQuVtHrpkzogn9Y8BnI8s
         1b6f6jcglShVfr+2jVN56SotC6iYouf8ieqIeenURnxb6U9n3cF+jTXBciqzKT7azxyF
         J2tKo5nnSFm46JRQ+47eKdXoBmHk16KGsgBJsM134WHgxZqSXAzIQk4WD9O4fbk28Q2D
         gHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706731595; x=1707336395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ItXQIkQttPChHbaKqcIBbqwcZ1KdszXLl9Uwy7Sr4k=;
        b=kxxE2TxS7zPmdd4HZfHUSY8ZlvYpJxqg6dhSB1egu7kM1dGIMJKGLxBS2zDaR8CTbf
         KQzTMfVu9YqpWyUIg1CAfVb/R3cUz5um9+D/weCg5Aabh+DNPvyKpKy+Xgml/L0RtSPZ
         RuAve5Mdh+xJm4lvELdfObwJNsdikx1cgJnixHexqhLODwrAHB/rXSQfFSX3leL3c8+G
         wqCoqG0l1gMykI+AHb0R4mcaZPLT6VJWeF644yR6+hRwvXzXLhLHjoi5OVReOxkPAo1D
         zb2kDyd8kBA3k0kroqByi2s2f7viStcGoRZIlJmFDQZJ0jR7ssxYsNS5VHbHwDlbiKp4
         xKcQ==
X-Gm-Message-State: AOJu0Yz97QMBuB9IeQOv6N0PwOzkRU9RWVW47Yni+HoVEl8FojvQBSIw
	TvsYZM8mySTaq4aBkIsgqgb08c9AjTvXx1aD/myRO6DWYr1DSWK9GnFSOeayHIkuvBoiF31ePuD
	nIKl4BVfhOsnmwI6AP45Vjo9grWscHDsPJoenUw==
X-Google-Smtp-Source: AGHT+IFOT1HXlFCXtHspX3UTVDTXTIGkWZx8hpYXw/Zb6yKcZalkw99EB7yeSJu6GX8s06md6Sc0WbZcI6LX4o5msBs=
X-Received: by 2002:a81:bb52:0:b0:5fb:c044:f087 with SMTP id
 a18-20020a81bb52000000b005fbc044f087mr2423659ywl.35.1706731595576; Wed, 31
 Jan 2024 12:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-13-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-13-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:06:24 +0100
Message-ID: <CACRpkda2dgK1hWdFRJh7N3qER1q-+Hfmng_Kiap1PNYQ-edcEA@mail.gmail.com>
Subject: Re: [PATCH 12/22] gpio: sysfs: extend the critical section for
 unregistering sysfs devices
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
> Checking the gdev->mockdev pointer for NULL must be part of the critical
> section.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(Unrelated: I don't quite understand why it has to be a member of the
gpio_device if mockdev/sysfs isn't enabled, something for us to fix
another day.)

Yours,
Linus Walleij

