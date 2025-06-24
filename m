Return-Path: <linux-gpio+bounces-22100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1F4AE7016
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AC8417CE5E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141562E3380;
	Tue, 24 Jun 2025 19:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uvz+GWRp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29992EA752
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794351; cv=none; b=Ac0PRbkPdrodrV0KuIJKYMgtGz5/hwBZZeU0WP7sfjENaaZOt90YGb/aoUT92LnQp44uQBWeq155rF/AvaHa0ngpkcuHkO9QJv6UCze2lYx4WNG61ULOKhpRUdjxDs+w9dxN6tcmnGwVxALCQtCRe+HIWoCtKRnY6VLv39liJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794351; c=relaxed/simple;
	bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tomFS1GQepTqq+zYGkgaPqduZDtaJRUe4JaR2/Z+72FTO76I7mrh2pxa6XcSAk0BPGOuR+ouCtqV09W41BME/A2NoeCXa74i6Jf6msaxabPVJGgm0kEQ/yT710wOjuO1w1kt254iHxSXwBjZ6AFwtzCqDny7i+lNTOI8Gt0+8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uvz+GWRp; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b561a861fso7246481fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794348; x=1751399148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=Uvz+GWRpTRnT8nKtxhEc/eCo7ZG5NAvzQCPFuUyl+e7x4xx34/OQVluMhmvu2AMSX1
         afYwoBsuAd1iyqI8sJGGp0VLXRYjybuRn1C+Z3FdRI0+PJyfx05xsjhGZnr1alWI7taj
         9UY3ldcznOUMO77Dtryz/RDlY5G35wQt1xyq17iL8qSzfDXktUtM97Xk3G7zr0fdxHIa
         bn03ruHMVzVdAlW8z6EPnIPdDwDbbZ8qHsV9N6XoyxjgUuffNOQeWAr/3W3rlhK3bHyb
         ui9ne4B1nQQWlcZ7zsAUHBPwBycSu9tDthaM8YesgizqXmRdQFI8fO7AVAkzKn3sQu7S
         oBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794348; x=1751399148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=dJrXhtVbOLxnTYYhGGwSmqrF8AkONXSMimwWqodfivE/yPf6I5Pn45aTfT8eOPb3rc
         jhD/9JPiL35BytmAHBdjaIIgpdTwpQKFW/sO8Yy4FxL0F2l2VSwQiffgn1SQtBCSA350
         vJ/5OqkKCHzv5fQh/xsv/tMj6n1elpmeHkJUx306zwTsHea8BicQnTETkCi4fNHaPMyz
         AzHrp/ScPTLbNN/sP5Y0/A9H1wU5C1tFMAXiI8FDu2ItfAeWSgKi4RS7Y5KiKzPJPQ8s
         1bSF/ypFSxM2VjVWiiSjES8//psveQfJ51p0762qTwonVQDoQICHcq0f+GyKLbLHHEo8
         eBzA==
X-Forwarded-Encrypted: i=1; AJvYcCW7iOZMQJZ4ZuclX1IOd4f/78kunUk7VclXglV0Vo1tnGU7//o2irtuP5AcvssTVvViPoMCwlW8J3DA@vger.kernel.org
X-Gm-Message-State: AOJu0YxkizY/WU9eYHG5iI88aISqhXzYPqQtJsKvZ8ANrA1eBbr9Jjm6
	b9zv7yRsEUKwazRmgRZQXkmTnCBDz35DZeiVvjcUP1Q6nOF6XE+d+PtzkDBx/PCHaCjAlRSRSjr
	lgKn+7o7vlFZrhZJ6PgRZSxE/CohApxfkpFrT/9blXQ==
X-Gm-Gg: ASbGnctdVYFjKe1/qQWkt7cwIQ8lcaTj03z5oIFmebjYVvwAgtI9LQHkZWJbE/bGsmX
	wJTDg0Tc6UKDD8CmPQaesNfLP+h1QJNfeQ6JOgXRclWA5OBfovC1hYY7ujhRZn02LcmitD7PP5a
	up7diexGaareAV23yNJmJNgXSONSvA5MIZv29hzRlSxet3aiBf3i0nOA==
X-Google-Smtp-Source: AGHT+IFmqiLtBv2UOTh1D8iZHZIySmZyFDbcKWQIsCqDE3SSo4mBAPZZgwKH6/ZLVohgVWg9CA+g75neATAOTu7gWuo=
X-Received: by 2002:a2e:a7c1:0:b0:32c:a006:29d5 with SMTP id
 38308e7fff4ca-32cc6432fc5mr199911fa.9.1750794347783; Tue, 24 Jun 2025
 12:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:36 +0200
X-Gm-Features: AX0GCFuxMgt5rF_SL0XMbgco8X42yBA-5q-4FLSXTx6fBKQwC2WxaI2emdRh8Cc
Message-ID: <CACRpkdYTQywBeO_NSdjHZFAc3GizCpM9bSU2W+o59vtkp=Cf8g@mail.gmail.com>
Subject: Re: [PATCH RFT 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The two latch GPIO devices in ams-delta are registered with struct
> bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
> remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
> also able to get the relevant values from the software node. Set up
> device properties and switch to using platform_device_info to register
> the devices as platform_add_devices() doesn't allow us to pass device
> properties to the driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

