Return-Path: <linux-gpio+bounces-26570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE80B9DE94
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 09:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC6A3168E88
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 07:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BC7242917;
	Thu, 25 Sep 2025 07:48:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B9F1B0F11
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758786513; cv=none; b=Tp1QiB2Z1A49ztIPrkpoM3IBV7qa1QkuoXaXdmm95JsTvAGx8fQqSniMsvnbc6GBH8AcoOVb1zKqRJyhuQHl6UnMnAseFbfr3sl5/qh1ByhBGs6sHyjknfz/h/WxgPSKEaq7BR4FPGkF9ELKUZcnTq7PTz26T+o297TrazSQW0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758786513; c=relaxed/simple;
	bh=8MOOlgpt3OudDO28qQr2MAUrM06asLJeVuzzvJ7Tovs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGyMy/y7ukoN9XkhaK2VxtGFbPfVY0UGyJZZIIsjIwbNg8wvW2+W6Q3UmsPwfAU543UjUP52M9pgoMeNbEjGRoT+qA+2yAQ9cD7wySc9X9B+TJgELoTQhDc6ycAjylk632xEPfs4n7TBw0OBb7OeDqyw3jix9JhOZMM6OdApFTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-90dd3b43f8eso278880241.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 00:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786510; x=1759391310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fvGyyGJ8hFx3nYrMkZDfGE5Winq5taN5wWeFI0QZNc=;
        b=IhlhPD9emeAtALvEevl/mRfSrtHr2BTCCplL3dipASFjHy1Dau69L7M9400iiK4CPf
         q+V0OAUFdRNyeU5Nt6qmP3lu6oDQRWCCBFCy431s4yY7SBcCxurWJQRJeAlWEUH1Vrby
         b4mum3RSNXlyzL7454AMRv5Q+l1p4lh8HdShNviV5JfsZWQs9CwKldZz8sdR/JXZBUbg
         7L8chXVCqbwiwN5KLjSUSZeLjqUek7sUZcZJ4YDFL+EDGFZijs+TwE9VX6C4BrczeHe3
         UAf28uywVnJmFNRUIEce2tN4/ipWH2k3q5YhlJEcmeZ7AF/FPcVLZ0NfoQE6esVAPGcV
         W34g==
X-Forwarded-Encrypted: i=1; AJvYcCXnHblpoTPdGJ/2z9seGQZLaKtiHgfO5eHxKSLYK+fIfBadCdQF0UnG0AdAdyj9zTNt5ostMRchE1HM@vger.kernel.org
X-Gm-Message-State: AOJu0YzcPKVI1dKcnOUKMV/GAtPE145HdsaDTfQ6PD0NTCThiuxMssac
	mZfVAA2CrOQoY3lBwF8TdeoBhk5vYG/vQsgR1+/OP/nUFbuIxdc++qZCJroxSx06
X-Gm-Gg: ASbGncuJ1BKsZg23iv/tCMbHTKRSCCkSMwzdMcNgtKnCP4EbG9yA3HaCHp25GiE080b
	1WU3coTEfH2NDnQOsfdkarsuPCkKPxOkJZe7t/K63M4dUh7W6QhDuBKPL/SHGE71XNu7y+VREtY
	6yxCkBX0KOGbJYXwxtrvmG2r3yWGvkuuHkhw3cvd4JlghrJVjkGwKhXRTxAaiH7gACwM8Src/1D
	zLnxT9x2ZVjDqlsZlzdRzY4r1R83PDtbbX+OdcUNnqTzuV3jD6ysuqQ6wfORV2Dm8JWl7cwOPHn
	AOx3JvcDPq3aHDsk7flet4NIxsSB0ZD3gKDMzgSKx2guvaCFwE1Pb3nIqGZS/d4rOiWcpOE4CTn
	XPM7xzVpmvE1bALgLlO2+WC6mlKTHhrOSs6Sj3wp2QHfBzeMa2oJMN9ewSUBC
X-Google-Smtp-Source: AGHT+IFA0BOB3Nk/vcLgs40KmMeZ1hhncsqocIxj7FXUu0u0HrUV/FFJqWXuobobU1qjoWtkuTF/jw==
X-Received: by 2002:a05:6122:46a1:b0:549:f04a:6ea8 with SMTP id 71dfb90a1353d-54bea2c71a1mr954595e0c.9.1758786509926;
        Thu, 25 Sep 2025 00:48:29 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed881ea0sm255493e0c.1.2025.09.25.00.48.29
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 00:48:29 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-59dff155dc6so428354137.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 00:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVS+3OSyagUCNo7Cfp+byagXli9NVi0QVqNV8CwZkePf/i7JCweB1YvPKNmu9RNTk0Z8p/BWI/zSP/q@vger.kernel.org
X-Received: by 2002:a05:6102:510d:b0:529:fc9e:84a0 with SMTP id
 ada2fe7eead31-5acd36bc5d5mr955558137.32.1758786509499; Thu, 25 Sep 2025
 00:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 09:48:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
X-Gm-Features: AS18NWAlEwAE5FC0AW6Wq0ip31mrrj6gmcRezsp6GMYcQa-YSc4N16xdaxhcVw8
Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.

Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
use more common syntax for compound literals") in pinctrl/for-next

> Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

Looks like you (slightly) missed your target. The correct link is:

    Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

