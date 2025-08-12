Return-Path: <linux-gpio+bounces-24279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF81B2265E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B4673A9C38
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63FE2EF667;
	Tue, 12 Aug 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iJ2APG8P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236A2EF65C
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000653; cv=none; b=t2bGvd+KPs95mkugiOyNHbQ4MQHy2CF3UMRZ8TyF0FJzYxJskoY2ocQ/SNsst9RFEc7TjNHO9titv3sZEWml1MH4lc5vyWxHxOe16c3JaKCfmIcWB/vnE71KyFlnZVACGNelv7YWWk5Srgpv6BbPdCYUIr+pc5RfYSSp2nwn164=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000653; c=relaxed/simple;
	bh=f4mmX3DnDN9WPZ0ZlMT/3SKrn3Rg6eYqTFkxnIsKE88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nj4m7IvRsN/cKR173Lc/u/TmFYMCRa+JyaiT0+gLKAJklP8ZK+vAFldu5c6p8Je4rQ0ZTyTHGHsKN1QsdV/UaAu/g6YbUgAwBe2Iz+fTGKXZK0Iojjhf5a7/s11Y8sFpVo5crnbS9AuKx6xcJqr7CE+X6pRSxb3ZIVC/Sd97TXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iJ2APG8P; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so49486375e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000650; x=1755605450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfRZccYyalaxYSxCz0vvdl3bBP0fExSvS+eG4znUNEI=;
        b=iJ2APG8PEce7kV1PzGc/V38nEpbCGEuocq9guwQy0U37Q6vW9z4kfd6pZyJ4UzxALB
         jBr0uCgM58Qo0sJTPplDB+VqcArd556+phQ82dHjTdaMKiJ4e4DeIbjjEaKpO6UKNxU2
         KTBd1waNxYpFbc3b9NmxVhmEMOWyZZF1C4a9x/WGbfWqugb7+9arcOpVIivnP+lYYoQp
         qnUwTcqlgrl5JFduLsstda63CFJOtD/Q6hm4rM1Xj+A2JO8PYueqAyZkLi8oUTeiSSJu
         R7S31NTuBR34GH7Yz+Hjuzyrjp861B5OY+tFebdIhAiXkYgXGkmWfSzEy33PnUsr3l0s
         pX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000650; x=1755605450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfRZccYyalaxYSxCz0vvdl3bBP0fExSvS+eG4znUNEI=;
        b=Sdu41wutotvvQHF7K+9/LigsVPc71uWoRFzqtliKCHNhEhmDi6qRKGdAoc1j10ho2S
         0PkSpNZmHMmAc1DzFn2dO813qayg4+VjRu1a3TzmyCeRahQNHaz8Ib0/zAA5zS0LKcgo
         Jy0ZhOx/F1PRJDjopClgX+pYqIeiUAuKIBC/aNC9hrKWEiPn0bnKca0lsSoL9rD27JIo
         lIHENm9m3tohgjYfGePJkayYOlHdxoL3jXBrqQEr79qoAzyKla8uU6AQnBkJ79ZfZngE
         M3XfbW1sy7O4M/VKW9SGJntlskkGCtv/BDtZ0lQWhsmI/iQvjbQzvd2UdjEslw6Za/8Y
         /c/w==
X-Gm-Message-State: AOJu0YyskF70/1p9DNWrZw9lqng9fVwD2cHM/vjUclhznAyNCpXUPQMQ
	6UKltxSxalLgAE6kapz+T5SW8sZNQTUZA5NYvCBOuH/CdU8/NgT0F9T+n5BwJvIUVkxWavQtJm7
	pADTB
X-Gm-Gg: ASbGncvARTl0mixYWvb/aUOIEE4RwHEc8BZdhD0J9bxxbsshczEBbbSAauSHh5zFtGf
	wSLDsZSSAgsLe15KXF8qqPmnm1WLK2zRp+SQXdEyMs93hRIdmo7q2H7KR78dMBQ/GvK4mIP/FSZ
	Dx6OqIzioEqsAEDvhlyHMWogciRvZySh1MT5Bj0g0erW3vzJdWnBdWsS4KVvwNEbMryPg8JUXSN
	vK8/Aoqz8JLnFRQrtRmlCFHCZVDMY8eWI3yj+rPUC90froTc+/HLCspTqSDCl2WqyZXL1xGh4xe
	m5F/iQzRyi8Hy928frhQznE0A55ksudkptV65bVIS/Tan2HfIRp4+pG1xjltqTUp3t1AJxXQYVa
	O7OplW80kXVyRngk=
X-Google-Smtp-Source: AGHT+IEIGdq1QQlrMY5iXpHdJGhm623X9iO1yw1jQqvbAzny//vbaphDudM091BUd7WzrUSfTrxgNw==
X-Received: by 2002:a05:600c:3b10:b0:458:bf9c:274f with SMTP id 5b1f17b1804b1-459f4facbd3mr130994235e9.29.1755000650212;
        Tue, 12 Aug 2025 05:10:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:35 +0200
Subject: [PATCH libgpiod 05/10] bindings: rust: update cc dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-5-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=689;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0ZAsfoeaHw2perkiRoNKxpPhSTLE9xczZpCn5Bg2rzg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9CBfMI2Zq0MxW8e/B8yQCnVelAdefPt14N4
 iuKyBnt7wmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQgAKCRARpy6gFHHX
 co50EACNWUTkrWG+01VTgBADa1sxf9E771V4JgpOCD1wqgWD0DJR5SFBJZYajr8HHDRRcUI4wTy
 ut4vPo8OMPRcRENLFOfuMqVZqpdL5gpo6JkUO4tg1K8N4XIwNkGbCl42WbyGP8pMmtibnuwDvj0
 RlCCoef1GFxuvpEUBxpVvZBanQr7ng/ag9nQ4hCUkD9TeZp5X4XX5uoxAxPsHi+5ltB4CzCAZLm
 7kTBn4R4YA9seRECzUoMvX7bbJDoXTHeeR6Ub/T+MXrUoqbnm9iPKlcXrCqSJ9RMURJ9kBXu5kT
 PXVpwvP1z5IV5NGsask6aFPF7wzQyddG5vjp5wKhyFnZxWOuF0LkiOdZTtH0tCVBt8QAVF3gPwf
 hj86Z5fXMU9GQ3uADhQY2ns5bVyH2YaPc+PLcU84O7awGMfKUdRw3EuLg10Q0z+JVfwbpMIQI3k
 165rrR7zBNfB+t6ULYrUu8Egi00RNGoF/rYqB9A9zVTZGv8jTJMigP5rqEMeTNJQ6gUyU8pkIT/
 wnXfk0KZV1h29Hqy2jisePYvQtoLC20a8T67/i/XnDNGM9hh7nwXE1z1fq/X6U0/fg1WEBuemrv
 fWo+CO2UrbGasQShYa8bSItY5axASnH2dadlgn/ybIgcqpTVa3bqPnMqSZWvqA1akTc4HeBktLT
 G2djIXnsH2LbwVQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the cc dependency for gpiosim-sys to the most recent version. No
code changes required.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 52ed43410ef5154a57a15e362344347a2b2cee57..7c092db1a4ff30f28a55bd35573cb9cc11393661 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -20,4 +20,4 @@ libgpiod = { path = "../libgpiod" }
 
 [build-dependencies]
 bindgen = "0.72"
-cc = "1.0.46"
+cc = "1.2.32"

-- 
2.48.1


