Return-Path: <linux-gpio+bounces-2415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C618363DD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 14:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D471C26A11
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 13:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B24F3C46C;
	Mon, 22 Jan 2024 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Pj3gFJYL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D963CF40
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705928491; cv=none; b=bP6gkePblH9VtrRQDbYIqJMDBAer/DHKdemi4ukVyCZWywGaSCNnWVaVuhDxkjwtW3cEGF9AOyedQAZMmJR0QVZ7tjf9H9gcCNgL6XZu8GorxcmkJLHOUiOPtNmBNILdGy/OyrNi0SGM7M4Y7VDLtEH0/QbGKv8wbbg0W8w2bf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705928491; c=relaxed/simple;
	bh=JLkHdRG4MECfsMfuvLTyMo7K6W1AR8tRDwe3AS/o6xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A43YnK8abV0Zds1LvxAEc1u2yvc/GIr7JvIQcof4drAWH5PB7WfLO7Eb8jKa/IYB2TX7Gscv4VXRXS9wjmlm7aXHM68A3EODtdaWwjdgUotMzTMeoNHXSQ4XBkE62N0jfQhKpCgVqT4dzzbZm3wEC5zESRF2nPu7XX5iDJ4FBWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Pj3gFJYL; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-59960d26f65so1586051eaf.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 05:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705928488; x=1706533288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd9mO083dpZJlRLnVXPFnP1+kIWlEICA3F6gDa3yy6U=;
        b=Pj3gFJYL3BlMZkNaZl9IIOu0vQZiDmXpJ1zOPe4dj7MDRuOpnTz1aihuDRbcjONttW
         ZJFAfFBe/6Ce6e5twJUxJNsupBi3ib2jgEXllHzzRE++z6rYj2fagvtv6WDtIpJ1tsgE
         HPeXolhkctV9SVtujzQ9HLsIy7eGi9DxYsrzFTPG0fPSas6MzIduBpa25lcc1087ugeS
         9iykR5smJmQrwKn+Sr+r4kkT1a1HZoozFTx8SISsEhxc5aPsQB+taHytsAp9hN8FVxMa
         PzXqXVU2ooWqfTa9jUv0J+1APRkI9/Aea0JVkNA50pGEulbFmANo67DpUcwjoyAI2/5E
         2qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705928488; x=1706533288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd9mO083dpZJlRLnVXPFnP1+kIWlEICA3F6gDa3yy6U=;
        b=HjZPwDB/n6/JALNjWOlomILQIe1sOtGGpd3Q+ykmYSiLGAOWhhndxIWKSWeHHY+jl8
         30dRawlfr16iwwCb+Ze3W4QhfqFatPNrNaK6BzFjo5EZNEGHsv5Tds28iFXz+H5lwQV0
         zKdyKiVRvipAeRwArAo6ctSUClNuj5jwU0b3wucf7b4gqxqqPC1fpt8xj373REQ717yK
         OLzBOa/3/5e04t3cJVUDTUl6oQRw5qRPFmOKCodcPEO7Z7bk8T3NYZz5PAxmeyYgsSdb
         VpURpx12Bh43mEYtF6T78jZHBhl/2Lb6u10A0dSPzt00jD1nKXdiQXgy2RbE/2yhYo0E
         heYg==
X-Gm-Message-State: AOJu0Yz1UUfWjoDQNFN1Gk7HNgzEddKO9rGEjb8mjD8ezocatMY8j8RW
	xSWVZDfObrlCYas+HjNk32UO4l7VYIV8xDCWPwyd1UCNduAFkWwlwiBgqNKCiGNSXMrEpyn/g3z
	Ybua2QDeyFREC35au7Pfx/kAJSyaXeZ3GHGq6gQ==
X-Google-Smtp-Source: AGHT+IEuT9JlKcOav07ptD98xxAWOjrdF0Rp568/q++9ntyWb3hkbZTF/CuNjZus9XW6zDJKqC7Arxjp6PtCINNbh5g=
X-Received: by 2002:a05:6358:4b0c:b0:176:503c:498a with SMTP id
 kr12-20020a0563584b0c00b00176503c498amr731285rwc.57.1705928488672; Mon, 22
 Jan 2024 05:01:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122113640.93162-1-warthog618@gmail.com>
In-Reply-To: <20240122113640.93162-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Jan 2024 14:01:17 +0100
Message-ID: <CAMRc=McCjcZLWXRkT-UjKMsJTL0TbZXRo59chnjQzb5fewkT2g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Documentation/userspace-api/gpio/ to
 GPIO UAPI section
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 12:36=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> Add Documentation/userspace-api/gpio/ to the GPIO UAPI section.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Now that the UAPI split out has reached gpio/for-next it can be updated t=
o
> include the new userspace-api documentation.
>
> "No capes!" - Edna Mode.
>
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d1052fa6a69..2d0bc0e128bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9148,6 +9148,7 @@ S:        Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
>  F:     Documentation/ABI/obsolete/sysfs-gpio
>  F:     Documentation/ABI/testing/gpio-cdev
> +F:     Documentation/userspace-api/gpio/
>  F:     drivers/gpio/gpiolib-cdev.c
>  F:     include/uapi/linux/gpio.h
>  F:     tools/gpio/
> --
> 2.39.2
>

Ah, makes sense! Applied too.

Bart

