Return-Path: <linux-gpio+bounces-22958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED7AFE04D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17A1D5405C7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E3D27CCC7;
	Wed,  9 Jul 2025 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bzykrB34"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3470727AC32
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043354; cv=none; b=EHWifAXp1BTE4+EdN4gA8sYFNs3orj0RcfLWpKABKC8/OHE2Y5Qwf5uma5yFlnKQNSZqK8u0R5+ZEHkD5Dx0Cgs0uK/+OaEksKToDASlJ2m8qR6ODbus111mKV9YD5KyXEDTZwqQf413nHi/8BJ1dJ2YhzNopRf7r+eg+03uL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043354; c=relaxed/simple;
	bh=kzFKN4i55dDhwqRLDyNACYNKst0Ab6yEzRy7vcygGJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1fz2wYkHflqZYPK4tsdLkagOrlGcYqD5I2Br0LLIkls8p37tZaAOx71gNY4cVTpVIVMLiwAYEZOoG7ifZkXsa/qep2NBIi7zQN30HlDOQFjh/+o7CuOxCsJez2xjy8KC9jJm6QZZJxDEzsU9bqVGweeEDRmWBl5WgvUncaiCSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bzykrB34; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so4117413f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043351; x=1752648151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUrgUkOHTyOnDe6ndwQPZ7IvM7nkBad/sckqQo8qgw8=;
        b=bzykrB34RD2Y+TRHLLcRElV/FIo9JL5UTYUFYmDL8vgjJcZmFDYn5t06eTxWPO1hrM
         zgVdSqPu5Sxo6Ms+VqOJ3ZBb/MnsIol/PHpNkCYZRTb5lfc8jOy28HnaeNBhfiyUolUS
         3PqveuQve71m/vNs23U3hM6ECYYSeGlCUHNqnS725xukPCr/Fq1aa0QiijhO2KJZJbyK
         Lqq/GZzv6D4rrZ9pHoJMwd4MZuHfYJLPTNT1/VZpOtJxjJcsfN+bRWkXiqIAH+p2U3Rm
         grVqwodViv/hrs9B/kihGdCXwTsb1yh2KmDK+4BnxbSZzbGMQOtGComjHL9BvVyv/k2a
         ++yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043351; x=1752648151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUrgUkOHTyOnDe6ndwQPZ7IvM7nkBad/sckqQo8qgw8=;
        b=Akyu4alN7KLtZN/w0XTvXjhkdfb/62KZfMCAutIo0bXEDxsCAto9xIbU6AOeuZIG/w
         hVYzBVSOB1yVe8OMfLgHJIuyirPncHnU64Y0Hzv2RwI4acXMnVUxaJANCKmTn4pyz4gr
         iBjaKWEU+Rk8Rm1qMobSjH19Jgw3hNJrXuvEoD19dqsJdZ7QC1uymC7WGT5W8UQKVMqZ
         5d+oFXTU/6T0oM6cyBn79BjdQwO4UV6CzygPpZO4u8hRtWQZhTu6acdOvf44bg5VTPD2
         fh2IfMVSOMq0wSYXNeEBCg8Yb8L/ZyT30uQ8tPCue1a0SZT8kYLzkmAymcxUMnQgOpkY
         SpXg==
X-Gm-Message-State: AOJu0YwX38CU977a1vXH9gR4mlUwfi2DOoEk631acoODPM08YBiq2phL
	8yUI201PtLajeAr68RzeAc0Za6MuJi/s6+ij1VRHFzVMH1PPm+xq6s0W6dzGtzRiAKY=
