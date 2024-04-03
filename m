Return-Path: <linux-gpio+bounces-5047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF5896DA0
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 13:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B53528E7DE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 11:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D071136E3E;
	Wed,  3 Apr 2024 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="br14o6jN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262AC139581
	for <linux-gpio@vger.kernel.org>; Wed,  3 Apr 2024 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712142320; cv=none; b=K604ZaSeDOhIu5kUt+wyGXDJMF5/DAcytqvmOJNr+WnR9NwmZOPwMDDQWPfceHNWbKd6jp/GzXIpjJ17IixHWOLyVllKZBQxGil9qcVTtfpGy1v3Pz5YVbxhgFVUCRRXOPdBGhIBsgXirepwausqs32JAH0cI9r53hZnufMu49g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712142320; c=relaxed/simple;
	bh=ZJvZmJHxJhSPiXQev3phRQ5xGMWb3Gfu1/whv/9iNZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r75QxafFixH/A6VhKZ67PgLKFW8niuK586U+3EhuQHuLqFcWMZ0c/QNK6dzNtzZzZbSQ7sFri/z8WUiGoJiHWcM6GTM0jbopfkQbMdUA8YSLv3/ShtYaFAitTAdG9YDyxqkKhr3QiI3/YxHgcOK8RKHJiTBrh1BHOmt89++1LZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=br14o6jN; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d4360ab3daso81541181fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Apr 2024 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712142317; x=1712747117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJvZmJHxJhSPiXQev3phRQ5xGMWb3Gfu1/whv/9iNZ4=;
        b=br14o6jNVK26rgPAdXZaidvLQWPomgdiUZEGrzpkRQffw5caALb7epmnIk6XcZMUWG
         lKpjIHPbcNUwYGUbZKCuvLeqgXRR31RhOSjgXo0zCH+3X96SjB0vBL4RbpdnQFUFiFY/
         YiUsn6buDI2d73PyE12t3cIhTDQ/snprY0RNIU6NsOI7ZegVjST/6DNlK+hIh7zaQdJb
         +2H43DxzMgTNOlHHsT98Fk+Ftq1NpHj/W/H0b+AXglm4rvYqlGk7dOnxceRqrH5ljoZU
         v9rkhJUz6ea1B8ZiFOSQ5lioOEerna4/bDIkBzfNEOewaMRu/TPsNn8wTJfHyhiq5r/7
         Wsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712142317; x=1712747117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJvZmJHxJhSPiXQev3phRQ5xGMWb3Gfu1/whv/9iNZ4=;
        b=YonJb0X4K+y2FGtgr1NOjNqmW1rclFZAyEPXeoOfwDvnCCn3IwL/5+4TOm1EoGfYn/
         bDMyVdakAHANDDb69capc6I4ej86Mimk5zafBev/jncQ0UpWaiZh9QYkqJ0Y4odr6P19
         Etb/rXo9tNzXa3qryvL29o2+IECxOPzz55I0iYsgGzaV+e635SmbWBPVzEfDrtF61HYm
         6n2GE7p5ajPFhyRqsrD7ZgKRieSTEWjICSvqofUM6hF5T3fIckVIUv2RVrmabq0x4uTG
         Y2Czhw7/e1kFz2T+prucBnTKJdkb+3A/+AEHQq4nrEvtLoNm+pM771jX2OhT83lohxIx
         Hyfg==
X-Forwarded-Encrypted: i=1; AJvYcCUAZlfRGwdVM3Dv4E7Un+4YEMNpX14Pg5ak/78YxUqUTc5B/RlvM6jv2UCzspj8f0ml66oT+ZWYLQfB0aiPKSJImyLoDZhi94Q/cQ==
X-Gm-Message-State: AOJu0YwtO/wemuQq7POTaJrdPB8ax0/Ouu3JbxvAgPXaGPWwQEnUCoJB
	PfkM4dQywmo3RmYuIH6oMK334IzBDchvQYhr0GA8hG1KyjC328cdKwResugeXxRcGSypTT8O5Ph
	yts+wR8zP35HsHUSrVxO/+kYravmy7BsODLTk5A==
X-Google-Smtp-Source: AGHT+IGUbSycw+xhCKbzuunuEt8CNkPSdh4HUdvDp0mg4wHbwgOvRmj7W6DJfRWgVQ/4OQszflMyHYsz/5zEYPSkFKk=
X-Received: by 2002:a2e:b5c3:0:b0:2d6:b424:a634 with SMTP id
 g3-20020a2eb5c3000000b002d6b424a634mr8638113ljn.15.1712142317196; Wed, 03 Apr
 2024 04:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402164345.14065-1-hdegoede@redhat.com> <CAHp75VeJYASFaxwG2yuAdBLn7H5hK1BESP7p+3CzBVmNdCTpwg@mail.gmail.com>
 <0303f5f6-05f8-43c7-8922-11de2550d356@redhat.com>
In-Reply-To: <0303f5f6-05f8-43c7-8922-11de2550d356@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Apr 2024 13:05:06 +0200
Message-ID: <CAMRc=Mcocz5fJUJsjje_2qSRcptv-dx6bWFsaWZNVQs=+n7YKA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 10:17=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi,
>
> On 4/2/24 6:51 PM, Andy Shevchenko wrote:
> > On Tue, Apr 2, 2024 at 7:43=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:
> >>
> >> When a gpiochip gets added by loading a module, then another driver ma=
y
> >> be waiting for that gpiochip to load on the deferred-probe list.
> >>
> >> If the deferred-probe for the consumer of gpiochip then triggers betwe=
en
> >> the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find(=
)
> >> see the chip and the gpiochip_setup_dev() later then gpio_device_find(=
)
> >> does a kobject_get() on an uninitialzed kobject since the kobject is
> >
> > uninitialized
>
> Bartosz, can you fix this up while merging or do you prefer a v3?
>

Yes, queued for fixes.

Bart

