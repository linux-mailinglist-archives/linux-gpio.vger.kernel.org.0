Return-Path: <linux-gpio+bounces-26107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54475B5695E
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 15:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D35C18978E9
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 13:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAC719DF4F;
	Sun, 14 Sep 2025 13:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAJ9fqid"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A11FB3
	for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757856893; cv=none; b=CUaBhjWP/H8vRhFa3FRfCk/DrTGdxsnPm4yPgX3xvn2ao+GgZkGWLV++z6ZbS0pZhyDm+G8O9rwlpP5F9NlMtg6YVT6rDiio2ZQyq67BjEaehBtCENnmZ4kqpb94eViTU/Nb72dVs3/f5RshfOEjjS6QA0kAm+cTyyHNQ91uKj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757856893; c=relaxed/simple;
	bh=CyhaP+rK2v9NVe3H6P0c6SO55g3iZ5Ysr/4PjZeuRI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqQgSUei33MEjPMXc22uPEgG+4mzyssGjC9v0jVtVi8PGIzAo+eXC1yOBOxRX8umH2lj+vrqrEOPv1g/hZohg8ldkTZeydauYtmWitdOpl6aTPFPM/YUxKsKXClp11WXWpK0AJWB9x8vH0D/qiUoPOlXACRKliuX/Paf7iuJhKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAJ9fqid; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7322da8so643049766b.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757856890; x=1758461690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyhaP+rK2v9NVe3H6P0c6SO55g3iZ5Ysr/4PjZeuRI0=;
        b=MAJ9fqidJIIlOVWRl//hx7UPnZ+Rfj3w3FU6G4CTg9T0exOre6Vu6ZsYZrtQs/kBSg
         h1OJSuSsqlL44Pepk40BdyHfBSdlt4MFQ/usb1LIFdGr2NfKdm78VGn+mqAY9CMKRch/
         CeIYhqXtNw8BYpI7ggvc9YHhuwOxG3nfiIhhzyApmzDWHSXDdOAWXviolFI5EqFSN2Y0
         TRI7bMby9WarspaczCEOCEuc+JPZkj9+Zrid8DNdBuF1SpPHoF2hhJ9GU2iQLBbuqaWy
         82hXCsVmsCkLrrsewd46xJqUd+8tbWegYfWVxRAkECn9pS4dhLdK4bsFaZv8fIw92CYG
         aetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757856890; x=1758461690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyhaP+rK2v9NVe3H6P0c6SO55g3iZ5Ysr/4PjZeuRI0=;
        b=pM2zKHHWhOxr2oXjYPqfilF5JNzznd07qYVh7NZ1f1tUOtN/kOoRqeQKCpXvNmt/1U
         P2dgHtqVSlwtsy1PpqQsBpnpi2RucVtZxTi9N2Jda23ZkQfKolYG/hyuV7AvUmJF3Lez
         BFlWMw3hwEboRvE57r8F3C/lixfFFbRRGGFFkEKxlm+hYRKN7M0jULGDDHGb/Q3kM82h
         Pf/RmWpV4J5jxuqPXbW3Ax28ViHLuitzvlR2TWY44IH2OV6E2H8mA45hpcpB1a82h/dW
         pKdnAim+tlEl8oy2uLoCRzA6OsWuygudSGZUkBpV7Qnf5alOjyTJrclcB3rSSunci8Pr
         MeYA==
X-Forwarded-Encrypted: i=1; AJvYcCUFLo7o//SjeukRSqXEGKFJlI5HrcRWRDqOBYZQeg8EpbPy/0hJ4Zi4PscCor8wJFQYtZIBpdtPsuNq@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdkdFX79NAUjF2nl1vmgXrk7Ig4a+EloYzJXM+kTzyc7nuSoP
	81hWo5kilBuTIye5qPlp2kR7MwPu2qMY/YqSm7Olt6Ls9t3s01k9IdtuwDwlaT1GXPO+0uuD+C1
	Ev467JTAXxpVE837diCqLCxJ6BWCi1jw=
X-Gm-Gg: ASbGncsyBfNYTqkiouTzzfpV+BohL+WgdhV4s/wuT+LaL3xUxj4Qjr5XSHvVcMZ2sU3
	SAoaf19v8ED0zVzrAymwR1HKouMcbljOB7xm887wMmLebOMofK09jdW1cQcIKPb2mOp4RVZuYZ1
	BB+kbfS6cyR84vjj8vlPJmmYzsTzgY1nm6FX5LAQZouNGCUfeWa6UWEb+YjI4deA2VqHPpBDx7F
	oqBARJhHz2wcdyW1w==
X-Google-Smtp-Source: AGHT+IFCG0vgu660h+lIypuCmSneJQ1gV4hloj7XR5kegrvEXJOiAOwBrD0Yp4VMqZxiz3ZFZFfuKUw4tRRPxBUOFSM=
X-Received: by 2002:a17:907:868d:b0:b07:8972:2122 with SMTP id
 a640c23a62f3a-b07c35c0924mr1039382966b.18.1757856889965; Sun, 14 Sep 2025
 06:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913184309.81881-1-hansg@kernel.org>
In-Reply-To: <20250913184309.81881-1-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Sep 2025 16:34:13 +0300
X-Gm-Features: Ac12FXzyxHBkFS_-kmF-7rd40M1mWUL3lXuUi734ZeZ5UNFF9SRnz1EjK6040SQ
Message-ID: <CAHp75VdeNQ4O7-eDjA9otdGeRnzweYhXyvxnpEEAHoestB2=mQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Extend software-node support to support
 secondary software-nodes
To: Hans de Goede <hansg@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	stable@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 9:43=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> When a software-node gets added to a device which already has another
> fwnode as primary node it will become the secondary fwnode for that
> device.
>
> Currently if a software-node with GPIO properties ends up as the secondar=
y
> fwnode then gpiod_find_by_fwnode() will fail to find the GPIOs.
>
> Add a check to gpiod_find_by_fwnode() to try a software-node lookup on
> the secondary fwnode if the GPIO was not found in the primary fwnode.

> ---
> I found this issue while testing "platform/x86: x86-android-tablets:
> convert wm1502 devices to GPIO references":
> https://lore.kernel.org/platform-driver-x86/20250810-x86-andoroid-tablet-=
v2-7-9c7a1b3c32b2@gmail.com/
> which adds a software node with GPIO lookup info the a spi-10WM5102:00
> device which has an ACPI fwnode as primary fwnode.

While this is a quick fix, the long term one should be in a full
redesigning of the fwnode concept in the kernel. The limitation of the
linked list to two sooner or later strikes us. Besides that, the list
of fwnodes conceptually is not property of the fwnode itself. The
struct device may have struct list_head swnodes; besides possible
other users. In particular this also will allow to have OF and ACPI
nodes along with swnodes. You can say "are you crazy?", but look at
the DSA development and other interesting PCI devices that are
basically computers-as-a-card. The floating patch series is to enable
OF enumeration for the devices on that type of cards even on ACPI
based platforms. Which make above mentioned use-case not so
theoretical.


--=20
With Best Regards,
Andy Shevchenko

