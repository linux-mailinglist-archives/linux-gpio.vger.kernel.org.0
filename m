Return-Path: <linux-gpio+bounces-14554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D26AA03C4D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 11:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1217188242F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 10:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AC61E3DD1;
	Tue,  7 Jan 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQpqp19/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F2F156F3F;
	Tue,  7 Jan 2025 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245662; cv=none; b=KAmiPvSiWXxg/t/C5+y6VD60B5UzoQ5F0S7cXsuvbOidE9f0KANP15bO6txUq4Wd5dbL6LsZil8oOZZQoNtYhQ4a+CoSSDZKsYOg6TXlqGxUx81QEu9hXyAYTfNpmivYYbVWR0asBBTr9yOmAULbHtPNkJ8p9e16Hkvnyr0ZpO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245662; c=relaxed/simple;
	bh=5eAz1pH/WnNTbmVbiYH4X02PPs/YmzknBQRnrWr6ndg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=seg53NJcBPm2PrBsgBhKji5aDjp9WuNV6BTeBdiyS6BOpPOC8zOFE1xHMb/+w5YFumuILn92dono/DdkPEtIU9Pt3QD2axKZFWQfloAFSde8tzSSP2x0pYCY3zz4RokyvjLKG7CoQ0sXgfASr2pLPygzvWqWSFYjvg+IyrTu6xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQpqp19/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436345cc17bso110894755e9.0;
        Tue, 07 Jan 2025 02:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736245660; x=1736850460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ9HnyvZEmwZVbqJr6qGWdtCh1jTGR0FCRMcMwfoz6U=;
        b=RQpqp19/Gi80YU+0skOR7eAdAZ1ISnjXTEy0mntK5mRDzZnfb92jvg4TqXs+83YP9q
         lcChriK4Bnp67uG3D9tiNqd8JRapBTmDne3eppLj569TTmd7eLTzyMXPRd5zX40G9p3W
         2ZwD4Amp6xuWTKiOMB8FmIVus8Ho3Hzx/koiLhP2iwjFPUMYxi85gTlFpTxucd7xPVHd
         ajBZgsuVk4oRJQ8SmP5r+e5vc74lJBfTfHatJt/ca0lkFKxhtbvdeT595D9qutAuFBWf
         fS7qdoi+e17xX9mz1ZE/RMxKutbiOyypt+J/V2ZgQDjtkfKZ5kvUJ9N5n9z8nQgZwexS
         mABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736245660; x=1736850460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ9HnyvZEmwZVbqJr6qGWdtCh1jTGR0FCRMcMwfoz6U=;
        b=JgPMfsaA14UZd4ecb6WuEmmOVkv7k6sca7eXiZSAAilHdRPU+r9sU25v5T8mxdfweN
         zLfdH6SoYE25U9beibllcETjv63DBpAC5EXeRRNHRKsqwdjtHbYvVeyD7q8HEhpZiulS
         C447WVO2FXYzL/nH/jzWd0wLYdrk9xBFj1kQdN43I5HNSdG2D1ePD9zD9DLAQloqG/7t
         1cNY0dmgyUmihPCsa8Ic+zeoIkABSkz7hd5ecVNz6tnwhOYx85N4maVLeli98ajKa/uL
         ovurU148/vaZmBjVSMtdU84ey73wmC79CctVJ++MSiQlTDTFASRRK9u1nEbzg9yD2hWe
         mjwA==
X-Forwarded-Encrypted: i=1; AJvYcCUlSpiVrvsBvhCZMKmTDXFw4tWxHMjTqVkD0+4q6eK7YHJcOIWPwvimv3poLpVzNl0TUibsLHnMRoyecJii@vger.kernel.org, AJvYcCWyheMMjQ/wPjdd3XYK+11vYvhsobZwUyU/83powCc0bGevtMHDP7cYPPkEIesWmRN3CaxRBeLUG7Ne@vger.kernel.org
X-Gm-Message-State: AOJu0YyRzfViZN3rhTDquock9IMJ/V7YK3s4IeOhuhC8c3uzPqHav3Ks
	QKobyS80oetKtA3oZstis2LOf00YNmmOvMXUHt0LSgLRTzdoRvmz
X-Gm-Gg: ASbGnct3xDX94eao+m4hqYrBEwqCSqBtukG9iLkyaMM+RFSMDBo461rhA9cnkCneUro
	hEdwWMgvUlJQwWdWT9Uj0PS3YEPXRjIDpaqyHD/7IkaSpQzfEF5380FE7TcKsiR0ipHoVIgEzYa
	Is2KhadXO4b76nq44FVhgk2NGQQLlL0ZgfG+L3Qx/QlgaqO8LG3GSKQBnhiDioDy5d6DK9Uc7Jv
	VSlpX4RGUNsYQNQTM5UneVGRehEna07pjI2Csa5HRoJzKroRvw=
X-Google-Smtp-Source: AGHT+IFME+jwo9DyY+io9y9+//1b2CbVz7HQ36V3InqvjficR+WyexJalQnsLAJTKmmcxWfMXai87Q==
X-Received: by 2002:a05:600c:3b02:b0:434:f609:1af7 with SMTP id 5b1f17b1804b1-43668547462mr514804625e9.4.1736245659378;
        Tue, 07 Jan 2025 02:27:39 -0800 (PST)
Received: from skynet.lan ([213.99.223.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3d5sm598711065e9.5.2025.01.07.02.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:27:38 -0800 (PST)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: jonas.gorski@gmail.com,
	kylehendrydev@gmail.com,
	florian.fainelli@broadcom.com,
	linus.walleij@linaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH 0/2] pinctrl: bcm63xx: properly request gpios
Date: Tue,  7 Jan 2025 11:27:33 +0100
Message-Id: <20250107102735.317446-1-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add gpio_chip request/free functions to gpio-regmap and use them on bcm63xx in
order to properly call gpio_request_enable when requesting a gpio.

Álvaro Fernández Rojas (2):
  gpio: regmap: add request/free gpio_chip functions
  pinctrl: bcm63xx: implement gpio_regmap request/free

 drivers/gpio/gpio-regmap.c            |  2 ++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c | 14 ++++++++++++++
 include/linux/gpio/regmap.h           |  4 ++++
 3 files changed, 20 insertions(+)

-- 
2.39.5


