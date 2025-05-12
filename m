Return-Path: <linux-gpio+bounces-19923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CCAB33E6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 11:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 100B67A41B2
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 09:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F095F25A63D;
	Mon, 12 May 2025 09:42:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550A32E645;
	Mon, 12 May 2025 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042943; cv=none; b=tYI7B6GFyH0MKd3bmaBZBG3KfVcGu8Xke1cPu+GeBXsYx+w26bFu36QiOJysqA65bC835quNlkStd0+bnJ3zfLsC+htheHsGh5OSfMLnCyafiiE9sk2lhMgcjnwaHQEpbParao2SMPqiyjWJnP5wNlBLCU8fmk1gu/M+NrxmbA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042943; c=relaxed/simple;
	bh=hLrvNZ8i+JktglQb7ZFqPXFRMH1hMkoqvVZhP0Ghm7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsreLTyB0w9AxAQsyWIbKlrQQ6296padS86a60lcc+Bfsf0bMDHr2y3eMoc3aga1Ln1Ky5Y5Qi9/pto8e0if/x7Bt1bvAGyRRBmUEzSDB3SnfLr+GGfTTCA1O6QXKOIIUIYshMYhtr/fyU/DxiBuyhzE3OGGd5B2KLncvCtI1Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso3652083e0c.3;
        Mon, 12 May 2025 02:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042940; x=1747647740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxaXUnTJQ9X/sSRmLTkqCU/OLmyikEnIJW6UNmEyAnw=;
        b=uefM0nyasF+jE/+ARnvu40JYaRzXf4XG9iwsNoRdIAUh9ZyQDZyU38AhLOoIboYf8K
         0FgAi4l6LTEcre44+x2tlFA7vU1Mb/erXS9VopiTwoqZg4mu4XlU3injepuhcb+8KMEP
         Wh8TvbBBqaH/AD0ih7NMFiBS7iNQJK6vQJTKvHPfE20SfooHF8giczsCXrnJdlOK6iWh
         fpCJ0pP0FqQ+RijrLV6sO7Ysh2dtjcXBfQDXrbBbFb43m2Y1LsA7mX2Idc0rDRC5b9oi
         RzMPGx0FTU+aR9Fm73GJ8ATuePtxIKSnM5KenoqMWQV0uR4IUqGa1qVK9HDB8/HTgadr
         Gnow==
X-Forwarded-Encrypted: i=1; AJvYcCXP1c9X6xGboTOUVUUS7In7UEwJip+WmY1vDyFgjuKibohSUMRIFClJnvLltmSYzoE5XJZMv/iEXokGHRNB@vger.kernel.org, AJvYcCXizEBHKf5Hkui9s1kSco2g9hoTAAtkhiAiROHsEwpGOZTAWaYDaplpwhC/hBGK4b9YJpxdtmEd@vger.kernel.org, AJvYcCXv+LidbnVYex8Cq+4mQbodPj6NncvERbYpMKKjHvszxW0mWRuchOsg4CKvn9kDjizpF70+1xObMQG/@vger.kernel.org
X-Gm-Message-State: AOJu0YwwLAn2m+F12rlIEt5KPRjJSlOMZqB9kDC1ot380mdKTk56qARq
	J0SQJ1Ocx+PyURPcY7T9ZI1LKvgXu4K9NPs4Jl9RYtxTOeOBq9aOnQnP+bKO
X-Gm-Gg: ASbGncuuQRlFO1x/XnItnw9OY2dnCtcByXCeP2s0JlEq/+Wg2sIChYwY9ALaKz4A99t
	WANLn4k8uc6VWxafvjyG7d5YgXJRLqEjvUtk53sYhf81t9VZC5JZmL9VnhW9Tr4VNTpftM5gbhl
	KVAbApKMqkUZ4aaarcvrbkjn/7LQsadHF4rL5rMEmQ2ycNkGsQTYi6Ul88/Y5CJgm3WL0QURRSj
	w8KJfcxj3RniQyq85ikSMVU9vPY0TPAxWFSr0LI/yQxZ3ETXtYMp9/QibeXMDAoAji3JpLxWohG
	8Ouob08kru+NdrsGre3RSgJkkqdLJLbEdxeeyQTdqL75VP/TkdtdjOXZa82lW1pNpD/wq0X4bBW
	6h/YtTdJ5Wkv8A3OwI5WDWp50
