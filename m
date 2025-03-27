Return-Path: <linux-gpio+bounces-18050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA24A72C15
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 10:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30DD97A3F4A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 09:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D25920B7F2;
	Thu, 27 Mar 2025 09:08:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFEB15B546;
	Thu, 27 Mar 2025 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066503; cv=none; b=XUB8BcUEVRzH8cy1/y8PBADVcQ8P3lZOD9S+mhEMcWdjCqAKpckzpmLUhiqGQDEZrY/5BN1qUSClFSvbbpGR3MKX3chtE0V/ceIXes8LHBln1oI2YxaG6creQahdHtNevo+oHR69CR6VDkbxKMyqm5m0Eewzdc8PeIbeyiV0aNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066503; c=relaxed/simple;
	bh=JhCzlrQbCB9ck2kbk+MVZ/Ff1lVui0gpSCB2l+qCxvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OW1KehSCCMCJoPzDJ2rLOPv8xZJIksslMKFilp8uxTqfrnS+2ZV25HHf3uVDRGkLABK0jTAHM7Bz1Ctqvmm7ThpnA3iYdDmzzjh/HKUm0hk3Hl/oklipN/Vpj/BqYgirdW69I0zXs5OiUD+Ivn7Adgc5Flwkd42YkCSdoJ36OYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-525b44b7720so344565e0c.0;
        Thu, 27 Mar 2025 02:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066499; x=1743671299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lMrOeFxPSKQEwncRkG8y8bWLBwAZMVmj9Oxg/obSPg=;
        b=VoSEPV6nvpp7QxY9wfDlvAnl9LQYb+irUQmnNYVn3uGgE7CfQzl7M3RgBSYUnGHtdL
         eYpLHllXlYxARiXwRXYYd9+zg5+nMXI5hMBKtKFARkrZYq22WkE3N0Ra9Ak/b1/5yaN5
         nNpi4na5V7fzg/YBhejElbdxYz/39kp8E1T9a1Z/XQTGx72wX+fjcaOVRDaYQvfNfpfU
         F1/cpYP6S83KGlPhrnsDD3hNQdV3G5jfOTiHyWZBehyVFdx6dk6/e132j8DCFR3DszGr
         OYXrhwXx+Lpq27qx9lz4E135qoffC5G2vnX1wTAwFubhs5lMS6VwTt6hMQM9uBrJU5MP
         QREQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVqcA+Ngo4h5j8vzOgW1ddT7A+LkPlV9W7yvg2zTUZ2FSu4urFClPsjh3pI82BfcRVQ9EqBQW0LO4S@vger.kernel.org, AJvYcCUupZKyuiZq4k38x/JBl2sUTNXeJE6y7uy4XEmHqK1B5QqjJJdwg0E2ayWaie/X0gK5jGMoThYPkgO5K4MI@vger.kernel.org, AJvYcCVDJ3Wgja4D+sXy1srstDFYGzyl8O9T6EzEc+X4mafEiiVxLIF/lML7E74RY3XZ/0BNF+ti4zHrK5zn@vger.kernel.org, AJvYcCVG8+t3KPQ27TjqFBMnQo6QQl1T10c+seVfv6fKBuWWTm+wS2HkCGD17aD9HC4+XIgI2+Mm9nkxoQY7NZR+@vger.kernel.org, AJvYcCWKcd912KdidJNqCm9mBAwLYJAJLH+B3QnbtkYvQnbrYYGd2A1I3YelKmQndvDTqi7fqG+/HsXGPyGglH96kpVYlyg=@vger.kernel.org, AJvYcCWjCbLSG5sidJ3ETlNiiU80Pmrs21Yl+4GlYGWABVHf1xvKJ5WWV1l+aru11p+RZ7yvJhWMnjqAn3shyA==@vger.kernel.org, AJvYcCXlf/u47zf5dKZwhjpqL1GLzG59fjDDHJPVkbq4ONjftRKgmdWDkdg8dcmvzGEP+mNoldL0B0BjTaQZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5gL+j3yArBdw++5+KM/CKknCwSnfLmvT6wj7ryNWWOfkStbON
	ibwAUBCFzmBEfFmC/DvNcTZD7VTCBTz+vInTSYbD/E02tw5Tu371NsDxUSEhhZY=
X-Gm-Gg: ASbGncuW9Dr7YM9C9UYbiL1xXz1oJBK6yKCmp+TBVIDiu7mqKMZTr1CVPaqdQJTwJYa
	G7tAz4S5ge8olvobbVlBhyoNggn36zhoScaAme9B4Q0XtH6H5xqNzQKOq+1iNZkU3h1uIt0axhJ
	2dVBloJvUWUueB7xB6usbKZ5uPbxcy99rw+xsTCiV4GlyMXV4Ej5KhG6iuLf7YzAHnUX89ojoc5
	KVz99VWXkjeDn8PVrLQxaL5bRghCz6smz4YKWKR0g/DggzBYL2AMzJSXhENaDcye1S1wZyutrF0
	fR/EHwztU1+T9uy/3Kg1dJcdmRyF9huCVfmA39COTzdgzWS0SMvLHZ7B3+slUurDyoLTMrKmTzR
	RHSn8+tCZLseTckxiww==
