Return-Path: <linux-gpio+bounces-18291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E71F0A7D59C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77F718850AE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C4022A7E4;
	Mon,  7 Apr 2025 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0EQnU2HO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F71622A4F0
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010296; cv=none; b=Gleb9V3w7H0NElIXXV7FlpPXbF/bkVp5zPt9Ouro97omY9XSbRMqnEecryet3+mmUviOYITJ+kfoWD6jPGF6QD2tFXacSPe/iHNguLANkQlLS9vtjhYF4+YWOkbX53F1U8yC41wNqEkOO85D3V1/8YzHdO46eYq5cbcKnMU4nFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010296; c=relaxed/simple;
	bh=AxvTgPG/08SVbPx+P2b7i+Lqy2PqiHtAE+nknCQ9/HA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AEvryy91tSAEpMewI5EDKLIO83z14fTUuX3rs70+Q685BTzkkWiak/F2RJw6cyGEov5diGQX1Yardh1xbujbgkSbMStX8HTRgJ1igo1kHrsbvZwq5BAPtPbC5o1p2opgvZw8VO5iJjOsKDxu7Z1lRPxI9JrDK9c+emyh4f00W7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0EQnU2HO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so19935865e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010293; x=1744615093; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cc1N6pLgiIuAchfND5sDfdbE3yslYziafjrXEdXiVw4=;
        b=0EQnU2HOzGJ7qX8rKr7LgeBkidOX/Ker53VpxdMUGFWv9B23TYkkPNJFHQas7hfa1F
         9bs30S8PmeykXy+0UES5px2TBsZ2AG92GJWpHvYbU5wSkcwgLIubYL3Ke4iXJtE2258s
         D/EkwLrFK6TM+nJ48s3DAIM3GAhDqyItt1LlGe8Z4xUPFmWEQFQllPtn3taQw6JmdP6J
         j4t6Z8njJkwngmb1cuU6eRAA8H/w/Fwm4m9PS+EfDc+IX4jfbyvso2kVTyaxmltEi3tB
         Coy35TeNIcAEDxv1EFGlZijqkCUWwptH5nhmdUnz6XRrfyMAyY7LPtI9VETlASpxeShR
         NbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010293; x=1744615093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cc1N6pLgiIuAchfND5sDfdbE3yslYziafjrXEdXiVw4=;
        b=iC5nxyYKNCnxMyVnK/r75fS7l1GxxuOx61MCKbAwP2igDhxDB6IkexqTBzvc/HS+aU
         /dfF4Q/tiG8QPsVNz5SjnUhiOR3q4PTE/VHUhMnW0McT9w5M8PzJKMJkeI0qXT4ZzMPJ
         IBf8DXa85uT8dZG1HiHkGaJc8PDxMf47qSFCDpjicPKnCaqD9BFMugqTBgp6b2kiSGCQ
         hf35ynwwHU+6tM1SySjItxJmoanXSyQEXHKb1uv9fGdIKOsnwnHqHueXeyQgiVU3OH1b
         rBIgjxy+xlqI6/8a4iXcoWsRx8zN0c5/t3R8VSvrClTmwxSCiBj7Eeah9X7X4bxaBUQd
         oh9A==
X-Forwarded-Encrypted: i=1; AJvYcCU1PUndmPH26Da0W+GeIIImmH//S54d61L2gLqLdBiT7GdTMdT3HeOgKNdgdo70Z7sLdV1GMymZBKVd@vger.kernel.org
X-Gm-Message-State: AOJu0YyI8XjTuCDLN6jlaRAK3I1vFzTljg6aeyzK21mboQ3rgGAID7t0
	z7HVod69EY7tEW/6n0xPZHdO/wKamIsKSjGs+TE4kjB1cbX1Hw6BGXVGSieRnLA=
X-Gm-Gg: ASbGncvZEAAJ/7BwPwmF2QgdeK7nJpZiEXAGgwTnWOb3RLft9yA3savLiITeKr3KpND
	PM63gcmbebS7Eq5x/GiRCw7qc/cMCITUVAbDAvHA4JL9BjIDEsT+DfoILTTuqanFILjWdT+TB82
	ooqdN2j8Fq5r/N7gNZ+m5DzGgZjYEg3GS0rQn0T5MWvkwF9umo0AFpk0sFoHP2+I6v5+3nHKE7L
	rTPaC3o96OXuZ9D48NHU6R0x7OF6vTayC1mtcrYfgg0iF4Rr9AdvAuUj36y4JcdRcD7nvrueh+G
	CeCNfUBEwy1sjJ/mmlAcDR+IiwvZHqA09bbowEZMaLy1iGoY
