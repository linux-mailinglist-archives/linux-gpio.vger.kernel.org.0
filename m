Return-Path: <linux-gpio+bounces-3900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDEE86B9E0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Feb 2024 22:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28D511C24D5D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Feb 2024 21:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E247772912;
	Wed, 28 Feb 2024 21:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HnUDOSYg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B9C70031
	for <linux-gpio@vger.kernel.org>; Wed, 28 Feb 2024 21:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709155701; cv=none; b=bfqUv1qyPvicZRIgDhQP3+Vn4QBfCFJNWc0356fJ4NC/c1YkSCOZcH018Vk+0Dkz7cW6QvMQzvUhDkTzgsoSMYkuIzhfes+3AasBriRCYGIautapwwcFBRX1bX/u/KrR9/wcgTA+TN+lAjJ72wIIBGdXF/wNnwp6vNY7RtMlcZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709155701; c=relaxed/simple;
	bh=Vf0do4mWmyzl8Py+ttYn8ggj8OVTVR5qdBW3AzesKNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMweog9f06tsw8PbtItTYUudTZ/gnPFGcaOm7j+4oZeJL1XNJJKCTCgEVPIhunrUBABsqWDFZYZjOpkdhKUwAqRkwOpibAUI/72QsxV1zl2mVSCCy+zG55BZz89SwxI3GpXcBMkVId+kLRxQDgoqUFbcp3bHb1M8uzbU89S0als=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HnUDOSYg; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4cfa1b3c3a2so718583e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Feb 2024 13:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709155699; x=1709760499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P37DoC18sNGnImdksJqYN4+snHz4hsIQQAlSBf7O+w0=;
        b=HnUDOSYgwp2qUVKlB6E9QRUAjkHJQxi9z2LNB4bEeyDRwbCsgQN8DfSokI5/v6/2CU
         fefT2y5KSNyjrcawd82zzt2x9Ouqz/DM3WxUgEASe9dCsjn0r1ax2L3wijFrfUqLhc1s
         83fPTG5OmZuQGbtsVd+4MMGEzLrkNwfpOU7jmaPN82lVEvAvvXYU1npgKELYVho4Gtov
         ghowXnanRoWqUcorfz+atlQ/T4h12MM3tl5UtXHgcbSk24UCcHV2foO+ZBbfbzfQS5vD
         M8dMavfxqA3xFAnD5p/p3Kx1QImcly+G+R912j4Jh68vWfoCk66emRIUl7AwVku+p+lD
         aLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709155699; x=1709760499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P37DoC18sNGnImdksJqYN4+snHz4hsIQQAlSBf7O+w0=;
        b=Ekx8Ytoz/gedCTsJU5wREFmOH0A/H/H+X8iDGC9VJYUAp7+XwSaTzk25pFKaI6LlZR
         jkcpepdSCyCrfCEjMKbyT2f1n683L5ynIp3cjcFtN66yQHV1FAScREBMQ1b4G0BlI+xa
         WFPZ2uDb9kQv5aAQg5snVBtEEU/wHqtz7br/xAvQO06M5ZmtdEkn2Sjs8oHH5PnOU0TW
         taPeBoM3skyxDFlR6GWoRlSz6euoQMT7WVzccZDxX9eXe/pjcU1SWM8Lz7qdETLnXlZb
         13/Hs2rI4eVAoz4NttH0RwtIAf9HQ8bL1P83DsJBMG7yGwz1xIBJKd2hBslzy4yvV+N1
         EnEw==
X-Forwarded-Encrypted: i=1; AJvYcCXOR2BEJw/FvFejFdtKA8ix1a0YW+QWem8uxrFOevpMZ0JmtYwgnytjKT4Mkk3j0AYvb8QkV8iz8Kubhp6QkAUQAw64j+feLS/CeA==
X-Gm-Message-State: AOJu0YwRu7cnSRnMl6gu8/BvklgoLJrQ6Od8sQcQdmG7Bhbsbeg/UVRp
	xUw74volOg1tstQOkC3riOT/Fj124U5eeFKSYjxco9p02JKL5BqnjiBDtJCpyArbMZR4gaiGiYp
	hgPN9pl3YZcrZzjC4Zql2Yd6fXy8gptR9aHlURg==
X-Google-Smtp-Source: AGHT+IFQ8d10DnLbr45njbzPMBBRyKRbmpCeLUJYbzk8tW1MlnCX8W5wV56Kff7cnWjI+7dxb7hh1ZtoRVhOrJxf+4k=
X-Received: by 2002:a05:6122:2891:b0:4cf:da07:fb01 with SMTP id
 fl17-20020a056122289100b004cfda07fb01mr617399vkb.8.1709155698890; Wed, 28 Feb
 2024 13:28:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223065254.3795204-1-swboyd@chromium.org> <Zd-CJHkCHpuIEnWh@smile.fi.intel.com>
In-Reply-To: <Zd-CJHkCHpuIEnWh@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 28 Feb 2024 22:28:07 +0100
Message-ID: <CAMRc=Mdapd2jTACGqm-ujZrAunRmNeJ8_3+bpsN4ieCre52yrg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Pass consumer device through to core in devm_fwnode_gpiod_get_index()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 7:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Feb 22, 2024 at 10:52:53PM -0800, Stephen Boyd wrote:
> > This devm API takes a consumer device as an argument to setup the devm
> > action, but throws it away when calling further into gpiolib. This lead=
s
> > to odd debug messages like this:
> >
> >  (NULL device *): using DT '/gpio-keys/switch-pen-insert' for '(null)' =
GPIO lookup
> >
> > Let's pass the consumer device down, by directly calling what
> > fwnode_gpiod_get_index() calls but pass the device used for devm. This
> > changes the message to look like this instead:
> >
> >  gpio-keys gpio-keys: using DT '/gpio-keys/switch-pen-insert' for '(nul=
l)' GPIO lookup
> >
> > Note that callers of fwnode_gpiod_get_index() will still see the NULL
> > device pointer debug message, but there's not much we can do about that
> > because the API doesn't take a struct device.
>
> Have you seen this?
> https://lore.kernel.org/r/20231019173457.2445119-1-andriy.shevchenko@linu=
x.intel.com

Clearly yes as I queued the first one in that series. The rest did not
make its way upstream for whatever reason. What is your point? You
want to respin it?

Bart

