Return-Path: <linux-gpio+bounces-27599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D27EC0851A
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 01:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2C73B9168
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 23:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5113630DD1C;
	Fri, 24 Oct 2025 23:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6m6IVA8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F70303A38
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 23:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761348779; cv=none; b=pjIFyuu/Z5wKLM6qt1RBKidlHaBRwU5OL3s0Cm/QUO1lnOd34dbOPfzIhAfa9WdXYPw3Kkif2ZZp9n/yBvTDlcCwE/XPL96QOrGQ7uy3rY62C7eSBp+TKShO4zn0ujFGnwE8Dko+b2Aryuobf+f9rL7jKj0wDTzW5ja/Rr9t4G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761348779; c=relaxed/simple;
	bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=YIXCqTiqxEaNm3e8srUFWpZbqthoEfCFX6L874NFjjfo1Mna9nRby/lr0QUbjYncDNWCsb/Q2VCixIiurqAhMxbIS9S15XyxU5CkVLRBa12koVKiAFTWxs8qWPJS+4ESRde8fPjb1wCxGBG6zXdJbeJmk3Y21UtfHa7Xrm7c3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6m6IVA8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47117f92e32so24232525e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 16:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761348776; x=1761953576; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
        b=g6m6IVA87/GJJD3ajlCcB5mbco1inUtXBb29ngwEz+UlyLtfO7o1SDUOt7KRPkUN3d
         xseovnqYPPnyZtl6eiSZsomtkBdydtDl6uW9JG9AsU8LLCs4DJdnTNyieJzPf+XQbxUg
         eb8kLwiusjAqiJKvOMnr6hThcKURx7oTGYgUAYpVc7Ninf/LBC2ZqCeyQPSOg7NpVHqv
         WtoShpKH3T/x9ThuF/6zDujqgusvu0Iw9SPjHJdePP7qugd/Lz7+gYcWUeupYzvd3LdH
         0fBpwgsj6eskwRr+v5bW72PZPZbzw6Nfj+ZuaHecOcTfu/Mm6s4IeckmDqyeCCWpcQw9
         lt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761348776; x=1761953576;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
        b=ZRzfxOG559A9IKvvxfrGtkmB0D+hKJB5DRBuH+K1BwoyeNBR0XuzxGrXVA/rm3eao0
         jjVeRpR6H0G0umvxBwkOXRUpUID9+Xb/7Bj8G3WDMrBVu+tKtBxHIWBvJlyldzi8a3rB
         yTR+vwanWRtg/P/cIF1NDInmPOWox0EHIKjRm8WhzdK6mugUZ0Z6RJVw1nZRN7xlXXPl
         8Pp5KwhVNvEWOfdnQPNV0lLWY4SZddyfrKdSn6Q6oxRKe5QQMdSgGnoyD7P3VByqSD6v
         Jc5hwr7FdIOXN94+fdn+QHzfOhDskt8s/2Wd38OUJSxHqQKCwfy82cxReJ7enU7LCy2L
         skRg==
X-Forwarded-Encrypted: i=1; AJvYcCXIZ+kWkHoy26V5mmYM+rVKlSeqGkhXiszcUBwL4L3bi7MgSWGllE0qcbLX7UjJOy2y7VJjFi7mmJX3@vger.kernel.org
X-Gm-Message-State: AOJu0YwsDbUJU4gmabEc7oPQtBmYIfJva20aYthDwecqlTR77GiZcF5d
	osH9hOIWJaak4/SYVHv7PYRJdly9onCl+xhIJ+OBtxR4eMi9sdqJ8xq3CO6ItKwMP3Q=
X-Gm-Gg: ASbGncuQ9YPi+rj2B3XoVas9txYDmQkLZMVm0jAgAfG8C/1nF9wQI2WZZG6Kjov+DoU
	ExjJG7jTnRUM/YseFzlyd3Jp+7ICvKFxCLtnyrJn8cTX+15Bhgb1CbrSea4/65Tpvgxep2CsdXx
	6Q6sKUxie+Sd8+hpNElwX/P9zRwzKsQE68KTc1lfw+KQCRltEgesmUAtyngdWGpLDUZneKrCwk4
	yGjeWyeeoQUI1Wr3nIpEMYTwgSK+bj8j9v0RlhMM4zNpefOhQyCoVGrtW4uWOUaG19jwJbpdNza
	+2wKDVVwAmisl6I5KYxkZsVNPO+HLH0zDy3MRtLMH0m55fYSA7mWsPSmnL1V3WK3R8yz7BxxACL
	X/RrjkUnVs7iucg6gEB5mBhyL9wpCJx8NakGFAWvwnbIUTa8iCDSHe9NazPMNsoN1TVLqFdmTDV
	dSX5hDl2mm0OJcUYM=
X-Google-Smtp-Source: AGHT+IGpS+9bXxIYVkmYN3aYKTkh9rmryEYIUIEOWTNg7RqiVEj4YoqfyQVte/UCsJWhkp/A2ApwYQ==
X-Received: by 2002:a05:600d:630a:b0:471:1b25:fa00 with SMTP id 5b1f17b1804b1-4711b25fd7cmr148300005e9.36.1761348775627;
        Fri, 24 Oct 2025 16:32:55 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7969:1fa8:db69:6159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47794asm6627875e9.1.2025.10.24.16.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 16:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 00:32:54 +0100
Message-Id: <DDQY14HJJS8U.30QSLJ4PCYJQ@linaro.org>
Subject: Re: [PATCH v2 08/10] ASoC: wsa881x: drop
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: "Kees Cook" <kees@kernel.org>, "Mika Westerberg" <westeri@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>

On Wed Oct 22, 2025 at 2:10 PM BST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver is only used on Qualcomm platforms which now select
> HAVE_SHARED_GPIOS so this flag can be dropped.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I tested the whole series on db845 RB3 board, looks ok.

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3


Thanks,
Alexey

