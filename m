Return-Path: <linux-gpio+bounces-10691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A498D441
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 254462845FB
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963E61D040D;
	Wed,  2 Oct 2024 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvIRN4J9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51BD1D0408
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874886; cv=none; b=A+5Yh3sD81lLUVlvdQjufSGj67QU/LMf5y4g4Czmg9fsWM4K1y1YW99FGh048UCgJqQqwffx8V1XV1Bi7+m6ERdAsG3lgSSIuKqni+9gGOJ1chJgT0qBi8X86gYVbl6U6CBTsdkyF8fbGxYpKOZ4RunB8+0rFK7o3A2Or95Q10c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874886; c=relaxed/simple;
	bh=MRQEBnuUvJm6GyN9pm8e1jqWQqOcblVGAT3oHBgmQN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fe6FKYrmeN86FP+wcuMsfCOQxcrQDH0pAP67BzMwCRpIJBkhCOrSNDym4WL7GxUJj6WpVIjJFJSFpL45DGgs11QBM0t7dmw7f3Wx5yfGsoZFR4sbUknuqyqy277k2mFbvT5AW+6tp70jUKaTFz1q45cvD0nq26ZHGxoPjykgsCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JvIRN4J9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539908f238fso4317133e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727874883; x=1728479683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cis8PNXAtk1zgd9BHO9mBomJDz+ouLoNSLAVEjNH6JU=;
        b=JvIRN4J9gabpJa5GurKEH/3ARujzer4/k7EeYaMM8ATr28VVtoMEXLRUI9ZcxUDVtU
         7iZ/Gm8KT0SVUw8eUE1nF/BeugVjvRxxCALfe4qCLOuHgDtM7aOaY5rCHrWd7jymCHvh
         hdXqx5QAA41fh48CfUh4LOt351QVjBQB6WjQqcDUF3y+6/K9rBahJGpH577Bfy/B4S3R
         WHhiE4KXodlm20kLRc8Wj6BATkN57p+seBNy7QLf7N7tKpu9zfC+ZMDkrp3ipg13bMZK
         D9bi5PDulKAEADZI9wYTLhU49iTKfy07ZxjWFDyVLtAS248r7mO6HcM5tt0Bu2gZW8tI
         ke3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874883; x=1728479683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cis8PNXAtk1zgd9BHO9mBomJDz+ouLoNSLAVEjNH6JU=;
        b=psorIcTIe8BS+MfNjN3SiNQY8vYLBINInkpKbwqANWYyLk2EilSGyaizNOfTGIwmNu
         riTFD9D6GaUgFwvqoznY8UOYx1X8OslpUJNGFfWrvWC3HukUkHt19vQGICBxK3DM3nIe
         ZX9xgmyq2kT56rcwf/DCHDyxXpUG+2FP6CltBFhoxFf8jTp458KUd+Ao2PnyxESvoYj2
         wWUXRGNBJ5ToHixDgrV6M4sD+wIlwJnb0D2A42PfMeDtSzszp4aonOCwROit4WaT3xqq
         TuLhOdCcSxJ1jcay1shlaIth3dFaqjyCnIYAiTnTfYb9jdCrtQpkYn0Ak6RW1oy/uvLW
         pCWA==
X-Forwarded-Encrypted: i=1; AJvYcCVJIvC6OY/qHG6I7XuERzo6mdxvHH7qP4GCRq84SJNSo0BH365e6SOlo2q8KyAeIC9pqztZXfS5Khap@vger.kernel.org
X-Gm-Message-State: AOJu0YzfMxIUUvH3OSqhI7wTx1FrRQkCuIpD2ZXiJoYm/NY5d0GPc1yU
	L26NeuJ79edusg9Xd95+wmNs721+6nA7y0ScQ8vfl3w4tZSbQhzxoeZys4Mmisle0kzy1QnVAZW
	c/YsZIP4XIaeYQqjPcF4S0xeRKjxROx0zouQPmA==
X-Google-Smtp-Source: AGHT+IFjWE4KjxytZScCLgFahO1ykGZ/NIqDzX+zl3zfnSVVFdwEVCoJReHQ6LtTogDkrStt3MhVEHdpFE+L8qC6MCo=
X-Received: by 2002:a05:6512:39ca:b0:52e:9762:2ba4 with SMTP id
 2adb3069b0e04-539a067c583mr1644867e87.25.1727874882723; Wed, 02 Oct 2024
 06:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919135104.3583-1-brgl@bgdev.pl>
In-Reply-To: <20240919135104.3583-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:14:31 +0200
Message-ID: <CACRpkdb3ui2AH_FuvMEvk-XdwsOyrDHKPPcjHPoBSpu+EdUDzQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: free irqs that are still requested when the chip
 is being removed
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 3:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> If we remove a GPIO chip that is also an interrupt controller with users
> not having freed some interrupts, we'll end up leaking resources as
> indicated by the following warning:
>
>   remove_proc_entry: removing non-empty directory 'irq/30', leaking at le=
ast 'gpio'
>
> As there's no way of notifying interrupt users about the irqchip going
> away and the interrupt subsystem is not plugged into the driver model and
> so not all cases can be handled by devlinks, we need to make sure to free
> all interrupts before the complete the removal of the provider.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Late to the show, but it's a great change and something we should
have fixed ages ago (as usual...)

Thanks!
Linus Walleij

