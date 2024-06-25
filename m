Return-Path: <linux-gpio+bounces-7674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE61916593
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 12:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5079E1C215D5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 10:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC8114A4D9;
	Tue, 25 Jun 2024 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akDnX15E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2EC53370
	for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719312829; cv=none; b=aoggMTRexN7/KFNuowB4QNJlp5Y9bQBVzuXoCXYtcx31n8x5tWaIXmLd1+CL/gM6AP4rZABmTrpnihBcQhr/9VDeJVEwPCOQnNrJLpth5Rxsh4wx+Gfbh2V89Cr1aYPcppjphw8UhBVFqOBk9aX2RY6vqEVPrHpi5ecP0W5puIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719312829; c=relaxed/simple;
	bh=84WbEGo0ImuCOJvJXtBAI2ONtFQyQyP6YI87Rbvg7pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gy6U5h1FPmdFfVW0RbbPymBwNdjyYRyyZS23Hu1JjE27EJ7Cwr/xSHJJzMjyFb/hzm5Zuon6JQO/2mVUHxEcnL6ej911a1yFYeW0NYuDxE3HcS+zjjH7kO6CZyFYnJlUGwlUMUH9O2WblOGOY6LEah1zhsYWrQX5DvQvZbpyZWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akDnX15E; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f9b523a15cso38308825ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 03:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719312828; x=1719917628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+YBG7Vhob+y+6zAwAhtOxqwgJt1NUm1R9Um1yjv3wJk=;
        b=akDnX15EbNXnioReTikdB37MOhKyRxF57FXoixA7rQ7ubDZQ8YsN/iNQ6g1C2mbTwx
         ge40+RaJ/NGQagya1P7k1rk2iK2qZdmT88+JNB/v+97GBzuqzWTVH6m0gzliuGzziz5U
         uXtvrQfEEz5lta4jDTsi4X8tlXTGpMqUso6qK4a92TBXltUMvgy2xKVKXxtpKerTyOHs
         8muHq4j/oWzOOOt8G7xh6SfYRCRQaDUwqUpvbnM7lMO/E3vs4I17AanxN3chX6vW36R9
         tmO9/+YxMAN6bA0AhAvR8V0t8bdUffHqMfl6BNL90My/p5D8oUceKmfD9OKqMpP0rKR+
         UXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719312828; x=1719917628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YBG7Vhob+y+6zAwAhtOxqwgJt1NUm1R9Um1yjv3wJk=;
        b=pTW9thGkY0TpdykZoF0AwI4UX7NLCYKWdMyA/alqxPZe7tj/OWNWY3guNtIo7uEjAI
         fEINspWFy8B3qoRLEO9QpBCAE6ZWPIceVxkLeTdmQQIaEVknMomWmNbruEr29e3+PVHR
         VhVU6mBR2DN6ixYfVS5BP7E/uo9N40V646KR/33pXawDskbbT6Ji1YH9+smOv5RLC6tS
         batxHx1HCDgw1LD8dFXNv3nIGLSn5WeA1Y0x9DEdk9t6ENfifriUX8NakTV4hw40HJOT
         l3Hn3Z2swgqjkgR9VyBT6wIoPXGWaBgNLi7ZmJl5tDUrXSFNKVxibKj2a4zHlXVXyXjC
         WfoQ==
X-Gm-Message-State: AOJu0YxNByozX4a3V9gafh+dnXbgSfcolmpMs4BozMatKyV5r/4Ob15N
	6R10l6v7z9AbZ9eDBZn+QGuf4Tu0S5HPoxxChOWSnNgQpFa3FgPH
X-Google-Smtp-Source: AGHT+IF6Bx1PGU415WJdxSNpK4iKgtWRTRI/a9JLRtx0az0mMsjKT/rfYk8A6ZHd0BsRFYeAoY3YsQ==
X-Received: by 2002:a17:902:dac7:b0:1f8:3d2d:d9ae with SMTP id d9443c01a7336-1fa5e69a989mr44856375ad.18.1719312827568;
        Tue, 25 Jun 2024 03:53:47 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb32463csm78713245ad.92.2024.06.25.03.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:53:47 -0700 (PDT)
Date: Tue, 25 Jun 2024 18:53:42 +0800
From: Kent Gibson <warthog618@gmail.com>
To: chuang+git@melty.land
Cc: linux-gpio@vger.kernel.org, Chuang Zhu <git@chuang.cz>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod][PATCH] bindings: python: fix LineRequest.set_value
 only works for the last entry
Message-ID: <20240625105342.GA71664@rigel>
References: <20240625011522.1470733-1-chuang+git@melty.land>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625011522.1470733-1-chuang+git@melty.land>

On Tue, Jun 25, 2024 at 09:15:22AM +0800, chuang+git@melty.land wrote:
> From: Chuang Zhu <git@chuang.cz>
>
> When multiple entries are requested using line names in
> Chip.request_lines, only the the last entry is added to
> LineRequest._name_map, causing a ValueError when trying to use
> LineRequest.set_value on any former entries.
>
> >>> import gpiod
> >>> lr = gpiod.Chip('/dev/gpiochip0').request_lines(
> ...     config={
> ...         'LINE0': gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT,
> ...                                     output_value=gpiod.line.Value.INACTIVE),
> ...         'LINE2': gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT, active_low=True,
> ...                                     output_value=gpiod.line.Value.ACTIVE),
> ...     }
> ... )
> >>> lr._name_map
> {'LINE2': 2}
> >>> lr.set_value('LINE0', gpiod.line.Value.ACTIVE)
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File ".../gpiod/line_request.py", line 126, in set_value
>     self.set_values({line: value})
>   File ".../gpiod/line_request.py", line 138, in set_values
>     mapped = {
>              ^
>   File ".../gpiod/line_request.py", line 139, in <dictcomp>
>     self._name_map[line] if self._check_line_name(line) else line: values[line]
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File ".../gpiod/line_request.py", line 82, in _check_line_name
>     raise ValueError("unknown line name: {}".format(line))
> ValueError: unknown line name: LINE0
>

Rather than including example code and the error, put this, or similar, in a
test case to both demonstrate the problem and the correctness of the fix.

And, as well as describing the problem, you should describe what the fix
is that you have implemented.

The change itself looks ok to me.

Cheers,
Kent.

> Signed-off-by: Chuang Zhu <git@chuang.cz>
> ---
>  bindings/python/gpiod/chip.py | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
> index b3d8e61..ce77d27 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -279,11 +279,12 @@ class Chip:
>          else:
>              mapped_output_values = None
>
> +        offsets = list()
> +        name_map = dict()
> +        offset_map = dict()
> +        global_output_values = list()
> +
>          for lines, settings in config.items():
> -            offsets = list()
> -            name_map = dict()
> -            offset_map = dict()
> -            global_output_values = list()
>
>              if isinstance(lines, int) or isinstance(lines, str):
>                  lines = (lines,)
> --
> 2.44.0
>

