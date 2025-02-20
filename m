Return-Path: <linux-gpio+bounces-16296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB03A3DAEA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22854189925C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36271F8BA4;
	Thu, 20 Feb 2025 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="nrPzNydB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3F01F584A
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057009; cv=none; b=HuYiw4O/PZqO7qqbObZJjiuCYmhrolMZ2nckaNZaL6CGFKZdbzULL4uakLOuCcMvhEV4/2s5/PYcGTyWvemnu/dPZxF1MszNjSxAAtdkysBqGD/SEjz5MDs7m+NZlMfLWSEkjA1R1Rag3aFjghp6cc6tX+EEPt/vgqSPHwcRHJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057009; c=relaxed/simple;
	bh=OoFlg/wkEKxRqwkvakP/8WXxrSjDzVgjFkv67QkB3o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGJ4/kJb+nBTA2ztjx9YN7mBQVAgXhRfnbH4FK9mEJa3qNfrcz1O6PzTzhMkFdBnsgdctL7SbPJ2rIRCGMS+wpe2DjfBbD4zr/rG0F4m3pOVokJuakb+EQU7z00S6vEDlEzdja8RtT9TSPL43ONnL3FXREfOHQjbNxjMFI9/QzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=nrPzNydB; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E892B403E9
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740057001;
	bh=TDkw57RZdAj5KHZ7bxyyZ0R+TDLfczvy1Fi5CTCDaEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=nrPzNydBZgyAxzL0/e/kTK8olPL4D9S+V6/f/0xMZWN1286S0wbFjw5Ina4j0VqpD
	 hvdWuLUpid3K0j99uavJ/s6CpljCZds9mbTHN7Y1ShZXmCaKKW5bpSEOXjpCBjFYoC
	 r96f1yRtxKp7hTi4h20mRBMLpQ2iClhCVrUp8B9wKdPzf7kgYhWjXCyheh5+nQi8h0
	 fU6SFRlCbGWAo2CAPHoReSRpoJorkvxMSskUt4Iv8FxRTPwo6W+NgFSQfWTO51BfQa
	 OSeqqsj3wC+FWUTYHqKY/W7uWNwQIMdefOvBA+sH5jZjgCatqUsCPoVBxe8IDdmM/i
	 Sy5q7eHPb60gQ==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220f87a2800so30455005ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 05:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056999; x=1740661799;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDkw57RZdAj5KHZ7bxyyZ0R+TDLfczvy1Fi5CTCDaEU=;
        b=NlUehkyFtC/CO3d9gB/OiqW7oBhh5GbsVkZYt3JXZG0P1S1Z89XPD/Q8ivFKPPgksD
         WsWYYWgmY5u9CqNzpEu4izOvt+jNVs1tpaGKQ9uOKfCvYKOGF3JtQ32JZ/j975RmZpYV
         NQ1sGWokiyAyTi/5n6QElynx++o5WyWGzkdSP6XhuqsDC2TApZa2bWwRsHrNKGPlVqv0
         E1U7nJ2qhPLHNcI7G4CEIhz6T1ZQ6gPNpw9C5IX9K6Vc+wJcolW1EWUCLJFDNOqZnWTh
         8pMK3QBcbky7KGV2Hm2SafxztL8yEU/eaT0EOUfzgbP6B6JQ4us/j41oo7lv43qEQYWy
         iv4w==
X-Gm-Message-State: AOJu0YxMlR809Q3Cr1jVVspLR3mr1ssr2oLAdT8vPSsddT5nhxqkmISD
	dOyV/y2Uq1Z2i6pydEdwS7PzzZVFkLcPraetbrWWWGTcguf2JC52aB2kk+8F3U6MZaOvJo10FR6
	KUREdUWd+BChibAdNkIISOnp5c7zMBpOBujAL+rP0juYNeLfmTUKWeP54Wd4fe9VNO142PqvPv6
	I=
X-Gm-Gg: ASbGnctz9nD4rGChO44iMT9u22LycmxuVx5Tb2p2/6Ib27jwTFqfyBKQ6dI1veME79p
	W/5dj7T48SyQknp+1wULAWM6G3VU1ci1vnJiiPIahNput2IBOX7kzHezWrePKjFp9eSwUDHcyvy
	gZZki7DQY8eehKqYfPdhIC7ZFhbU9t1E+ZtOnX8riy5G2TwioFHN2CbcweFcOeTyu2tT5OQB7bU
	m2mfe35eda+6pnM2jxTWva2FzDlnGcdDoiR5+dglyzEerZm+QH0lVnZy/jkZwVst/+zF7+8wjHo
	1FfjIQw=
