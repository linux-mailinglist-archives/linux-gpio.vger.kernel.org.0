Return-Path: <linux-gpio+bounces-27877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44043C21024
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 16:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC0D74EC7D0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 15:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428401B6CE9;
	Thu, 30 Oct 2025 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L5EIOyV2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390EC2877D8
	for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 15:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839111; cv=none; b=jsT8CJUQWYRWLT+hTTDq8ZYAnXTwm9e7F5rt2kFbV2XTschhIg69+hw9qmTpFq8lY8T8bWJgR5dMbnHy9RCAcXLuW+KZ6q7hSdQgujsBzwaFj60nxHyiXq209j9Y5vHKwpDIaZqqP2njLjNgh1sp0QHu9ClWt/sdRkYMRSbd5aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839111; c=relaxed/simple;
	bh=4wdI/kWWVfqayanlY8MhgqBGSqVwUCmL94mPJ7ck8EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYx3wnB2a3qIMBGS/DJHdRcRZl+R7MV3abGdGuYgJV8lujsmZiUwmvUOAdDLHKK8al38qAriJ4AE64syRWcMeh0ziqN5Dfh7Nrchgnn8ye+xWjd0P7l+59ifyEVbEST5dp0yAMLV8J1bUxOiQmCMUFJ6VAKF5U2VV3qFSNlPRMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=L5EIOyV2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-378d50e1c82so11653331fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761839106; x=1762443906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6akgDw0rUZ91b2lrMYaxRTJHPHTR7/7d9qqAaAZpCEw=;
        b=L5EIOyV2O9iKAcTFeU8JdGORs6SNnaiAFu4faQyI/3n3kaOEXuXlRX3QCgedikG3VI
         M1hcq3sz3+inpWuHpASilfHnCiM2WDklSDOaqzLp6X88iY4DVSrC56HVtXxBNqbylW0F
         xOK08S+/JW0tHnfDEurQhR7ER7Q28SA+AT4Lxfz5Dj5a9jBPPCQhch8H9GXzwGOVaFAG
         IAIv+H7D1eVq2S5L6dpsepUZJV6Sg+UvfJ66Gk3v2sUsPcaPXrxJKwlDFyHHBh6LRTre
         hYgd9X+nAlLoVosQlYl5hDBURoFexqAyAODx4jKSjf1lZ+Zh1nson2WLpQSrGTBHaLxi
         vKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761839106; x=1762443906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6akgDw0rUZ91b2lrMYaxRTJHPHTR7/7d9qqAaAZpCEw=;
        b=hoglI3Cx8FcJmb2QXm5Sf31JiQjHuMV7oMf0lmI0/2vBMuOdyOqBvQawCXJFf21lOf
         f6t3Bz66Me9VvE5EJkanlvK+/eMxA1KcpY9Sa5KEYuAmK6K0OMKLolorfIBu5AX+AMAN
         TREH6cXTQzb5rHXA7Kw5uVBaxhcOajft35UYWpj0IDN74LjyHasN6xjQzJSsm5NGkPt+
         PPr6rNddOrhoWTZMNxIPpqDWBaXFRp0nALYrVICcO1/YFx+hKYJ/JfCvUzKibWA1mtdG
         Zd8sVT7kcoheajzztsm0jxXqH56lb1AobQEn80iq6F4XAOfQXCrxW2AHUJUcI342Ng0m
         pPCg==
X-Forwarded-Encrypted: i=1; AJvYcCXny2LUde+jhXz6BnItRmC43BzZKQuqDOrkdwexJKNu/LrEfF6JhWdqWsg9roO2C63ZIrgx1y20SGUW@vger.kernel.org
X-Gm-Message-State: AOJu0YxmG8fw9l34EE3BGKJQ2kDY0fa3pX0EeQH3KegHPdqW4/8eldRn
	0Gw2Q/MM2BcYhyYdSDFoe/zQ0bHyTz7ZJbEKVAKmoE1kqhFn8ncOziOWkwnqXWSiy2dUx4Z0pOW
	xpPZQWviR0cNllXY/z2g+wQLRMDLfmTKKKNFXqyt5OQ==
