Return-Path: <linux-gpio+bounces-27683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76545C0E2AE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 14:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4F424F81AB
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3ED302772;
	Mon, 27 Oct 2025 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="voCyTgSO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B142DF14A
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572898; cv=none; b=ragnIWenqEr34WVHRuaSm6DE2ehQ+eiR1HX19XAhaS6n8lnQw7hOaVh5AHSjMWCDca3T+ws0d+TfNhhfbMTGELk8cvYdQR07ng8tVRQAdrOuiCXQKAwH4th8gykNxezlCfM1hS8Vy9N666DoH/jDG28AbRD9WDByNadKxqtOSng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572898; c=relaxed/simple;
	bh=U0JtqnxtncEX4onOzRy4Hm/hiyMwJ50VlV7u6zYWNEI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c91RqnKJ/aJ0qHvtlpR+hBIILwujV7ATzAaE+xLK0scGepoWG3OQ65sM5i/yKxogcSvMt9qDf3ZMY9dotTsxDOLockjfRkRySw55OuPqLvI9JtW5aWbgL93NW7BWoIjfNjZtpAOF6yX05cUeuQpIBdtcQDqCW71QJpLJ8a8HGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=voCyTgSO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47117f92e32so41689595e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761572891; x=1762177691; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RzAesypNTPMugraK7XXwIYSosV2Bew+BMi5GpBBgGmo=;
        b=voCyTgSOvSRJ+zNFuo+xv6ZgQOGQfNiYDMMoC98igmVRInG1Uj5aqB4fLxoE6A9S5S
         pWVTpBVzehEwOtGsQVMnYa+mZNM9/mdG+ynhxeXgNmUUQdLm5p5py/0scZSePo8+j01a
         TxfCRmholhMy6zIoDr3swtGaydey8HMXdNQC+J+3fWvBvWOWBK2zrKuV7ShFqOztOdAF
         oREYM/IHFQEjtY34CYvbWsSWl/5wjWlDkvZwtPCVLEAJlkM9Yi97I1Jb9MNiM7t37c8l
         Q8TgMJ0LWqbniMGA9MRnRCf8crJLRVwszpT5xpDxQYp0akBWiO9MhPjRCFT3trfedzP9
         xTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572891; x=1762177691;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzAesypNTPMugraK7XXwIYSosV2Bew+BMi5GpBBgGmo=;
        b=CLcRKNS/9HL++d1o4NHPu6PdDAeiKF27JaV1F5jYpgHO40CUefJV/JxJR9tlCwL2Ba
         1E5fWMgT0rOIOV6vtOzjwro+1J23K8xfTf/jiJ9BXf88eAevF5TVZXSUvnZ8Xg5ZCfrv
         Er9E4rQgfcrqNki5FHKNA7mDWoyb6N2SNvkTo2rR+sNWi7jK5NwXy8RQVwg2KgSLsNkt
         q4KL0m6eiXW0JGsGmhK8hAR9U4gTwHmRX6RpiOHZxmyrcIDkuoyPgbOQeAG8W5iSCHIO
         Rru2Rl95iSehAKtNtzYvB54woltC2JH1wdnUmit6/k58jCWaCjccHc25Tz0zIdyASHX4
         aB0Q==
X-Gm-Message-State: AOJu0Yxb+OeAXqatHmBYjy/15y4oe0vZpn94vp0ymBKSVlmTzrCbBEC3
	1D+BD00GT5InwZLqsXtYoo30DKJ4dPEOM1IZYRNPMY1AlUByod4tgqORlfQ4gMAPAOs=
X-Gm-Gg: ASbGncsxo8lCjBqgcN0WHZcjfTkjPuBnwFix/SVKE5j4N+8uFFGCOB8A8ECyuDV49zL
	u0oXaEyMGI861f/jwPO0dJpaAZy/P83HrHvN4HTIZxsIFbwPzAf5BKXyvMSUUDKxjnX3YVnqx2+
	JNtoy7L1GwoQUkjIjohI6l6HEZIbhAPOFNPf1ZHTO8NdRbfvazrMRalT75TdUAMmAViBM3RpgdF
	NHD1WkKSz0mNKXUp6QYH/W5Y0CRzoComPeX9FcUj34Uvpl+9HhoCG06L0qhV6HT0fqGnSINgaWt
	GEmw3iUpUrhT705ap05hhX/3kSXnGtwceQVlpvNLKD808fo8BLzJPXqVq0b2hbVzhtSyo4sFL8T
	RKFugWpIPF/82mOXly/o0QKrNCPL5zDfW0/MPVgMqO+RKgS9UVUSOONwhOI1avzRjDo2EHaPM2d
	UeJ6iqXA==