X-Gm-Gg: ASbGncsUuhKOuDPqS+nb3fQsXpVdmE7buopML0f9vnCgrYl6EtJrAz06KyTW0l5KGpc
	b9kTXpfIJvWHNCyIf7pHv2sghO42PjJpSrX/J7xvpJBeTr2UuZdlDAPPg6HGjCHWVXezGW8ykvm
	flSkUOlHIxmJ3YZwwJQRyyM3hDYP8bOEzGytLQ4xFgP0YwVxTRxquFIYte06kHbEQMrzvlrVTvy
	2wx2En7hQ2tZIOn+v4sEclm68lCe+7eLKyDj/6WKtNPdUsEvhejKKe9XmVQyTLG1QJfL2xqxvYf
	u9Kgj9AlbCSFQVnYIX+KflWxGimoM+enadmYr3gDAwGS1sGa4T5BRUgq
X-Google-Smtp-Source: AGHT+IEzSFe7nz0LVy96l6aCeTa6SGcfCDu8HOJfAJ1g24SiaRH5ftoCc2kEuJ1ZSbFiHDMmZGd5bQ==
X-Received: by 2002:a5d:5d09:0:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3b5e4539694mr711424f8f.51.1752043351497;
        Tue, 08 Jul 2025 23:42:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:51 +0200
Subject: [PATCH 14/19] gpio: xtensa: remove unneeded .set() callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-14-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Qek07sXB/VWHFFd/Pd2GDtyCQUKPAvQ65Za1xgZnGxc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9DZWbVhAOoLSv6rDoZUPM3EtQkiANX6u7uB
 E89Yrm3x7SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQwAKCRARpy6gFHHX
 coEsEACfHdA2HRf+Kt4GEMSKy9oDBI2nKh8kVKwaZg53fNd8Qqr/n83SqIapZgxvWklRUxhPUhA
 PsUUZOmkRw5hAohTpOPhu8iCsAqtqGqnHiuREjgPGhfKwbor7ZkWDIrQliXRSsSx1PX+jDXX7UK
 GNU7Dehfsbi4FY+W7jjbENfrVfqKhGsSDoJe9Rd4UosUeZuK3+yrn9JVpkT5Cwr1fwmFfHOJBGO
 t11yRbMK5Z+3NWrDKToGYbOZRkGpU4pTudLriEtz/1V5vk8R+iMq+nx1GXqNvXsLXuW1FW+Yt9s
 tv/NiL4WnkugYxLNqm9GkopYqDA4QgCgmR6VSSN05xqJsob98NB3Uwyx8cLn39nZL+F75NtL3lH
 jItmvr3KVRRDaNOLF71MDBPICPmZ61dgWmiAjjEd3QwnoVhC0VvzGLSHzCgP9w7qRF7nmuBjFgx
 Tf0oeKHbLgtswWlSyB61XEw1EP2RHxxLRq6ovNQOBvtoNF4fUVMEdpUBQG/vO6TGaswky7IqRbH
 5m+yooGgr87lI+fQNel7WqiyAuy888mRUG92GI6J5+afggISI3jbIXFwiSuKcqFXERR7SF7IPDB
 BT4cCxvFYMTn82AO/ii/MLkZ4fho/ZFKPmPQ+uwd4B4CKYZ6Tx8fj+huaVpwmFB1QHA7gMS8V0U
 nRwWTbTTBThYHFw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core deals just fine with input-only controllers not implementing
the .set() callback. Remove the unneeded dummy implementation.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xtensa.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index c8af34a6368f4f69f9960fff7f8c27a2c8ddea8b..341b691ac2345b93320a6e8b933444d26dcf50e6 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -86,12 +86,6 @@ static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(impwire & BIT(offset));
 }
 
-static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
-				    int value)
-{
-	BUG(); /* output only; should never be called */
-}
-
 static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	return GPIO_LINE_DIRECTION_OUT; /* output only */
@@ -128,7 +122,6 @@ static struct gpio_chip impwire_chip = {
 	.ngpio		= 32,
 	.get_direction	= xtensa_impwire_get_direction,
 	.get		= xtensa_impwire_get_value,
-	.set		= xtensa_impwire_set_value,
 };
 
 static struct gpio_chip expstate_chip = {

-- 
2.48.1


