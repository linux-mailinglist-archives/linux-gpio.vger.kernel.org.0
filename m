Return-Path: <linux-gpio+bounces-8482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABAB942874
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 09:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB186B23CD5
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 07:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81701A76A3;
	Wed, 31 Jul 2024 07:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q5MmTzUL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100281A7F80
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722412630; cv=none; b=CL+C1Ff9j13RqDVKNbYDVHiWrkUSRj855ez2eZc25okI/Ky4XD/4q4l17uVi8p6DS9OUDHSQTjjmbCYhO9q2GANdHAYy7UAIdCxs4qVeOzv7mVENADE5ign31xi7wUSmSZyZph9mqIa8JJFfmHg1eyS3rqvIvNJ2jn3Zv6+kEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722412630; c=relaxed/simple;
	bh=5xMUQQnHfiLd7ujJcusm+8XOcwFYI/PU72Bs1QhUKnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRdlqAAOjA6u/VT+7PLJOh5IIrAEBBnOKqKLRGmJr3IuMVA98IOTlAH1EnJPXqBm6gI14TH3mOEgXR1EKOyPVzI/GAa43TaUsz3TOuhfiWqW0sNLFhkUp7Xrl/d3UbOG28jZLwDgah1xo7GfjM9N6cnGUiRl6lrxGEpWWKEAwGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q5MmTzUL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso29836935e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 00:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722412627; x=1723017427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mERmM/WSYpb8xDnumITCRtHrfI1svR9aufTX1a5k9Go=;
        b=q5MmTzULb08VR1wEzzpxx9/pxcVvZh0vbR/JTsZnqbLkxiMvT0kfPpZ+mBV5gWtXnl
         5KJFhhTwwABjGC+PLvgOi0X3kCtEZsEyq1NeuIL8pS2yZryAcvJTQ9Cp6FMNkGMfXSfg
         nyAJuAyTejo3+16X24MBL+hZBaXL5qOjDtwZ5g2Wej2qMxXQQlOQteJ4pkwxPRZFZmQR
         RLn2Qk4X9JTURvtHxjvxBzBvFLeQ2c2fv7eCeSoZoupu+9T/06i6mikMR8q03iX7VVkZ
         uA/h44S8DuwUSMYCfgBXwIWl8dr56dA8Z99D9bH4bATp6D8dgcqvDO4T9zf9FnlzRgCJ
         QsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412627; x=1723017427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mERmM/WSYpb8xDnumITCRtHrfI1svR9aufTX1a5k9Go=;
        b=GFdEZZPXZFPpxdurQOcMEYH9LdA7VaYWZdcSB1aSJwx9/8/xJGWscNjdPGdGxzm+dY
         BaBPUJJny2GvVU+XRrHVeAkHlO5MxrGVbmO11Gi5j2ZMHG0tRpZhZGiyi4CFc8ucc3kO
         mIL62RV0SnyXzaARPP/UYO4HHcZ0cUWZjpv0j4JScai1FSk5VFnEZ1CGF4aDZWeK9PW+
         3t92P5lT69QdiyMCqqFnxu0y0fWaK+CwYtoKvAB/0NfKZZrLdw4Ktsyf9wgz9Wu8Raap
         0mMXLuGZQvS9r/13FBvJ3K0CKg5TKPQvU/4KoR4cJuyLUcGMO8qCRw8sW3syaJIDpwUX
         0Rew==
X-Forwarded-Encrypted: i=1; AJvYcCV/rWZKZeS3fiObYg3eo63IyDrf9htujFBXDjmgKTEoI1BuGyjmsspnEzL3awgDgh6G5w02N/UJs0nuh8oyYp0XTV2bUVAWul7oAA==
X-Gm-Message-State: AOJu0Yw+pdWO48zEuOGj5MYesZZvxliMkHWCl9LnhVsA/w7kw+AyA2Ke
	ABJNgRznn2Oidd2DBjyJSiFPGEuYyWHeNnUpIjoxHvdZkYd3Jwd8gJIecp2fjt0=
X-Google-Smtp-Source: AGHT+IH/zfkXj5ULQZEFU6EvFUMJIx7j4wtOjvfjIg2atf3Em/LAAqfxwNTWM/qdKFYhsjISa/CeKA==
X-Received: by 2002:a05:600c:1550:b0:426:5e8e:410a with SMTP id 5b1f17b1804b1-42811dd7a57mr93317365e9.24.1722412627182;
        Wed, 31 Jul 2024 00:57:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c3f:3dd8:b524:cb31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb223f6sm11524355e9.45.2024.07.31.00.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:57:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	warthog618@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/gpio:Fix the wrong format specifier
Date: Wed, 31 Jul 2024 09:57:05 +0200
Message-ID: <172241262296.10170.8900238511707870912.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724024636.3634-1-zhujun2@cmss.chinamobile.com>
References: <20240724024636.3634-1-zhujun2@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 23 Jul 2024 19:46:36 -0700, Zhu Jun wrote:
> The unsigned int should use "%u" instead of "%d".
> 
> 

Applied, thanks!

[1/1] tools/gpio:Fix the wrong format specifier
      commit: ac93ca125b5409df56c5139648bbe10fd1ea989b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