X-Gm-Gg: ASbGncv8hT0BgTedxpbNdEnCv4VGIOvDyMNwmfSO0gGzJyKGW2q4GRat7Dxb4odPAAq
	EMKeV1Uu/sj0Ex7oGgpGqduY1dn0vxagVJRaP1aI28TB7xklSGjExLgo7u4IZpKZKnXuIF1nOyq
	XI7cAFnGG9NUanK2irxy/AudzaX9lCBp+GVU+PrxbXAwlhmdR7UmAav26xuzq1IYWXV/Iqxjx1m
	ToJlry0Oxk+EqRQ9PXuMHA7mvSphmkRwpuzoGGmQrIMfT2LQrs5E+/hPiO0zNeVrvmu27Mbf1pe
	MmMar9reORSL4elPFiKZR7qnaWWDIxfuA3se
X-Google-Smtp-Source: AGHT+IG9DOL9q1v7PPKQQMl6FrbUdYwOVLW19Hk65lHsAqZGusbK2QYhJ0Pdixkxw3U1XGLanb9R8lxY//92OR2J93k=
X-Received: by 2002:a05:651c:25d1:20b0:376:533f:e15a with SMTP id
 38308e7fff4ca-37a18e7596bmr831601fa.48.1761839106061; Thu, 30 Oct 2025
 08:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029195619.152869-1-shenwei.wang@nxp.com> <20251029195619.152869-5-shenwei.wang@nxp.com>
In-Reply-To: <20251029195619.152869-5-shenwei.wang@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Oct 2025 16:44:52 +0100
X-Gm-Features: AWmQ_blSmI92ElztzCrUwjPlKqESQNc6fO4hMknU1QrcXqAqhR50Y93g9AsOVGA
Message-ID: <CAMRc=MfugHWP=t83+ki5LaSkyX8=STn2FV=+x6msxD++ogLSyQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:57=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
> On i.MX SoCs, the system may include two processors:
>         - An MCU running an RTOS
>         - An MPU running Linux
>
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
>

Looks good, just a couple nits.

> +
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/rpmsg.h>
> +#include <linux/rpmsg/imx_rpmsg.h>

Also at least: mutex.h, completion.h, device.h (for devm_kzalloc() and
co.), module.h, mod_devicetable.h.

> +
> +static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
> +{
> +       struct imx_rpmsg_driver_data *pltdata =3D pdev->dev.platform_data=
;
> +       struct imx_rpmsg_gpio_port *port;
> +       struct gpio_irq_chip *girq;
> +       struct gpio_chip *gc;
> +       int ret;
> +
> +       if (!pltdata)
> +               return -EPROBE_DEFER;
> +
> +       port =3D devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> +       if (!port)
> +               return -ENOMEM;
> +
> +       ret =3D device_property_read_u32(&pdev->dev, "reg", &port->idx);
> +       if (ret)
> +               return ret;
> +
> +       if (port->idx > MAX_DEV_PER_CHANNEL)
> +               return -EINVAL;
> +
> +       mutex_init(&port->info.lock);

devm_mutex_init() to allow mutex debugging

> +
> +static struct platform_driver imx_rpmsg_gpio_driver =3D {
> +       .driver =3D {
> +               .name =3D "gpio-imx-rpmsg",
> +               .of_match_table =3D imx_rpmsg_gpio_dt_ids,
> +       },
> +       .probe =3D imx_rpmsg_gpio_probe,
> +};
> +
> +module_platform_driver(imx_rpmsg_gpio_driver);
> +
> +MODULE_AUTHOR("NXP Semiconductor");

You can state copyright for a company in the header comment, please
put your name and email address in here.

> +MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

With the above fixed:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

