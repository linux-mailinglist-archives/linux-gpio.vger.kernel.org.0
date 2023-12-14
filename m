Return-Path: <linux-gpio+bounces-1455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE826812FFE
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 13:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4163EB21854
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 12:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80ABD41779;
	Thu, 14 Dec 2023 12:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2SPUgaQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E4F118
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 04:26:36 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7cb3f1d1ff4so326452241.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 04:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702556795; x=1703161595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2Q8hlZ64NbmJ0/ekFmh7A+/wN3OLdaYsRhF1/tMxRs=;
        b=2SPUgaQFC9IWe+1lIiZoD+/02se25m2NtbGisXy4ym64j7aJt0KsWzfa4iKEKq4o9k
         4yXM+znMqYhYQWDCFXoLU54RpaPnuCaEVJUX+iwcSWFyt2yNvyrn9MsKAIIlwxq8ParK
         ahIP7qXNa9pKO9a50i+/ibXSV9lK21SxDlwm5/subM9JiwOAnRwDrYPc05kkJErISQzn
         JcOJbGJx+6gmZrNQFdMtgvP6IAAINbhUBnm38t9iSBLkChn3kV1XwSd17HcdEBywOHKg
         4bTS6tsh2ruy8vL3uI6AUd932nMGMWg2ZOpH8AGVBabuzuDLnLSb3We+nSCCct8YYcPZ
         lsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702556795; x=1703161595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2Q8hlZ64NbmJ0/ekFmh7A+/wN3OLdaYsRhF1/tMxRs=;
        b=FVwSWwjIqmQ58D+zdgfKXa9RGF/4raBel2fRtDoKynq9h4dejXdGMmmyWLO3OC68FR
         90eDMo/IT3wINxMpt6qzYF7CCef+Nq4tOWnVJbKYtKOvj1nZ7Gy+URXIXRjj3BNhYG8s
         X0v4BSpPeMcznCRvs/QeHRBihtZyPgMLowNB55s0q4yLJ2kNC9vC13NbeM12xQG/CepZ
         6gYe+QncWLxUCcTtN2Vj15+08X9oqU+S0kWzatRbJdV/JX4s5CdpVY5uP6Ug1EWpXlhc
         EyaT4WJlvFKTLEXm4WnHBfhrA3/YleCxbq784YXKRftfo+RnxE7FrLJdHKFtHBVnga9p
         11Cg==
X-Gm-Message-State: AOJu0YzOgFkd5P0JpRnM/aYd4xQz/KyAq/h1WfnvqclSzoVbNdfLmEtL
	JZNqeKRE1BTwqwwjQDX875M+L9sdDbx+ic+h+fO+6A==
X-Google-Smtp-Source: AGHT+IFJnd3NWdiALNpof+UgNDsWh0lKMJt0WRqf4oRVtEa5JqmD+fdi95HGY5hitlPjecpCFXm/yCAIBJ43ZrsRK9c=
X-Received: by 2002:a05:6102:3f14:b0:466:255a:69fe with SMTP id
 k20-20020a0561023f1400b00466255a69femr6746510vsv.35.1702556795153; Thu, 14
 Dec 2023 04:26:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208102020.36390-1-brgl@bgdev.pl> <20231208102020.36390-3-brgl@bgdev.pl>
In-Reply-To: <20231208102020.36390-3-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Dec 2023 13:26:24 +0100
Message-ID: <CAMRc=MfV7uf-K-+aGN8QWrGBDjvvtcsimWDTXEBZMHXrmFiSgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: use a mutex to protect the list of GPIO devices
To: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 11:20=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The global list of GPIO devices is never modified or accessed from
> atomic context so it's fine to protect it using a mutex. Add a new
> global lock dedicated to the gpio_devices list and use it whenever
> accessing or modifying it.
>
> While at it: fold the sysfs registering of existing devices into
> gpiolib.c and make gpio_devices static within its compilation unit.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If there are no objections, I'll apply it tomorrow.

Bart

