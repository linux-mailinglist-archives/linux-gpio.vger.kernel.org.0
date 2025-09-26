Return-Path: <linux-gpio+bounces-26609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72558BA3431
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 11:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA011C0397F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 09:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134562BDC2B;
	Fri, 26 Sep 2025 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sZirVNKC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1127929C323
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758880656; cv=none; b=j0YVVFrwY1HQ+Y/5n8unDs7BqAPL8iVo3nEfSHYCB0/Z5XNuhIZfGzKUSeKLtMlv5Bklm4leXWxgbAoBIyFdRNHNYms9FprCKKujE9AAhHdQLFTLMa5SWTsOs9Jyuzr9J+DIU/02lncdBATzjuPPsuGtgU4vmxcvGeYszrUX1U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758880656; c=relaxed/simple;
	bh=pSTGxTVn/zpOADQlpLLlrFQ3O7dddV8wjcyu0d9N78k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEJfVxzscV8Is2jzT6sSjfA0K6c8MoGJAfVsJ9GtCxP3Dw0p8tddFzqEpcXq8bMhbwhCwpZTvc6mSYhaHVIA3N66JUUd4H7P7EZUXUxsuh115UmFVcMpHVeXcP1zLycxdxg2oezbgSY1AvZP4MBtvQ1b5XDJzTLOCr7W/r0iCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sZirVNKC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso10860335e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758880652; x=1759485452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Kxy+zDkcHliCNrZ/JPAcR9GylbEx4LYmoR1pgjRV4E=;
        b=sZirVNKCvvIkXRb7JR1uzWw81ekdTMnS1wafQr+1S8ltTN5JC7jNwREgC1FYxnVDVK
         rEA/E4mGdz78j1uNmbyO5cX/eoLOonSeZrhHR6mYSWb+PXw2dk7oF7LoYZrNV4NlhlqQ
         dhwj00imPKAfxLJUcY4YGXnc8x9GwyxZc4CR598D5xLkLxkh6A9fnheSATvZRbDmEyt+
         4txLMwj9fBxjEaDA9+lvM8EIFDv14pxVZW5u05u8wphqJUtbTdV6rgL3BLpVbwiYru1j
         mb7ucW0iDKUeVlta8G0KYvepkjJ7emqtpYGTOiro0zlNFQIw7/khu8GaXsnTH3iiNnZM
         TFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758880652; x=1759485452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Kxy+zDkcHliCNrZ/JPAcR9GylbEx4LYmoR1pgjRV4E=;
        b=qAysnC390kq/qBSkpOnuWeTQPHRy85FrqYWPVjWY1Oq2ja/aCZ276S7aKH9EODXkuS
         9dBz25yNKgm970h4sOWv1hSEfkJTy2rdyspReeS1Km9tWifVD9rK1ee9JLFSsC4z/Wl6
         eNlNnxgav96wNx7E0zn0WvsOjRBxVEaCClTYgFqMUvbmU3gi+CQHGGdGlVScVpd+wkFx
         sTelujtYXrlmAZyYQ41h2ABrSSFgQwh9+hN9fOS16OZ5ClTAxuIRn+0PliBKl6npofu0
         ERS8YXt91VBLrNSQ2MIA/kab1V/iA2xckF9fyEK6tUDN/fDrpHfbCad9wVofHE2xvq0C
         ykCg==
X-Gm-Message-State: AOJu0YyXfEw2OLCgv1FAaXiBQsrlbMXE6KzfPZiR+SA2SWt1IECu9sB+
	0nYtzySZpzeBjCod1hpY3BejtFqnaepTasUr7Oky4H/AQlQeFmAj8+zcPdRxbBNyu6yE/5Vckwp
	0s20bGzo=
X-Gm-Gg: ASbGncujSE0k5Z5kKLJ9oWJ9N/TTry5SrRtbJpPMOcU+2Fq23vGvIjP8KYNbApWf65v
	AId2Wc44s9XcNhlEQlRLqdCKfJT3tUPRzco/ko2JiNlgFgW/yUAS3xU9l9ijwSMFUiPNSEBMohv
	SP1ZLAs2yKWXp3tBHZegOdTOyJrUvjrqPng9IZafpJYM5AtKfI0+km9C8E5HfvtaL/0rIIPA6Ow
	kuoVEz2FpQGFQGMQnTL4KTaRy+bYWyBr4VELo7+W0o+7n4abv+m9TQPoJHu1zrEQDmRd+7+2CnI
	OClW0qFxqSpPqGb7YshTBw+pTuKpu/Dudo0iSRkgjFS4S0JRIY5UOCiRluw4dqX/i/Sxhobgo5m
	Mw5Nd7VnI2ngimqsxCRM+CgE=
X-Google-Smtp-Source: AGHT+IE/q7gcEasaydfPlSh1kSSOSBJAZe/1ZBQmjjrYMZ94FaitrgjVEefEJEXUDsJu0At0EET9aA==
X-Received: by 2002:a05:600c:1c92:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-46e3dad3310mr19221425e9.17.1758880651763;
        Fri, 26 Sep 2025 02:57:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ab15:a65:aecd:6def])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e34074983sm66168915e9.10.2025.09.26.02.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 02:57:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril.Jean@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] gpio: mpfs: fix setting gpio direction to output
Date: Fri, 26 Sep 2025 11:57:30 +0200
Message-ID: <175888059620.38209.6546087887696517521.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925-boogieman-carrot-82989ff75d10@spud>
References: <20250925-boogieman-carrot-82989ff75d10@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 25 Sep 2025 16:39:18 +0100, Conor Dooley wrote:
> mpfs_gpio_direction_output() actually sets the line to input mode.
> Use the correct register settings for output mode so that this function
> actually works as intended.
> 
> This was a copy-paste mistake made when converting to regmap during the
> driver submission process. It went unnoticed because my test for output
> mode is toggling LEDs on an Icicle kit which functions with the
> incorrect code. The internal reporter has yet to test the patch, but on
> their system the incorrect setting may be the reason for failures to
> drive the GPIO lines on the BeagleV-fire board.
> 
> [...]

I'm about to send my last PR with fixes for v6.17 and this hasn't been
in next even for a day so let me queue this for v6.18 and it will get
backported once it's upstream next week.

[1/1] gpio: mpfs: fix setting gpio direction to output
      https://git.kernel.org/brgl/linux/c/bc061143637532c08d9fc657eec93fdc2588068e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