X-Google-Smtp-Source: AGHT+IG/5Pq2rLhHw/tIky8ys6co6EXR9zSlto+XbPaEqb8hJVQ9Q7NYKXTkS4/CDOj2H1jGjmFujg==
X-Received: by 2002:a05:600c:3b8d:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-4711791c8d3mr298674945e9.30.1761572890905;
        Mon, 27 Oct 2025 06:48:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db964sm14483390f8f.33.2025.10.27.06.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:48:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] gpio: mmio: further refactoring
Date: Mon, 27 Oct 2025 14:48:01 +0100
Message-Id: <20251027-gpio-mmio-refactor-v1-0-b0de7cd5a4b9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABF4/2gC/x2MQQqAIBBFryKzTlChzK4SLaQmm0UqGhFId29o8
 +Dx+L9BxUJYYRINCt5UKUUW3QlYDx8DStrYwSjTa2WsDJmSPE9Gwd2vVyoSlUVUo3eDc8DDzIW
 e/3Re3vcDLgpv1mQAAAA=
X-Change-ID: 20251027-gpio-mmio-refactor-e07ee08a9699
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=683;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=U0JtqnxtncEX4onOzRy4Hm/hiyMwJ50VlV7u6zYWNEI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/3gVzK9p98srMQjjK90qfWIlPnEynp/If32sQ
 atWvhqJw+iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP94FQAKCRARpy6gFHHX
 ctayD/0V1TlmAHWo2Ux3/bjlynGZuSV6wwdkMMHovKfN8N9xLl7fmChl+WqAqFL37dsHv8C/pJA
 mmkfjf4oIyO/k7jvxPYWNlgbjCQQQaG1K5S4hADQN5cEEFKw90ErN3agn/qemYwbQh5zg4QIINA
 ujXqBKOIjna1ljqtcEc7gBV1q4xXO+YupjCQgYylMHFfg5Q8WGOq8pVz1F/5WPnApzTVY6dDfxe
 YHue3x9qZ+tctp/4Mb+q7QhCPltz2LJQZy8871L8v226K+zgI1Ba1j31y7YN4OD64E+yi747GMH
 y4hyaCMKOs7sjIv6zQ7o8NVyTYelbbnQhf2e3lzKs3rshHQABlXAYaNddE3gViHHg0DlGSWBoTD
 HubYbnxuLT45yWS5vfa/plzbJ2yU0VR0j5d9IlB7TiV1bj8MO+J8erUhQO9DbTB4nqKWIKmQske
 6/IyYs70zZ85X7t2uqL0oYXJCYzQ1wf5I8TMlLXgeOg6/v83R7e58SpQikj4HKijiRecZ7Lz0cA
 fuQVjMZhyYEywWfNhCzQyVhCrd0gFL7mVgl+tDFfj6IvneYyzuaqHE8j8DQdjVZOFIpXRM3rehZ
 WNYlrUPfQB4HRjEFfJ9JhVCHiwrfkHy5qWtypwaPsJCKIVyrn7d9RMqKEIyzx62HuQ8BHq8xkKM
 Ijt3vfRE3fLbXhQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

After the big conversion to the new generic GPIO chip API, let's further
refactor the gpio-mmio module by using lock-guards and dropping the -
now obsolete - "bgpio" prefix.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      gpio: mmio: use lock guards
      gpio: mmio: drop the "bgpio" prefix

 drivers/gpio/gpio-mmio.c | 335 +++++++++++++++++++++++------------------------
 1 file changed, 162 insertions(+), 173 deletions(-)
---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20251027-gpio-mmio-refactor-e07ee08a9699

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


