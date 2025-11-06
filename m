Return-Path: <linux-gpio+bounces-28222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 893FCC3CD50
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 18:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C126227EC
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 17:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A1634B66F;
	Thu,  6 Nov 2025 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lHhZCGPx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7149034E771
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449604; cv=none; b=KfJwrFQMFvLcGilPfoAFXMtOUX0VAH22p1/MNVqY54TBfyaCF87xdhxUqlKR+uNxF6ER7jKJSMsQrD9a2Rg6FbKG6VBpYkOf0NDrZq8EQIIOkYecvyJfQ5lxWoEUsOhLU6Pq37gQ2jet4HOwoOoTpD548TtBnHT/fNqmKf7f1oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449604; c=relaxed/simple;
	bh=cnm45OLWp3G3n5UF1avPywYBvZ4MfBRDI/6SWNbJ4qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y9HxVJEI36EdrSxzX7d5UpfAamOJ1PtwkJ3to1s5m4t5w3gi6tIyj0mBoPY/F/dEXweCjBKT88fnQja0gnYLGVUXhgDCe3ivR/ty/T0evhEAsEJIyaDk0VTAa0bTosoWrYnvRB7Hfsp/KqJ3vEDUTlim0luMy0CZDrQTIStKg+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lHhZCGPx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso1227021f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 09:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762449601; x=1763054401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF4ODf2wTRFML1B4tRmpvs9bZoB7DEQ9x1Ify504Ygo=;
        b=lHhZCGPx5wJ0XJ9EpWUNr54pzPGSjLpvkH2FM8mRxnD2olfcj0RsGyQE8JsjA6GXlT
         64pK2Rnw1u+rKx/+xiiiV/JPwZyjXdc7CikphsPHLDGCL+kbCsJnukDy0DShG+75y4iM
         FOdlhk1lYMa8/UnKQQK9vJ1OJc7gTR4qSHB3WKycy/XUzjOaLl7jACADsd5y8XsrE3ss
         7SkUzRfw/j2t1sk2YexhmLOdEEvTbDJslSguknZKHvpmHagKWy7TYnDv0FC0Uaca8MWX
         8QzzsuHPU8C16bh8I4VcymUxdx0yWP6lHDPdU375Vyp+CqhgIw5InT2VYR+7lPfV4k/S
         Xknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762449601; x=1763054401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CF4ODf2wTRFML1B4tRmpvs9bZoB7DEQ9x1Ify504Ygo=;
        b=xILCEi9Jud79q/saP1I2bsRg4z40faE90aBzwaOg+Y1RDwd3qKfd9HWslbMyqYVRBZ
         J2C1X+Ka3V1+3dPy1FF02fVohUf89hHwqG/MAUq2go3grq/TWB1moIIEMd2zQltj6dU4
         gVDnV78DerrVN454wBEBmlf6jJiKVytaL8/CLwXaxIlc/FcHO5MW9Y0zWilVxcBu6NTj
         +llgu1LvW2NqT1kpfitXZ45Rp4HnMC/3zJI3E/+3W2JQ2wD8Xo3U8D/qYJupfjqjTahd
         83jC4NqYzY4/9IC7xKZlx3Zys3qAmkprjEx963cIfShBsUZQsaTzPx9fp55QOZBVY3e3
         gxgw==
X-Forwarded-Encrypted: i=1; AJvYcCV2pK/f0YYrMcCXgDCiBgN+ZfamMyWnbmmA/9ieHEcbkwhnDI+9RKAHz5VaDfqst0LsZnICdNvSbfXX@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFMU58/Sy2lV6TjfWG9Pwwp/76wVOks1NANDdIxQRpNM9fB8b
	9YwYkUq62DyDYnFBssN78NRmLI/3FIknNq2S612VCzyliUIviT4eDRaiIRUITz8pVq8=
X-Gm-Gg: ASbGncuUOiSwzmXQ3zqYopSjohkZQ7b6w284sOaxE/ablryQzTr8IAl/JYJvB36z8pe
	wqLl03OH+0Gr7U9DPue69+3TQpeFHg1CZhBwroAf6MjO7Qj2fi/UuEVV0FnDD3805/IAz9Aq6kA
	gL95PwF7h0KT1gY9157LCy0DAM6JtmmnpuCr46ARWch3b5qp0wYgLTZfXdVJayJFaVRQnkSaSIB
	jwxc8uB3w83YVviW9Vr+hngyeR46l8Fg/uvd9GC9DnXFG27Vk+pISk1/5yl84+/R+Xz5vUPw4o4
	wh6VLvb/Wb7MKOb+Zm8HgAMMXrpqChimckhx3XZFJgCPl292CjadKEJqifKD6YpnrsFU7KN+FzS
	ATOfzFkCSQH2sC9fE4ZElqRdJJmTwFVHwOxBzsETOg4nKuJpCoYxg4/3Sh4FOe/RS8PQJ7A==
X-Google-Smtp-Source: AGHT+IGv3ddFv7Ixmi0z+24Qd5qosIPKUTQKcEJpg9ieaTfBELOhzQHfNLOSGn3SU4H3SmjfT+TvKA==
X-Received: by 2002:a05:6000:22ca:b0:429:cd3f:f43b with SMTP id ffacd0b85a97d-42adc68940bmr1528f8f.4.1762449600670;
        Thu, 06 Nov 2025 09:20:00 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677b41csm215368f8f.34.2025.11.06.09.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:20:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: (subset) [PATCH 0/4] gpio: Simplify with of_device_get_match_data()
Date: Thu,  6 Nov 2025 18:19:58 +0100
Message-ID: <176244959622.43499.14570364732284486996.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 06 Nov 2025 17:16:24 +0100, Krzysztof Kozlowski wrote:
> Few simple cleanups, not tested on the hardware.
> 
> Care has to be taken when converting of_match_data() into
> of_device_get_match_data(), because first can check arbitrary
> device_node and the latter checks device's node.  Cases here should be
> safe because of_match_data() uses 'pdev->dev.of_node'.
> 
> [...]

Applied, thanks!

[1/4] gpio: tb10x: Drop unused tb10x_set_bits() function
      https://git.kernel.org/brgl/linux/c/4436f484cb437ba28dc58b7f787a6f80a65aa5c3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

