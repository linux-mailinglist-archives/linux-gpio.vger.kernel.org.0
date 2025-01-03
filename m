Return-Path: <linux-gpio+bounces-14445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EED69A002C5
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 03:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56AE3A3330
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 02:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96AE020DF4;
	Fri,  3 Jan 2025 02:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="dkud3B1M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8B4A18
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 02:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735871795; cv=none; b=DhfRObestWZZbkQ6iH0BmBbjidcLd695MkLyQLcV2WKuTsjaI+GGCO1Kk2ZmL80UF803McjE0Owh94a5QlPeHIiU6vXaw4DKnrveALcthl7U2vTv2HnF/8sb3ACjo7cWC2gPf3byL3lh6ewE8FKhag+CuifBCNIGJtbsB6BVUws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735871795; c=relaxed/simple;
	bh=QwX8YH8bBIaj+ut+gIGjOf/lcBXklOFpcVo+5HJSXsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkJYKH5tga3jdwl7Gtn/P2q8ZQcoh7kYVkFk0Z3ize9bthesye6g0B+YarX81Gqf3g2Plo4iYcgrsKt2/MPBJHj+iKX1Dw3XTtptKdrNsbs+0qS97aAiu9i7Tp6uqkFbCFiLihoJXx6LLRcq8OtbN3PmVDgm5ZyAXVTmCKwI/YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=dkud3B1M; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B423140FAA
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 02:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735871380;
	bh=zz/JSQidwbTqwO1GLGEZFwrEmayDopEyOFIbfrZtZ2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=dkud3B1M6AH+p+rqMb002dCAvlThbuOh1ScppuyW6uzDKbnZjVeD4nIRcaltC1Zpw
	 VkepmnhZ9seJiPNUx57IMBbG9CSQdbQdLYVyGbUhCwcj0CJial9wIgBbhynx8E6dCQ
	 Zx1uvGAWqRl5cwLQhhrocLHmk1UwgXXPydyCLjO0KXI62yVurhFlMFWYxNNgwBY+CY
	 hLxZTKB9rEZCt3539oE0m36K/DZFD50dXSdalZYTgnTn/R0uyTwJsrTkza1nan1xSt
	 MbYkEjTlc57YSUtAfLWpYTJC9vv8kIZHaHosdhNV/QW4tB8SicClqC+P9E27TxFHg6
	 9Lbsjq3BQW/gg==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef909597d9so24571961a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 18:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735871379; x=1736476179;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zz/JSQidwbTqwO1GLGEZFwrEmayDopEyOFIbfrZtZ2M=;
        b=ZluvwkmeV24H8cXPY+wyBEfSaJevPlkM5owys9snMTOoGjWSvB7+PUTgS9myelaNxW
         DHZ2aWLKQ8pXcmIKticlX3Q05a3Ak++eIS1bzcOsJn8OMeLqFnepYZbNstyau6QyiOjB
         /wgeQQ2TulepTT7IPz7HRDjwE7KGVImcQs74FaGE7z6MG/Ac3a1BhBhGezKvGxZPC9Bj
         cdMXVLv/SIN2XOvozOpMAar1jIHpTRdER3G1ZhJ7Yc+15wOH5SM2dGlDippNE9xGB9QD
         gG/UFSaEODB9AuilNZIFHhYRY02fraJIuXjXMBcA6t94k5KUadwUH3mgtLziCYoRsS3Y
         aung==
X-Gm-Message-State: AOJu0YyVeVfntg9rZonifmPJtBfmaproO314h2zyuNLX5LooXSNg2r5g
	Yuvw3Im5tE6mSxO7J5iTIL+y5+rQDA4SVjH6iIItZHk0DKr8w4td8EBozOd+Nya1dBImqeIzftf
	emQhSW5JkTWMw7MaX4KjfWonhpaxu7ZSDU3hF2UZrejQ2UV7lES79J/+fzOpjGwCNhzTuW3Ci+x
	Y=
X-Gm-Gg: ASbGncugxjxqUFcyWM2GLYhbseQHy+5nkb02upG1CHrJjl20UEbd7QZ6bLLHr6u1ZCQ
	8vgwTOHkBoHV3qy4ttGeKAxGmN4Dg7eBq5Zf/RWe5Bh2VJuJJ7PYLW41WRKDwER6xtMXmeIu9p6
	rVUVrYkn14aWWwMPrmRPUx1gZ+seADXT9pQRzQ/SPo9ctIRSAFjIbNTR0TNPwLtXbxgCnyfNOFH
	uaWXeDegMEvIUMs0GsfJU14sWYgJsswSw13TjX4UeYr2pvZbmrrsbvRR/4=
X-Received: by 2002:a17:90b:540f:b0:2ee:6db1:21d3 with SMTP id 98e67ed59e1d1-2f452ec922bmr66048127a91.25.1735871378915;
        Thu, 02 Jan 2025 18:29:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb7yhmNRoJLMT2FsymMJwbrYVUrBwOEgn8byEvtNnhZvIYQuntnv5XasF5j8OAeN3Y2Z1GPA==
X-Received: by 2002:a17:90b:540f:b0:2ee:6db1:21d3 with SMTP id 98e67ed59e1d1-2f452ec922bmr66048115a91.25.1735871378545;
        Thu, 02 Jan 2025 18:29:38 -0800 (PST)
Received: from localhost ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9650bcsm235914645ad.39.2025.01.02.18.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 18:29:38 -0800 (PST)
Date: Fri, 3 Jan 2025 11:29:36 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] gpio: virtuser: fix missing lookup table cleanup on
 probe failure
Message-ID: <s7y4v374dah2vjr7tv5eefaqolic6m5ns2d7qh2b272klhrlg6@scxsa625ylf5>
References: <20241224060819.1492472-1-koichiro.den@canonical.com>
 <20241224060819.1492472-2-koichiro.den@canonical.com>
 <CAMRc=McjLeSfHMaAtj_P0kd2thOVZjrGTSZsDWZX2Oir+8DN_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McjLeSfHMaAtj_P0kd2thOVZjrGTSZsDWZX2Oir+8DN_w@mail.gmail.com>

On Thu, Jan 02, 2025 at 01:56:34PM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 24, 2024 at 7:08 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > When a virtuser device is created via configfs and the probe fails due
> > to an incorrect lookup table, the table is not removed. This prevents
> > subsequent probe attempts from succeeding, even if the issue is
> > corrected, unless the device is released.
> >
> > Ensure the lookup table is removed whenever the probe fails.
> >
> > Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  drivers/gpio/gpio-virtuser.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> > index 91b6352c957c..a81e15a4b807 100644
> > --- a/drivers/gpio/gpio-virtuser.c
> > +++ b/drivers/gpio/gpio-virtuser.c
> > @@ -1509,6 +1509,7 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
> >         if (!dev->driver_bound) {
> >                 platform_device_unregister(pdev);
> >                 fwnode_remove_software_node(swnode);
> > +               gpiod_remove_lookup_table(dev->lookup_table);
> >                 return -ENXIO;
> >         }
> >
> > --
> > 2.43.0
> >
> 
> Good catch! Don't we need to do the same if the call to
> platform_device_register_full() fails?

You're absolutely right. I also realized that I need to kfree the
lookup_table.
Thanks for the review! I'll fix this and send v2 shortly.

-Koichiro

> 
> Bart

