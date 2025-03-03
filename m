Return-Path: <linux-gpio+bounces-16898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 353B9A4B96C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D4A01889A75
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEAC1EBA08;
	Mon,  3 Mar 2025 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A3W17pDj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2D1E98FF
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990891; cv=none; b=UIG6wIhTWPb6TxM3d69RKfRwoh41kfpj2guMOTQtWgi+LZvb6aNRz53uhpJbgzljUmv04IiDk8KEfJA5EgkcMgpf5+3I/6LI7zu7B7Zo4OX7W/1vyWwVaIOEy71qCk/IIl8vYiF0vnLrxtV7BAqcd164f4Xgf43Tdd1x3lwdTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990891; c=relaxed/simple;
	bh=iPFuGbLFPQtPqFzwDENkWUAO61z2GvV5w4cvc2a+t9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMCbTyX3p+3cXwr2XFA+cZrqT2lWETyfF49x2b0UKjnn43oM4fGOpu+vPh4hO2JCCHrFbsb3vEIaMyt2l+KCDcCJzOTRmE4OiwqWfATSinesTCF6Q0//eAgn5/eqtjDaeTmOFuFEa82bor974w236x2vaWgkNLAdVs/OqKGYq44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A3W17pDj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso7067945e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 00:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740990888; x=1741595688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVro2GWwNaGJu4kXC9WvdopNSLCVYlzQ9STaoYCC7Zk=;
        b=A3W17pDjYKhgJfA6mmgrR6e1GbMN1Yv6AGv6PlN1rzfHZyMjL9MUnxJrCAif3F8iPg
         Ngmmh37O6E8Rz2NZeTATj9quKGUNci3fpFf59h/ZhLRHPEeBZ4O6+ywJQYo0rKpJ2KPg
         FGtusYDHeRtGmZGJKY1VVlBHNd5dPP3HcFKywtohSPlbW5PkPPWcW5IVdBljCMdlFnbH
         v/A+Qs/9sretcTS7QvpT5axshEI6E/rZg68q1h6WZWs1hB4TOwwvg6ywHDEV1Amp2ckm
         xxQSNOoyu/RyOGD0S+zigJW+RrBG87bj/iPkbbnkaEJptVcM8vCKoNbX8h6xbR6t2hEt
         +Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990888; x=1741595688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVro2GWwNaGJu4kXC9WvdopNSLCVYlzQ9STaoYCC7Zk=;
        b=gOpBZxoTpoNt1/MGmqYMPejcksWUJSDtJ3zw49iA6LjAjKtrxj3ytjwCxHFX0+Lnn/
         uU0DgrbvzOpJeGSy3lUwi5/0/D00sp6EhV1nejLM4/Ep/3v4Ix5OR7n2oXj2wCTEK8iD
         4jtljyJYsUaOCaQ5X7o5E7WspUAnHeAcekoJswLowKmC64zEnT6HUY90yMhPAYZ4hu8m
         qlPUAtXd/e0uD1ofXZKJT3WPkmlQsbjmrbshiu0XBgOBBWsMC61GV7/SNL2+nZ4g/hsa
         ZsH6mnPVDddpQy2qJsrvqwHZdaqz9j2J0giNCxfQ1wAbqz33hWz6UaR1yRRP1tOr0gp4
         SIew==
X-Forwarded-Encrypted: i=1; AJvYcCVc0dMEnnE+EEUup85PdudLxAlidKwKJrXQmPl2xZrHZhP0sZ8Pce57czznMC2klUaaEiBGu0jC1WWT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw64ojxop+vFILSiTJjv5nS768hSAvz1cJj0JUHHqD9GvtEw+hn
	FWG1jOkLbujIEajSspNZgFfDnw4Oe+1qO35Tcc/rURUpD4qM9RIqHW68izWitVc=
X-Gm-Gg: ASbGncsFAjhuJt5p1/quIxOW4LOcTa+lsQVKMyPVrZ+FaYRZFnJ1K4dpResdK56CDaQ
	iwrzvuf1i2eyL4Z9wCQ3F6LIgUYQJOOs2E+BJ1fUkr3PKsCGXqFOGLV3xi5+R65KylC4iEqTH7B
	Di7eiYM0SRJn5ElA4WgVScCZXvMHHeFDURvYn/ay6JB51V7MOmD6TWKkwtPiFfoh9JCKWpJAzsM
	AmnqIQ3rJKHS+GnR205+sPoTPiWDl/blTZyMD0k0OHeB85cwQ9lOSxGHWcJix1teYSOG1yZ3YFj
	mX/mKZGXkRNGggcS9sy2cNFYjdEtw+HKiTYp5UU9bkgE
X-Google-Smtp-Source: AGHT+IGT44pwTNA4nyeYj9rXZTnNHuMSqOpa+cLk5QqeHHwy95CnfW/yr5rAJr2fRMGTOGMJKwU4KA==
X-Received: by 2002:a05:600c:a4b:b0:439:8185:4ad4 with SMTP id 5b1f17b1804b1-43ba6747082mr94929085e9.27.1740990887605;
        Mon, 03 Mar 2025 00:34:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532ba6sm180406115e9.12.2025.03.03.00.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:34:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpiolib: deprecate gpio_chip::set and gpio_chip::set_multiple
Date: Mon,  3 Mar 2025 09:34:44 +0100
Message-ID: <174099088185.13023.4679489992150652346.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227083748.22400-1-brgl@bgdev.pl>
References: <20250227083748.22400-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Feb 2025 09:37:47 +0100, Bartosz Golaszewski wrote:
> We now have setter callbacks that allow us to indicate success or
> failure using the integer return value. Deprecate the older callbacks so
> that no new code is tempted to use them.
> 
> 

Applied, thanks!

[1/2] gpiolib: deprecate gpio_chip::set and gpio_chip::set_multiple
      commit: 6224e7fc1ce75edcd03b56a2e0fd4c1765d5888e
[2/2] gpiolib: update kerneldocs for value setters
      commit: 9778568dede2166c7bd124d473f9ec365f782935

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

