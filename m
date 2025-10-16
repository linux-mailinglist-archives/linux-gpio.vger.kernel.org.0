Return-Path: <linux-gpio+bounces-27210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A6BE4053
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 16:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94425E31C7
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 14:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8346534AB0E;
	Thu, 16 Oct 2025 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MywwBi5l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B51B346A0C
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626125; cv=none; b=VSIT6W0Abd360/ibdOlvhkHM7NuUZrciaDD1wGrT4vhVAYWpylukbyaN6w0A9/SHum79Ot/C8ZTfl14f7WAi5kmOjkJoirJhiNY1dMsyg8XVRYe1975NK0WgCfBdR7lGRReWg2JhGJSwidU9ZPGXDcrkJOGbZwqQk7yeyx7Q5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626125; c=relaxed/simple;
	bh=fEYTH53YDZJZ8C2Er8bOzHta7ybr+V5+FzGrUdlcHBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/m4ltsvsLC0PvPp1AY40I0PWVV5IfFYMYSVtrwSPA+wf1HYG+WBKdA3wJAR1wAWW7JnLQJWQIWTNUVMsjYXDf7OrbmrmMFB1R34QOxMypr9e4hh9TmH8cQFK7P73+v6e+Nx9Rb2tpr97/JIMC1yjeosV3BBdfY2BUl58yT+u9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MywwBi5l; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4060b4b1200so756662f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760626114; x=1761230914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il5/r0fmHwvIVU3+4q4zkfdvIMAREkRpbu6Q9Q7Tig4=;
        b=MywwBi5lmsOrpsCmmOV7nsIsxLrHGlTjFrIL4fvXm1GqGyoTm843ZETfE08u+w1whG
         Pd6itPgMW/hVeJSiobWZt4ZB/69aeq4PnEAvH0W5wWV9I++qCvK0hclteTx8rPbg0li/
         UECLKcUbJ6bsohZ9z0fC3GOby2FZtqSQVJOF76rdw9zc5NqUSlNHBUNrvu7aNdgfZP6L
         71UD1mDeKkrNLRX/brgQqU6sXugpZl+YIhHoSzEZkol3xU1yzH+ThXGULoSOvzBH049j
         wkgpLSoN4VA8Be25FHV1XILDwwuuyX486uJl6aWr3dkUEPrU1gdBFNPEOq6NuZppdUNu
         iiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626114; x=1761230914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=il5/r0fmHwvIVU3+4q4zkfdvIMAREkRpbu6Q9Q7Tig4=;
        b=COcYGl/3AqfsPEFU/O1Sk8d6KDeKTF685VA9DH9FGumPE11e/mkeHRDXcn3seX2ndJ
         jEQzBQX+rtRsSub2Z2CdSDPOu18/X8fmcC4LmGRBvzvWlegO8CcBN0Z2cQaWb9MzW+6L
         zfW4PXANj3hlNzkcCpBMQ3oDxJbthw+eXhmdK4Gyj558oEy1zO5G8RwfpcmEYPeuX6B1
         /NESA6wexx5i2h9G2OuEmlEewGDUzyJGg4AeYeV+nWIaVrAEsb0j9Vig+Q07tVAxAMBV
         XY/TbuZd6qNpcsluGHHwOaBUPCnVC/YtB6xo1cb8AHWCls33li9WgwugV8J8oedpiRtF
         qPBA==
X-Forwarded-Encrypted: i=1; AJvYcCXQTpXr2jN3vy18JWNg2QEJfQIhZidtUVwD4oWJuDvPlGubJzRfjQac233apYSVfC8qsaTabknnGgtz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3nL6MofrALqWb7JPFQ1IZpBQzoEld/4cOppKturtJwUmMiLYi
	BQX5Y98PxbjaRRA0Wc4qG+N1S5XwrpHpnANXIwZCxzZEfboU/85hkLfLreu3xUDUtVA=
X-Gm-Gg: ASbGncswazFdIR9CV/Hz62lcSQExKaJX2I8FP0MBmxVv2nWXzxfXZNm9+J5BnsZAm62
	dSCw19YNXaTwSm31vhN+4j1yrLNGFqfvrLaLFCehrdFduB0J5dfeHhfh90P6MAe/I+s/V+K0Ap+
	A9sk4Nun6dgR4xLx/pZsspJ1nEhen034hgUBqqB7QXZ6NXqTaQq/Dvp4R25n7R2SbYZaqlLg+T1
	EY4liAP/Ez+lJLM3ZZVsKnGjEzLJGbFhTBRmSDSixhA++sRjNuk46FySm3EmLbg9AA0Y7LLQONS
	tslNRGCscaG+g0noRUeHgut7flymtyKzsNx8uOVBBTMJrjIPvpfDFsGlRwQDFH2rGo2IJXkSiSP
	dn+MMoU0y3mjK0McloVjKkZy8ULTooTCiBBd1xeLpINhv2e5JdSFktsAUYPjlN8avwPaTVwI95L
	Y3vw==
X-Google-Smtp-Source: AGHT+IGU+UUv23rPnRMVt1yR35zGCx+QFDbX2GlDTl3HK/z3KL4fSupr6QTfss0me53/F+Mqd2QUFg==
X-Received: by 2002:a5d:588f:0:b0:425:8591:8f5b with SMTP id ffacd0b85a97d-42704da4b6amr311746f8f.59.1760626114003;
        Thu, 16 Oct 2025 07:48:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426e6f03a76sm19507158f8f.36.2025.10.16.07.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 07:48:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH 1/2] gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h header from GPIO driver
Date: Thu, 16 Oct 2025 16:48:21 +0200
Message-ID: <176062606134.122017.14455806740339775356.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <c7415e2870b3bd9109f95bab3784d48e708e30e6.1760360638.git.christophe.leroy@csgroup.eu>
References: <c7415e2870b3bd9109f95bab3784d48e708e30e6.1760360638.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 13 Oct 2025 15:07:14 +0200, Christophe Leroy wrote:
> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> file provides an OF API that's deprecated. There is no agnostic
> alternatives to it and we have to open code the logic which was
> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> drivers are using their own labeling schemas and resource retrieval
> that only a few may gain of the code deduplication, so whenever
> alternative is appear we can move drivers again to use that one.
> 
> [...]

Awesome work! Thanks for doing it, we really need to keep getting rid of all
these legacy intefaces. Queued for v6.19.

[1/2] gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h header from GPIO driver
      https://git.kernel.org/brgl/linux/c/8d0d46da40c878d082b92771355faba8036aecc7
[2/2] gpiolib: of: Get rid of <linux/gpio/legacy-of-mm-gpiochip.h>
      https://git.kernel.org/brgl/linux/c/eba11116f39533d2e38cc5898014f2c95f32d23a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

