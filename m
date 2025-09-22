Return-Path: <linux-gpio+bounces-26474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6A5B91B39
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04CA3174F94
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B77824468B;
	Mon, 22 Sep 2025 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LaInY0YV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF201F2B88
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551178; cv=none; b=q561WLIOZBVu0U3m/TXiAHFjID5ieFgkm+GqUI5xegG2bwrprRj01dx54yGOdpI3inQ+8Yvd1gypZ83v2hgjBAkADVEZz4jIRebBh7jBcEIFgptm6Y/lo74j0N6pHKjoLevLB0Sk1h/USIrVIvhEYWEXnrhs1fw6zLl+mHwpM30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551178; c=relaxed/simple;
	bh=mP96DEmh2bjOnupXEAFWa9ertPrArnBqiTrrqz2g5Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yy6LmH3uw4PUIYV2lGVCBYxw7wLX5YZPnw4Gw1SqKUqDCpVSEAvhZ9M6ygoM13WPXnGE+ScMRbES3vjWWya3HpjhH2q+w+4e2UihX3A+COXNRY8EiP2YaptKcVyBXXtkpi+egFcmz/4VlkGn7DaY7kc/OzISWF/8ukv6S8Xjctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LaInY0YV; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso1576722e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758551173; x=1759155973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNq8LByj5pwbTMU9Znek1vsRvf2KZXNAUyuTdvujvsc=;
        b=LaInY0YVTAj1nxSq5wIUGYCuGUBvT2Z1sAZLZQefqscoIG8qdxXWtVlrvB69kcy7Ib
         SHe5cXycnYbOTKMwSlodbuIjtMheNLcdNSEW0S0LI2cnoaoQcUi+jOm4lcN5EqC2HiR1
         mc8LUYgWpGvf2b1dbnCVMtyf0rqZDcaCXUvxvX2+FFz2YvNLeWBX1iEbhh36VpXjFUx3
         mOtO/nv56gUzd9PFFToex88zhXzVNpyelImZKOj9/0ta+KWeydTTTJDU8sMq/WT7MK+v
         Tfu1CdGOpk/7N1FlYkWHJlgzQAnkEM2WmaEbJ6Ht8RVbrcfftC581m1f6r+JrP1YcJtL
         f2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758551173; x=1759155973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNq8LByj5pwbTMU9Znek1vsRvf2KZXNAUyuTdvujvsc=;
        b=C7qgSKBmN6QeOEwQfahYbJ3X3/iXb6PadtY20msrA4/Ai//uwLWEgjFQKEZl7Wxy7d
         wvBtrgyT7mUaIurv+qZwnzNZLGq/JUyuePZrpGRzkTmvHezNR8dkr4ERYu8wj8gR8woK
         STqcYNpWLiHED8Uev4oyulXoF5zzbp8ZLPaAGLDUX1Dd2AselV+QF8aRKBST9fTXnKpX
         SqU+jD0PBUE9/Jm2YIBbnfnpWQV0g633NSJ7raHQ1IcoTTqXcFcvEKv5QWpkzLcUHroV
         68uTzOsvnwtcUyJen6a99AAXLXLX7iETjWxAVKl3/2E496lnjS2NlBkukW1jXgFX3qJ5
         CBLw==
X-Forwarded-Encrypted: i=1; AJvYcCVl9ZBm/43VgXyTaVilLLa6pSeLF8Tc5tlhMLp8Q+Qr8qoU6HNG67BX4a6CLcHCbYdobXyIDjH+Laos@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8UT15H8/EaUnoPDW7ky0In+hTra/lCNr0Mxi+QU4rk87DZV2d
	tmdhPXxEMgF2ecm95xmDfSgNlvcqecwfbqj85XZEAj2O2s5aQgrikPu3vEb4tOcUlgZlqptjl1G
	2MAE3roUErfvTpAf9c8e1yi+qR5HyxOIxsElY6AQeTg==
X-Gm-Gg: ASbGncusjyNXpMxx/VGYUMt4SWbLldc7YA2JZAP/M/7I3LvJG3NWUveK93hq5211y0J
	IdrRupeFKzZ85zVtRoWb+NQoGmwjzheqvYP0gSe0v4zvTb7khip01Mk6RtwW07nXqX6zw9c08uR
	e5lij5r1mkhJ04Gj6PdfRfu+CUuQCbrokFJ1AlK5wPc4Y9XY0JxomHP1buZFWzQa4uDfHHN4KV3
	oqQNd3j7IdlQkamPVpCiMezvBZN8V8Mk08YIg==
X-Google-Smtp-Source: AGHT+IE7DmYOUjyHSgUJniPn7e9AJvVcDzh95Q1+d6oD+mIbIisj0H6I1VaeOo8cYSd50AnJUrfkdbDELShAYcU4hiY=
X-Received: by 2002:a05:6512:b09:b0:57b:dc46:b9f7 with SMTP id
 2adb3069b0e04-57bdc46bb10mr2828551e87.29.1758551173483; Mon, 22 Sep 2025
 07:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com> <20250922120632.10460-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20250922120632.10460-4-sakari.ailus@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 16:26:01 +0200
X-Gm-Features: AS18NWD6NsOoZOr-LD3KJ3t9qbbN9qckcANb7bMcNVYUpjUM9Cnxvw0B1IHlQqY
Message-ID: <CAMRc=MfaybFsuW1f=obVEX+1ij2F3vui2Q=3eTs5LVd2BCrv7w@mail.gmail.com>
Subject: Re: [PATCH 4/5] spi: ljca: Remove Wentong's e-mail address
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 2:06=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Wentong's e-mail address no longer works, remove it.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/spi/spi-ljca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-ljca.c b/drivers/spi/spi-ljca.c
> index 2cab79ad2b98..3f412cf8f1cd 100644
> --- a/drivers/spi/spi-ljca.c
> +++ b/drivers/spi/spi-ljca.c
> @@ -289,7 +289,7 @@ static struct auxiliary_driver ljca_spi_driver =3D {
>  };
>  module_auxiliary_driver(ljca_spi_driver);
>
> -MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> +MODULE_AUTHOR("Wentong Wu");
>  MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
>  MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
>  MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-SPI driver");
> --
> 2.47.3
>

That makes perfect sense for MAINTAINERS but why would you remove
someone's authorship from a driver's C file?

Bartosz