X-Received: by 2002:a05:6a21:6004:b0:1ee:e4f0:62a with SMTP id adf61e73a8af0-1eee4f008a3mr5085212637.20.1740056999406;
        Thu, 20 Feb 2025 05:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvByjuePrsVHk8y766/+TCh6MsNT6Fs9sPnsreg1VEb5YOiXGj9/bDc37i57PPPNYm+t+Nvw==
X-Received: by 2002:a05:6a21:6004:b0:1ee:e4f0:62a with SMTP id adf61e73a8af0-1eee4f008a3mr5085179637.20.1740056999115;
        Thu, 20 Feb 2025 05:09:59 -0800 (PST)
Received: from localhost ([240f:74:7be:1:256c:5029:b967:ebb0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb5813a687sm10818259a12.20.2025.02.20.05.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:09:58 -0800 (PST)
Date: Thu, 20 Feb 2025 22:09:55 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] gpio: sim: convert to use dev-sync-probe utilities
Message-ID: <w6qjqr2uccbli4nejka2z7dusjcyrdqklda6au7qqkesubmfgb@hspgx2zmru3p>
References: <20250218160333.605829-1-koichiro.den@canonical.com>
 <20250218160333.605829-3-koichiro.den@canonical.com>
 <CAMRc=Mc5XfcQPsw1K70ogT6Oyxhy=PJ8neHT9xA8wrZmk069eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc5XfcQPsw1K70ogT6Oyxhy=PJ8neHT9xA8wrZmk069eQ@mail.gmail.com>

On Thu, Feb 20, 2025 at 12:08:18PM GMT, Bartosz Golaszewski wrote:
> On Tue, Feb 18, 2025 at 5:04 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Update gpio-sim to use the new dev-sync-probe helper functions for
> > synchronized platform device creation, reducing code duplication.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  drivers/gpio/Kconfig    |  2 +
> >  drivers/gpio/gpio-sim.c | 84 ++++++-----------------------------------
> >  2 files changed, 14 insertions(+), 72 deletions(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 2e4c5f0a94f7..ba06f052b9ea 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1866,6 +1866,7 @@ endmenu
> >  # This symbol is selected by drivers that need synchronous fake device creation
> >  config DEV_SYNC_PROBE
> >         tristate "Utilities for synchronous fake device creation"
> > +       depends on GPIO_SIM
> 
> No, it does not. Please drop this.

I'll hide the config as you pointed out, and drop this while at it. Thanks.

> 
> >         help
> >           Common helper functions for drivers that need synchronous fake
> >           device creation.
> > @@ -1916,6 +1917,7 @@ config GPIO_SIM
> >         tristate "GPIO Simulator Module"
> >         select IRQ_SIM
> >         select CONFIGFS_FS
> > +       select DEV_SYNC_PROBE
> >         help
> >           This enables the GPIO simulator - a configfs-based GPIO testing
> >           driver.
> > diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> > index a086087ada17..d1cdea450937 100644
> > --- a/drivers/gpio/gpio-sim.c
> > +++ b/drivers/gpio/gpio-sim.c
> > @@ -10,7 +10,6 @@
> >  #include <linux/array_size.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/cleanup.h>
> > -#include <linux/completion.h>
> >  #include <linux/configfs.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> > @@ -37,6 +36,8 @@
> >  #include <linux/sysfs.h>
> >  #include <linux/types.h>
> >
> > +#include "dev-sync-probe.h"
> > +
> >  #define GPIO_SIM_NGPIO_MAX     1024
> >  #define GPIO_SIM_PROP_MAX      4 /* Max 3 properties + sentinel. */
> >  #define GPIO_SIM_NUM_ATTRS     3 /* value, pull and sentinel */
> > @@ -541,14 +542,9 @@ static struct platform_driver gpio_sim_driver = {
> >  };
> >
> >  struct gpio_sim_device {
> > +       struct dev_sync_probe_data data;
> 
> Maybe something more indicative of the purpose? probe_data? sync_probe_data?

Hm, right. I'll go with probe_data. Thanks!

> 
> Bart

