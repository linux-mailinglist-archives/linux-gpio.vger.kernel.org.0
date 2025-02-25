Return-Path: <linux-gpio+bounces-16593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D77ECA44EFE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 22:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78A3F189CEBC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 21:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F02420C02C;
	Tue, 25 Feb 2025 21:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FusTekW9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24F2151991
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 21:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740519378; cv=none; b=LQoKlAzIplMMQ0Q88/G3yGCVKWPd4pjgsVs8xnsjDD12nn8YE5Ay5Ig7sDmMUiQ+Gwvi7PuM1cQH9OvwlIhKYmLyx4vzwhg/aQM2w9swNRvNL/iXp2R8k5y8LQUQNRvjEHC24k1Y1rHkN2etU2smnNdlzx15dBIiZJqbxZFilwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740519378; c=relaxed/simple;
	bh=jsgR1CcpkfBKgCwcL7kNHyDvZ8Ph78Owzp8FKLFEBPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mwda12pvqKt+Fp+wBv2tMcglDHHIkBZnYpalXt2iz0027TBF6JHLSRn8nsa7VP2iSDM7MZHvSrioSyUSW8y2bTgJEXsDuE4PdjzTMySYEWI4kvxMMYPaHNaEfWec7QisVGBpqX8NeZrNfeWjErlUCrcFX9X4cOpjfPCsiZuSHBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FusTekW9; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30737db1ab1so49296131fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 13:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740519375; x=1741124175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgsKhYzK0ccEnXiVc5xNUD/gNvmfefBesZ2KsZO47bU=;
        b=FusTekW9a8FDaxU2TI2hXZBMD/94OtjS1tqtZZRDZoGZSACh7E7E4OVq9ZIk2CBr18
         Pwb9NKuAOLqeiTHiOCveVeygOr07j/vtyCT6pe0IumUOpuLLS0UiHOtAutK4nTBNd0m1
         /5yY9W9VH5yn4sqG9zgQIcaOtTwhqmo74SxSQqNAA2s+4lWBT8lS3dzDAsxAd9OTDKLs
         tRd/DvfVQ0NNQ4Av7cnRQPh1Ib47yO0oAinSJc7xa/xbgvDl4N+1ULsartSlFDpmw5f2
         5he2mAFY6eS7JX3PlEO/jpBAbbQ4Bl5h2rOsc1tM2X6fs+xo0xzgOdkmKYBVfXu0GZSg
         sM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740519375; x=1741124175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgsKhYzK0ccEnXiVc5xNUD/gNvmfefBesZ2KsZO47bU=;
        b=EnPuba7Wrs5djsAT62LziH33TxDbTKm76G0/o/jOSRg2Xgzfu/sKUIzfErymaR7q0i
         5k0i3ecyJbI2m1zilsv9AdpmaTVUahJ6OZ4eANB45v4XJz78b9nwZy+6E4egN2TeOvtK
         DpAJ3DQpd3de99vsE6nmoZPpbNABUDDKKZUPviw57o5ZStp8MVzC6O3Pu6Kcw6FdgIrd
         wBwtMJUQjwFNiley2QLEU76z6+en/umC9eCod6H8+EJq5PHtFtG1zchtAr2k944QrA3P
         uMSxkgJsXNpAnP6TROZYGzfHQcfi8Dsr9/jARM2779Rg83rJJ3WJwECsNReX4CFaHS60
         sZGw==
X-Forwarded-Encrypted: i=1; AJvYcCXVeGydD8YugfYWKH882z5pe1eVdmTQRoianBcza6g1r54PAL/zd3kTwEPr+mvnBslEVFUw6ZRL0d+W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg7Y4vDhsbcZq3sfWEc/Q967fQDUGUrggvDQuKbF25KUEdLZat
	VQ3pmQJwavN4b1DUrAfeaRXXAoBibG0TYoLqTsJTJ8HSuHD9nUNU81BKfkFAyAa7BqNQSLMM5Q3
	t5wgJk6XV3b98YyLfGeMi/UjToFw31ewk+ZjvFg==
X-Gm-Gg: ASbGnctHJhS9fyKyqs8xdEzhiOgvMyGjcKru5GAsM8jEhuGhhf67v8yBiFzi1k6L8ct
	bf5RFAtziuY6acHb+Ym1k0cptClBvNNofF0wZfKzBjvD0LTUbMo/3AQNqeY2qI8XatWxXkA0CD4
	EPJL7EI/8=
X-Google-Smtp-Source: AGHT+IHtK0GrikirtfWiHMcu4twRuE4bwiVH2TqDeFM1nOp8IzyFh/GRwHs9tMlflIxoYxAaZLfP6DCmyG0toUUaOvE=
X-Received: by 2002:a2e:900e:0:b0:300:3778:4dbb with SMTP id
 38308e7fff4ca-30a5b171675mr69335381fa.1.1740519374778; Tue, 25 Feb 2025
 13:36:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z71qphikHPGB0Yuv@mva-rohm>
In-Reply-To: <Z71qphikHPGB0Yuv@mva-rohm>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 22:36:03 +0100
X-Gm-Features: AWEUYZm9IB8uZx5il-FUDE7JKvkQMqjNNI8CBvjDggXboSfqsX5Hba7CBEVyDck
Message-ID: <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Document the 'valid_mask' being internal
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 8:01=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> The valid_mask member of the struct gpio_chip is unconditionally written
> by the GPIO core at driver registration. Current documentation does not
> mention this but just says the valid_mask is used if it's not NULL. This
> lured me to try populating it directly in the GPIO driver probe instead
> of using the init_valid_mask() callback. It took some retries with
> different bitmaps and eventually a bit of code-reading to understand why
> the valid_mask was not obeyed. I could've avoided this trial and error if
> it was mentioned in the documentation.
>
> Help the next developer who decides to directly populate the valid_mask
> in struct gpio_chip by documenting the valid_mask as internal to the
> GPIO core.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Ah typical.

>          * If not %NULL, holds bitmask of GPIOs which are valid to be use=
d
> -        * from the chip.
> +        * from the chip. Internal to GPIO core. Chip drivers should popu=
late
> +        * init_valid_mask instead.
>          */
>         unsigned long *valid_mask;

Actually if we want to protect this struct member from being manipulated
outside of gpiolib, we can maybe move it to struct gpio_device in
drivers/gpio/gpiolib.h?

This struct exist for every gpio_chip but is entirely gpiolib-internal.

Then it becomes impossible to do it wrong...

Yours,
Linus Walleij

