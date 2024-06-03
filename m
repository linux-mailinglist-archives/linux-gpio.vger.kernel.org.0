Return-Path: <linux-gpio+bounces-7055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E788D7F20
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9D8D1C2151A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 09:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1754984FAF;
	Mon,  3 Jun 2024 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gXHd0TWp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03811B667
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717407536; cv=none; b=sTYi9QSFPXGPd8y24u8LgKWIPxWib5o3PDDN6OzI75WQddVrBbIdVweF6CSZCwdzrzupOs33zsseci0KrzmdyX5Iow1PrkTvS084lhBNDFZhBtzf7yX05jNiWfk4ZyQlxhastOlCfAzk2rhcI+zveR+ttX74fGg7MY0W0Ukdu9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717407536; c=relaxed/simple;
	bh=ddnxqBrzYel3dnv1DWlgZ8rF1bgffe5ajZec1rSIlRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VRsxVto/4zNo+njSEeaMR2CSR/LGnORunXZTxxHorftVCTPEWSOtvdaghzMXwhZlsfZJH9DxX8UOpU3AYgXRhW0H/jAehjxNsYgmiPxIQtEzpdagrBuEMmKVv1MhMDE1iz9oRlrBYNB0EYodEALTE86nJSy9wrhKP7mCTy02Oxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gXHd0TWp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-421396e3918so13694375e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 02:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717407533; x=1718012333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLremGQ0sNyS/jZjt3mbSnSabu05Q+H+GToTYpUKOW4=;
        b=gXHd0TWpQvUHPvuWG19kgnv+a0T47v2vs+lb674lYf5G+fKtObuZIsmfC5RhaDFHuB
         YaTQ5rgAbDS9e8tnRagGxccwepRUsR4XVMDYG256WtpxXBcRH8MNjzhd2eZEIglI94XN
         4HSsuVqUcZ42pYXggw5NH0ICVpku0/KJ0tgFExNYT9M/cwT/6Z/oXw3Zi7bTnUyKZFrM
         dZjrEwVbFm7EUG/q1fEPqxmIn/w+33XvSeUDDCEjQzuWJxBIMOYe+Q+sjXKAWioXuUuk
         kBIeQYzx7sXpeo3n1Eo6nVJvbQlJyWp9Od2SKeirBvyapzwkmnsiil7XPWxGELco+Io2
         bODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717407533; x=1718012333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLremGQ0sNyS/jZjt3mbSnSabu05Q+H+GToTYpUKOW4=;
        b=GmDi/0pVpm//vwEZA4jQQ2LlZFsmgRkPvBXfW3XGkGxrKQCszJuBQLmtZz0AkvCVxL
         F3/TFaIRGCTHaJh3OlOduy31vS9y7NtJzFpk8cams8af+jSAKxjB2eYPqxlB+mu2OsQY
         X1GmYNEIFYvX51Swv2JPv130+zJbbqN6oJE3mUHdxyOalyZVPgNUV/npUOgTMdK/U+3T
         zATifNvj6a1/F2BEKWuqGfVm05jBDE+U2S0NxCM/W0Q8WA6+pYSjMdLwxSPa713FTBKx
         iPJ82OKyAxwfZ7drwPY+1dhqQEPo7b3b0ghw2vmdW3BC715uQsUCD0QBDRL6Fc7u4B4M
         F9MA==
X-Gm-Message-State: AOJu0YzNLTs9NNZxQv7LiZiP2K4EaKKx/wNmukFrTKNpYlEl/BvzVOPZ
	uiIAhfP4MclaCsCj2O2UWeiA8Am2VqFnbcW4zM+okarGz8TALx0meZDJmgCeVlHq0Rq+MxpC3ca
	q
X-Google-Smtp-Source: AGHT+IF9vc5hM3/oy4C3NGJ8jl8bxBzaA5Zsn2Q8ryEaBAKT8o2+nM/Rn9cGNOi4mrAGj3AkR+QRgQ==
X-Received: by 2002:a5d:64ad:0:b0:35d:c988:6bd7 with SMTP id ffacd0b85a97d-35e0f281d6fmr9998049f8f.32.1717407532841;
        Mon, 03 Jun 2024 02:38:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5b1:48e9:27a3:7085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064afe3sm8191744f8f.97.2024.06.03.02.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 02:38:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: cxx: Migrate C++ tests to use Catch2 v3
Date: Mon,  3 Jun 2024 11:38:50 +0200
Message-ID: <171740752753.36958.11202089472351032248.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531184223.3949069-1-raj.khem@gmail.com>
References: <20240531184223.3949069-1-raj.khem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 31 May 2024 11:42:23 -0700, Khem Raj wrote:
> Catch2 v3.x has API changes which needs to be addressed
> in the tests themselves, hence this changeset is to fix
> those.
> 
> 

Applied, thanks!

[1/1] bindings: cxx: Migrate C++ tests to use Catch2 v3
      commit: 95a2eb76bf634264e56523d3215d1be6c42761f0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

