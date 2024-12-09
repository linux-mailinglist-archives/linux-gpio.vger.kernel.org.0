Return-Path: <linux-gpio+bounces-13632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51AD9E8EBA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 10:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5CD2163325
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 09:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7787C216387;
	Mon,  9 Dec 2024 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DWlvq963"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F39D18DF6B
	for <linux-gpio@vger.kernel.org>; Mon,  9 Dec 2024 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733736509; cv=none; b=Rv13Xb7N9tlMHLeTEAgG44NXV+rhsyXVWlUqQ+YNIereTr9o+kQTlZbmcEBoZXRN62zinzK7O13fp0flopDJrkoE91RFDjtG9kvjubF2/Nx0DIVZeFsnzINUN3a0lutEX1FjdQbmr+gWf76i5Qtc6LTcc16sy+d2Olaodt/C1b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733736509; c=relaxed/simple;
	bh=h0fqKj165/cxx5BWJdDWYRgNKbo57oUuM7z74BNu1zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldnxoNeJZ0NWJwF3rMvpOOeG8nSfH919Z87vWthgzp8+bW4hH04Pz3UAjyBf1jAutDK9DmA36MvP8Z37rRBfOBqJoiPtDu4vhJzEtN2IiezeFpYuaHvPOrqKpR1WEMOr5z1q/8ZkkLEuI04hOfPlyyxvc2LkvTnYzgbtw0NpREA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DWlvq963; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so17997131fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Dec 2024 01:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733736505; x=1734341305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0fqKj165/cxx5BWJdDWYRgNKbo57oUuM7z74BNu1zc=;
        b=DWlvq963797INGSlWGcWkYJk//i4f8Kmha9dREs355/9ztCcA9kSKYN7dgb1iZvywz
         WTHIHyfTnT58Ic4ymZ9QkEL53GypwSSoUI4DePw9xZFy/ymkqxVmZlhg0CcsSEvKslhq
         sIus019u0BOWM+k53CMG1TTSIkYPQKH2bJpS6Vjtl4rwQRnc4PX0DR83/7EF3GYkGPEW
         Wj6mIU6nsW3ArjPKmbJNToVO9C1uuEtnPwUaDBx83vj3pkuhlWuoGob9vvNdpNpr2dOW
         cq1iSrN/V/BqDa+d31xlCojYLrxKV3F9JYq67ZYz9UZYjBXFD+B9Wt/v4aRcJVq8IFnB
         Z/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733736505; x=1734341305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0fqKj165/cxx5BWJdDWYRgNKbo57oUuM7z74BNu1zc=;
        b=wAvvfz+fd9X5HYgZasmtezWlo/c96s7Yz4+Ic9OUUMRppgsOrEie512N4riWqjTvWI
         C0FBnnhp2ZcCCoD3pE3vXgQrsJTQPVhXUJsu9F9OOcyA4ozzTiNXyFJfXJVdvDkb+tJi
         pBQOYnT9wNwcDTNM/JdI4EUlSas33SCNQKM2R0+yzY+gW9C23Evg2F2PymWE2tPqIgh8
         RWe1Vf3V9mmG4D1P6RrE2Ft2B32GwMpb9Z7ceqSSdKJu3sL1oLA61+Oy0rtnxA7ehX3u
         eFegL9rEveNVqC4Dxp9RAZJAA6Q7k3obknpH1pFcB166gslt2QDk8lnXsK2nMJhFuMDb
         kxxw==
X-Forwarded-Encrypted: i=1; AJvYcCV2AoG1KdX/hi+lN5axmT7F+HuFQUDR6jW1joZ8zt6XQbpYjM8X7tcDc1+WzigbeZ7G/x8g4pGzME3t@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaq4TJS3rTKD3g8zby0DRRaImq3pTXT0u5imS+mlzEXimWVmWQ
	haJuSOoXUVAbpvyIjXXeLvATsQiA2oODyBsy1TvEgMwlg4yZQ3KZIh8nvzNjavNkvKtZS/4pYwz
	ACRBsEP1kFLl5u0Y/x5uVuj/NOOtUVwtjs5ahOQ==
X-Gm-Gg: ASbGncuPizTiPsT/GrTNP6QvjDdKr1dlpi2H2ynIjw7hyaxxwbQfUov+2V2htDAOVeB
	7NEF5jSmVIcjoQ4zNPf0hImzC+HBZfLwtOMtZGhmQ4AkNFSRUaveyqiCRzjh2Ht8=
X-Google-Smtp-Source: AGHT+IG+S8o0nDapSfnZ1a+uVEpuyD61RrMs+TwTGtUlDwK3w63qWwCtloY1zC2nCST2wZ8cLR/VOxlT9ubBfZbkFIE=
X-Received: by 2002:a05:651c:507:b0:300:1aa5:4967 with SMTP id
 38308e7fff4ca-3002fc300f0mr40061971fa.25.1733736505228; Mon, 09 Dec 2024
 01:28:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203172631.1647792-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241203172631.1647792-2-u.kleine-koenig@baylibre.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Dec 2024 10:28:14 +0100
Message-ID: <CAMRc=Md4t9QuiCtJ3TswSM-2qdOwR5_yk=kVN7wcvN4jz+yhkw@mail.gmail.com>
Subject: Re: [PATCH] gpio: idio-16: Actually make use of the GPIO_IDIO_16
 symbol namespace
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: William Breathitt Gray <wbg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 6:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> is included. So move the define above the include block.
>
> Fixes: b9b1fc1ae119 ("gpio: idio-16: Introduce the ACCES IDIO-16 GPIO lib=
rary module")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> this is based on current Linus Torvalds's master branch and depends on
> the topmost commit there.
>

Can you rebase it on top of the gpio/for-current branch? It doesn't
apply to my tree in its current form.

Bart

