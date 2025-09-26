Return-Path: <linux-gpio+bounces-26608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD5BA341F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 11:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C7EC1C038AC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 09:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8218A29E114;
	Fri, 26 Sep 2025 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kUc2V5ur"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B79429DB6A
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758880503; cv=none; b=fSUXDx4l4Itjyijh8loge+H3PKATpAuWGxRpMS6O3iP8LwHpg+2fr7v77kHTvg61Crsf/iVwVPgrhnGNJeW4LisSZeh8LSXyi6ZgSH7wBIP3/CHlnhgtNjKe+ltuvylGBooNOQO4qd7K4AOg45Hj3MbAcjiDqBUvuE5ltyaFgFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758880503; c=relaxed/simple;
	bh=uU3S1tR3us0ZxlwKhKR+yOTCQ4y8T3GpkRpVn2HQL3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LoKXsvub4Y14KUicVrpRthey6KgMhudw+M6u31CqB3p9rLU7/8bLibz365nmYPqVZcbEEJBjc7Y3cYq4MvUiuWsHwadLxaaX2yN466PRIbQv2qxAmFcdThpOG3sGJW5rOBgeyWE3PTyucsQz2cLU09FInE3ksSXrgtrARq+ErK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kUc2V5ur; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so1672101f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 02:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758880498; x=1759485298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3SYsnn6xj+2CFFAu6bYdM+BNMUh6GZEi+lrLs+Yulo=;
        b=kUc2V5urWL8BKPMaVOJrsN+qcQunhh3EmVGwG7y3vBMfXFZLzlOCLJ3WlA7rKzoOlG
         lD+sXGIrCL0tkCIRgatgpIYpsKzUMEtoLY+rxuh/+J7ojrYxsJuUzmj1MN1l+esZvwZ5
         2r5vWorRzX9D2XyecxFCLwSjJ/AhNpyfN/sF0j7EV37p0Ctk9RQ/QMqU3N9KXxTqA1B4
         K80IkxUQawDR1nnCsyT+phik/KkCdPHdz+8oJp5us4dXtEW+dUC1uu7B20ptQrEJaIk+
         SrmawVf0vYa3Hc4oxFDTapBgFKqjPbt94cF/tdclnDywcRbcjWxw+NZlup9DlNBzl0yl
         TA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758880498; x=1759485298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3SYsnn6xj+2CFFAu6bYdM+BNMUh6GZEi+lrLs+Yulo=;
        b=kNTcKEd9R/jPrEKcN/dyX0T3g0p7FMFVJJ721XuezBJxuz0VySKjp/J0jR7haTRlfK
         I6uYAWznuM2wfs4TvVZiMmpelHZf6XpwBrOW7LRD2o/joU9f8HClkw9mgMBzbN2MZeMD
         up5tkkIYyZEqLwZwOtlOeCnenCD1S45q/0nbxyuBdQSLY9R8f5x7HSv0Hy9V60mlKfIx
         Z4A+R57cVfpFIo/NNJ9QUZqMCgSrp4ZolisVhK45uvBEMRqEPOMvj64Vr9PrMdzmlp5/
         VO9ONnI18LLC1+RNhJjgcTZWBKtgcfM2bJPk7E7lx868EV1iuSET3Y8jxBcXaFHUJDZT
         Jlyg==
X-Gm-Message-State: AOJu0YwC2gMoR2BJv2GOX9jCR4y3m0APJGOu785cyoW3oOYybT7p3mZx
	kKwN49p7PZzPt1q2Ulim7DTJhxR3BBj4mulZKnfRMGCIoA6wnHe5c7uc5u8/8T2y9oNbw4wJ6NX
	byLzggXQ=
X-Gm-Gg: ASbGncs21tbeJj7gl2/xnjtnuKCOY/ZPCh70KV3IkS/cAePeM1ldSDKi2ESBEcB129J
	+iAhNiI++vya+cIXWlBw8knkGQYMyqz4cnCLqYSKJ6Rc3e7eGJB+HpeXvQ61zuIwva//+c94bfX
	PllaXNn9E5yAL66Qzznnhhpg0J1GkBl0merbV4+pP7jC9bN9cCrHCx2q7KZERvj+g4ZqOfWsG2M
	VJ4w+5Jkt2VQQWyz9VMRG68/X1G2/paZz/jTlOuUdca7+9xWtzHEUnT/kVZn7ZV1ObDgO3cIodM
	r0pUCwBP2JFOF/V0Nwrb1T9EnWNeQdT+x0jDQ46V6A8mX3Iv79/m/SC1zalSG6x8DNGd+jD77Kv
	7Kakdk7WQRruBExV6GgPDSCo=
X-Google-Smtp-Source: AGHT+IE2tw/vd4QTBKAY6R0G6RgHu5qehPdriZ21xEC9GbUr6i+MstdmqyEkDVIjHuEEEXGh28wHnw==
X-Received: by 2002:a05:6000:2386:b0:3ea:71c4:8e1b with SMTP id ffacd0b85a97d-40e4accc948mr6387814f8f.63.1758880498045;
        Fri, 26 Sep 2025 02:54:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ab15:a65:aecd:6def])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb6b7sm6838623f8f.2.2025.09.26.02.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 02:54:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	vfazio@xes-inc.com
Subject: Re: [libgpiod][PATCH] bindings: python: generate wheels for CPython 3.14
Date: Fri, 26 Sep 2025 11:54:55 +0200
Message-ID: <175888049343.21571.15213107625906746652.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250923200737.3177136-1-vfazio@gmail.com>
References: <20250923200737.3177136-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 23 Sep 2025 15:07:37 -0500, Vincent Fazio wrote:
> Update cibuildwheel to add support for generating 3.14 wheels.
> 
> Configuration options for cibuildwheel have been moved to pyproject.toml
> to keep it in line with other tools used by the bindings.
> 
> The configuration has been updated to skip generating free-threaded
> wheels since the bindings do not support free-threaded builds [0] and
> cibuildwheel generates them by default starting with CPython3.14 [1].
> 
> [...]

Applied, thanks!

[1/1] bindings: python: generate wheels for CPython 3.14
      https://git.kernel.org/brgl/libgpiod/c/97ee30872853b2c9fbb448240012909d985f2e19

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

