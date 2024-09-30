Return-Path: <linux-gpio+bounces-10540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA409898BE
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 03:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF3D01C210A6
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 01:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5264C69;
	Mon, 30 Sep 2024 01:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5SwvTOu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F912F41;
	Mon, 30 Sep 2024 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727658221; cv=none; b=EfPTlsGNgPg8+YdfQhRk/ilJvEuVOKO60g3XpcpfVYAullhWFkmpy0pQ+nFJ/GGm7UpYSXn/Ydfl47z/pEnYFGFac2XPy8PCF6bBSB6ZdhjK9sOEvB1G7/wIZTTOnLFuFmIGZK3K5SrcYjqp1jvPXQD+QeU7tlzammkO2j7Za0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727658221; c=relaxed/simple;
	bh=FYJvokFsFfxvZorMb9mxDOI08z4JveI00Fjl+Z7IpQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgSOE9agZQcGP+WMETT/D94T5jhhHX/2tmnCCy7/yTwdQD670MH375U4TBeolgKLNQIYbcg4rbGG3pDgWagaVUR69MB17sJlpELjp1bZw0WbM9F5KuaI2Sr6KATqjDIMp5b6O4/l4SXlPmDbSnIw/9/OjPZOujtaj+IcTTDtAFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5SwvTOu; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b84bfbdfcso2083515ad.0;
        Sun, 29 Sep 2024 18:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727658219; x=1728263019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYJvokFsFfxvZorMb9mxDOI08z4JveI00Fjl+Z7IpQg=;
        b=i5SwvTOuUZgFIlHe87opVuZGR/7q6Qd48crnMFdUkfV1NA965tCCg8rzAbI4NeIl98
         4rRmLkqJkd5c6YSx+PYX3vbGxlA9i/WcfKtRCVQS/qQIXv7csVxIBI5U23ZLL3f8r/rZ
         eq31mrh672BbBOm6SFkiE0d6Q/AIRhQgAccIWNTS6vmGccByzURWGupmhz9orCmllMe/
         n3JXRCJrSQeXRFOZrg3xyupptYU9G/f7cEo2JbrOdUwuhnOWSMZKCMUZy+Chm3tVX3bl
         PObvzK9YVLowejmBWJ0VAB3eXuR3MOjZaMTF3NpuGRFM7+R6hnMkD5elHVZcF3CwFm+x
         6M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727658219; x=1728263019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYJvokFsFfxvZorMb9mxDOI08z4JveI00Fjl+Z7IpQg=;
        b=eEIMOfXINl8Pxhaz1zDQmPzH9OvhGiUO5CitiRbje4Tvv+Ax3WatYhnqtEqDUGC2p3
         Tj+JGPRzKxaDLbWxEw0rRbvGi08gpR+B600ht6W898aQVMiLm3IYLx2+9RLTDQiJIMr+
         pYST7oxa2amhK2ULk2rV0uw6e74Z340vyXj9ispH+vGltuyeutQQyJzz0RxF+UIGobt2
         hB1JFs8vRqctW45Qt6/6DdacjNEpqmFQneFMmaioBMGdLkDN8PmDe83CJOXNrR8acg9N
         t+f3exYxbb5/YkAaygy0Tz2f2M2BsaIxXIgO/tUPX5PXIEIrORjB6rjHwNGnV1alx4Sg
         2QVw==
X-Forwarded-Encrypted: i=1; AJvYcCVU4xe6tnYgpEux43zsHn5hX6/rOMxr/Zx7FrAnAzoNNEEyWpsdVXj76b60l55l2tnuSIqvLGycmpesiuax@vger.kernel.org, AJvYcCVb5qdhFgyv5qrOc0cJX7w2UhIY2P2Nt3VxhWgURO3phoYYs2g5pQTuFD5V3U3sYC4mE+Wr17aG7HOV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz50UQFVTcWdzmQZKONI6lRK6KfL71WhScjjtiqQ0vaCc6AbLhs
	fVC6aRtwfQeaK+XAbpv+QKEpzEApaq3BezQYYHUWm2PniqTtvYZ+zLtHAZbT
X-Google-Smtp-Source: AGHT+IHBWChnPSHp0awl4ZVfXLkZ3RFXVi6tcZsYZ3cPP0tUhDJGUC7SSFxDazrTKOBxHfi6IhFseA==
X-Received: by 2002:a17:902:e801:b0:20b:1335:e173 with SMTP id d9443c01a7336-20b19bc128dmr207258315ad.4.1727658218848;
        Sun, 29 Sep 2024 18:03:38 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d6717fsm44934865ad.14.2024.09.29.18.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:03:38 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:03:34 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RFC PATCH] gpio: sysfs: make the sysfs export behavior
 consistent
Message-ID: <20240930010334.GA6286@rigel>
References: <20240927074221.9985-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927074221.9985-1-brgl@bgdev.pl>

On Fri, Sep 27, 2024 at 09:42:21AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> For drivers or board files that set gpio_chip->names, the links to the
> GPIO attribute group created on sysfs export will be named after the
> line's name set in that array. For lines that are named using device
> properties, the names pointer of the gpio_chip struct is never assigned
> so they are exported as if they're not named.
>
> The ABI documentation does not mention the former behavior and given
> that the majority of modern systems use device-tree, ACPI or other way
> of passing GPIO names using device properties - bypassing gc->names -
> it's better to make the behavior consistent by always exporting lines as
> "gpioXYZ".
>

I have no opinions on sysfs changes.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Story time:
>
> I decided to learn rust. I figured I'd best find me a project to work on
> that would involve some proper coding but wouldn't have much impact on
> anything important when I inevitably get it wrong the first few times.
>
> I decided to write a sysfs-to-libgpiod compatibility layer based on
> FUSE. Since Rust is hard, I started prototyping the thing in python
> first to at least have the logic nailed down before I tackle the rust
> part.
>

Something along these lines[1]?

Cheers,
Kent.

[1]https://dev.to/krjakbrjak/simulating-gpio-sysfs-interface-with-fuse-and-c-30ga


