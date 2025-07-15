Return-Path: <linux-gpio+bounces-23280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C4B053D8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 09:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BE65188C297
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 07:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01002727F2;
	Tue, 15 Jul 2025 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EAIcc9Ep"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B607E26C396
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566191; cv=none; b=ed/aa1dmXsZUBaFd7YqiDQ46XBU2FfBBZCP8wnOyySQDxQqOjBH0+pd51+0n1OpynAi89os3O19/0BSMBmuUo4q0vViYMrxmto9kc7XEvcKzuFzDoxbbV6p5TmxP3WoQiaGYCtsg23CZRfSX7bZzTNxgZPltEAi6GOJRlZH9TXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566191; c=relaxed/simple;
	bh=N/FMbc6s37XpEkcxxQCQNEHSQ3ylwzn4pnGF9Oc7RBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SOzqxLeqXMcHrq5Ah9DF4QQwcjAXCHodUVhlpLsc/JgHD84C7Y2iZPKLgJ5NJw67UVC/m5sVA/YQYJfbwoi/PmpaPLLdS9UJfgOMhE7NPsHnfDqxgyM2eYGXZCZDqFFH4umM3yN4Ms63XL9S1UJf8FqEsDnQcbUKurjskdw+s4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EAIcc9Ep; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-455b002833bso11791785e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752566188; x=1753170988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDB8Yocyi1CHyFjahKv89dOXx4slR/SlVFPSQTYj81Q=;
        b=EAIcc9Ep1y1oJ3KFFhLDCDdABludSu4Lh0VzEGqwwoADllBmxr26l/n7YrBNZF9SJy
         ULmNOH1/AvrkPHZwiZk249O5nd3tmaRPa8doGCF4obtf7cQzbHEUCHYfS6fqpgkYFRxn
         +5jCqFvk2tI6l11o/8qTQfLwYCDg3dsYTncQuODGifk7GC1p5PnnCREgWwdNYQ/DAVyR
         P+OJzzcyaDH19ZkMiXJ96MIj0cG/2qsYIy2ZSePw4/i0ApfSAGNmw0iZy1mexfFwBzEK
         ra/jxCtjYDrChbWK234gDIQk17iduq46r0M+cNBO85kof0sFXR50dJ1olvy7eeWHNN/e
         4JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566188; x=1753170988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDB8Yocyi1CHyFjahKv89dOXx4slR/SlVFPSQTYj81Q=;
        b=RAxOn4Uf4le/pkleziSeZs7Pst50jZu4kIMBgd8IBd9U5748BQhQhtod/xcUKgywc7
         SJfYRr9wttxP1+lzsclnwj2F3wHF6cf3T6HyDeI/qNYEecWqgA8GD8jR0X1VZLXk8zhH
         y5EyCRdTH2BMJq+pvSEEymsQ+miNTby1sMd2PQOmMp9VKPXbD8G9OHYzT81iou8s5u7d
         dgHp+cA0+UY+paIfMEVWsPW9o2+UcJ/hDwmo9LEBNheknziT5QbblXhcYym35TGIUZCK
         q79VdLILVULX5PMDoIE6qUHvZfSrZhePLVJS4pLrqA+0DtjPx0BHG4RUEzqnEMyAiyXD
         L8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA0kAisK57QKWXNnIE8AJbmzdTGim0oI3Hy/LRdzffrRU3cZhrWf6ciB9u4OIdN1nV7yWZf/60H6vp@vger.kernel.org
X-Gm-Message-State: AOJu0YzncHiG4y63o8eCXRnfmJBw2UPBjR+esgnug+vbeopLgTDXvS0v
	iWNUpVtMDcMpVFf0v+iUOJIq1SdEGXy0iQZlr2GkXN/L4G9dbB2NbT7Lja2uEVeP6EM=
