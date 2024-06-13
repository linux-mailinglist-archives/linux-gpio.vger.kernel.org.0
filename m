Return-Path: <linux-gpio+bounces-7422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C8906ADA
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 13:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 803A21C21A93
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 11:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C2613C9C0;
	Thu, 13 Jun 2024 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NVPA4wvU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFEE1422DD
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277506; cv=none; b=fOWlUVhjGHcsD658Rk0yQgo6O+KtxuZkH5bdXmEjE/quw4rKf4ouYEtpdA+nbDT4wHeLlofOsCftGELstIWRedU6CrgrNaOTM3AJ6dvwxT/YyBqVc7FyTJdCtcKTrg7osOJeDGJCVA6YSwX6137uegZUCxjVCxAjJ1FPNsntapY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277506; c=relaxed/simple;
	bh=HBFcO3MnDbEgvd9n1zufKisPAvQ+5EkOfA3eyt/cemA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=futBZ/jnR6kC/y8qADuQRB8pnCorPWpCBzQO0dqV+kL8E9mAuh0untooR9Q96q/iwGod/HS9kjlmhIfHgdR2PX+njHe7B1HFI29DoeUTgUxzuaNFn50Tg9IMUBgVw8OttmxdJ7Y/tsTvKnajMFXTbP0nNhVzABN5kbJ7/z9Wkdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NVPA4wvU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso1261257e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718277503; x=1718882303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBFcO3MnDbEgvd9n1zufKisPAvQ+5EkOfA3eyt/cemA=;
        b=NVPA4wvUQ6PZGYycD7ersd3mzlNbhyMnJuiEascfPCY+WdRa+vGieO2XPZITu4iTnA
         ic+xnl9MqTgGnyAxu70Fnt1UMVo+G98EwhMh5raKtjuHVN9grDRiSFEKiqVmGc+BS6yI
         EeJkQwZynWdNqFx3JVScoMiPn2ZqkipMRy/wd4CGi1jBr4G9hV27PMNUU15L0Bn4lszK
         MiwuiDqqHDDlbZWHT4+xG0flTt8DvddWTXaiJTj4/rG2EI/uJz13Hk8mr7xDecZg+gVE
         BrQqEuVN7daXlkOTSCPrsnMuu/clBxl1e3PcYjtc1cRvcnxPtPqFF7yKRBsbY8Wkny1s
         gV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718277503; x=1718882303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBFcO3MnDbEgvd9n1zufKisPAvQ+5EkOfA3eyt/cemA=;
        b=QkShfZIUJvB560RR7513AQCrkOqVi90iLyTscfU7/oYiFnzd6vh3g9eeQnbyP1wsCa
         AEGE5Jc2ZmCU9HYumTlor8M3/dOPycdHGA1mUdy85qrH/Qcfc7V91MuNM8P/fHYLyP4k
         9YsqkS9mU2jZr1hoNe3ILsd42urfiPGAyAfSeeCNQqEygTa0RL2yY7GEQYcFPw4soP6B
         saGSK+G5RbCIYnfOh3KDNtii+XNmEW3Bo/PWTvpznSjOBKXY6/A0NBy1DLbTPAGGP2Zf
         pvAGee4nWNizEKfEIJT+quvGb0xsRDVjbPmsCZBZFSz3m5JRULY//lURcb/PbgfQ+cxW
         2YWA==
X-Forwarded-Encrypted: i=1; AJvYcCUqmcBCWd1jhLxYozp09MKCz7yeHOfo5Ikfe6gtJRf50lTUmB2ojd2y1P2Ll8gbg0Ar2Wb/PtGChXevKONZLDmSSVx7VCQ+ve3Jrw==
X-Gm-Message-State: AOJu0YzHJyA0ONN0afrMde/qO+J7Czpns4/XbOIkUXYpHM/Va1FP1cZf
	is+YI3nG64wmkP1w8JZDfo31JY7O+8G8TFDAaXL6IxHh66XGaX6t8qbg6o9mi/Ntgq19tj6WfWy
	BCMpIOum2Wxor+7C28wLZj5ZlsCKOmQ1anOsThw==
X-Google-Smtp-Source: AGHT+IH+kLDQa0quCXRnsDwlpEst6OqWiTKg4mLICk/r9wtgXQ3OKkeStQzc8ULsG04CJKTsmjwSqQNEA4SjszvNw2Q=
X-Received: by 2002:a05:6512:3ca4:b0:52c:a465:c61f with SMTP id
 2adb3069b0e04-52ca465c7d1mr482771e87.56.1718277502785; Thu, 13 Jun 2024
 04:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613092830.15761-1-brgl@bgdev.pl> <20240613092830.15761-2-brgl@bgdev.pl>
 <2024061330-clarinet-favorable-02da@gregkh>
In-Reply-To: <2024061330-clarinet-favorable-02da@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Jun 2024 13:18:11 +0200
Message-ID: <CAMRc=MfzVxucpLBn4fdOghBvLQFazc28Q8Zt+wzuKbrkrnzW4w@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] drivers: export to_ext_attr()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 12:02=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 13, 2024 at 11:28:29AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Make to_ext_attr() available to code that wants to reuse struct
> > dev_ext_attribute. While at it: make it into a static inline function.
>
> Please don't use this, why is it needed?
>
> thanks,
>
> greg k-h

I had a struct in the gpio-virtuser module that consisted of a
device_attribute and a void pointer. Andy suggested reusing struct
dev_ext_attribute for that but I need this macro to access it when
only having the embedded struct device_attribute address.

Bart

