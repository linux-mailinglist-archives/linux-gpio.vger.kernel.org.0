Return-Path: <linux-gpio+bounces-25949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC57B533B8
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45F7AAA04A0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 13:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A43C3277BA;
	Thu, 11 Sep 2025 13:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tRHrj973"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56683313531
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597245; cv=none; b=lvA9Q1yJ/R39fwjt70Mo26qxJ8L5/iBbJz92EqLoY4rowUBNWRmk0RvpxxCrnNnX7kOe70KLzwV0YW4rX1BW2NbUnSrb615H6mCpoUb48dqHzgznzkX1tz6mgiWhNkEE/SVzZfP7a4T4pR5zcjdgSFwCjDExltQk3KygZXm1m+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597245; c=relaxed/simple;
	bh=A7yKxmDExMeHFoZ5DS5kS/O/awUG1znqYvQLffqw0n0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6M5atYmBSMo3igEwD6psZGLuk/waS9CwzQSoSc0A2IO0Hiwopbb2XJFji5Ki7j+kV3j2PZEPZVWKaA2hNVtbKnDL9H2rTJDom0mFwqMyHChgTmBL7OaCjbLR78oN7c+g3JuHXpMztMUSyvztUzCWaSRaSdh+DyQvRm+b7+B9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tRHrj973; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336dc57f3f2so6499201fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757597241; x=1758202041; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DeUccbeQ/kyM8X+MjI6gjEtxWNHGIttYsHKE4be0R7E=;
        b=tRHrj973G55r4OyQWIn7hI2+n0BSnUWv57OqmDIfoBhLK1FL40cPaHiE73uh2bV4Wy
         41aqxqZx+QMhqjklcVLEmqBG38QE/c97qC6X3ptv/mmv/LFMEwNi/Whqzqa3vz1u4hao
         4OlbtV8G1ULnGjE1QyBEZwQsfDE2xPGPI7g61osmt6ISwibFpglCJB3NU6FxIEZppT+1
         bQ+/advy5gI6LNRHiW1HYSgo5ydlP2Jxz/Se4H3GihA16QS2f6UbVKQBqLPHp1/F7yMY
         rpIBF/oUpvwtxyVa3CuyEbqgdbOrXy1x0fzoGn5aC2i8E6nB78qEMB+e9IwttCUzCSFE
         TFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597241; x=1758202041;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeUccbeQ/kyM8X+MjI6gjEtxWNHGIttYsHKE4be0R7E=;
        b=s/yVJrUbMS1Zyhrqek5v2bPMZ9cFulu0aBfIq1qjs9dwkM6bne4t8jqa3dXAOmWX2G
         eAn/d3rAKWZUtM9B/nAnQGH7X0cS3iHPHGsteQdQbrVr13OuLobOomkfz11uZJauxMDC
         BH710MVnshZifrTps8p6nrNSe4dQg/CbJ5CrMJwSEhaKs3yfkKRFF/zZ/E0sUyPtKiuN
         q6oRk1TYfIvsiH5osjZBlPJ4q8CRMuGeqt006mvbI2X8g+vpTUrBAFcV7DCzgugD7buG
         TZ1Zvk0iwVZmlDTAYtEmuwgWGoctgMWlONyNaID6S99nbsJV4i1oYJ4IQpRxnFjq8yPQ
         5T9A==
X-Forwarded-Encrypted: i=1; AJvYcCX51XDPYJK/xwRCmkg0AeV/rNllz4++c0pU9BxvVkWDWJL5ZxkLzQNTv/iRU/cu8Af3ekZGcMjVCbpP@vger.kernel.org
X-Gm-Message-State: AOJu0YzMpjG9npjDdoDi1+ZAi3pxbtCXeWjsUOq17xW5QdgmtGPPNXMy
	kjjXHRHiFyHG3u0VQeVWqe0OXxmSFQ4W5P8NoLwQKn7sGHXywcSH8ZT/qlux7emFnWrJP6mfFWS
	1denVhzNNZ2xJfJ+N8ZFwqYPdkNFrMcTD1B+bwkv4GQ==
X-Gm-Gg: ASbGncsy34YD3GIdhnAIh4kboJa9B0sqw6ye5xsoUNM7lR4UIeqx9/ETU7Xq/Ez7mTU
	yYxrJXcEsAcWKrDJ/W6UTb4JuUGpl+XLS39zBtgqa6HYiIpNUY0UcqVCwBUraNNTuUoCZemWfN5
	oUIPtgR5QuyjpjZ26Z1GljhfeMjCjdRMgXK60XmBVRkDNR5sqUL03blGitNCnFctmoDgJkPoULi
	ZbqzxXUMDCWYjrKM56cKyOD7RbO6eVqyVXseH5G9Q52TSO7SA==
X-Google-Smtp-Source: AGHT+IGBB6D1hNdnllPGf95Uj3l9EU2JfY7JcduwYvVgx0oChEBeWjvr5yTav4TCpbqAhFjiHyDJdIQ3rvnvP4CkIb8=
X-Received: by 2002:a05:651c:1117:10b0:336:b4d2:6c4 with SMTP id
 38308e7fff4ca-33b520d6d1emr49059301fa.17.1757597241429; Thu, 11 Sep 2025
 06:27:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 09:27:19 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 09:27:19 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250911131832.59335-3-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911131832.59335-1-hansg@kernel.org> <20250911131832.59335-3-hansg@kernel.org>
Date: Thu, 11 Sep 2025 09:27:19 -0400
X-Gm-Features: Ac12FXwV3WssWXmZ6g0rdQcbcorV7HFa5hX2cT1C7ZyRIRy9qt885Y0faI-jmjQ
Message-ID: <CAMRc=McKOTWxu=M0S0p0Uyhod-h4mNH9QfsLsycN4vbHJPtgeQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: Add Intel USBIO GPIO driver
To: Hans de Goede <hansg@kernel.org>
Cc: Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Sep 2025 15:18:31 +0200, Hans de Goede <hansg@kernel.org> said:
> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>
> Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and
> later) Intel laptops.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Co-developed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> ---
> Changes in v5:
> - Move GPIO_USBIO Kconfig option under 'menu "USB GPIO expanders"'
>
> Changes in v4:
> - Drop include <linux/dev_printk.h>, unneeded auxiliary_set_drvdata()
>
> Changes in v3:
> - Drop (offset >= gc->ngpio) check and make usbio_gpio_get_bank_and_pin()
>   return void
> - Propagate usbio_gpio_set() ret val in usbio_gpio_direction_output()
> - Use devm_gpiochip_add_data() and drop auxiliary_driver remove() callback
>
> Changes in v2:
> - Add a config_mutex protect usbio_gpio_update_config() calls, which
>   read-modify-write banks[x].config, racing with each other
> - Adjust usbio_gpio_get() to have an int return value and propagate the
>   usbio_control_msg() return value
> - Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
> - Some small style fixes from Sakari's review

If Greg wants to take it:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

or I can take it once patch 1/3 is in an immutable branch.

I'm fine either way.

Bartosz