X-Gm-Gg: ASbGnctGoTqVUbSI094r3DBUmkw9sAgnhOYjl2LdRr98hBYc1kStTwhqeVmR0G1e9xC
	ie9/JdvXZ5G6V+KmGgsMq9h5q4vil2eDV6ycahM1zkTutbBL5dO0DWiJ+sDT9gPa4Q+zLOdVYt1
	GRhZQTWPdV17jQTVIpPz0rzltX+eF4/MT7wXkhof2ffoxwaj7BjLF4BL4Z32lZd0m6w/EfJLlCX
	qnhKyJMmpUUlEVaJ8FpFsl/ZlWQ7zrRW85Uy5ESehkfR0W05K+rE5E/+RSBGv0p+xWs37hyRjIa
	f3keJ/fGdN01TH0lKV2CUiPCsbIGGeVf9KbFsSr1BU5ztknZqUcyebRzxgpxtEL9ECfgdkaEUUV
	t+R4JuOe5fS91s1V0b+aBZg==
X-Google-Smtp-Source: AGHT+IH/xgSlj6fv7LIl+NxN0W8/80B7umwBFaGWTraOqNYcXsjCpGDdeLcR4qsgIzlLlWYliTyPCQ==
X-Received: by 2002:a05:600c:3b84:b0:456:1efa:8fe9 with SMTP id 5b1f17b1804b1-456272d254fmr17208765e9.2.1752566187780;
        Tue, 15 Jul 2025 00:56:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5631:db97:f06d:3c45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455ef31717dsm118630535e9.6.2025.07.15.00.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:56:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Nandor Han <nandor.han@ge.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 00/19] gpio: use new GPIO line value setter callbacks in remaining drivers
Date: Tue, 15 Jul 2025 09:56:25 +0200
Message-ID: <175256615060.11708.15247893367426426465.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 09 Jul 2025 08:41:37 +0200, Bartosz Golaszewski wrote:
> Alright, there are a few left so let's get this done.
> 
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts the remaining GPIO drivers.
> 
> [...]

I queued the ones where there were no comments and will send an updated
conversion for gpio-wcove with comments from Andy addressed.

[01/19] gpio: vx855: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/db12cdc8224845bbe31c1d7e5e7d2c2dde4847dc
[02/19] gpio: wcd934x: check the return value of regmap_update_bits()
        https://git.kernel.org/brgl/linux/c/ff0f0d7c6587e38c308be9905e36f86e98fb9c1f
[03/19] gpio: wcd934x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/637c3054e9a5337d303577584d575c247138dae9
[05/19] gpio: winbond: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/dd94adf7da36281b5d1bc40ee8ac265082576f4c
[06/19] gpio: wm831x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/023a24f83edf9abe0fbb66929d286cec5a09afbb
[07/19] gpio: wm8350: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f7a680e9c2e512f903c385ed1a71732389788aa0
[08/19] gpio: wm8994: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/47b427311d959fd3235485c08f367cd14df282ab
[09/19] gpio: xgene: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0933fc87f31da17871d6cf255dd9a3de86658685
[10/19] gpio: xilinx: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/1919ea19a4ff8d534fb2789453a69f86f70a493b
[11/19] gpio: xlp: drop unneeded ngpio checks
        https://git.kernel.org/brgl/linux/c/c719fd3e3991b16460babf70036bf39cdbbb7a90
[12/19] gpio: xlp: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/6d0f71cd58aaf107dab3ea5a50e9f725d4691043
[13/19] gpio: xra1403: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ae8bcae8487293cb1de201734ab4779a2438618a
[14/19] gpio: xtensa: remove unneeded .set() callback
        https://git.kernel.org/brgl/linux/c/735ddc67ab88d35378cb79cfa5ac5f87db0775fb
[15/19] gpio: xtensa: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/383a02f6d421bf7703703aeb3e7270426b2fc30c
[16/19] gpio: zevio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ee6e05eb5fe27a45678848fb92a2a5db6b3fea84
[17/19] gpio: zynq: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/815c9769ba0e2e184eac570e596391a1ca58b8c8
[18/19] gpio: zynqmp-modepin: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/680450b358b73823c82d150330aacc52e286be08
[19/19] gpio: zynqmp-modepin: set line value in .direction_output()
        https://git.kernel.org/brgl/linux/c/e70513bd98e3912b431b196e3cf53ac821598e6a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

