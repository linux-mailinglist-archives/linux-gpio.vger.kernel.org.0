Return-Path: <linux-gpio+bounces-25503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EA5B4207D
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3B8B7BD1D4
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6B130BF5D;
	Wed,  3 Sep 2025 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pF9w+/65"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7B302748
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904530; cv=none; b=VJFHpdTYmNOPjg8TqkVifs/6O+cxsswbpyCzRDXgrKHzV6mB/ML3I/DnpCitdQu3USWMxsPrv78NgFuKaSFYoFtzov4PZ6fJIB2dT9sFb2ljlDnjk1atS/rPsHYDTYEF/A1n6MZ+fUvTCOX0W5gJhAEkXOqy3kmiS1CSK0cahxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904530; c=relaxed/simple;
	bh=d4EWq17/UebM229PPNzsNmJWA6ELN305M48QmcRyvnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lu93QfXb2x8JGCIXe/ZmTaQb5rdGLsJJ+5owbvNSMmE/gnNxGfqJwj3r8BnT97hEjyl5NIplcZCGLQJmI0b0oPlXHbhfrJvgUN1iSSsVC3ZbzmdKB/qd6c8vvgPtYOdiIa5BXeuvV46z8diFhKXn6FHe6hvSeQw2UN9lclwj7js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pF9w+/65; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3cf48bde952so4584533f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756904526; x=1757509326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuxGNRHTurlpueuSXm+x9b7Oc+hZG86opaj8n6QNJ5Y=;
        b=pF9w+/65KI07itxzz2I8iegYwfmJfqK7af0Vdo12CzIC1GpJUDx4o7JrGiaQyyPF/P
         hgVAV97nVN1A2iPb+51Qyr/f1O33fO6EX72VSi9owqc0yuy7+u8eSt8s1+m7CZ1Tci0M
         uae4bgjVbqJSv01t+ZcAxSbkouGm7mX6FM8cgWIHk9dsV3quHizCsFU9uzfVO6OP4JmH
         6waf+hxSB6Hr4BQXdSjcdqlKVr3B3Dy/O9hQwszNUGJKG7YjeXNSl/mYBLFnl1IKS5EC
         JnMaDYVXi4xsyCHLMbThdzNWacKG14uDUmWrXbsm9yU4hOIbnh2C/D1cUipPxLayIfV/
         HXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904526; x=1757509326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuxGNRHTurlpueuSXm+x9b7Oc+hZG86opaj8n6QNJ5Y=;
        b=hzsPqpN8L2MlNZE87Pw2Lqx9NDeAdBJ/lieUfikPQRcSAuNpdSSXcBXrYlCoC30k2V
         FoJS7JkKQ8sVFoyrJJLyu8beJIN4v7CVolhBD1DaqhTJGeiODPMjh9F5TcHJqGwExLpv
         sxTsFz4oyuutRb3Y2M9qu9vm652E/51n7tA2Plyuq3oF5zY/GBfcwJAANP9Kukb8KpM1
         f/Kc9c+nQRmkDKWBgOpclMd6m/ScEeYdc2u9gJNVk7A/nzCasKS+N/LhNfUQOQElQqlA
         TVpaDRf3gkJOHQjNiqcW1WoLBhb5ekvyXcmJJW/+qM1hqS66GccDWmOGJwJ6onBBK7Mu
         Lwog==
X-Gm-Message-State: AOJu0Yw0gsM26/dET4wukUfulnpOYPcEVD124jrDd1KR0EBROEU1rsds
	lKhUHDEhLn/WzOvmHYa/HmpKMZXC4hRgZeuqSVWoCXF1IfOGphJXN7rBGrJeJPuGi1Q=
X-Gm-Gg: ASbGncug5BRzo/cR5sEAmZf31p0fh8iGWrpoop96Ic07nMlw9AwMmkHsPEOnEwzryFa
	UdPQ2VQmEl2/b+AI/j6NePdGZ/jtHZGh5B0wrT0gqd5z6/8DZkrSGDL6xdm7KwLSWJOpjXN6r4K
	MFrwKyAxeeHWK3Mt7kI+aNot4JRci1i4z3iMI46mJhvzz2lYJg+BSioALoN1bmHE1bQT5SRH4Mf
	QyYtHQjYR0j1cykTbgyL56h28fdxBfhqvsVXkyFN4m96gsIAJTTa8Mkhd/F0aQaYMokazz1tXwZ
	fi/5nlsQNptTw5AquZCTzBhEAdC9ul0AfbDdjJLJBxAoG2xs4Yqm/02nTnRZoFuBqiPqzdSbnkc
	Yp+RE8uiZYUbCBnOz
