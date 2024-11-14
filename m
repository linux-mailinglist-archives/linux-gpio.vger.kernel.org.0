Return-Path: <linux-gpio+bounces-13006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03C9C8D26
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297BE1F2392E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E026F06D;
	Thu, 14 Nov 2024 14:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zNzHCC/h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE3B3D0C5
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595502; cv=none; b=azo0cIt2zaWSfP6wIEeJ75c0rxvV32XLGfP85YILyaDySG2L+4hr1w7FavmfkxkLDE575KOfWslj4damFXo45nY2F473kI+TA4HdL+UwJcnig6KnJOKeOqRZole12tE42owUo0cONMnNA28mdMXbhWf6fnukOWI8u3AvBYjRvhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595502; c=relaxed/simple;
	bh=+rMLXFzgqKZLk8rQ+k3N/R9MMAXehsTmRTsmokLBChY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJLhBDweLl2duVOlNZP9gVq7C8fcKg0bmO/MekDnbRBHDQwRljFBqrPDkH/y+xjoKYkTST+SKd2idsFX+Csls/MTfKzXJwc81y9sMpNFnu24OFAYE7NF8SxQCE8QnLRxPIW3JyHANQQ4ZJVYFhwK55Dou7SPKn6LXyuh6bAK32Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zNzHCC/h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-432d866f70fso6434755e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 06:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731595499; x=1732200299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEgpr39w0CcAsiKuCtl80T/zdi1/rF4sSBWwhuKglcU=;
        b=zNzHCC/h5f8K6GCgsbToTwYTbQ4f0mVY/hum2IyKHnIWe/9P4LsLY+/fXVEfQ64mmO
         7ykX3YGaQca8Rw4YCAWRhTC48kHolYHIa4mpB92YaxAsNQRFDFN/lXIklnQp3z8xQfWT
         jRDmcnfriTi80vb3yw/vin+gDUg/1X68c+5Sv4/2Zc5PjNREFNlhV3P2fJkhT14qAJ9Q
         U3XhPtjuLJHt63JBKZyZbrBrfu6O1/JtACRZDfAR5T0xYDThhVsQqeIJweaPLXZcHIPV
         t3KQXb2UTE864Xqq6d8xfT0MU5JwqtfK3DoL+9vTGpPGyjK06r/77nB/5taWA9JuvqIj
         qB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595499; x=1732200299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEgpr39w0CcAsiKuCtl80T/zdi1/rF4sSBWwhuKglcU=;
        b=sMZYI8ynOj7plMi/gfswJjB+mpPx0zpVP78fFf1Pm3NyYwXjCo9SvZF3EmQazv5VGS
         Dz7bPvhqJuklNRJkFR5+xAKwlOqSAP9zWRlH5UnsEQGD7DEYQu+icL+3lLabCIWhzGT5
         /3HsWa8z+GryQhZWanvZX6155FgxFu2k7/Enz4aX+9pWtboSarcNXgGpTrM8qkMFJRxV
         Jhq9ji+n+zo+1H9P5pVJ846EF/+grmthgPej8RljPekMG10v5YgIXksdVfA7jzmNztNR
         jiyBOqsi0aeojY1xXNdU2ktuIKA9afSAwOT8GxTS9qjSipfWfJ7mja2wfK8lCIv96GX5
         eeWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXENZ6YV3GzguI0A7CJ38kS6rW/aZmWrIDvBAF71Q8+IUaHB//sKTH7hkHxLMhKgBH0qYhP95NeF+qs@vger.kernel.org
X-Gm-Message-State: AOJu0YzMHnypNYeAvzgOm5f2sXA+HXruLqOaoWSVlPUue5McqYRcj9Js
	M9DxtktUzkm2NS9W1X2IYPj2FpiY8Kvuva32JF/P88shEnZmK5/UHu6gbGOCO4U=
X-Google-Smtp-Source: AGHT+IEFpp9RmzTQrpWugYQ7Zu1HutntmJdWfk/HE3B/Cs4tqZen/YgodsoFDkE2lDf4RFmjYyk4qw==
X-Received: by 2002:a05:600c:5124:b0:42c:b995:2100 with SMTP id 5b1f17b1804b1-432b74faa3bmr199575445e9.6.1731595498566;
        Thu, 14 Nov 2024 06:44:58 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d8d6:4da5:9533:12ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab721efsm23527295e9.4.2024.11.14.06.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 06:44:58 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Lars-Peter Clausen <lars@metafoo.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	Prathamesh Shete <pshete@nvidia.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra186: Allow to enable driver on Tegra234
Date: Thu, 14 Nov 2024 15:44:57 +0100
Message-ID: <173159549500.53717.13347422076056240861.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113162939.886242-1-lars@metafoo.de>
References: <20241113162939.886242-1-lars@metafoo.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 13 Nov 2024 08:29:39 -0800, Lars-Peter Clausen wrote:
> Support for Tegra234 was added to the tegra186 driver in 1db9b241bb56 (
> "gpio: tegra186: Add support for Tegra234"). But the driver is not
> selectable on Tegra234. Update the Kconfig entry to allow the driver to be
> enabled on Tegra234.
> 
> Enable the driver by default on Tegra 234 as well, similar to the other
> platforms it supports.
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra186: Allow to enable driver on Tegra234
      commit: a5cc199f4de2a2a10e3c9d3fc2d07d634d1e5d0f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

