Return-Path: <linux-gpio+bounces-22453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E07BAEE096
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 16:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6760C3BCCEA
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB8A28AAEA;
	Mon, 30 Jun 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qY9AJzoq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6672633
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293548; cv=none; b=a8tEsz2yDmWG14Ak8NkyAQAk6Nkp3d25GZ9fPydXQbnqptLyDSRYDbJwqNE8NOeonZhxv1d7veJTFd5UTCLpNP0Q/V6wV9iR301mztK4/7tSi/FHXGEeeLXR89/J2YbhATHVM1t544iLRDjhItL5Okgh+GiWQUMu47/Ecz3suE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293548; c=relaxed/simple;
	bh=6R7boCYEzLpJ45qSgAlkXya0/J8kHqvdKuCYBUv67Ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sm+o+G0kkO5Kwbs2Sp4ynyh4x4hTIwnXgF3dP8PLa5Erudkj6w8yOXhSkT9KDFsaFaYAkSXYjH9MGOYp9UPSxXefPWAypKvgsEtlzlMNxVnw46v39YBiW9sipNEUpjsBUSC4QfjmPHhj2bzAA5EpVUz2LtAitvpykQ8aSKZhrV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qY9AJzoq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b6a349ccso2424195e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751293544; x=1751898344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCR9YY4zlxmSg4QDtfwUqkbq4za44RoO62WAzLMjonE=;
        b=qY9AJzoqhUivjP/6JO2g6+OHeTDxamaKiLXxzGaNzybCntu4jWkb+j/Dm+2WeG0wTJ
         JQqIWrByOsemQf6h/9zgMd3tC4ewwO6hjsjZ9Nc2B8lCHMd4xDauikX8eyZYyaQal7Na
         9SNN4ZFC040f9TQGPoKJxrPiDhqIpg3PoBVJMsj3QTLE1YwUFEelpTcrLdmoIuwAW17k
         tdv4iEHlOi1qpWXDFi5pwkva1Z5wpIfxKeUoiEKwCx+EUeZH347fKP0xmh2mzWirKNjv
         /Q/mU7+2zUYQWC0NywP9BB8ngHJ4stGfNU3Lo5qTUcW8nG4PpzYGbjFui2T0KZYv5sNf
         vwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293544; x=1751898344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCR9YY4zlxmSg4QDtfwUqkbq4za44RoO62WAzLMjonE=;
        b=Cb44tBkbIPBB/5DrbPAqEBt0TABSQN0zLdv6fmF8TeVw3IkQ95ZJ6Cm+FlBTcgHueZ
         oZJ8Sz3JBsfDVso52HfQ8Zjc7AGzC/MJBM3jdi1NeggX0YP6bQ41Jw992KoOYZ6lalJg
         QZjvmQVU/Yn8RJwi7RwHeAi/nr5WbGNVxw4UhW/2Bh/F+GTge67dANd5BrsB6oDZKs9u
         mpU9CMuDyZ0CoUJ78+XkLiFYu6zg2OjidUxkRxZwVOgLrsB1szoBt21dZ3VQw5DEIzC4
         Bu4uGFGP0biindfLqnbn0n2nMdncbfZqNT+9btXZC005U9EUYAFNfnbt/A+gU47dJ+9j
         ALzA==
X-Gm-Message-State: AOJu0YyCBqgdYyhk3ynA8EuHkyT4uafBWm83zxZLYmQEc/VnRsTGg/zi
	PAEmmhR+VzrABC7ZusaQfRDRSOZCOsbSkFuOTLLdMiRelGVz7HubKMe8pC87pnaj1oI0GyEDtv8
	zbv/A8Sq+qkqD32S8bU/fpZigWAHD2V/MYufBvU9oghovVbfAajl/vkY=
X-Gm-Gg: ASbGncs4GVrmWFMlb9OP4dBQnlmJi/0IG84VZf82JK5xrpxAhsWIdNwXpGUS33bzCxO
	5hSuOzmNeYIQBcwY9TdHvFu2CHSbdthRNuycV0pzT6m9kiDa8tYj3alh6cXeUZ7opkApsfE3EMk
	gsefMhKlED/dkrYy+NDZOYFpo6clVS85yiA27BcGPTnrNt+V3sJIJdCz+fgljfaX3e2RSobiC72
	9k=
