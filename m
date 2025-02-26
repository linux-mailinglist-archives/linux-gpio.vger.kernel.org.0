Return-Path: <linux-gpio+bounces-16615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7689A45BB9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8CD6176B38
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2FD2459E0;
	Wed, 26 Feb 2025 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AtIPaW51"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF320ADF8
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740565650; cv=none; b=rHzv/h5SjwmTNbfy2NPVi1sCHn5SJpFgoHxeK41dgk1VlKMtypDBFAbqVyOwjxg2UEBWMLOdCWG/MgAURTVTBBMQf2ziS76bYqcf6d4qB+oDmAEb40FAbqifTuCaR8YWPnqr/yeVFRvFoFu6XGdEKpUpnn5Z5gvyAqHJu0vhuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740565650; c=relaxed/simple;
	bh=XKG8FSINbw81iP5c0I80X1milF36EHFZ6IexSHG6hHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IwroQjgVch/gP/FZrnDnH8Qza62VVEL09DMdvA4coPNFpgCOMvYWJf7LmeGuo8UuNMDJjIm+Q2qNGBp5wVbG57kgeeA8GDu7/4OxU5y5xpefNMvGbBFiZZFYsl7A5zswgyu2+G5fn1qeQ3lakTydEq0HGvi14hRFZDdCzYRGyYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AtIPaW51; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43989226283so45151205e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 02:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740565648; x=1741170448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N3ijWIZv68eyVCzHot+mfvzLN+Qerzb3ZH4lrJQqvA=;
        b=AtIPaW51Yl2r4ShiOrKhZLExpaPxL0gl8yutst7buhfJfwa31Svz5/kDvEEjxJyolY
         QIzoLEIYORVeHg7+dio+0FhAxvhopn3m0ml4injfjI+cLYw+gwwZ7LBBfKHezOEEC+bl
         O2wl7YxjtTxWZQaUG/9FGGpT8hNURzvkjPDF2v2y0Uhu8R8Hy+iv0jri7yXAqJOlVLzr
         qpIgdwFSfWh14wQ8KIqu69sPRM1ZSY7h8GlDS+KUheMzfpmdsXCxvZAY9rcC7cyFGG81
         0So+13/6w5PQuNxRAl0r5Ahsfg7Z+YntlDBcixOr1cAkk/JplAruP5sc+haZriP8vu8P
         7wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565648; x=1741170448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4N3ijWIZv68eyVCzHot+mfvzLN+Qerzb3ZH4lrJQqvA=;
        b=furuTeVJdWfOd9LxTPFZUx8617X8ZJweXwum/OW1eTRf5wYJv85wO+40w+bNM+h+7s
         hpKqe/hwOXFhsWMKl9nXyZS7UN0gAuJ79xU2oe1vhIA1/3qDMTr44ws0RKVLk6k21FeR
         ZI6ngO5xKDJPZac6lOHNBHkckIMB67H5tAoMaT0d6EFZ02iLtqba39tUhqNfHl0Vynbw
         3Q0wQpuDOnrziWkzIPOL4CBJaTHafjbjetsY1NBbxUjI+L3mTihT+bnQs2EwrzImUpKl
         3YJXWQIjVeSnUAuAvku9q1AV3UFPq/fjVFLzFSUsF7Mvt9j19BZCAuV5lrQdZxycMUfz
         y1nA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Voq/iYbBksQld47gHIyiLtKn544HrWTqRmdwljc4/8ls/SY79IYeTzKe2+dDboFWg1xaHfBclDOv@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5GK5UUj46ASdFulKEhf3CPTWNGbzOJ5ifXvRpAfI6ieQUkJz
	0HM/907ivVrnvy1eI+x3OnT/Vjf7JOTxNljtgu9nNFV4oZrCo77J5XQ7nPnmFQ8=
X-Gm-Gg: ASbGnctz8E9bdKOPqC7xosstL6NGzZrv+XlxlKD1F1jDXVp9Kqv56nYyzaz2Qo2DmSl
	clKjk2N2kkExpKV9rD8OavP44z3k/QmOqc5KReHQqhojBFuP+ZwCIROOMx4qY+N55qyPYdilRvq
	qRRLROq07AX6zHfDpeqKRqmmjzJAXTUsGXFmrouHthQUkV6+iiOmMpXN5whKjG8t6/ycRwB9kOy
	z3/49mIgIEkvvVwtonEOAN2FAkQXA8mh/uixIqNWKE6Sjsf3qCKWBRN4/56jPBvWDxS6w0QZPR2
	qOFrNcE57C6BtY210Fozf38=
X-Google-Smtp-Source: AGHT+IFvMfF1V9DABzoX85a0pJFEGdD7BWr+NcNzq+PCz0lqB3/qnz86jDYRHsS9ArkWtks7QJIzPA==
X-Received: by 2002:a05:600c:4704:b0:439:8b19:fa87 with SMTP id 5b1f17b1804b1-43aa9545418mr93905955e9.4.1740565647644;
        Wed, 26 Feb 2025 02:27:27 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7d02:26:5770:658c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b97bsm16448205e9.8.2025.02.26.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:27:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/2] gpio: pcf857x: add support for reset-gpios on (most) PCA967x
Date: Wed, 26 Feb 2025 11:27:25 +0100
Message-ID: <174056564160.36055.17560042378839414084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250224-pca976x-reset-driver-v3-0-58370ef405be@cherry.de>
References: <20250224-pca976x-reset-driver-v3-0-58370ef405be@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 24 Feb 2025 11:03:20 +0100, Quentin Schulz wrote:
> The PCA9670, PCA9671, PCA9672 and PCA9673 all have a RESETN input pin
> that is used to reset the I2C GPIO expander.
> 
> One needs to hold this pin low for at least 4us and the reset should be
> finished after about 100us according to the datasheet[1]. Once the reset
> is done, the "registers and I2C-bus state machine will be held in their
> default state until the RESET input is once again HIGH.".
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: nxp,pcf8575: add reset GPIO
      commit: b28037d4f375ed36ce8abbbd31107b991792db72
[2/2] gpio: pcf857x: add support for reset-gpios on (most) PCA967x
      commit: 087f8a6b8ce93d582e0b84af538da13d735e2444

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