X-Google-Smtp-Source: AGHT+IFD6hYWqMMEAu+wOwmrA/EI0sNezIVJV6WUp6fj+0RWC+BR88ePV2sHh1DYdCGh3BnRWBK+1Q==
X-Received: by 2002:a05:6000:4013:b0:3b7:94a2:87e8 with SMTP id ffacd0b85a97d-3d1dcb75006mr11238918f8f.18.1756904526129;
        Wed, 03 Sep 2025 06:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm13280178f8f.3.2025.09.03.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:02:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 15:01:59 +0200
Subject: [PATCH libgpiod 1/7] bindings: cxx: move misc.hpp inclusion to the
 correct place
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-api-version-detach-v1-1-027ca5928518@linaro.org>
References: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
In-Reply-To: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>, 
 Erik Wierich <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AewjXX50XSJ5FLa5vf7+m/5qmPhoYYeprB/MkTcg5sE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBouDxLrUdfdiiic3GGoEMcDRxyb8RicRDbZT3jh
 EEqFNHrRH2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLg8SwAKCRARpy6gFHHX
 ckpVEADdLlAzwKS+7lQSRujGEWJG6ggZsyZg0tdApPyh5O5g+nILhjfnd+eaUvR/w0ej1Q1qdxd
 WO7Xu7Arfj2RsXlejNzW2ogkkxiPzbGSz8SEeXRmARkb5y36TW2KZhBXprOGTXimKPLLP14GTDy
 M5QUZeisIEc2MitzQNQk6AfaI9uNg2Lsfr3I2IZgmR5mZzgAviZ6dQMi3SSbTQcoccF6bKADslR
 89w416q5JDuQ2uCcULmOjE/sycAzPosPuZMgeG5xaQw4CUGIdpsuupZxxxcdamJZUl29tv94jZE
 +3XgQM/6lOvN2Zva95QCrU5YTgrnxGCh4o5srLxZD1qYPLyb1ih8a1YgBMqLleUyR9ReWkaBM23
 Jyx4s9q9iUyf80DkiVk7KwlhXyGkuB+CX+i4p9k7xRZNOCed8tWdnLgoMFyLHknJQ2GpLIA8wOO
 F0V0KJS8t85U1ST61PtntnbIeY9Dd7ob0j/YKXYzD+OV9+GlXOj7IQtVVukZReg+EWJiEsiIkbf
 2Bt/fFxH7NDtHm98jcJ4yKS3WHPI6YCw4GsKoJJS7SGSWHsBBEReuCvyAd8BilmtSciOeNbdfXU
 lwsLrvo9JEPyTlyn4RBj/ii8EUjq8SzyO52wGZWJAi/Zx3YmCIFBAK/q4v7p3pThbtl1MJGiJ4y
 cGFgmm8i/oK1xNg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The symbols from gpiodcxx/misc.hpp are correctly exported to users of
gpiod.hpp because it's implicitly pulled in by line-request.hpp but
that's incorrect: line-request.hpp has no need for any of the symbols
from misc.hpp and it should be part of the set of headers included by
the top-level gpiod.hpp. Move it to the correct place.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiod.hpp                 | 1 +
 bindings/cxx/gpiodcxx/line-request.hpp | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 606994dd606a19d63bfcccff90fdce972148397f..c5fda421ffadad83f5f7dd1e60eed1de55354095 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -35,6 +35,7 @@
 #include "gpiodcxx/line-info.hpp"
 #include "gpiodcxx/line-request.hpp"
 #include "gpiodcxx/line-settings.hpp"
+#include "gpiodcxx/misc.hpp"
 #include "gpiodcxx/request-builder.hpp"
 #include "gpiodcxx/request-config.hpp"
 #undef __LIBGPIOD_GPIOD_CXX_INSIDE__
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index 96050191317f1790c6322d93439af6f93bcbd960..e41f31a115ce86d469236f33730112333a495519 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -17,8 +17,6 @@
 #include <iostream>
 #include <memory>
 
-#include "misc.hpp"
-
 namespace gpiod {
 
 class chip;

-- 
2.48.1


