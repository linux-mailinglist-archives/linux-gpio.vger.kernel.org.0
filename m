Return-Path: <linux-gpio+bounces-22101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B270BAE701D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C998516C3A1
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA802EB5A9;
	Tue, 24 Jun 2025 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZK64ZpQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185432C3761
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794405; cv=none; b=A4ZnJheSI/tGG8mzEDnO7LE6QHRL+3rncL6GE3NailVIW10X0rxgNPXigvd7QgYFY5FR2Lufb+gg8ZudshAukAKvBcpnB9xNn5dLFQ8Er37s2KTj+UI82CIAyFkst5XFVDcATn5Koze4Lv5KGVuCiDFD/cYSY+5XcMP0J8MjY0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794405; c=relaxed/simple;
	bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4/X4DzWzPjn35c5tNi2ZtmVmuISX8OXkBAi9DXc0PXyqEhLchkHC4JMUGfMDG8D6+gWkX4q+O8eZGOz4N47t8RgR392v+HM+tYEiyxhCtxX7uHkMKvyqbh4ErCaWU7h879DrmZI0D0+e5RRbd4jHtuW6gGRB/beiaTV6e9Go/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZK64ZpQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so242441e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794402; x=1751399202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=VZK64ZpQTEt9hL2LxW8l6wfKpbOHWR3TNjMgYRQTap1lD84dGIejNLJ9NU56lEA9sQ
         OY6YCr8BDg0/opw7Uu5vmWNmD9vGtbUP5Rzcuv2T5GZO2IMwggT2Uu0WpiTzWnBV+UMt
         MGou6zlqWylzILsmpc4yaS9mXK8up4RL2oeoHof18cN33eLXVg4DJkIxQhx1DJ+izAmz
         QHHFW2CPXhg4JdtfZntdB9UYrDOEHQnOr+vYupVvl3xWqE8H5K93AdAMOEMwQt6iJJ92
         R036d1iCOQeh6p2WTN7GRq660y685JFgbRizPKVNFM8YfOoegUuOdmifJYXhJzmnPcvs
         XPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794402; x=1751399202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=xM6KjN80gB7TbNJbCE+RNys1rNce4sq7CdeTa/d0e8UBLCD685ATao4m52HZfWQo6X
         sHYrd0E16P9uS4r+FoJXQMsKOJz0YCnJ0nfxbYNlTi4jrFG0RnQOjF0cQ6zVWAFa+c+5
         4Vdia4a750vNqjAVdQZY7NSqKZ43piOheX5Nn3cUCKKb621Jd9xxvKqQZ4A8c1JQy196
         uEmyQzmD3w08bvhIXT243L3MqqLnZ5WNZZUs0oxNJtXW9u5LFbniD732T+hlyrFuv0iJ
         VmWzEkzIrzBAE0HgSnwwUnRQx9hqwFXqViskix4dhjTMh7TO3VgFg2/52wQUUB6GAzo8
         qfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX3TGQoCmey3GBWQKwI6dvvBKrx36SSYmwbgvhxYJNGhVXc1+TmYgNdxeKyu9tecA06ffK/C19j1/r@vger.kernel.org
X-Gm-Message-State: AOJu0YxsBlUadwMV11cf2vYLeS857Xrl0hqhXdygsOB/EwvdiMLGKtmG
	ii0QtNipywp79NN+VhtXd645u1wn2rtekZ5zB4Zh2bf4XOeao/0L+ietmxOV/9lRPPPVdCMcU8h
	nloz1Dl17i8LZf1wZmrwdQWg8v2Kt83ipRLzXSZW8ew==
X-Gm-Gg: ASbGncvWJMhXyzg7sULWBG7d4aOivW+arbeJAYRz3i/1gHkHw+cDBI9tAaZxUVv7TG2
	YZTDWbOsZM7rvdK7pwGRV1zb8sUlobL6XJmv8Wl2QsMfsCCIjvBv6iReA12huieLpYLrgervxwd
	fsy9KP1pSdtDSNUqYAGc3cnlz1C7qncwN/tw619SiGkf7uD1XVhWm9/g==
X-Google-Smtp-Source: AGHT+IHdpwQMLs1O1YXsE7OYJDSqDv174xvDSUigjOl1MX3lK4+jDay8aiOLOcZL8anmxuKl33tiqVeqknlI9Y/jdlg=
X-Received: by 2002:a05:6512:1114:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-554f5c85c83mr1548662e87.9.1750794402146; Tue, 24 Jun 2025
 12:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:46:31 +0200
X-Gm-Features: AX0GCFtNgkCX1W_AdlK11ZGEmJmRv7gODCrJ0s33UaorzXY8ZeRx0-2XaShZXAw
Message-ID: <CACRpkdZ0zsBCXLqdXKoY5Fyn835xqunesRLrAMxUu6ASWU7iBw@mail.gmail.com>
Subject: Re: [PATCH RFT 5/6] ARM: s3c: crag6410: use generic device properties
 for gpio-mmio
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
> The GPIO device in crag6410 is registered with struct bgpio_pdata passed
> as platform_data to the gpio-mmio driver. We want to remove the
> bgpio_pdata from the kernel and the gpio-mmio driver is now also able to
> get the relevant values from the software node. Set up device properties
> and switch to using platform_device_info to register the device as
> platform_add_devices() doesn't allow us to pass device properties to the
> driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

