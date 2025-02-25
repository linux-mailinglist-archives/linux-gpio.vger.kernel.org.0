Return-Path: <linux-gpio+bounces-16581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD4A44A4F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 19:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97B9C188B8FD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 18:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6638017B418;
	Tue, 25 Feb 2025 18:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAweMjQ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08881C84C8
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507920; cv=none; b=QsodnwNwSU3u0OH3EAwcGTW15t8tifW4G6vI2lk3ndPH06zP1JZkVGOa1Rk1oIFM18qNF6L6m0PSmIN2tVuBxTHTfI0OIrVsAhoBP+jqFL+6sGOzatjaZ819RVhlr3rtvZnWhuHZwm0Jk8Og5ieqGmPfCeKFd7ZSPBBpL2E2zOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507920; c=relaxed/simple;
	bh=RPMinrcewbWSFzvKzFkCx96B8wqsf87LcBRIynpZJQ0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=fTykkgl6RLNGqQGQkk3qAySm8s+vcbLLgko5OsvEJrO3gE5FIrOPzrmFL1v67D9jQaz4s5LKq2+r4+hy/SG4JkmBeuMleETmtXAVRd6q+qtpT0cJ3VOwrjzAJWGOeN5mVZwpR1cMptdETZz8yKmiZkxcptrijxTgEnWcJx/Dt3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAweMjQ2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-221057b6ac4so115314115ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740507918; x=1741112718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqCPW7j6F9XVC6VBp6QdxnBfBGPyuHKxrntWntP6Kdk=;
        b=hAweMjQ27vHmgUSa3QxDT/RLavg+mMWLXYbbMr4kCTG5SgbZGyMbJXY4zvVBAhGHrU
         smt0JkhR3D1rWuvdCK2uJYgoyYOWAkE1EUk5JSOgMlC9r7P1voJ5PIQgc0PGML4sVrbn
         Be9S1ySrfagcJAMZwCjctcvWdNX1MWeIxFvvLaLmoT/Yhxds8vXpIRhEZ5vo3Hauxo2l
         lsyfgvJo7z8IvApt1vuHe/ajYPO+jLbQoHAegPWbLbX4BnhGwjyxKS7zP3ILOyYMk8kK
         xV58Qzh7DTM+AV3khZy35FIDZ7i7GxmWVzanI9ojw9YhIR8BM2hs3lEg441JmHPvrg0B
         QS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740507918; x=1741112718;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqCPW7j6F9XVC6VBp6QdxnBfBGPyuHKxrntWntP6Kdk=;
        b=QCpql5qUFgwsPIJEqRnqCoqehKZRr4a+F0NwzTklIy6wniFB6w9EJMM+GELnZxYJo7
         631ub0COOLF4r6A1mAdGbTUi3xPE3jCHkFkF1eD+iMaIOlKby0/soti8DWDZ3vod5eGS
         bo7+m/EiXRk56VhjxJfFTKkC2DuwJ54+jpkQpLbsqEpRbrWIJyJuqzefQsdq67/E34OV
         5L4khujHhT8hFtcS/rxwAcy6BIYB7UeEFhkQ0C7tW9wJjMkkavTp5b9dOpF/mVBNA7uv
         8Bm522cf15VJHXo396pxKWyiI7wnwV9vMvbFeNKBnM6zoqoZAFkJGZI6d2C1OajPChYA
         lLKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxSQncQ3Ws1whWR7wwMy4ErecNHP9XUtDz2m4iuj4MzEzE6LrP+Kjh9ju+N9nvcfemLuIOjHBlw2Lu@vger.kernel.org
X-Gm-Message-State: AOJu0YxEde6wUqQL3BUti6YZxAETOS6g5Nw2Pfi9lUzmCyVUCoe7l6xf
	g61EkICEOTcvbk96B8j7f3zk/Dz39FVpkTRi2ojDtIMxU6tRVt2DGQikwnjx
X-Gm-Gg: ASbGncuToW6fZUZmg+pTgFBHGYrq1bNfh/npeF9zZQotzkAS4ATbLh+1fiRsRaHYfaX
	LneGg1ARnZ0GyYlAK5G2AcsLG7PnToPKhJm2kXV+B4gWD7nwSWqe5ZZ1x9rRpXE8WUyLrbt5Olc
	mORlLOlUcyrHOf/NaUyL0qFne9+mNIddL7Dw55cF/3qDYDli15dVnaOi8rEnTFaYRV2ZGzZpOyj
	7SJ6ipiFNzuOMe8Z6k3AbAZkLrSUcGRzlo9FvPC/0t69Mua9W7dNrBf7mQwrc+YdMgmmLYlIy0o
	weDslLYfgnLOKLwG0CDe/cx/xJK1FGo/pJL2kQ==
X-Google-Smtp-Source: AGHT+IExUjDQlsJAZIVkcFxltmVn+miTGQCMhPjUZ+vYgo2XY7RbBtupbLbhcnArCOcvqrXzAbLRDg==
X-Received: by 2002:a05:6a00:805:b0:730:9446:4d8a with SMTP id d2e1a72fcca58-73426d701efmr32987140b3a.16.1740507917574;
        Tue, 25 Feb 2025 10:25:17 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aeda8181c5bsm1692645a12.36.2025.02.25.10.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 10:25:17 -0800 (PST)
Message-ID: <6c53bc06-34d1-4ac3-be12-f29d4e5031f8@gmail.com>
Date: Tue, 25 Feb 2025 23:55:12 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: geert@linux-m68k.org
Cc: a.fatoum@pengutronix.de, brgl@bgdev.pl, jlu@pengutronix.de,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org, marex@denx.de,
 warthog618@gmail.com
References: <CAMuHMdVxZab5X4HyKj2d_21WohKfpFrsnRYYjx9X1ys22xCvLA@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
Content-Language: en-US
From: Ayush Singh <ayushsingh1325@gmail.com>
In-Reply-To: <CAMuHMdVxZab5X4HyKj2d_21WohKfpFrsnRYYjx9X1ys22xCvLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Ah, the dreaded userspace GPIO drivers...

> Please point them to my ELCE2020 presentation "Gadgets and Trinkets,
> The Upstream Linux Way"
> https://elinux.org/ELC_Europe_2020_Presentations#Day_1_Presentations

> Gr{oetje,eeting}s,

>                        Geert


One of the reasons of the prevalence of userspace drivers (and probably
the reason why kernel drivers for stuff like motors are not attractive)
is the lack of upstream solution for runtime devicetree overlays. It is
simply not attractive to have tutorials or examples that will require a
reboot to work. And since a lot of people will start with those examples,
they will continue using userspace drivers for their future projects.

Connectors is also a problem that has been stuck for a while (although
things seem to have started progressing).

I personally, would love if I could use kernel drivers instead of
userspace drivers since they are probably much better quality than
random userspace drivers, and will not require any external deps
(as long as they provide a good sysfs API). But I also dread
having to ask a user to reboot the system to get their blinky
example working, and reboot again, since they used the wrong
pin in the overlay.


Best Regards,
Ayush Singh


