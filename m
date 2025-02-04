Return-Path: <linux-gpio+bounces-15327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B85A2726E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 14:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CF363A3D3F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 13:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD65920D4E9;
	Tue,  4 Feb 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C8RzIx1b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E216A20D4F5
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673376; cv=none; b=WhXNfgBY8ixl6wxfkYUazarXfWVQ7Q7toW5jModcLg7UUyONIs3AD3QOLIZ7Hf3UcfZvXnZdSKeGUeWxWP1cacRkWj2aiEvVshiSF1S7R9qTLViTffzyyDfNgZ/tSKyrYxSDUmlN9ifc9EVKEr4nNp2jz/H6z3e3f8tMCKApAV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673376; c=relaxed/simple;
	bh=/T9Sh9PRHJva4qd2W6nNPRoLpbx2eTBsWsBBrUf6yVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5ymuaB1RfD5tpbOyDsarOoZIf/ooRDE0LasGx/BJYcEvWOOV7FL2mK1yjQV8ts7WSSSSghsNM46b80MdIF45w8/U5oCbXBZUPxrQm3KekE9tqrW/uOY/jjOFh7OMv3Nou4QxdaPpkbfuH+mulToyG6hOaMNQkOQzBFur5IsLGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C8RzIx1b; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543d8badc30so5796210e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2025 04:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738673373; x=1739278173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR0Gevd3W4EVuh0yJZJBtnhS1e3+lA76cfZQ0K3Yb7s=;
        b=C8RzIx1bBwxuX9HZQxT6JZjyf2n7zCASYWOsuBOoTCTxZwCCjEFqzet09zC4b6NjZX
         /V7FisV8twTIQcD9CwNCCfUgDEXe7pQragRSdDc08DvPc/2ftG8yOCfCLX92JxkDskr5
         A1VtnWlzTeDeZo1sGSw3jy/xrzj7jJjvnPYDf1Ws0L4oeBGVDSF7hnP1XLmXojHIiXyH
         tfKRl9dHtcddxezqZGDz8k4GO6MHC+H55PzBJwbQGEMya0n8+YaGAMjB682lwhFKokam
         CrkT0LNi2Qz1qVuS9SS/W/ICDjdjWt/4YB2uc3RFTu/fdg1F/J+aZRq4Kb+aF82C5iif
         gDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673373; x=1739278173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KR0Gevd3W4EVuh0yJZJBtnhS1e3+lA76cfZQ0K3Yb7s=;
        b=bXRvhFAjtqOF1tOovpqt6733OFYlcKffGY6QaOv94AuIucDkw3VZQHP/qeK0BiFhhI
         7E8RzIxqDfoodLvUh7r0YTQPHjZqVs4otWC6JmOUHSamL0+EnfH3rJUU1YDG/sRv9Q8J
         QdcLztKI3oppkN6n3WF2rgdrVidUg8+ijTLu1DqofX8IR/WIvzGHdd4MFg07zDShK5LG
         THY6ztOA/JL4XaItbgs5LrAzeBU9yiDgPLDTTBziIsFsaRjtdHe1bWQDkmIWOEPGavi0
         N+gy4cTNAHcG+4y9KBIrMMesa2t64ZmpsGcaBC0a5cur9dMIw3WDxjaPYHublpFPL3/J
         FfiA==
X-Gm-Message-State: AOJu0Yw1h1ejnUXkPLZNT6u8zFC1qU4lDhd2IuX4lKQEmzYLHY04Jb87
	9LpSajbPYgcpoRDtkeezdG/x7sS0jOl2hsqORc7snZR2Ag5QmKpRw7SaQWtIymJbsBhlI3XF23l
	qVemQWJ4phs0wuhv745cxjAHy1m3FHYPhdv0u5w==
X-Gm-Gg: ASbGncu91/5wdsmCUzETdCxHM4hfzBnhrlQs4JB/IInewgwmWNWY4crqhT0YOW3zdhf
	LGH07xi+5Dq1LseJsHa8yQ10H68R2z/iHxTeCwfK/nJUdAX/umGVwJQCfLRHYFb4YIFgnxYRTUT
	T7Yig0DITXr1zYvThjoqK8/cMCOb7a
X-Google-Smtp-Source: AGHT+IG71qlTLTpIDZmlqJpqP28YbkJfHeJ0QRNm0NxTAdBdTBgRmTv5h3wS6dO6yteihQoGUYnAUUSE3uWIXgOBAP0=
X-Received: by 2002:a05:6512:33c9:b0:542:232a:7b2c with SMTP id
 2adb3069b0e04-543e4c017e6mr7595249e87.29.1738673372814; Tue, 04 Feb 2025
 04:49:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-4-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-4-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 13:49:22 +0100
X-Gm-Features: AWEUYZmicD-KTkukacr-qp_vj9khYtqZlX8C1R-ghbNXUqwnDjHUxpSjYkyVFNU
Message-ID: <CAMRc=McftUKH_DNvsJPjBP1MMSo94CCXxT+ffoR5F_H=OegBvg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] gpio: aggregator: add read-only 'dev_name'
 configfs attribute
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:12=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> Add a read-only 'dev_name' attribute to configfs interface, which
> exposes the platform bus device name. Users can easily identify which
> gpiochip<N> has been created as follows:
>
> $ cat /sys/kernel/config/gpio-aggregator/<aggregator-name>/dev_name
>   gpio-aggregator.0
> $ ls -d /sys/devices/platform/gpio-aggregator.0/gpiochip*
>   gpiochip3
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregato=
r.c
> index c63cf3067ce7..76d3a8677308 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -732,6 +732,23 @@ static struct configfs_attribute *gpio_aggr_line_att=
rs[] =3D {
>         NULL
>  };
>
> +static ssize_t
> +gpio_aggr_device_dev_name_show(struct config_item *item, char *page)
> +{
> +       struct gpio_aggregator *aggr =3D to_gpio_aggregator(item);
> +       struct platform_device *pdev;
> +
> +       guard(mutex)(&aggr->lock);
> +
> +       pdev =3D aggr->pdev;
> +       if (pdev)
> +               return sprintf(page, "%s\n", dev_name(&pdev->dev));
> +
> +       return sprintf(page, "%s.%d\n", DRV_NAME, aggr->id);
> +}
> +
> +CONFIGFS_ATTR_RO(gpio_aggr_device_, dev_name);
> +
>  static ssize_t
>  gpio_aggr_device_live_show(struct config_item *item, char *page)
>  {
> @@ -781,6 +798,7 @@ gpio_aggr_device_live_store(struct config_item *item,=
 const char *page,
>  CONFIGFS_ATTR(gpio_aggr_device_, live);
>
>  static struct configfs_attribute *gpio_aggr_device_attrs[] =3D {
> +       &gpio_aggr_device_attr_dev_name,
>         &gpio_aggr_device_attr_live,
>         NULL
>  };
> --
> 2.45.2
>

I don't understand why this isn't part of the previous patch?

Bart

