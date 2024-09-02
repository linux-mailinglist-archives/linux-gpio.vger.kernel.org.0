Return-Path: <linux-gpio+bounces-9542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6065968428
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 229E71C20901
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AEE13C9DE;
	Mon,  2 Sep 2024 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jvvVg13/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325E813AD37
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271801; cv=none; b=QIz2wWkGIyIac7HUlK/NzKNMSZwfjkeIc27RFvEAt0FylzJUeooAiGGx/wfyAWqyTl6mYrw5WHI5TF56ysmb2eeupauvmkU77vAY8No7aWbn9ZOcdCYr8BIyEe5G+zPLCmQgTFzjVFqwvV7Pl/CmCubaQIw3Pq8HCZAGvNExcGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271801; c=relaxed/simple;
	bh=Ja4YtugzMB9ogEIkX3BJKEenkvJ6wDGuFRn5ZUDxiGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYwQU948hYvtx+dtaULMQMb5qyRbKPoJxIzgGEk9bA1IY9vL4d4v7ypYc5ll7HnWIxVXFqjFvx4Ev7BX4woSFVVCDSX1G3zRfTQArHv4HI+tNJVF5xVXJUogs6nWH/RAf0r8aFp9uAGu1ji8koA3km0uR6c6vwp/BphvPdYOgPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jvvVg13/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-533461323cdso4964518e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725271798; x=1725876598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXTfoHlWfPNF1IIbquXqm5QjiVKu7PwRvegy7632kfQ=;
        b=jvvVg13/nsVIDwZCkPBTSISswQCk9lNP6mKZXEs7cHitbdGU611TNDCELPz9WMTlbo
         3bBbtQVh5eBc2E4Yr2UDp2TYUmjNKMoVT6t7Z4DsuZfdfgHhAGdpTEeSYScyEEo+Jmoo
         uhc/1DPNX/s9foS7Md5YmrY53hli48wPRUoEshU/mY0GSuV4LSNPFPEsqa5ULngZZn4m
         fadFyxuj4s5oM2tnjK7p3bQ299RQCkr/QXPU6fjAakMdiqGoSXtPO5Z7abIXryQPhhWU
         k25enYKcqgFcon/J6HJPI2qqw+WBgRIAL6xSXW3Fh2kcGjtUJiTeM0b/13THIiSX1cM7
         KBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271798; x=1725876598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXTfoHlWfPNF1IIbquXqm5QjiVKu7PwRvegy7632kfQ=;
        b=kmM+eLxUZ9R2oFL6BA8/gIFhDrWg9qFLJ5X2bqtM9JTKM6Jt6t09Bh0ntkJBVVUXpT
         d+VkizclcewPfl7Cj6BO/jgqsSlPme6vL5T4LWuHaUhmb8uMBpSXDrN43OEA3sIeO8p1
         7eg1HNFup8JRhsbKf0GrHn73u+zqCzC2GT5Zuo4p/iE7ibgmlHYhqvwqMpbVLBnh+/T+
         xnpkD0fdERZ1Zn5CauYn9pTIxLDSCxkWFDr8RNbFKfAdZlHDb7Gr7KFBe9JxKRG/d8AL
         +Iac5P06kyFK/NVoPn0+kAkP/yWgCH0ka5Om2Z2wxd23r0QvOCRnt0FAgCoPvJ/LtTpv
         pv2A==
X-Forwarded-Encrypted: i=1; AJvYcCXziDrt28vuF06It434OTNrHYdcjE7I924/dG0bKS2HunCtVtbtl8XOTRD6sofx7TIF59/mnD5eDOlN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1q3NpzKnRlfCz7jnmIzfjgBOnpptQYYF/UsDfxMQ0hTY9pJ2i
	k4qqGAwB2cIw9KX70FSa58hoskE7Z5rKwMsHqaf3LWvoNFF0z+aC3BglKYQIlVNMV4ikCLX+xg8
	h/1tOHfJMjR2nk+51IMkiVIMGwY5TU8jE6Dlv6w==
X-Google-Smtp-Source: AGHT+IEfsxozqEMUgmXhMyMPUf5NwF4vKKwxsvyswqI6GCtgLgU7BgY9T+H3dEqh6ncqSHBxoWIZwevlso/C7nKtjeY=
X-Received: by 2002:a05:6512:31cf:b0:52c:df8c:72cc with SMTP id
 2adb3069b0e04-53546b692d9mr5654696e87.43.1725271797696; Mon, 02 Sep 2024
 03:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
 <Zsy6pZ9LYDk0LOHs@smile.fi.intel.com> <0187710f-73c1-4ee1-87f9-384101f0c32c@linaro.org>
 <CAHp75Vfq0kEN-VDd=aTycHH+oEkUHt260nH533UWnkoEnGRhjA@mail.gmail.com>
In-Reply-To: <CAHp75Vfq0kEN-VDd=aTycHH+oEkUHt260nH533UWnkoEnGRhjA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 12:09:45 +0200
Message-ID: <CAMRc=MdGUYQFJ6GnryL51AKPpXOW5FuV+SZxAtqt+moJpvLQ7w@mail.gmail.com>
Subject: Re: [PATCH] gpio: kerneldoc fixes for excess members
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 4:02=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Aug 27, 2024 at 4:55=E2=80=AFPM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> > On 26/08/2024 19:25, Andy Shevchenko wrote:
> > > On Mon, Aug 26, 2024 at 06:18:50PM +0200, Krzysztof Kozlowski wrote:
>
> > >> Drop kerneldoc descriptions of struct members which do not exist to =
fix
> > >> W=3D1 warnings:
> > >>
> > >>   drivers/gpio/gpio-pch.c:101: warning: Excess struct member 'lock' =
description in 'pch_gpio'
> > >>   drivers/gpio/gpio-syscon.c:46: warning: Excess struct member 'comp=
atible' description in 'syscon_gpio_data'
> > >
> > > I prefer on per-driver basis, but since it's simple and I have nothin=
g
> > > in my queue,
> >
> > These are so trivial without impact on the code, even if W=3D1 reports
> > them, that it would be quite a churn to handle multiple patches.
>
> Even trivial changes may lead to Git conflicts if managed separately.
> But as I said, there is nothing in my queue (at all) so there are no
> chances for conflicts.
>

Is this an Ack for me to take these or do you want them to go through your =
tree?

Bart

