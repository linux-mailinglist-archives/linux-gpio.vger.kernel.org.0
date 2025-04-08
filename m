Return-Path: <linux-gpio+bounces-18427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66195A7F5F4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1FD07A8234
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE57E261585;
	Tue,  8 Apr 2025 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wyhQaTWB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A27D205E3E
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096875; cv=none; b=h+e1b6t6h6pZ59Q5FxYCPHKZe/u8rdAkzYTPyuY3oTa2QLw5Ki4vLGNcQHnjJkLZp6UeN3eTDR20vCLw/mBWdapSJLzg9zf5bm7ZB25CRKuhnL8MwCSkviT4LqRKvdUXVIVxSIVkGlD0qs9dEBindjOIWCoh2Kg14hF1nfrzgHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096875; c=relaxed/simple;
	bh=tXCJ6XOIP5UMxUMzwAAhIQV73CiyhZPXy/4pnKrXAZE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PgXYu4CNKgSxxzUOMqFY2z0ZN+kxuEiDSSGMxHmZAA57NVab/TUe2hehMgSoHrxq2zAjjNJNjF1v0iKqgI8M5rot40X6on9QX3sAq+mh1kAfBm94KsCGcK6UP3ZQqm5TH1ayMyu1mpSOQUHkpeu+sY1wvJQyXflkv7fzSz+ju3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wyhQaTWB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so2979128f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096872; x=1744701672; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TE8KU3GgwOIWy128lWSLTsSWedqlmnBG56cma81HI8U=;
        b=wyhQaTWBYnU0BdI1xBTzuqMfyx7jo4ij84pK6NpPkQwQsGCy9gan/LjvqzfVBTBBVl
         8bOWogWbQvJXcWVpw9lXYzyQeohQ33a6pURSzUULnEPFM69cjeim2QpcM1ZjV3QF4nZx
         8TMrSrLiqC8s3rqO+deV+K2uwdilTLKBEFE7QfZ9ASSxskKDV9F1DNwrQP+f82NxfbtT
         FYJIxdLcFKo7OIzsBLr3wHq4KddeCv7b/VYU3+Uk1indUn0Dxs62JjRjYJyJZCC6U0fK
         qdX5MOWoH8w7w0qi/Zz5AlGG9SSm6xZbDR6YKMEFanIewA4oBvXor3+4xKUW7wG5eK7e
         GMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096872; x=1744701672;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE8KU3GgwOIWy128lWSLTsSWedqlmnBG56cma81HI8U=;
        b=i9cf0aR/pzF9KdTZBGu2J+AAq6RYpQbYMRoOlI1mlIV1uZgmSCt4U49eO/X2yxdI/f
         e7wn9rg+C7IK24sAEYEaGRg3tcDUnWlR8FmOGgNvGHQvo4Tt0cOC9EzFu0RIt2ljTzv9
         sfI6Jd/gzzI32aOGdJPohp2V9SIO9DAMYILPO1/Qrfwu+3UZzku/AeFgg3oIgkDYa1FV
         277XGOtFrWb8SG/qR+ZkUw/OtnOmi0mT3ft671qYHac07jREmXuTB57PGv+3oM4Saotk
         bVv04tnK5Zs43sVe/uFY6QmzhAD7t0UcH6TKxChTGrNkZhW/3kZAu/LL22paoWKuk7a+
         6BGA==
X-Forwarded-Encrypted: i=1; AJvYcCWs+K03OG3tLHWIV9yhRhvAzSAJqCWaXejDXUOrNEiz2rUaPWZISdvqIHWynI5B9QWkL4araYuWEpiC@vger.kernel.org
X-Gm-Message-State: AOJu0YzqSW2rG1z0b2l3h/jYxW7S6dJFDgZJ8VyrLHXM3czVb4FjZmtv
	BgUdqVSK/wLTI1JjN8NlS26mQBmhRjv3z48WTPANou/gUtxogrnWOp+pxT7YmbA=
