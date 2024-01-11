Return-Path: <linux-gpio+bounces-2139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5CA82B177
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 16:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 290311F2197E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 15:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB3B4C3C1;
	Thu, 11 Jan 2024 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xk8hLHf9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1C24B5DD
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7ce3e5bc2afso1161425241.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 07:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704985850; x=1705590650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xmz1x13MtnOunB8aG40zQUjvVo1bCKTcp5yEOK05UU=;
        b=Xk8hLHf9vPJPHKnKj6cxkhW5yGcvc9qSs98FdnEOeQBiLqjZqM1cOXe0hwM3OxK7PI
         V1dVzHNsz4SHXZ1fsJuYR3ldGtIo0BDkNItKZjkTGw/9K++xwVQEO26dQ198Om/oZqKj
         uSz8BOUeAwnfSVzjw++6V2/ijHdl06lXwlAJBI/Kg4WkeIEnWgtoMXggTCg0r3OkFM3E
         IVDpyV1nZmt9OG7cilOTvDIkKbAv8W9EZPX4T730bomOfHqzgEtauFqX4gKMRLM8AWzE
         O9ZYXhRLqgXa875Va3THzz4Z+X4lw2BWcfxC7EL/ZYS8Q2PeVih+eQUFYy+gslKuaUvU
         zSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704985850; x=1705590650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xmz1x13MtnOunB8aG40zQUjvVo1bCKTcp5yEOK05UU=;
        b=RPR0v3EX9DDyhMULsLcgE0mO6k5vCcyklCWv1477LT6FJrrE/x86pWaW4X7V7+Vz7j
         2Gc/cMjz4hKOof7ixBiqxX7a2KcRe81zQd5Y3JQI7zC0WicCkGeUvGcfuUdRwLhkapqA
         bUrj20uONGCjHKdNsCX523gUNNW0mM2sTQfSkkKSII93zxkYaEcQOjbkA2k6CuKSYlI6
         MfZsE9GGneL1dJvmzCMblmO765Oky1eO5qNnGVjgmWVrtdy2Q9nxBRC91xdh6Lxpo5fx
         qaR1J4e9gNJ7yBDgwwiObEEcVNvGxdwm2FneDMObLMgKAB2RxpXrIFdjTWDaXZIi+76U
         yN+g==
X-Gm-Message-State: AOJu0YztHCupTT8qpxnRz0iBIxfOGbhoKg2ZtlXwELXM5hMhstCtErN3
	HhfxEOTERD2z8Hpj+YMnlxsXxDfBBX2rI+TihWFzsFJpWvDmKA==
X-Google-Smtp-Source: AGHT+IE0sQxotHJfcPjc1f5P6j0/2Cd4lA8mERRjZObzwdBXuuXE9u7qYkpWhjk1+IWLCRoXaBQRLG4l//0DZVBnziM=
X-Received: by 2002:a05:6122:4b8b:b0:4b7:1685:9f99 with SMTP id
 fd11-20020a0561224b8b00b004b716859f99mr664902vkb.12.1704985850420; Thu, 11
 Jan 2024 07:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH0PR06MB83342EF7DF19F93CF257756786682@PH0PR06MB8334.namprd06.prod.outlook.com>
In-Reply-To: <PH0PR06MB83342EF7DF19F93CF257756786682@PH0PR06MB8334.namprd06.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Jan 2024 16:10:39 +0100
Message-ID: <CAMRc=Md_eZvVPMyeNZaB0b6SZyLw77eqRdC=qd699vB4PM3j3A@mail.gmail.com>
Subject: Re: Assign line names at runtime
To: "Westermann, Oliver" <Oliver.Westermann@cognex.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 11:43=E2=80=AFAM Westermann, Oliver
<Oliver.Westermann@cognex.com> wrote:
>
> Hey,
>
> I hope that this is the right place to ask a question in regards to gpiod=
, if not, feel free to point me the right way. We're transitioning from usi=
ng the old sysfs interface to using gpiod and named lines. For most devices=
, we specify line names at boot time using gpio-line-names.
>
> On some devices we have small differences between revisions or hardware v=
ariants, which causes lines to be swapped on GPIO expanders or just being u=
sed differently for between revisions. We started to handle this by overlay=
s, but that requires to distinguish during the bootloader phase, which is h=
ard to service and often unneeded. Especially when we want to rename a sing=
le line, the overlay needs to override all entries, which leads to duplicat=
ion of those line name lists.
>
> Is there a way to assign or change the line-name value at runtime?
> If not today, would that be a desired feature (as we're looking for way t=
o test contributing back)?
>
> Best regards, Olli

Interesting. There's no way to do this with the current uAPI. We do
however have a way of doing it in the kernel. I also see a use-case
where udev could rename GPIOs on dynamic expanders according to
user-space rules.

Cc'ing Kent who's the author of most of the uAPI code.

I'm in general open to enabling it but the problem here is that this
would open a real can of worms with *global* and *persistent* state
controlled from user-space going against the design of the character
device.

Bartosz

