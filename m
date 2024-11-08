Return-Path: <linux-gpio+bounces-12704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF029C180C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A41284368
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537631DF993;
	Fri,  8 Nov 2024 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UQdrQq09"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC31D356C
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054827; cv=none; b=lya7gE+Qli3CiKJXuw6hPXbQqeq0+3/j2HGyDmUdo1BlGKOFEFI4pzHtXLvRsZmeEisvwa3GDsspyXu3pskwV5mf98lgw2+awabqoadKUmXpOuMb+br1MyLtYsRjT7CWKWXTeXWREFTe0wmzL4rVC9U6Oo4A4ySHCyqsyuHM2kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054827; c=relaxed/simple;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4X6pv0jg91TxM0usuoTDxtWQ5uGzdLIvUi+7YwnSInJ6h+9yyhgR6WXdNmcwVTS4iE1Tm/z130SiImpVp27eSefjGMCKql2/tbhD5LWxDj9pHohmjp9n5Ii9ZemIkPMsA/ODGUhhVqsHwqMNp7Ht9N1j9cBFFVyz0fwsM68qmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UQdrQq09; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso27449971fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054822; x=1731659622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=UQdrQq09sJOLoisSqnk98aZyQUCU2WzUB8ZQ17v20xSmMXVoWPuqIZKLTBoIlWhar1
         sa5NrDuDLMhSI5FPEWQYfnuhTVKfEhjqdeW1YPG816v4lSbhF5agcqnFVKzzObmHjeR1
         XHE56xsiE0xhZpoLrU5I4UIUFPlP7IpBzFFkWyQtyODlu7TFxp/YQZTwlR608J5gwm06
         QALVRLQh/ebWrHrepOsNTRmv1B1MCJAF4RzOPkbEqCWOWhsUToIo2DHnFM14n5AD5+z3
         ooNd9BUg5qQAEWxghZcOpE4VU78z7dFanWF8Bz6KR+DZ4+3ZDmtCgCYcC3gWutze9Ggw
         ANsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054822; x=1731659622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=OYD+8oMaaEuoKDWaNKhb79A48yUrwvIzGN66nXe6iWd2TLXPF92E+H3FyCQGoF+a5t
         TUpTyCtFhftyiGj1k+1AjV6+TAWt7HG5Jslv3042YlUU5D+ug4NlBj7/XMW5HiR9Esva
         wbVDQNxCbzp3OH1lG8a5Qr5ZayyhDz+5Vj/WX3pWr6GS59aVKO35uHOCfAIeKiBlb3wM
         dQcAdz5tfApLseqXjCY8lkvNa9zYkBNMwnr6KH+I0yQLNZUSZcdLHGXb27xr1RXxlukD
         H68dxNP/cwhOu+KERxX2clXbFNyF2ml+Q4PtwwBDS0p+tyRYPmP4m8lKQ4iSS408R/7z
         +s+w==
X-Forwarded-Encrypted: i=1; AJvYcCW91TgrCT6qw2AiT4/kFQdD3U/Zi04JxZ43YWGM+gAHSq9xUXz2TQOQRBb6+Xqz1xi57dN3jqgXBo4i@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGSgQu8ZSf1NGRoOwEQils61abUqTehYia4LgtNgNKa38rUvK
	Nt1P3SIINC3Nwx7Z9KJcWqloT1OlyvtCKpUuM1/nHF8ufbbX7c+UqHB1OL8DXrm56O6DVgkuFVw
	8maxv9O/V53/SSpRxjpChMrmBg5fbFCeol/3hjQ==
X-Google-Smtp-Source: AGHT+IFyr+pHYPoU9m0KAAV5TzGf7UWj3G1xJPS3/nNGmi70pN4W31YM52rF43tSYPY2jobLCKLiVuwMjSY+Mo67UYc=
X-Received: by 2002:a2e:a9a4:0:b0:2fb:63b5:c0bc with SMTP id
 38308e7fff4ca-2ff20162837mr14265851fa.3.1731054822269; Fri, 08 Nov 2024
 00:33:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:33:30 +0100
Message-ID: <CACRpkdb251gJhbcoh9ewqh=TLjTgWA9ZKRAXc6dopjRHDrCVOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

