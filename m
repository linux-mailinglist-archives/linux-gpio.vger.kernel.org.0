Return-Path: <linux-gpio+bounces-4992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFE58952F7
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 14:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEAEB28474C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 12:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086FC6E602;
	Tue,  2 Apr 2024 12:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mc3r2EQe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A22D78A
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 12:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712061018; cv=none; b=gPEMPp/yv1aPpcCNWs2l67ECUQdgI0w2VZU9vtV0wPNm98Fl41tzW2ceejyx6V5QNpTBGrz00CXHWhJHwtNjqZKu7Ol2g3tff04oiinJ8IlNy2uM9YjSH+HiqmXsOeGQT2VMNtLyhL2qpi7n3YfcpNzAPpfZzNuF/e2KdEmLeJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712061018; c=relaxed/simple;
	bh=Zs7RYzJuxbghkdLPqGTx29qLDxS9pI02mK9pwl5L2Vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFyfteqtt+ZIf4BCLZJUSn6FEj27hc2grQEj95VX4DB9Jp7w2iTwf+wX6lGvJnmVgW7mAexWW34B6VI7O54Z1AfibqCzfb9SivRZA7xJgDLdOVbis28foWxTkm/Z3EtKUqKTOi57U5UX8mYwI41H7AMwojvOgW0akpsLSoLCRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mc3r2EQe; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso4703952276.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 05:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712061016; x=1712665816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIcPIkXXOlhDttAffO2gh5drI+8AQ9cgDL80itbQeww=;
        b=Mc3r2EQef3j/j0PJ/EZzAut1j/h+so5o6H2qGqCvmQ9aDQody/BCsAQjCJhBOnUe6M
         wIDXLuZcHFW4IHuhdHEL5uBbHM3RcvQqd1RGxD1qUwAa+3c2sOHpn713S0D8DwCMhhmK
         nqfVaYTcbW+T3VGDELI/a0BAPdPB7ApZr8m6a6k/Sto7kJvZMh9Uw7Jkm5HVhW4gWZWS
         5OwVvoYdi9/rGZYHT8dIvOIg8/KINo8b8GG54u1tgZvqyzwJEngCRYJKBBxBPLkwcDxp
         Q/N7+2D+PuIMgqmGdnViYq0phkFdTSVkePeFodMIovaYkUc/6jCUmn43nNy8yyIhb8A7
         PWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712061016; x=1712665816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIcPIkXXOlhDttAffO2gh5drI+8AQ9cgDL80itbQeww=;
        b=n7yNIHNDoWQ0//Q0vuM9iOG0GsBp6tDPutduIq3QeLDc2wNTsd9CW4eoa4bBh+oHye
         lbTVAnPa4we18IEx9ffkZA6OWgLeDKUUJpR+oqw1V82MpyNeQiDq0WYAt/+8cl73D9gb
         M4u2TXwDeQEsNnDuKwf4CFOUhOII/7/FfRsXsO+NYUIcgkuY98rK8T4N3KqfiE1vMFXp
         foe8n/Y4ug1Z+2+2fmw/w/gjmYFn0zhMNSb5HY7RcUHQyv6VNyF6j/0AypHEeqKZxeeA
         qCDvXaP3V9TM4jtnO7IfVYXHNjoiEZ8ljiRo+6s+5CBTgcor1FmBbowTExli8+aCMbak
         P7bg==
X-Forwarded-Encrypted: i=1; AJvYcCVqOa4XjdBfAMkQyOPE7lSbGzu7l712Z0p1jTKUzAE7ztGKtWPKE/0UvrbBt7FmUxo3cGBqfGGyAOJNhRLHdDYM7e6cwCNRPEZ0/w==
X-Gm-Message-State: AOJu0Yyt+YRmRabtDA/aBVbdbzcEsxfk5GOfgpTDLGCepcbO8Kl2ld6q
	mbMH6+nMNGLHFiCj7WWyW1bwwR60UVRNQg3OUJaJk/tDswiLuGmZpg8COwvohuUNI4EFxHxtUb+
	lNSE5piCLHY0pbDC2itoVd/KMpIHioGsOQI9ZuUXaCm3riDTq
X-Google-Smtp-Source: AGHT+IErRszW5P64U+kk4mUR3NVbU4m6Fv323kf9eS0aVuwmDLT5AdRvQYEQHF2q6E575YZZsy2hpqyd64ENJXefK/g=
X-Received: by 2002:a25:807:0:b0:dcc:a446:553 with SMTP id 7-20020a250807000000b00dcca4460553mr9476757ybi.57.1712061016321;
 Tue, 02 Apr 2024 05:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-gpiolib-find-by-fwnode-stub-v1-1-05a0ceee2123@kernel.org>
In-Reply-To: <20240322-gpiolib-find-by-fwnode-stub-v1-1-05a0ceee2123@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:30:05 +0200
Message-ID: <CACRpkdZn+eZEa62ZjttxS3sgT63t5bRtpueFmrG3fsrqDw=xSQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Add stubs for GPIO lookup functions
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 5:14=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> The gpio_device_find_by_() functions do not have stubs which means that i=
f
> they are referenced from code with an optiona dependency on gpiolib then
> the code will fail to link. Add stubs for lookups via fwnode and label. I
> have not added a stub for plain gpio_device_find() since it seems harder =
to
> see a use case for that which does not depend on gpiolib.
>
> With the addition of the GPIO reset controller (which lacks a gpiolib
> dependency) to the arm64 defconfig this is causing build breaks for arm64
> virtconfig in -next:
>
> aarch64-linux-gnu-ld: drivers/reset/core.o: in function `__reset_add_rese=
t_gpio_lookup':
>  /build/stage/linux/drivers/reset/core.c:861:(.text+0xccc): undefined ref=
erence to `gpio_device_find_by_fwnode'
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Since we have already exposed the innards of gpiolib as much
as we have I guess it's a must:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

