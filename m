Return-Path: <linux-gpio+bounces-13688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7259EAC98
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 10:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 017A5294264
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 09:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B7A215765;
	Tue, 10 Dec 2024 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wEBLexRJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AD9215760
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823483; cv=none; b=KVEz9NJswMHYNS/PAqm09GM1pqwTbfVWocYPagK4c5Wbfh0RD/vUl9NdJzgD/HpywVSufZDsLt0bDQA0xz0YvsEB0ziPdqcetBjzw9VC5dXtmZbZm0mixeJnzdc/IyitYVeRkuTDefPyCxMiT4acYOxgQF8rAGLH4gLdb951qUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823483; c=relaxed/simple;
	bh=60guHFuRpbe4wvLXU7u9E4YAsgZevp/WicEhNCYeH1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbcZjyZ9+4Y1eZTKAn/r0F6/qYfH2Ta5ubpszJ+JTcWyUAid97mX5OzebhECK8jZC8DEIW0aTI59xxcT9QK3gyEIrEAi3NPSTWAi1Jt4IPBZaxEklXWfoJDGxCag+iVcqjoALQUxKhISu+4/o0HPmllk/+msRPYoQY6q6XA7sPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wEBLexRJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434f74e59c7so22106275e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 01:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733823480; x=1734428280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXO1I48hqq3Yjyl5wU6rrxXQLGo0Q6gGMkcgwSYT/Co=;
        b=wEBLexRJdztaNSB9heVnnWS9oMzuMdQ8M/sbHzKqoo2xVgZ/R6v4DDWTzgQ6rL8j3H
         f7mLzFvLfjJw+JepLTIe+2C3nA+Nhr2V8oB7yqcbd8jIMQ3uG1GUHPfd0fTVPG+UdO/V
         PquSi/e4+0FXWyiUqt4ZmwyfMr+nlcsWq7ctoMG9Z3q7skRiDdaJjq0M0UH8KlCkjV70
         nKhj1bh3xHEPjQ2VWdddN+lv9gSBZj+V9r7/Oe4gTrMLOD1kyK4GA2mAIsX0rxCf1zhS
         2KC4GelFeIH/7lBQ6oz/uCtFhyWBgagvw4HYJLkWTmOP0JcnL1ScDME+0eY5YJldVq9o
         YZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823480; x=1734428280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXO1I48hqq3Yjyl5wU6rrxXQLGo0Q6gGMkcgwSYT/Co=;
        b=tzKQ/docIWPZUBgYIKaN15MpIQu7GpmaMA5c/bnFPfH/pZ2kWHAKYmPIlUFlPELI+j
         i23fIlaemd+KZRi0AdloIPW2wT5QPeiG5jsGs47BEfus3mlepe/NIYMWLHGLRmzc5RNe
         380EAjlezIWvp+PuawQv/zDd/igCKgy/JVpXrMOzoyWsgLt96jmHj9cpxEpZR7vlUufu
         WtrU+1j0POshOO6JAL+1UI8XH9LWcrBmPiDLKuUptGrJ/UnKZhchjOTQI7Oxscy5t8ht
         V79eVAFRN0E/Cq6UxNrevwKtS+ci+cxZpXkWpQ2RgqcuGBgV0DEEKu6kBMGo2sbIknYI
         fLQw==
X-Gm-Message-State: AOJu0YwOYqw6FCx85dOB9yMkmEzRRDr3HiSfCacQpLzG+/ucL0obcD6b
	WzSqS2cbccY7J8rO2uLrqufnD31//3W1maVBCJ+rZfLRyPvVDBNItj1AAraKyO8X23k9bVLyCzn
	9
X-Gm-Gg: ASbGncsMBzpP5yxJ1KPRW7y5YHtZ2mrAm3jh8GTRJCelMlj0MNGZYxeArpXT5jvpHdU
	2dDwHNeg5ioDpZPmR+Cl0e67fO9Hj2iMdi1HfV/iWDFRX18zLLG9rLEN6dKBdhc01FGQHwoMYOE
	9RFNXRHZ9vUsQn1WaCm+ZXdBf9BTfQjv23PngA9DbqezMBAg8S6qGBHMxDrbhkZtL9qK3pWu2kD
	lO1cBVkY/8OQoKVprnsvAMy39b+5pJo47Gxb7H5UxFNew9dyRF0Jg==
X-Google-Smtp-Source: AGHT+IGTlpBcb6k5YeTkGn3U8EKQlzzdVQk2arUij8CCL8EMbPFIW+Z2OxmULOsfgBaPIa+UYaFhOA==
X-Received: by 2002:a05:6000:23c4:b0:385:d143:138b with SMTP id ffacd0b85a97d-386453fd5fbmr2208692f8f.51.1733823479256;
        Tue, 10 Dec 2024 01:37:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4c2b:c454:658c:f771])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386352d45fcsm9952443f8f.59.2024.12.10.01.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:37:58 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Shankar Bandal <shankar.bandal@intel.com>
Subject: Re: [PATCH 0/7] gpio: Fixes for Granite Rapids vGPIO driver
Date: Tue, 10 Dec 2024 10:37:57 +0100
Message-ID: <173382347085.25305.7878942557222092615.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
References: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Dec 2024 09:04:08 +0200, Mika Westerberg wrote:
> This series includes several fixes for the Granite Rapids vGPIO driver
> found during validation.
> 
> Alan Borzeszkowski (5):
>   gpio: graniterapids: Fix vGPIO driver crash
>   gpio: graniterapids: Fix incorrect BAR assignment
>   gpio: graniterapids: Determine if GPIO pad can be used by driver
>   gpio: graniterapids: Check if GPIO line can be used for IRQs
>   gpio: graniterapids: Fix GPIO Ack functionality
> 
> [...]

Applied, thanks!

[1/7] gpio: graniterapids: Fix vGPIO driver crash
      commit: eb9640fd1ce666610b77f5997596e9570a36378f
[2/7] gpio: graniterapids: Fix incorrect BAR assignment
      commit: 7382d2f0e802077c36495e325da8d253a15fb441
[3/7] gpio: graniterapids: Fix invalid GPI_IS register offset
      commit: 0fe329b55231cca489f9bed1db0e778d077fdaf9
[4/7] gpio: graniterapids: Fix invalid RXEVCFG register bitmask
      commit: 15636b00a055474033426b94b6372728b2163a1e
[5/7] gpio: graniterapids: Determine if GPIO pad can be used by driver
      commit: 0588504d28dedde6789aec17a6ece6fa8e477725
[6/7] gpio: graniterapids: Check if GPIO line can be used for IRQs
      commit: c0ec4890d6454980c53c3cc164140115c4a671f2
[7/7] gpio: graniterapids: Fix GPIO Ack functionality
      commit: 0bb18e34abdde7bf58fca8542e2dcf621924ea19

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

