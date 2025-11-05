Return-Path: <linux-gpio+bounces-28097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AFCC35208
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 11:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CFA5E34DE19
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 10:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C51F304985;
	Wed,  5 Nov 2025 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pt/T5WtZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215DB304968
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762339148; cv=none; b=L1sP8VIPHlvRGlovoZC//poowkUcxrD3n5v1FHmVr6ZZv3oir9vWpunYvC68kFHy2+TRxorU8HIDmn7qvqmCqStWEQQnt57lpj4oCxaTIDw1+65kSUKDguYMH09tAssOMeqBMghUESiCp380MmwzVMVKDTIeLoX9eywzixTt6mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762339148; c=relaxed/simple;
	bh=B6N6+G+raW9szqrkMfYtUgrmVtFUzIhXLGDx1FbqoF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MlUcddmRZqdL7Rc0fEIiZHuikOpzwLkuqe1kirduDy6gca0Z+uzr9+6zuyTZYaqvLBEmGWr0Nls4mSVF+W0aYQBXJZhgA0z9TX7T6CNetyto69o6fi1apU5rlAFdudfU1Pv5wLjZkLqeLroulpoABx5x7cEnL0qUs6p5ecS2XcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pt/T5WtZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso2166085e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 02:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762339144; x=1762943944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g/sM+ooTubeGB/r5AMnvIDwNtxu68hhAAT+HeeXwqM=;
        b=pt/T5WtZ26iBsvDaTnLsY5jhYH2zrhSrITIfvV9ZFfUMtLLaE33CSI2Px6Y3ZTD1Fs
         k2C/neVbbJxOSMHfkv6Nvwc/uxmu4sT6PGog9hH8x8NPn7nLMRvQ1D4Bg3KWXwslciOK
         2RanfvnVroAM2yW+bFYl0OQhz38dmnQ7HHR79IqDMsmDd/Iag0wNmRSFEP0dKIgfxbVI
         7hyXPgIse5+9fVnsoBWOxzbSXmmgcma9PKBgAnqumy2uhh8z4y5p5rlNZRayYE4CL1eA
         RXDN4TPLy13g1vg5T008RKzsg3i/a/3FdJaXnUD+t0YUU5rqoo2uo1mVOedMOSCsRIW5
         AUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762339144; x=1762943944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2g/sM+ooTubeGB/r5AMnvIDwNtxu68hhAAT+HeeXwqM=;
        b=ekl9W7rs/+qDdhCsFdHdTGWwVJbEFWSuF/VXrtXPCvWNRTzNven6QMsFren751MQ9+
         bzYIhDOtplHUg3IUy8i7s3OOxTJzkMgSZp0tnsVyu76krHn7/6i8Xguh/k33d4wzJCsr
         ZPIzgKEJRGOKpwQRCdVfAO0LG5Uy47RsmPM6k01zs48jbeG+W9ZigqNPm21Gke7q0ErM
         I9k9UrrEmVT4zwGyLzhOEm1PztIBIhj/+dWc0+Zu7QmsTbjsXNB4z8lMr5KaaHPY4Vwa
         MWOiTV9dfDQC2HciSIBqunen/iiKjN0a2SXuEDPEbZdmd+vL2MAWQtDK50+6ycrr/K5v
         A2aA==
X-Forwarded-Encrypted: i=1; AJvYcCVda4MjlDm1CEeyZ0wNVBzyeQlZ9trtjyq2pJiFclxOy2O8iuFyOzQOKMPnH4p6/Tbm71tJ8uMDxtLL@vger.kernel.org
X-Gm-Message-State: AOJu0YzdgXStEsxuoseJ3L3XVLG/DYrLmpjPeSuWENK2PMQjqRStsN6/
	gbzSMvFncaWnWLTZhJshInHK8z1Lb5h5P6WPiRnL4LCsMRdQCq5l1BdftQoXE8FI+hZBxBqvE0N
	x+zc74J6WWQ==
X-Gm-Gg: ASbGncvWQLr8eS5hjd/0OUBIUyT6H/Zkz8GIplU+LKCcNVo1zO5/fjE7kHAxnbfJ5o2
	bcQOHVR3C+1Jmz2EalQVlmMRk3q2UqVtfZNrDA/5/J3pv/BNCrb55ZF5ZA9EC9WJbxDjz+NIK2t
	/SV/DJ2Zzukdszuhtgcauq/KIQ61XSz8haCsH9opbF7vWngieY2IyMVXYOzDKe+DLsJq2sI6OKJ
	ppBP3QGMlcyLugq6e6vsnM/a7khIS5XyR/kl75xhw4d6GJdy27QZ01Q1VdX2iOF4dCGthvW94LG
	NwyptAa251VoV3UI7dxqm8kp390RqG7Ylk8dteOKgsx53slSqSIRT7aHCl8Mbzn3Bjt+X4a8xDr
	PT9ootkrhdjoU4LNdCQ2qz2AZ689fW4N7SzkdqZSbYdLro8z12iKd7andijp3IkMCMqyskEU=
X-Google-Smtp-Source: AGHT+IG+cbAuDAH0Ij8+zc8t7/AjLTxcA3chPN++C6d9hYStQMVPEhWamSx/J32FhHdzqihiok1/9w==
X-Received: by 2002:a05:600c:3f1a:b0:46e:2109:f435 with SMTP id 5b1f17b1804b1-4775cda57femr24740155e9.11.1762339144440;
        Wed, 05 Nov 2025 02:39:04 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:4e71:8371:5a52:77e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce210a7sm41073225e9.12.2025.11.05.02.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 02:39:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] gpio: aggregator: restore the set_config operation
Date: Wed,  5 Nov 2025 11:39:02 +0100
Message-ID: <176233914040.18609.8941746577918404952.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
References: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 29 Sep 2025 12:03:13 +0200, Thomas Richard wrote:
> Restore the set_config operation, as it was lost during the refactoring of
> the gpio-aggregator driver while creating the gpio forwarder library.
> 
> 

Applied, thanks!

[1/1] gpio: aggregator: restore the set_config operation
      https://git.kernel.org/brgl/linux/c/5232334baec371a3c9d9192ba7d2da2d88a85333

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