X-Gm-Gg: ASbGnctEDZObkfUkS5DxaZV2xu64pMzc2tbnuN/akUU6vc8fJJ1cnLf2fue66D0mk4a
	5HaH+6rWbK2M81SnQLcJAr6mfskBxO2oiRJc7RSIPDaJ4jLsBjDRsmTcc4rD9dzo55m60TUqXXj
	I1HzIiXKLt1Uw/LDbT3X6dhHR/wbxbV9r55K4cdovZJlpptj61G9uKrKC+NoScLl3IPhoKgc9xB
	DF/Faux8JHpfdUwtUfKrYJT/pNf5QEBxpRqTTFJbCKE0SBi/lr7lXjmTAgA47tB4J1cVK9bqOOd
	BxiOMpUTp0bgvE537IRkD/TwpgkxbyMyrc6O5A==
X-Google-Smtp-Source: AGHT+IEzkrRzBMtSl4ctUvpMUsrqjcehR8fZ97eCkYCoVM5CevnJWRctAuT077lImW/GKdTsztThZA==
X-Received: by 2002:a05:6000:2403:b0:399:71d4:b8 with SMTP id ffacd0b85a97d-39d6fc293edmr7415263f8f.23.1744096872357;
        Tue, 08 Apr 2025 00:21:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
Date: Tue, 08 Apr 2025 09:21:08 +0200
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTO9GcC/x3MMQqAMAxA0atIZgMaUdSriEOpUbPYkIoKxbtbH
 N/wf4LIJhxhLBIYXxIlHBl1WYDf3bExypINVFFbNdThphL8LoqRT7QLNdxs6rHmoV+oJyLnINd
 qvMrzn6f5fT+J7rl7aQAAAA==
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tXCJ6XOIP5UMxUMzwAAhIQV73CiyhZPXy/4pnKrXAZE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5m0mAka9slZ1K1D+jsHMTs4VAcc/p4oxLtN
 XB1vI9OBBeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 chuuD/0SxuTx4+pN8BePlC//dOOUmReVczVf6jRowNhc02sYQt1a/bPYtM3rNcNcqdMCJDF45ud
 MfOXuA0DsTxCBEI6ccmItFp7dkfhtlyr/A/bTC6ITmXlGEDYgQSJ4c6R9DamchQx4oM7L9jqNiA
 LcctfJw7ge/xHBhkcwJ1Q6eKug/cu2FcP55KjiXS7IResKIi3ox/5loej5E/FaDUQsOLvrZkZ3n
 vfWO/NNW9ujF1DuPMbBjHOakESTkGQzWuXTyfVbRbKmab15nsBL91W8NcRXMqFXODIETP1TFKXp
 9qlaH8RAC+RNkm1HVzALgp1IxX85h+TqJIot5FPsAb+HBqP1yeLmdolkGMJjd9clUO6STS8Jvci
 +/+T5YAlLV0lRjKXo3YUhb9j9wmRa3Yqm8S2uLgaXVx+ULhzyPMztrr0ikxzEj6frq0ZDDDB28p
 OMVGh/Wz9QcHVhTuI6TcD0fs+owDNWwrD+v5F8JoCWU0Uvnit2XhoYETY1yWDuX2jKBYG0BVVFz
 r+ekbp8lykB6WpWoACh/bCvrDbhKL5JXghXg6hZl4WW+n8liV0/Y64jVDqPGhUmCZx4OQsD7Qyb
 kJWluEDSE6xG/lMhcoE++E2gaGZJOQZAMAr9ru4dMrpYEPlBKsybqw6y+CofqzWwT2GzsoDXvWQ
 LawoqFDJt++YjAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of 
converting all GPIO drivers to using the new API. This series converts 
all powerpc board-file level controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      powerpc: sysdev/gpio: use new line value setter callbacks
      powerpc: 83xx/gpio: use new line value setter callbacks
      powerpc: 44x/gpio: use new line value setter callbacks
      powerpc: 52xx/gpio: use new line value setter callbacks
      powerpc: 8xx/gpio: use new line value setter callbacks

 arch/powerpc/platforms/44x/gpio.c              |  7 ++++---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c      |  6 ++++--
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |  6 ++++--
 arch/powerpc/platforms/8xx/cpm1.c              | 12 ++++++++----
 arch/powerpc/sysdev/cpm_common.c               |  6 ++++--
 5 files changed, 24 insertions(+), 13 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-powerpc-1e98d28222aa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


