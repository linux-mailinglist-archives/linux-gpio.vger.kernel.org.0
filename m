Return-Path: <linux-gpio+bounces-503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF37F86B3
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 00:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7716D282473
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 23:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CBA3C49D;
	Fri, 24 Nov 2023 23:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atCpN4rz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FD510DE
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 15:28:03 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5ac376d311aso22409797b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 15:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700868482; x=1701473282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2T6xhJOCHBr72o8TDhfTjNe/mgHT5Nn+BnsbczQFrE=;
        b=atCpN4rzQC5g2+UIz/SivB0roFhN/AxR73FfuDxTNDxZGHUaRQYLYk7lrRkO4nsA2I
         OTgGpsuv/pwbgcLQEwupMy+ZPFKRf2Y8vex021aOTHXDE08sPfvsPfiCEgbukqDZI85a
         I5Ruu6w2FalLHzbm4BaBlpJXv6Ruo11FjPz4UuGKOfy8qcjX7LthIzJEAfmB6BrH092s
         SHfDNVFNUFiLcUbCGtJ90pYLVsMh8FX0pJG/DQCW+hYfn8dKngxgPQwdmHR/P45kcD7I
         5HauS9e6ohkNmx25AMLpNYCrF3c3Tek/2UC5N0ul11ejME14u+7N/vXmkc2wymfD8fO3
         RKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700868482; x=1701473282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2T6xhJOCHBr72o8TDhfTjNe/mgHT5Nn+BnsbczQFrE=;
        b=hEowdUFvM8NZMVLXJjCfOt/N7zNao4rHPCr/lOhzJardKv5ZPVbshvslbkOKT+A412
         XrmGcMzmtkrZKGxwRqG7k4lHtd//lvsjtoV4RPhPxQidgnVexJTPkVuXfIlbsYs2mAaK
         5OnK+YiQLij68XjA9OYWaBGJXmNbU15b1xSXvnQY69+qm3lhaGtbRsZ4u6JhUnVFnz0t
         4QD71CY2Nk/8mMVmm+vVt/4eFvu5k/9cu6jjncQYGih7/Rc+EZY8ruFYDMghHPYoIPSW
         0iSbEUPEf2spUvqA5yP0DUBSEeWYMqnCv0hF6FnB+88P4Vch6VrLXrH5ICJAkCh8b+bx
         ga6w==
X-Gm-Message-State: AOJu0Yz09ovlTMnByMKUg8Ra3QFu+WtI8d3uyYDdM7EhsDBG72IsxNex
	zQx2vjYi4bpMS/XQD5n6ZqJ9udDmH7tAWjYS6xIbVg==
X-Google-Smtp-Source: AGHT+IEaF5uolA+HMAwWuxAWZeShooHQqlRPuQDzXT3Q0kiEp69ZHcnKhaqRDxjLYLhGa+UtUv1SkhJpjGvdrp4VFWg=
X-Received: by 2002:a81:8843:0:b0:5cc:e5a5:d951 with SMTP id
 y64-20020a818843000000b005cce5a5d951mr4563960ywf.45.1700868482367; Fri, 24
 Nov 2023 15:28:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124193816.30412-1-brgl@bgdev.pl>
In-Reply-To: <20231124193816.30412-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 25 Nov 2023 00:27:51 +0100
Message-ID: <CACRpkdZ44D2_dxdwa13z9c0Upu_VUaZJHHkXZMQCnms0UKvLbw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: immutable branch between GPIO and pinctrl trees
 for v6.8-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 8:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Here's the immutable branch for you to pull into the pinctrl tree that
> provides the new gpio_device_get_label() getter.

Pulled, thanks!

Yours,
Linus Walleij

