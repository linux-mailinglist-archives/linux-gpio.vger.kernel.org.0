Return-Path: <linux-gpio+bounces-15939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C167A34C79
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0620B163B9E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 17:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1279923A9BD;
	Thu, 13 Feb 2025 17:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gow7KwF1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C3623A9B0
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469242; cv=none; b=XzeApNCC3vHzO5zwuSeo/KFWDRG05p//o1jYKISI4SdXSefJZjE3hsJ+Ogno0NUrCTdfXHU+zYnAblUujhVH5Ji+t9v5gb43+m3Kgecpra95acw43JEeSJJ8xXYukjX3g7TA/8c9vAgQErib7/ye6JEKOrYUKElcooy3aplRVI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469242; c=relaxed/simple;
	bh=+269OY7EaDipCh3onm8DEanHmFliIp3h0+vp7uAa798=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etizmcgzu/Kmg7E1ejKckYB3zYcwmK6DrLF2GXwIYUWzXVMD0ELCBAHwMfNz2QlU8LrS1YUMz2ujXmBfiBDOid0AGXOSPeBD6xVtBovOCVJOyj0nPqUfvffrRKgtedDXEoFaPeo4RXZF2lWmhrQeyVk5T5VgCrzlWnDC7QP/Sho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gow7KwF1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43965592e1bso5760035e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 09:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739469239; x=1740074039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AASLEmG4hHg23vluDlbgkllPBBiNPcd+6WwxQkkx/88=;
        b=Gow7KwF14bVZsUVIKSxUfucaZlTh3/avUJbZxPcZ84lO2c/rvAfKMIwgn2SI3NCDY+
         9fWo7FivfdU2cn4NhMWh3nHQSigqTk8abG7BSqFjW0CnXmxq0Kmn610sifpm5Z5xt9GW
         YpZBc1yUrAFPXYZtCCcAK21xueVj8/kadhj9nhqhBpAb471WCp8CnZkjBuGoL71EvVpG
         oQdnfQJFIekNYqTuj/Oy84APLTHWhWxUyQ6WvJW3VJCzE/AHP9C5g+8ltknTjDfadQL/
         5w7s9aGPNIgfPIKwF+i+VnwO52NZwk8iEkvSuTYUqfP1bWTJjqPXlA3e+JxKlqqsTyHn
         SGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469239; x=1740074039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AASLEmG4hHg23vluDlbgkllPBBiNPcd+6WwxQkkx/88=;
        b=B+/oQm++DhWvtCBaBrmO6z9v9G/Pd+KjUxF7E2GT8fnrjOnJ/+4gmgRBI/Uo31FvKb
         fGt5yOCMOiyD8nqWE2YZTAMvCXyiplww/MCCzs8WA5+NT7K3NEaZ9aKMWY9/zR/lFRnn
         Cl8X5xfMQC8AbZxW3aKvnhCQwO/WSt7aQ6VCcgQFySzfzX5FYNga8NLDutlwHHSBUvla
         wvvtcFLXEsQJuE1vxvq/Anzrurm1+mJp1ckpI2LBcdA1UznoHleACFIGK9p2ISM91ro7
         +9EOjEvHK+J14DYf1gqdu1zEpnjfMkw9PrLMM6Wxk1eEcazGGu8TmBFuf784RT1AOrho
         eg+w==
X-Forwarded-Encrypted: i=1; AJvYcCV22N279cGsB58WM4t6IB85VaXmr/7Be1LA7e3x1/ubWfGXEz+qF4Gbz7eh/PjiuKvO+xK0jn3HvFsL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7x8+6/3gKYWu6z8N6vfchHu2XU/4GYcPE53Hv2bmZiKE/LQVj
	Bt/xh14M2m/Ny/MlJr8x7qfdPkggxF7DXqdOOx/rmHUkjtA0i//TFgd3Yqq1wuvvcDIdhjR/l1K
	sxew=
X-Gm-Gg: ASbGnctXWVLc3cD+9T2rCxWNReEPt6sF5+9PLAgD68/qXKYxh0n5gPic6FMzjORfQlE
	s/vLlj0hsyo9Q4Wy6tHR40dZuncSs6vRom2VDUlcSWXAZ4hAWIII6MsiQQa/wTy91E5cFjInWwK
	SD/BjnsIfRPkMK+ebM82geTS269eB/DU/IZZMASYHRW7MqRYY+k/zsjGioa9dL8OotIXUXRpY/U
	yKNQNwCNeXi6QaFEYUpgwdQh7WKow/DjZuxW7xfyVGDhOs1zcYpMbdBPh318/zIqffj/a0P1T6q
	6jdV855uiq4UXgA=
X-Google-Smtp-Source: AGHT+IG42/S+tsvaljYDR6/SRyicTAxV4SHDiyz2AP6YClUGY82Q4xoEFmMDivThTYJ91m0TxC66AA==
X-Received: by 2002:a05:600c:1d9b:b0:439:60ef:ce88 with SMTP id 5b1f17b1804b1-43960efd0aemr43983675e9.23.1739469239541;
        Thu, 13 Feb 2025 09:53:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:affc:1fb5:fa08:10e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04ee48sm55390325e9.3.2025.02.13.09.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:53:59 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set
Date: Thu, 13 Feb 2025 18:53:57 +0100
Message-ID: <173946923528.103541.37570270811887464.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250207140640.57664-1-brgl@bgdev.pl>
References: <20250207140640.57664-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 07 Feb 2025 15:06:40 +0100, Bartosz Golaszewski wrote:
> During the locking rework in GPIOLIB, we omitted one important use-case,
> namely: setting and getting values for GPIO descriptor arrays with
> array_info present.
> 
> This patch does two things: first it makes struct gpio_array store the
> address of the underlying GPIO device and not chip. Next: it protects
> the chip with SRCU from removal in gpiod_get_array_value_complex() and
> gpiod_set_array_value_complex().
> 
> [...]

Applied, thanks!

[1/1] gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set
      commit: e47a75fb5b139233bdbb889995edda4dffc3f0f7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

