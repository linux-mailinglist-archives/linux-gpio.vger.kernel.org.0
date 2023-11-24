Return-Path: <linux-gpio+bounces-490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C27F7872
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 17:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 540B72810F0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 16:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0134C33095;
	Fri, 24 Nov 2023 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RjIrnPia"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EBE2199A
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 08:00:48 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4ac1988ca66so1144430e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 08:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700841647; x=1701446447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oo1ZknLYqxbBos2qf3hDH5GDaxrvJ0Ctc73ioaMRpj4=;
        b=RjIrnPiagBFhklIhvYeoM5Uas36J/0ILqkjiWDCIIkP3N1ANfosstUKDhv0sz7C0tG
         1lPu4Fiuya9tLyKQaSnJwG6PubmlCFogpMw8QgoBv0wOiWLokT08dyvwY87K39SHh3O1
         aMuWnZ7ba4s/EpD9iRIfO8BuBjljQPjfIpP6JKiBrwpbZxk4SXxqjyaTm2mck1Wdkehc
         MS2A5P/ja1LzwAO8J8bZV9tzLiohK9XT7BiygBANaYFr3WuAb+QvpCtfw8SD4vsxw7hi
         y1FAlme9TBiJbWdG8ZWTSf7NGbDRS1K/cupyPhs6+BnZ0jpBlwiAhV0kmzr1D89zqZP9
         MTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700841647; x=1701446447;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oo1ZknLYqxbBos2qf3hDH5GDaxrvJ0Ctc73ioaMRpj4=;
        b=a2im11rGsyryY44NSoP/ee+NEftP+WV5CB/cVWGADC4oePdnTDWZ/u5zK+HnRbQ21+
         aDd7MaME4ZdKC0u65N3HT0WgXOEg2y+8UvyyXX7dVorFD5axYnG+vYQhk4CxtTTLveWv
         bkRr85uuUoe+toFAX17k1FtGBSGU/jaIE0n67vzP25OZBMWmrNRQfUTyA5cpsxP94R+P
         rlottMjC9fngzfHCfMcHKhIfDfbFgrGk2Z6d4TmJy7FXB1LRH+sH2kSOG1/v4DEkhe4r
         i/IvsiuRGoHqqF1povhgvcXmkBLCFJP2ESa6Qe4DL4IiWzSlJRi9uSj7P522X4HBm/mI
         eULw==
X-Gm-Message-State: AOJu0YzFkL7fmtiThgls/aBW4MMOupuQNStY1Mmivod6cEreuRBDpHgo
	b2LR0hV0xG7N8iKXZrc9ngGS3Yn5EnqFawU6/h5XaxMdoxZLzreKLBQ=
X-Google-Smtp-Source: AGHT+IEL+BgAFtq7og+/PYXz2TV3mZ+uuSfjlzIbZzeHFJWWjs7USGk/Nx9QT4+93EYhWAUDJ7Fc21jS73qCl3N9T7U=
X-Received: by 2002:a05:6122:d1c:b0:4ac:e85:8bb with SMTP id
 az28-20020a0561220d1c00b004ac0e8508bbmr7630497vkb.6.1700841647405; Fri, 24
 Nov 2023 08:00:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Nov 2023 17:00:36 +0100
Message-ID: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
Subject: GPIOLIB locking is broken and how to fix it
To: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Kent Gibson <warthog618@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi!

I've been scratching my head over it for a couple days and I wanted to
pick your brains a bit.

The existing locking in GPIOLIB is utterly broken. We have a global
spinlock that "protects" the list of GPIO devices but also the
descriptor objects (and who knows what else). I put "protects" in
quotation marks because the spinlock is released and re-acquired in
several places where the code needs to call functions that can
possibly sleep. I don't have to tell you it makes the spinlock useless
and doesn't protect anything.

An example of that is gpiod_request_commit() where in the time between
releasing the lock in order to call gc->request() and acquiring it
again, gpiod_free_commit() can be called, thus undoing a part of the
changes we just introduced in the first part of this function. We'd
then return from gc->request() and continue acting like we've just
requested the GPIO leading to undefined behavior.

There are more instances of this pattern. This seems to be a way to
work around the fact that we have GPIO API functions that can be
called from atomic context (gpiod_set/get_value(),
gpiod_direction_input/output(), etc.) that in their implementation
call driver callbacks that may as well sleep (gc->set(),
gc->direction_output(), etc.).

Protecting the list of GPIO devices is simple. It should be a mutex as
the list should never be modified from atomic context. This can be
easily factored out right now. Protecting GPIO descriptors is
trickier. If we use a spinlock for that, we'll run into problems with
GPIO drivers that can sleep. If we use a mutex, we'll have a problem
with users calling GPIO functions from atomic context.

One idea I have is introducing a strict limit on which functions can
be used from atomic context (we don't enforce anything ATM in
functions that don't have the _cansleep suffix in their names) and
check which parts of the descriptor struct they modify. Then protect
these parts with a spinlock in very limited critical sections. Have a
mutex for everything else that can only be accessed from process
context.

Another one is introducing strict APIs like gpiod_set_value_atomic()
that'll be designed to be called from atomic context exclusively and
be able to handle it. Everything else must only be called from process
context. This of course would be a treewide change as we'd need to
modify all GPIO calls in interrupt handlers.

I'd like to hear your ideas as this change is vital before we start
protecting gdev->chip with SRCU in all API calls.

Bart

