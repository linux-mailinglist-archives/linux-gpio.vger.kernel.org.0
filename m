Return-Path: <linux-gpio+bounces-5715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4738AD154
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 17:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE4AD2851E4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 15:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B0E153519;
	Mon, 22 Apr 2024 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Hxxvfjhw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FAE224D5
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713801357; cv=none; b=ELcxN8d49FJdLo2fej9daT7oCHvWd1jy3Cx05nttGkfB9/wISti+edVg56i6qSgVZhSqZQzdv4RDbOu0sWr9TUhnxfj3TUEiZm+ydlEDUOc69EKzxKmEHuF/0Wx/8ZH2q8xmAlBvluQrqQOtszDbC6h0hyIuMZC/GYxnGy0xgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713801357; c=relaxed/simple;
	bh=PM5rC5xM6dWtXZ05tdUJJCCE7XyYSwcNlOMxnHsAcno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKPRVPKzAcZPLUgQqiWkrCjSZOjAkb4RBZX4PNMruswiZ7EWD84+VIF9Xr7aBOSy+LWIxliu7Fe3UzpHNmMMuX4PBMjObmgg8M2sF/6Zam9PbB/aENuQjacfqE515l7lITS3QbZZL+QIVX2C9n5VqSMqHhIFfukNXsN5JiKpO+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Hxxvfjhw; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5176f217b7bso7604947e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713801353; x=1714406153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM5rC5xM6dWtXZ05tdUJJCCE7XyYSwcNlOMxnHsAcno=;
        b=HxxvfjhwKdz7TDfGWt7oZMaAq9UwAPVZXJxiKTNc2sWygjM8LUHQHutPbrvT90emBR
         gls/Ev50k4bjQB/373E/c43BE689BfCB5fKG7YRLDGuFEKF5sRY0Yp8TOENcnB+Wv/AE
         RCrKl+9K4MB/EpG3vswXE6T92N1Nz4V9WvIvWEf4zPsrPNeYzBKE6wICP9dAf2MLUflD
         j+hxGRRMl0s2qdeG76T3z8xGeoXz/DAkKJF6U6J6hF2qJVlp5ONpoY4XCZk1eAloWrgJ
         B9l2f098Bm7cX71a4PwzOkTeJ/DJrQ2tW3MARHgUglVBd1ZimzI1WhpvQdtMTp8UqBje
         Sa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713801353; x=1714406153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PM5rC5xM6dWtXZ05tdUJJCCE7XyYSwcNlOMxnHsAcno=;
        b=fNhl6s8gtxV2SQsGgiXuJ/1eylnfM4L4+/N9HmSDi6AIj4DddWOrYcGTSgG6sm4nXC
         BK/OUkwUBcY4GGspNvLfo4Bf8HuXbheGFCFIZLce2kaRSINDCI6npvHyH34HpZGIwce/
         xHlrTLLA4KCMLsFDOS4LrKG/AQ6cMG2VNc+frq0nGEgHLiF/rRMuC8QR3ZqRwvz+1jc8
         roM6y7uLoOh+PvjF8kXhvuWXdAKqjXD/qUzDVak/5I/YVnCmiAFmilx+HwgopfDJimT/
         m51ZrM72P8KqVJepUil9RpjDFTFgmfJJi6OXNP2+zVrS9pVQS27YGw355vSwleCouE42
         J/Iw==
X-Gm-Message-State: AOJu0YxnzSG4GNsWKmN5OrmBl0vHx12bdDvmSyH0qFFvOFEWaKROou54
	be3PmCommhoOxriS94Wc4fV5LpG6WjtKN2ZDaNt/OAtjcAd4hHye7KPDGXDBni0RfrAW0Hv5kKg
	4KBLZ3fPCGIodiTbz/deedvDMX8aBiRg+GvcvUVWfa5bHy5bMEH8=
X-Google-Smtp-Source: AGHT+IEqon+/kx//pxqfcpcy7UqZAUgEjeXxDJKHczuaXdz6xYbi4EA8W07YR1CBGjl4D3929sauZF+lFkCvzQpoHfU=
X-Received: by 2002:a05:6512:483:b0:518:e7ed:3c7c with SMTP id
 v3-20020a056512048300b00518e7ed3c7cmr8367164lfq.14.1713801353123; Mon, 22 Apr
 2024 08:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
In-Reply-To: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Apr 2024 17:55:42 +0200
Message-ID: <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
Subject: Re: [questions] : gpiolib and gpioset behaviour
To: Gilles BULOZ <gilles.buloz@kontron.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 2:44=E2=80=AFPM Gilles BULOZ <gilles.buloz@kontron.=
com> wrote:
>
> Hi Bartosz,
>
> Several years after our discussions about GPIOs, some things are still un=
clear
> to me.
>
> 1 - The gpioset command has this in its help : "Note: the state of a GPIO=
 line
> controlled over the character device reverts to default when the last pro=
cess
> referencing the file descriptor representing the device file exits. This =
means
> that it's wrong to run gpioset, have it exit and expect the line to conti=
nue
> being driven high or low. It may happen if given pin is floating but it m=
ust
> be interpreted as undefined behavior." But up to now I've never seen such
> behaviour and I'm glad to have the GPIO set by gpioset keep their state o=
nce
> the command exits. Is reverting to default an optional behaviour in the G=
PIO
> chip driver, or in the gpiolib stack ?
>

This behavior is driver-specific. Meaning: you're in-kernel GPIO
driver may actually retain the state.

> 2 - I've recently wrote a GPIO driver for an I2C FPGA design having ~112 =
GPIOs
> and wanted to use get_multiple() and set_multiple to have more efficent
> accesses, but realized that the line number was limited to 63 because of =
the
> unsigned long mask/bits. But I've noticed that working on a line number >=
=3D 64
> was unexpectedly calling these methods with a mask at 0 instead of callin=
g
> get/set methods, and that the only way to have things working was to not
> define get_multiple/set_multiple but only get/set. Is it the expected
> behaviour ?
> At the end I've split the GPIOs into two banks (first with 64 and second =
with
> 48 GPIOs) to be able to use get_multiple/set_multiple.
>

Please use libgpiod v2. That won't help you with the max requested
line limit but at least it's more modern API and actively developed.

> 3 - Is there some way to request a GPIO already owned by another process =
as
> input or output, just to get the current level on the input or the level
> driven on output ? This would be much more efficient for real-time
> applications than asking the owner such information.
>

Ha! Please help me help you. Take a look at the DBus daemon I recently
posted[1]. With the daemon running, the behavior will be exactly what
you expect. You'll be able to get/set values and have the command-line
tool exit while the daemon retains the state.

Bart

[1] https://lore.kernel.org/linux-gpio/20240412122804.109323-1-brgl@bgdev.p=
l/