X-Google-Smtp-Source: AGHT+IHCWOO0RTjiSPCdhaAdwwAHJp08f52xwZ0fQJ2PMKUV5lH+ZzCTORm7kAFQ3aUAQ3rCpIsWuQ==
X-Received: by 2002:a05:6000:2403:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-39cb35a9bf5mr10149672f8f.33.1744010292920;
        Mon, 07 Apr 2025 00:18:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/7] iio: convert GPIO chips to using new value setters
Date: Mon, 07 Apr 2025 09:18:08 +0200
Message-Id: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADB882cC/x3MQQ5AMBBG4avIrE3SUoSriAU1+DfatNJIxN01l
 t/ivYeiBEikoXgoSEKEOzN0WZA95nMXxppNlaoaZZTm3cPZA56jXBwSA44X1Rorpu56vVIufZA
 N938dp/f9ALfLZGRlAAAA
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AxvTgPG/08SVbPx+P2b7i+Lqy2PqiHtAE+nknCQ9/HA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wyiF9eNcG9pcYjFYXO0nvnqmICDBdUhsLGF
 tiCIVJqOKOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MgAKCRARpy6gFHHX
 cr01D/9cBNJG8dIVi5vVhhGlLzoHYUpOqFtbUbaQ5D/RgpGGyaPBptye2CxDZ4rXCs0BxFL7Joi
 9D6ZZgQX+7AIY8sHuBmMgGUL1Hi5kBq/JKE2RdI9wZAGn+7z/eGGzJgpcvzlGkH8S5N2HnY3d7D
 OgOyfjkd0CFmRUTwd5Y1r1nP/RoNE63WosR/RTbBbs1C2emRU8McPxg6sz0fy4UbYhZil7RGybt
 V8Px+Wpjn+f1YcsSKWLcP6hv1uPI9Luze5QMDK+GejkztK0Bgz5X6Kw2dXJQw7EN5dzN62fIgp6
 MXZG511YXRFxmU0P+9M26/Z0Enx+/7MXQEZYAz05nNGeDi0mj6hUMTnVovAITuUJAmpkLMVywV3
 El3bnX9Y2KoQkZ7LunbVGuWOP63jsdq1rk5+DqUbSo/AFySfD+6LgibaFiGn31ZUtJ/QbXK7qxT
 CohpiPpx65Ki6vc9y/8qHaOt0lOCMVwyVcJrXbz0jsoTe+Q10kVri2DxbNVgc/VcQAd9n/eqk9m
 jjt54ZA2Ehq3+ybllfeybfr3xiRtkp6ZpVxSvQngz+U57KSDZ24O3QPObQIwNmGUecRacSnXBQP
 62YwsaBYqIeZrezcMohXGilqH03MXeVnEt2mCoJfOVAZUg97/5590ulnDagNJukCb2SaPSsd5qT
 sbCmCjMoDLrg1Vw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the IIO GPIO controllers and also contains some additional
refactoring patches for ad5592r in preparation for the conversion.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (7):
      iio: dac: ad5592r: destroy mutexes in detach paths
      iio: dac: ad5592r: use lock guards
      iio: dac: ad5592r: use new GPIO line value setter callbacks
      iio: adc: ti-ads7950: use new GPIO line value setter callbacks
      iio: adc: ad4130: use new GPIO line value setter callbacks
      iio: addac: ad74413r: use new GPIO line value setter callbacks
      iio: addac: ad74115: use new GPIO line value setter callbacks

 drivers/iio/adc/ad4130.c       |  10 ++--
 drivers/iio/adc/ti-ads7950.c   |  17 ++++--
 drivers/iio/addac/ad74115.c    |  18 +++---
 drivers/iio/addac/ad74413r.c   |  28 ++++-----
 drivers/iio/dac/ad5592r-base.c | 132 +++++++++++++++++------------------------
 5 files changed, 95 insertions(+), 110 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250401-gpiochip-set-rv-iio-b064ce43791d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


