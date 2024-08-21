Return-Path: <linux-gpio+bounces-8931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C79599C6
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 13:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 435981C21643
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 11:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDD2213497;
	Wed, 21 Aug 2024 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0TpbejM6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D15D21347B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235528; cv=none; b=uRy8Fv4qRWkl9t6oH8oeUQECAUega56KdcOQD7ZfbjfovjOgsGVKgF6NPwHyCLRjAMxzN8UQ1Rh3+qonhiT4RZ42jVn1ZbIkMFcih1cvw2nCktCAxFmKc6xmJV/LKPB02AbWw0ABE+CIIf1oRPbMrRGu/quxoBHDcVhL1Pjh85k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235528; c=relaxed/simple;
	bh=IrCwK7+BhTrW4s8TxW9PL2T+V+PgKFD8aTUduaq5fpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEBwHMkQolLTVrkHZBD/iGebzjORssiXWL4hGFa1OclxoVRrH9n9W7qpC9BXrzV326LKipLzTYmxWLcQcQmT3W9gNhY5SlkPNXi2iFtlIHIEHnerF0aqaByZ1hLTKsjziW/SXza1rT6MiMCMzz7RajPIzjh/TuyNHM+54ftz++A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0TpbejM6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-371a6fcd863so2728594f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 03:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724235525; x=1724840325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOpfe84wOW93OeXxz7jrTStdA5m5aEo9lGe57jDguWs=;
        b=0TpbejM6ZZ/FmttNzdkwo5KUEzGKjcy0giVzgu4KMbcsreNjNsN+nP4zFDWA/wNQI0
         0068/Dtb8FpneEW11L0Lsp3iqvANB4mBnBCLW2A/RmdUXQLYqXXFFDw5vC9F2qmbKzNP
         1fsTmZdCI4Of7kqqbOxhA5UohRIYWec7XmBDF5McIVXFWBX3y8Rttwjg6t1sztfMHrO4
         9EeOZwL6L9XdSc+8Xbic/mTsaipS/9r19MgTbrwK7V/kas2Tr10sHsORlBGHLJ4iEHvn
         WeJH2TQRAl13py8quhZvImTL8m+RX39snyN+PJ/RzhCqeWIsPUSFgmGYyI8A4OU0kjuD
         fqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724235525; x=1724840325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOpfe84wOW93OeXxz7jrTStdA5m5aEo9lGe57jDguWs=;
        b=DBMjplwSaHdILeD6mcYxLewCQNj5InV77pPgvKGc9bWqb+H/+wRiM4EXVUgA5JXI9z
         tz+6qLAZLMfRaLhx4R72a8kxTt/I7dqWhP1GaW0vghRkXqD/0lO5FiaIv95JWx7JgADs
         CRCVRCh5zqBvzoArs8B/khZcx3gsIEyh3wgcebOl6eNPZ2SRjopvrfSawMX6xoKpZ93g
         3gO8FKy+qm1XLss/bwh/28hxwPJbhBS4R8fzLmpYqnYMK8VbQCb2wWQ4nCoAaE5UcpeT
         Xmdb7ofbQ3ApEZgRVmJIWcpQuIyFn441W5D2GFOoIRIuCRqTRUj2nTwUt4M4y/VGOvay
         U65g==
X-Gm-Message-State: AOJu0YwwOQ5/i7kfpimDPcF8DizaNjhiJY0sGQ02UQyZqw6SMlhJU/Vk
	utQ1VY6ypPLCAIslkyu05RJRjI1gMDCUiqcWwXZEtv0yqrGiesp4/tarRFVanC9NWNGy5+MkKR4
	SmLE=
X-Google-Smtp-Source: AGHT+IG0k1QWH7EKXa9xLkDmmWS8z6ihVQWOwECJ2n33gs1mT2RgoNUQldG6ksqRS6M1D2rj0dMnUA==
X-Received: by 2002:a5d:43c7:0:b0:368:4c38:a669 with SMTP id ffacd0b85a97d-372fd5a85d2mr938977f8f.10.1724235524723;
        Wed, 21 Aug 2024 03:18:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:42a6:b34f:6c18:3851])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aa8casm15437433f8f.93.2024.08.21.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 03:18:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpio: virtuser: Use GPIO_LOOKUP_IDX() macro
Date: Wed, 21 Aug 2024 12:18:43 +0200
Message-ID: <172423551979.14185.1510477772723968102.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820200858.3659995-1-andriy.shevchenko@linux.intel.com>
References: <20240820200858.3659995-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 20 Aug 2024 23:08:58 +0300, Andy Shevchenko wrote:
> Use GPIO_LOOKUP_IDX() macro which provides a compound literal
> and can be used with dynamic data.
> 
> 

Applied, thanks!

[1/1] gpio: virtuser: Use GPIO_LOOKUP_IDX() macro
      commit: 2a4727e6a8bd1d2b8ae7abf95061eda0457c4d79

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