X-Google-Smtp-Source: AGHT+IE0uBH6+ITRBmBSJrC2fYht9fM+n6ikjfShXTb6XmSRwz4dqFnbf76KXSA5X9En+j6dUmfpsL29n4sPTw2iBmI=
X-Received: by 2002:a05:6512:10d2:b0:554:e7f2:d759 with SMTP id
 2adb3069b0e04-5550b8977dbmr3983718e87.28.1751293544206; Mon, 30 Jun 2025
 07:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6f289fc5-d959-475d-9d75-0557c5bb8350@wavecable.com>
In-Reply-To: <6f289fc5-d959-475d-9d75-0557c5bb8350@wavecable.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 16:25:32 +0200
X-Gm-Features: Ac12FXykgLbfuWUlzADo6JIjn8mTnt8CwxTWNgi4cjpC_ebuUZhZAoqZVh_bfjo
Message-ID: <CAMRc=MdR70kWDA9ts-ycprNEVeM1-NgeVNLPc8kSvU4n5ZwE6g@mail.gmail.com>
Subject: Re: [libgpiod] Version 2.3.0 fails with RPi OS with Kernel 6.12
To: "Thomas D. Dean" <tomdean@wavecable.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 1:58=E2=80=AFAM Thomas D. Dean <tomdean@wavecable.c=
om> wrote:
>
> I installed gpiod version 2.3.0 on three RPi model 4.  All have the same
> RPi OS but different kernels. I name these rpi-4b-[1:3]
>
> I have different results with the code at the bottom.
>
>  > lsb_release -a
> No LSB modules are available.
> Distributor ID: Debian
> Description:    Debian GNU/Linux 12 (bookworm)
> Release:        12
> Codename:       bookworm
>
> They have different kernels.  One rt10-v8 and two SMP PREEMP.
>
> rpi-4b-1: works
>  > uname -a
> Linux rpi-4b-1 6.6.74+rpt-rpi-v8 #1 SMP PREEMPT Debian 1:6.6.74-1+rpt1
> (2025-01-27) aarch64 GNU/Linu
>
> rpi-4b-2: fails - Exception:  [Errno 16] Device or resource busy
>  > uname -a
> Linux rpi-4b-2 6.12.33-v8+ #1 SMP PREEMPT Thu Jun 12 06:11:58 PDT 2025
> aarch64 GNU/Linux
>
> rpi-4b-3: works
>  > uname -a
> Linux rpi-4b-3 6.12.32-rt10-v8+ #1 SMP PREEMPT Thu Jun  5 19:06:02 PDT
> 2025 aarch64 GNU/Linux
>
> The code at the bottom, a simple chip.request_lines(...) works on
> rpi-4b-1 and rpi-4b-3, but, fails on rpi-4b-2.
>
> These tests were run just after boot with no other user process running.
>
> I did not make any kernel config changes other than the rt patch. I used
> patches-6.12.28-rt10.tar.xz as it seemed closest. There were no errors.
>
> I guess the best way to proceed is with bisect. I have not done this for
> several years. But, what difference does rt10-v8 make? Maybe bisect from
> 6.6.74 to 6.12.33?
>

That would be tricky, these are divergent branches. Have you tried
v6.6 and v6.12 from mainline tree?

[snip]

>
> Working output from rpi-4b-3:
>  > ~/aorus/work/Python/one-line.py
> gpiod version  2.3.0
> <class 'dict'>
> {18: gpiod.LineSettings(direction=3Dgpiod.line.Direction.OUTPUT,
> edge_detection=3Dgpiod.line.Edge.NONE, bias=3Dgpiod.line.Bias.AS_IS,
> drive=3Dgpiod.line.Drive.PUSH_PULL, active_low=3DFalse,
> debounce_period=3Ddatetime.timedelta(0),
> event_clock=3Dgpiod.line.Clock.MONOTONIC,
> output_value=3Dgpiod.line.Value.ACTIVE)}
> <LineRequest chip=3D"gpiochip0" num_lines=3D1 offsets=3D[18] fd=3D4>
>
> Failing output from rpi-4b-2:
>  > ~/aorus/work/Python/one-line.py
> gpiod version  2.3.0
> <class 'dict'>
> {18: gpiod.LineSettings(direction=3Dgpiod.line.Direction.OUTPUT,
> edge_detection=3Dgpiod.line.Edge.NONE, bias=3Dgpiod.line.Bias.AS_IS,
> drive=3Dgpiod.line.Drive.PUSH_PULL, active_low=3DFalse,
> debounce_period=3Ddatetime.timedelta(0),
> event_clock=3Dgpiod.line.Clock.MONOTONIC,
> output_value=3Dgpiod.line.Value.ACTIVE)}
> Exception:  [Errno 16] Device or resource busy
>

What is the output of gpioinfo in both cases?

Bart