X-Google-Smtp-Source: AGHT+IGKYrEgKh5lhHbNqW4mUXJYxsqUil2a5EUQIe8NMERdqxk2zmS5+fmR+xEfQEmOaOg9XW6RGQ==
X-Received: by 2002:a05:6122:1d48:b0:520:5a87:6708 with SMTP id 71dfb90a1353d-5260071fe18mr1854445e0c.0.1743066498983;
        Thu, 27 Mar 2025 02:08:18 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a735cddfsm2522594e0c.8.2025.03.27.02.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 02:08:17 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso364329241.1;
        Thu, 27 Mar 2025 02:08:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEgndLn+S7qmkb64GK6noeSIIkYQP3v8ZBHSKYzbexpGILNLkMFk6xJFHHxZEflY3iJLf3nfWsK/5V@vger.kernel.org, AJvYcCVIpcuPr4TQvAZQPw1uFLZE9o8P8s73VkgxbMakDjpLRh7EH0XceiouIXa+Ql4N6gcWahHhHnoawPOy@vger.kernel.org, AJvYcCVjd9Q+wEguIBMa4cnWjEGAJ6VCt+uvlKQP0HLQhcolrMmh6Y5y3V72qpfyvEfu0KzIInIuUxl6vcz7b/9p@vger.kernel.org, AJvYcCVrnHTggrB8Syxbf4Xte+O0XVPsUtKUCCeLN0qk6PodEMgEk0qZq+/9YZAg0wccPGGA3keBX5jj5zA5eA==@vger.kernel.org, AJvYcCX8wB9qtIavoaGevd/ns6cYalPyH8pJMUvK8460DCsiiSgv4ZJAsh+aiqqlgTtAU6hkgmqRG1+1A9qR@vger.kernel.org, AJvYcCXUHAYOLGC67v58tr+dibiOLIFIzxaDCcfHXxRfQIEdOeSRApt6RnZmSwbQLdcCMjsZTTqG+kVIedg9s52k+KbHUmc=@vger.kernel.org, AJvYcCXaHG9JGWDizr6pMFWTkzkgmGokAUMq+FKvQGVkzahCsoQ8yMo4xMt1KJMvUsJ3qTLSyUWZ7oDCQV/r3k6q@vger.kernel.org
X-Received: by 2002:a05:6102:4a81:b0:4bb:c4ff:5cb9 with SMTP id
 ada2fe7eead31-4c586fa8f21mr2548472137.15.1743066496881; Thu, 27 Mar 2025
 02:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org> <CAMuHMdVKfL-FRhDaFfOACV8R=ziqXdhmeW7Xd4WYXqHnSbR0ZA@mail.gmail.com>
In-Reply-To: <CAMuHMdVKfL-FRhDaFfOACV8R=ziqXdhmeW7Xd4WYXqHnSbR0ZA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Mar 2025 10:08:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5HSt5cRN8WFB5DrOZjo+Fc55X5bB6V6GzFT_Akiqdrw@mail.gmail.com>
X-Gm-Features: AQ5f1Jo3lRIg1W6_ThZ_8jOIWrU0aCRCv9UzPJYRRcdVuf2lBsxdUWR2mmZthkU
Message-ID: <CAMuHMdU5HSt5cRN8WFB5DrOZjo+Fc55X5bB6V6GzFT_Akiqdrw@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 09:55, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 27 Mar 2025 at 08:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On 26/03/2025 15:39, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Enable support for the Renesas RZ/V2N (R9A09G056) SoC in the ARM64
> > > defconfig.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index 11e7d0ad8656..c7b41f86c128 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -1483,6 +1483,7 @@ CONFIG_ARCH_R9A07G054=y
> > >  CONFIG_ARCH_R9A08G045=y
> > >  CONFIG_ARCH_R9A09G011=y
> > >  CONFIG_ARCH_R9A09G047=y
> > > +CONFIG_ARCH_R9A09G056=y
> >
> > So the pattern will keep growing and none of you will ever bother to fix
> > it, because you have your patchset to throw over the wall.
>
> Yes, the pattern will keep on growing.
> Just like the minimum kernel size will keep on growing, especially if
> you can no longer compile a kernel without support for SoCs you do not
> intend to run the kernel on.  Not everyone has GiBs of RAM to spare...

<pling! :->

/me remembers
https://lore.kernel.org/all/6323eb7a-03e9-4678-ac4f-f90052d0aace@kernel.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

