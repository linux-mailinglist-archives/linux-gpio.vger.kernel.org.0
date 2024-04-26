Return-Path: <linux-gpio+bounces-5872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A97E58B2E8C
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 04:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 248EE1F230EF
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 02:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A21817CD;
	Fri, 26 Apr 2024 02:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjtFBBoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B1017C2
	for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 02:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714097247; cv=none; b=jsN4iLWGB0RQQXnHCPCSvzUdlBqfYkkimn1F/WDDncUMSHCBtooYSxNO6R4HIVSFQerldoBIxwALenX9PR4P6W9gXU4eQYYiLDwQHCPkkrKrout8zJ2KOaZB1ZLW617ecllH4OZJX6exAKvW032WhGjWoe0vPLkuOQ5ZndFhgXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714097247; c=relaxed/simple;
	bh=yzHNdT0Ftsim2CP4P7c1PGiy0Mb22PWZhkTdD8ovDMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGHfMniXHucKXeLO6W2OGJ3Eak7qJoyC9ssaPL0IMcLmDDwL7BfFstKtYod+rqBA/VtPIYBDlV6MRgVEqcwHe+8e86BbLwa2m2lRXiTCg10vonCv7JSycEsZmPMCnjPteqOSpiOwjZstE5STimtpDN+/CsJjSYs45PgieYsLVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjtFBBoJ; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c70999ff96so1131667b6e.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 19:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714097244; x=1714702044; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RpcfRp5jB0ibscFOZ8m6yqO22YjmZpxX91uDLhRMWzY=;
        b=fjtFBBoJ3e6GB66UNPRlu6oiEAFaSNMYLf9Cfa4G7YRppnPQ5QaEGxYQ3xGNYDHXLS
         yWmTOefxFh1zPiGdOZp6TYpZN/zDq3VvHTuExixBUWgxY1qe58IcaLCNhKiCEnmdSrhO
         y9VBvW8zhDFhNSBIi+jT0VMEK6Lpopnng2Hl7qPrsX04LoXECOw+Axv7XkAU7ftVeDRS
         dWT7ElUDKFGSo17QoOP1KROMUh0BRXgLpRKIGngxv/q27Ko6TAr2LuOIiZPX6+eb1/3h
         tWI3wDKEoQ3/7bKs1Y8e2S1kLRPS0NHyRxTGbsHC6TKiz6ZICCxna0zWo4rGOkGBRQAL
         jQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714097244; x=1714702044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpcfRp5jB0ibscFOZ8m6yqO22YjmZpxX91uDLhRMWzY=;
        b=fdLibYgvV6oIXbqKTOIO3RW7O6yKkRvCPBnkMlQlWPeibkyfLnnMMay2sChxyif8WM
         GeeWIqIgwET3Xy6K9H1Q6ChnaunZg1pmaRLQIrELaMcs53XLKNF7GuSVMUxbHyFIz4pG
         N0vdzTLNu3pM1hvriVXYtkCrdyGR2HHI2K4HTGt3omQv0yvyLTKFWL+du/btrRwoNQEw
         F0Iy1xI3XYeznS6JujFOsgMjGMJ7X4QaFwFJ47irgxkDNJF3fqyEcgi1sVEmfNq0ePKs
         qkd7kP9m8TTnAqNqgzmqn47XECBhLAEMyy5Pt+xFsp4F+IjlAesbYvaRH8LhY6vlm6qn
         NN8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuBOw/vMMYxatNrkO9ENQG18U7jE7x7a2AgPGuLEV67Prneefs7C1sHGy/06n7MMmJHWG1OfKCqBa7SwjmMnE7o5ajcccEV3O1yg==
X-Gm-Message-State: AOJu0YzdChKIIe6baXR4gJ1GSNTNsc2uS7kWm+5ZSRmabPKq3/gse0t7
	57Ba9YAT8YjTkWc2H/bZ6FRrnLgT4lac/dEqO/NcxOI63zOgFZwf8rS7BA==
X-Google-Smtp-Source: AGHT+IGV+6t8nBSAPlYF0QRqJBilyKON81KfD9JjGEA+PzY2IQUXLhtdV0/byFXLMUoHW6xQnDirDA==
X-Received: by 2002:a05:6808:3a88:b0:3c5:e81a:b5b6 with SMTP id fb8-20020a0568083a8800b003c5e81ab5b6mr1280256oib.59.1714097244602;
        Thu, 25 Apr 2024 19:07:24 -0700 (PDT)
