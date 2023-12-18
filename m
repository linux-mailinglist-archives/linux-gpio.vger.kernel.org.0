Return-Path: <linux-gpio+bounces-1614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB87816E3D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 13:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B139285D08
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 12:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1957EFD7;
	Mon, 18 Dec 2023 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y5ytsrwe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90147EFD0
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7cbf2d2fdcaso16963241.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 04:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702903431; x=1703508231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfvHtKUU7XlgS0LyrkbLQeM1LtY2gjMvOvyId5ed8lE=;
        b=Y5ytsrwecuPJmEE3VR8/HkEu6C9J6FFodIgkUAv6VHmmRq//Idi5JBUd4C5w9tb2El
         e3wQC0NeMZQlwF9OdOdL0LQpNoJIJlaev/4ziBxtqRVB9eFKlrtfe/FXrvQQ1e9kZEEm
         H4fp5gQUIaGQTttbv/YMJRRpo/jy27/L54QvILdtRRja+AIDNSeSCv8f6TVAIGuNb4SL
         /u6EVVpvZp7MlHBlQrWwJoDPwYZd2lFbrDszPlCWwtzInLggiNjdKwobAXtGK0NtHaOF
         X+7Png7qt86idqkJYgL3R4HnvF4IKUSWmf1eFosnLpHQRbhPNEsv+3cK/VPl10uy8GYR
         h4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702903431; x=1703508231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfvHtKUU7XlgS0LyrkbLQeM1LtY2gjMvOvyId5ed8lE=;
        b=V0YgtPiNQ9dLm86crObFNHzR//ALKnzc12VZFNjN33l15gYgWupRKlrc2+F86Sk+7w
         xqJJJ9cBjkXxwOafZPcfQf4O7S1DUdEquqwvr+5ArNSTchUo56QVM1Uj5lhQe0Xu5GY9
         tJMMJUg22pXG9ugwXOObSfx7PWMgovIbmwfUu8PzQ8TMe5aL6JZBlw1DsDHfeN6+LseV
         JNKO4jHYpcMP3Aaqw1uER0m0gqN96zeWdW88IjIYrgbdcB3D/PfeWLRHFExfBYbKoTAM
         UKDS8+XDJior9KgJlAFV2gPaOzBv3qk9FZD74DlEf+DD/aZcVsSPxraptQUq+u5CHc7l
         W18Q==
X-Gm-Message-State: AOJu0YzWJUH3OXYBgjkPh/Hh1ojpjrx/kC5nkxtr24C6JM2aLAtr5Nmt
	aFDtR5Hr8ZxN4sqD8WCF4o2lhRTvdNxtJER7ciun+w==
X-Google-Smtp-Source: AGHT+IGDnDXa/gihpusavmilYaX175FCWpQxfi9PEjSjb3l334z11qxmvtQUeNtqT1ahRB3xuGrYEOYJOkOM3ZlNPJo=
X-Received: by 2002:a05:6102:3913:b0:464:7f21:17d6 with SMTP id
 e19-20020a056102391300b004647f2117d6mr5500298vsu.15.1702903431622; Mon, 18
 Dec 2023 04:43:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231025184259.250588-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231025184259.250588-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Dec 2023 13:43:40 +0100
Message-ID: <CAMRc=MfZm7TDHRRLrDmnyj3vmbscmpveR0fveYfsGz0SdaskKw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: mmio: Make driver agnostic
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 8:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Driver uses so far some OF APIs when generic fwnode ones can be used.
> Replace these APIs accordingly. Note, this will help to clean up OF
> headers even more.
>
> Andy Shevchenko (3):
>   device property: Implement device_is_big_endian()
>   gpio: mmio: Make use of device properties
>   gpio: mmio: Clean up headers
>
>  drivers/gpio/gpio-mmio.c | 53 +++++++++++++++-------------------------
>  include/linux/property.h | 26 ++++++++++++++++++++
>  2 files changed, 46 insertions(+), 33 deletions(-)
>
> --
> 2.40.0.1.gaa8946217a0b
>

Applied patches 2 and 3.

Bart