X-Google-Smtp-Source: AGHT+IEadcD6TXY2NzIdfqdmxG92rAujjPc1OiAwO2m5KMF/ewl/ia24KEYQDcrmivkMAL5dVWaXvA==
X-Received: by 2002:a05:6122:17aa:b0:523:e2bd:b937 with SMTP id 71dfb90a1353d-52c53ba78a5mr8343001e0c.3.1747042939721;
        Mon, 12 May 2025 02:42:19 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f603551dsm4864872241.0.2025.05.12.02.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 02:42:19 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso3048338241.1;
        Mon, 12 May 2025 02:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIjC570aWR63LwozpR/DFQu8KSWJoTF9TX2B4VMkiyQyiHp7IuS81UIp8p3/9mpuwRlZZxhsO/@vger.kernel.org, AJvYcCW6NeTwAVBnDFnpjdNOgANyFpkr3AhZ0G+YfYN2rnr/bUD2rG8OW5ZnK8rOva3Ya0OYPaXB0yFqOrP/9gh6@vger.kernel.org, AJvYcCXLz8i6WwGEgIuIf6LIIEPK3a6/YgSdp9ikmDN9A11wO+j5K1VusSsdY+dOVKsYh5GMR5iMEwGVWQtp@vger.kernel.org
X-Received: by 2002:a05:6102:8082:b0:4da:e6e1:c343 with SMTP id
 ada2fe7eead31-4deed3ec6f2mr10435052137.23.1747042938966; Mon, 12 May 2025
 02:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509141828.57851-1-francesco@dolcini.it> <CAMuHMdXqRpuy8gsz+0a0xTp6VWfMD0=WWdS84jWvF31O9i4MZw@mail.gmail.com>
 <aCG-DZI4fexZGy2H@smile.fi.intel.com> <10caddc8-7dc1-4579-9edb-4514efa540cd@gmail.com>
In-Reply-To: <10caddc8-7dc1-4579-9edb-4514efa540cd@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 11:42:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUL0vd16C6=pr8UQV3+t2E0fJLqgtUWgm908VEsCYkyiw@mail.gmail.com>
X-Gm-Features: AX0GCFsYAjhVktfUQcp6VZbHccrljkdyDEuNs8jjvL7H95OWlSLpFlXPvZyNCqk
Message-ID: <CAMuHMdUL0vd16C6=pr8UQV3+t2E0fJLqgtUWgm908VEsCYkyiw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: fix IRQ storm on system wake up
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Francesco Dolcini <francesco@dolcini.it>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, 
	stable@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"

Hi Emanuele,

On Mon, 12 May 2025 at 11:38, Emanuele Ghidoli
<ghidoliemanuele@gmail.com> wrote:
> On 12/05/2025 11:23, Andy Shevchenko wrote:
> > On Mon, May 12, 2025 at 11:17:48AM +0200, Geert Uytterhoeven wrote:
> >> On Fri, 9 May 2025 at 16:18, Francesco Dolcini <francesco@dolcini.it> wrote:
> >>> An irq can be disabled with disable_irq() and still wake the system as
> >>> long as the irq has wake enabled, so the wake-up functionality is
> >>> preserved.
> >
> > ...
> >
> >> While this does not cause the regression seen on Salvator-XS with
> >> the earlier approach[1], I expect this will break using a GPIO as a
> >> wake-up source?
> >
> > Good point! Have this code been checked for that kind of scenarios?
> >
> >> [1] https://lore.kernel.org/linux-gpio/CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com
> >
> Yes, I tested this specific scenario with its GPIOs as wake-up sources, and it
> worked as expected. I already included the note in the commit message.

Sorry, I missed that.

Then I have no objections from my side.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

