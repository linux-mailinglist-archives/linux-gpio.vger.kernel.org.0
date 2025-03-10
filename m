Return-Path: <linux-gpio+bounces-17354-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B31EA5920C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 11:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA011890FD2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 10:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D7622A4C2;
	Mon, 10 Mar 2025 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IiFUYj1e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA9226D01
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741604144; cv=none; b=Q3CqeRMwpzFCGvjmriHYPC2jYVRrBZ+UovFB7vQcUMAnx7xqHrp9ICOOtrLzL4IflVo2rDkCY7jDEd2moFTjVEUYy7UJVeac294FZuvtS8YJmTmP39xNjjuaIJ7BVbdPAId0v6ZIMBlvUgFHHCYai9mLal7KKeWZdcOot5wVsUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741604144; c=relaxed/simple;
	bh=Z+q9hKKalJHtE4aTYKlxZn8Dz4ZgOsFcPddQrOazVM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WE3ACKcRkSpCEVOrPkKQ1tBN3i91iOg8FkxdNbIuINRmtH6bmaH2CfOiNXzJV4ukHJXcrgPJ1iUe7hoTs9WgTK0OPiUrzZTCrlHimKMK30JC65iiR8bhI2HccEZLgDORhXKjMTN9cTD+3MNz7aqR0XygnUzqP69jdyAhe+8nNgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IiFUYj1e; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso354260f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 03:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741604141; x=1742208941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCXbQ0vSkso3Eekd9AOru/DhCIZmWQ4i9u+wlY/Itpc=;
        b=IiFUYj1eMHFGNcClHcaXFtGV+5ph7rFkMOYWGS63sQ8/YvCQBQ/kGe8h1FlSUcg+m1
         IBrUkJKRdSeCrqiLjE6EdeucQk2KtB0NqzMJo+L4t8tWB4FiwkpWkTv8Qre1mukxYXtb
         nLOaDCZSnExn/84JZzJtDTCbhBlByl/2GD7w9sTh/pYsUn8f3pF0RSQRAnPFxPz0XcJj
         E1PC9ZlJXz9+XvAGHLdU55FZTUownHYhOrhJWovJ/uQCfhnTdDqf8R6AwkYQPIGBVzq+
         QPWUOdTSaQf/+/GfSA12GRER99tLDr3HmyYkdTSUhOr02z0HO2zcf80qHejG4w2Q0lfM
         l78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741604141; x=1742208941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCXbQ0vSkso3Eekd9AOru/DhCIZmWQ4i9u+wlY/Itpc=;
        b=hgewgjbgSsw8gdpOGh2msQ8eSKnzCpG9yB9+wrrvzRjMsCDtBXUc6RlHuY4tEfU2A6
         FTFZW+Z9S0T0fZ/88iz57vro2VKK3N1yP0etwIKSpvpUVkHObZeTRTLSnBMQr4u/EY6s
         aCqZ2+vQqjkLmsL+GcUhhmFxJO/89T0MMcxMBCuZMcNFFKsA3j7vpZXapfxg6Zat03h4
         C0zSiB5j7u8kKTPdyzSK5lkyFzGZ+h+1sSbt7XtL/XX4LMEepyFNvh1ZhfFR3B/Prije
         ZOwY4cAUAnI2TRKQFnRZqc6PS/uW/2Vj2Ln2PRy/LLH2FJIIpaeL1hqypaeX4f0yNePL
         S2Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXUVpvd75qwz/UWah7apVqMjbrMVbsTAROeBsdpT0zg7qiralJRGCC6RW0zXAVZKsxHXbcOglcZ6PNc@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMB4FXQs1qH41aPv0Ang6lRQXadZDIZE9VGQi5Dcon9HXBFSz
	eUfc5St4+n4xEqQLTKGh+nJV/c5l4/1yxid0TfS7pUyzw5xtiWuxXDLot1apKZ0=
X-Gm-Gg: ASbGncvqGFcnmbDGAYX+Fex2a4b++QRwW73H/JQRd8cCVGnj+GnqWGrclAg7E/HBDBU
	hRG9B1FhyxAqIRDYHO0j4wSWbt368givTvLsQxOIJrx0FJwOG7G3iGp+hH4cMiX2wWZW/FVlgDa
	yqsHIwRzLQYvxkFLL40G+5wl93ybSVCiAIQJNooEOq+eRyhYR0ZJzncQokum/fmSAlu/IYn0lFz
	itgZcW+n53KOommcwnn+gOpGQhnvBL4dnzp/Pz1B5H3T5KJ5XK+QKjUIVdf6M0q6dq7IcQDw70g
	KQ5CvuMp6CxPMm4gjMoN9L+PomthBOOUpUUvUUohVl1d
X-Google-Smtp-Source: AGHT+IGkPK1E201LnEu5m0Av/cBIQyI/BiBo6QN6lt53sRq5ZCBebKSvYVzHP+5Q1RjgXwXaGU2cxg==
X-Received: by 2002:a05:6000:18a3:b0:391:2e19:9ab with SMTP id ffacd0b85a97d-39132da8e5dmr7258133f8f.47.1741604140838;
        Mon, 10 Mar 2025 03:55:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba888sm14720641f8f.16.2025.03.10.03.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:55:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: convert more drivers to using the new value setters
Date: Mon, 10 Mar 2025 11:55:35 +0100
Message-ID: <174160410511.24364.12512158073290549923.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250306-gpiochip-set-conversion-v2-0-a76e72e21425@linaro.org>
References: <20250306-gpiochip-set-conversion-v2-0-a76e72e21425@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 06 Mar 2025 18:19:25 +0100, Bartosz Golaszewski wrote:
> I don't want to spam people's inboxes so I'm resending just the patches
> that caused build warnings. The other ones will be picked up from v1.
> 
> New variants of set() and set_multiple() callbacks allow drivers to
> indicate failures back to callers. Convert more GPIO drivers to using
> them as the old ones are now deprecated.
> 
> [...]

Applied, thanks!

[1/2] gpio: adnp: use lock guards for the I2C lock
      commit: c7fe19ed39730c121449bdae11e030f02c7071a8
[2/2] gpio: adnp: use new line value setter callbacks
      commit: 21c853ad93097619c7966542e838c54c37f57c90

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

