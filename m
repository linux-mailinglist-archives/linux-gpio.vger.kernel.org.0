Return-Path: <linux-gpio+bounces-23407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF301B08E4E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 15:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D77B3A32F1
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 13:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F252EBBA7;
	Thu, 17 Jul 2025 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LXDpy/LE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB332EA176
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752759142; cv=none; b=fgNoxixFzKpqyMFf+diH1JB9XhC4ADr1KFd+JbKes1eoe446VpJdqAihrSOV4TGT94IXfDoUxSi1eSXhlYOlAGDuN4XzxELYZeLsxnPiQV4m4CUZmIQpTFmfGYp3AKUQyBBA2iZDi+V4uNI9bMoEo+Z9nM2ATWyBXsc1cbULlF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752759142; c=relaxed/simple;
	bh=2COzNJUWK6NXKJgnzIL/4QytxebvWRPGY869OILBGjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdwWJ1BCPvf6BBrlgalDSBilmzg5/3cwQurfrXhNEVCwjTUxOFrjYYI4LAPdypuOZJYY8khhlMVfXkjOTA6+t9bz5KiGsD45I5Hq+CGnhQqemW0R4gLpWtA4LbCRlQa3+FnKwWwBVVZq8/9WhS6buMaCH4WLJ48GU5l4cWc0FCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LXDpy/LE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso958936e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752759138; x=1753363938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2COzNJUWK6NXKJgnzIL/4QytxebvWRPGY869OILBGjY=;
        b=LXDpy/LERUFh3Xk4yKB3u/Iz1UtuBdMT+wopaYy38B5vdJq1f4E6+LQvBXU6T0nl+G
         EuoUzm7J5lDYqxOCgJpGNWwP981X7W//UqvakFGVDp5zKKYYPPa4r0tt9pxNu5YQ9WvR
         ZaHZiMxFNr8KHdfOMoUEejxaOdjMQ4RYwosBn66xKAw8dCkXDFmDtEugtYNJNMJGBp4k
         xeJlYep6yiEg2crJKhEN37rlotOn+CmB69GpBzltg97ZZQXJY+wgns2y1X0sDz/fIwtv
         BuhBX56dbkWh/znZKeat9PouaXOswRJqFGsjdHGu3IHtyaUQm86ERJk8cNRYhLrvfHG5
         jhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752759138; x=1753363938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2COzNJUWK6NXKJgnzIL/4QytxebvWRPGY869OILBGjY=;
        b=XTYT3HHNqHLp6P4WXVFY0Y/EKf6pzNIL6I/f+V1JNtl8sU72Bq05qdZWj4+JXJSMqy
         sTJQK/W7Ps1hImP9lAuModYZROTyo+3tgqswYyD81hd8bfnLM75OMuoqVP6l/OPFpDyb
         a2rbHNqskFFC+szhFlBZIzSOQJY/oRnNajgWKZwbAVdz68Pui31HqroCaa/s/0h4s3k1
         75PdDdxu13wYu4vW0hzq92PVq1HMy6B4dTBaYBYZnYfYPws0dxRO3Gdt4iAfGm1e/U2p
         so74dkeBG5EyUN5sqbLWL0WYzs0P+erMR9hXpnoS9a8VsGeW72rOBHBEZexrSZHPFK7N
         QRaA==
X-Forwarded-Encrypted: i=1; AJvYcCVUCpv2MMbj8s72znrCJoqNs0J/UjGt9KYE9+3XHu26zljd+RTm7uo7G/SH2smF5HfmTvWXlv/LJI7R@vger.kernel.org
X-Gm-Message-State: AOJu0YyIgiHCG71a63yblaHtT3c9pjKZ+IAj8al919ALX3fRW2NayT/4
	74GjUjmqVxjnp/9krOJcmkoQsbCOhtvPuzWIdqylAUANLVfQJPnsVflQ5LRkmNsC+78SZEYjC/o
	7PH9QMUvb18n4NSlyaGS7uAJB1JWaZdX+rfCpAa3M8Q==
X-Gm-Gg: ASbGncubTN8NW4W6C77Zk13P3SuChCwntP9SHUo1w7R7u3Go0FBXI5O1UyG8OqeJphX
	/VCrH/ewBMUSf9yyj17d6vD7DS+obRZySfSFdaNXoa/1hQJkd5q88p+dayGl8BSQLht/Zj5cZeY
	KVcyD78tuRSxLG/vI7F85g9jD8Ydq5yWqkiZeX4qD6EEo1hpsIKULbrba0sLEkFBPmLO5xV4W4M
	I8Kr7VZ4JVJTHCPbEFfwQxQqOVKYLeq2plUtfc=
X-Google-Smtp-Source: AGHT+IHT3PtD6npdrbFrtvXjL0dHEAYy2QX261hi82tHR+AHdc/G9o8TJQapTwo0gQJBJob1bFp1eZmVKThdFoqXeBs=
X-Received: by 2002:a05:6512:32c6:b0:553:3770:c91d with SMTP id
 2adb3069b0e04-55a23300188mr2624433e87.4.1752759138065; Thu, 17 Jul 2025
 06:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717130357.53491-1-brgl@bgdev.pl> <20250717130357.53491-2-brgl@bgdev.pl>
In-Reply-To: <20250717130357.53491-2-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Jul 2025 15:32:07 +0200
X-Gm-Features: Ac12FXzS1YV0ZsodWalyOcb9bv61iHiIR9_cWAuIM6ifnXF6pwzJ_JHOc34xXDo
Message-ID: <CAMRc=MeMyocMa6eCOw--uBic4Zk9OG9A=VKvMP+T6bnEuOttng@mail.gmail.com>
Subject: Re: [PATCH 2/2] misc: ti-fpc202: use new GPIO line value setter callbacks
To: Romain Gantois <romain.gantois@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 3:04=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Greg: this patch comes in late into the cycle but the driver in
question got merged for v6.16-rc1 despite the set() callback in struct
gpio_chip being already deprecated and it went below my radar. This is
one of the few remaining conversions and if we get it queued for
v6.17, we'll be able to complete it next release and drop legacy
callbacks. I know you're busy so if you could Ack it (and I hope I can
get a review from Romain and Linus), I'm more than happy to take it
through the GPIO tree to speed up the process.

Thanks,
Bartosz