Received: from rigel (14-200-166-65.static.tpgi.com.au. [14.200.166.65])
        by smtp.gmail.com with ESMTPSA id ey14-20020a056a0038ce00b006f27e986e84sm9550426pfb.158.2024.04.25.19.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 19:07:24 -0700 (PDT)
Date: Fri, 26 Apr 2024 10:07:20 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Gilles BULOZ <gilles.buloz@kontron.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [questions] : gpiolib and gpioset behaviour
Message-ID: <20240426020720.GA9777@rigel>
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
 <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
 <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>

On Mon, Apr 22, 2024 at 06:49:05PM +0200, Gilles BULOZ wrote:
> On Mon, Apr 22, 2024 at 3:55 PM Bartosz Golaszewski wrote :
> > On Mon, Apr 22, 2024 at 2:44 PM Gilles BULOZ <gilles.buloz@kontron.com> wrote:
> >>
> >> Hi Bartosz,
> >>
> >> Several years after our discussions about GPIOs, some things are still unclear
> >> to me.
> >>
> >> 1 - The gpioset command has this in its help : "Note: the state of a GPIO line
> >> controlled over the character device reverts to default when the last process
> >> referencing the file descriptor representing the device file exits. This means
> >> that it's wrong to run gpioset, have it exit and expect the line to continue
> >> being driven high or low. It may happen if given pin is floating but it must
> >> be interpreted as undefined behavior." But up to now I've never seen such
> >> behaviour and I'm glad to have the GPIO set by gpioset keep their state once
> >> the command exits. Is reverting to default an optional behaviour in the GPIO
> >> chip driver, or in the gpiolib stack ?
> >>
> >
> > This behavior is driver-specific. Meaning: you're in-kernel GPIO
> > driver may actually retain the state.
> >
>
> Which method should the driver implement to restore the state on GPIO when the
> last process referencing the character device exits ?
>
> >> 2 - I've recently wrote a GPIO driver for an I2C FPGA design having ~112 GPIOs
> >> and wanted to use get_multiple() and set_multiple to have more efficent
> >> accesses, but realized that the line number was limited to 63 because of the
> >> unsigned long mask/bits. But I've noticed that working on a line number >= 64
> >> was unexpectedly calling these methods with a mask at 0 instead of calling
> >> get/set methods, and that the only way to have things working was to not
> >> define get_multiple/set_multiple but only get/set. Is it the expected
> >> behaviour ?
> >> At the end I've split the GPIOs into two banks (first with 64 and second with
> >> 48 GPIOs) to be able to use get_multiple/set_multiple.
> >>
> >
> > Please use libgpiod v2. That won't help you with the max requested
> > line limit but at least it's more modern API and actively developed.
> >
>

I suspect you are referring to gpiolib here - the mask in gc->get_multiple()
being unsigned long*.

The uAPI that libgpiod uses is limited to 64 lines per request, but that is
only relevant if you want to request more than 64 lines at once from userspace
(you would have to break that into two requests to access all 112 lines).

Note that the mask in gc->get_multiple() is unsigned long*, so it is a
pointer to an array of unsigned long.  Its width is not limited by
unsigned long, but by the bits parameter.  In your case the mask you pass
should contain multiple unsigned longs to achieve 112 bits.
Refer to gpiod_get_array_value_complex() for an example of building bitmap
masks to pass to gc->get_multiple(), in that case via
gpio_chip_get_multiple().

> OK
>
> >> 3 - Is there some way to request a GPIO already owned by another process as
> >> input or output, just to get the current level on the input or the level
> >> driven on output ? This would be much more efficient for real-time
> >> applications than asking the owner such information.
> >>
> >
> > Ha! Please help me help you. Take a look at the DBus daemon I recently
> > posted[1]. With the daemon running, the behavior will be exactly what
> > you expect. You'll be able to get/set values and have the command-line
> > tool exit while the daemon retains the state.
> >
>
> I was thinking about some specific "watcher" ioctl to do so, not a DBus
> daemon because this is not welcome in the real-time and embedded world.
> The only workaround I've found is to directly read the GPIO chip registers
> but this is bad to do so.
>

No there isn't, and I can't say I'm a fan of using GPIOs as shared memory,
though it does seems to be a common use case for those accustomed to accessing
hardware registers directly.

I would question whether "much more efficient" is true, as going through all
the gpiolib machinery, including the device driver, to perform the get could
even turn out to be slower than some IPC options - such as actual shared
memory.

Cheers,
Kent.

