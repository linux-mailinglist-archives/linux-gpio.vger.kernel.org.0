Return-Path: <linux-gpio+bounces-9528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95DA9682C4
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 11:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 972DD282BD4
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 09:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7EE186E5A;
	Mon,  2 Sep 2024 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zLwK+okp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD98C187323
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725268244; cv=none; b=nVG6vXNonwrUDszXTGAzEXp3x+PcEyCEXaL9LgIYCxGZTMsdnpMDLVyKLLZIR2q0cQ2EvhX0sS2XteMYNFe9KyIWhgSOzNrs3ff3kVIbz6LQAhhNw8G+uJ5M2DT2aZ3M0HC3KlF0YUUlnJ9CJVYdYqNRp/LygUMgMj2LR9KVkyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725268244; c=relaxed/simple;
	bh=gLtzuCSwarsqWnE/n2QnjUDMRFa3rifgetcYyohvtis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IX2nD9Y3RhgRdnWn3PNWTmHWisUwgyuiR2pi/nLCuKp+6wSE1uvPIZcfcB+CBftEMMixXvycXANWyYwS9X0qnUdB6303t/lWFJeUI2MvcYDI3ThER9c1jXMomZb6EpxQp7h24JAHCeN9mC655TP0pImrRTJAe+SW69tlylUcNYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zLwK+okp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42c5347b2f7so17522255e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 02:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725268241; x=1725873041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feTQlQpe6m8ABYWkRp3ykckOGNnbYvWNZ3YH4k9+AFA=;
        b=zLwK+okpmyTL+sJZnelNzFIt3Bv+5pjv3NVNFPBgYBmcIK2NMCV1FVIhVDzFlhP9O6
         OPGvB1Pbnog0n9vITQnhYDDDtyGAZKKgkvUs6d/tRsSaMQuofCvlbPMKXRTX53x/RNge
         +NbJKcpKLbGLHEINdyBfVsBoeWwKmDwG6YsZaSbc8SyqpAJiMMli5tEKyHlrf/RcG5nE
         +Q4LHryE+adsWwHE4FQMihsuZDn8uxs3ULuNdUzyORkqqPM07jww2jVX5lzLUW4ZlXcG
         9UOICTslP9DYbu5lcjNfltQkJCtTXOM5OAyuzV6J87xVlJlJj9xne2eYnFpWpvfPsZMT
         T8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725268241; x=1725873041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feTQlQpe6m8ABYWkRp3ykckOGNnbYvWNZ3YH4k9+AFA=;
        b=DPhXBrlFJ8oPNQ/a9lpWkMt0XcF+zgIigoksbft7XRqrrNb9MR3POlAFB7fLmcQFqW
         78raNUmd2HyeDKuh3hITrZu+hjZM+JXQ9+lWPk/MRJZHw8ucfPdycS0eK7LImEUSWAHA
         opG+B+gjf8yQwR7471OqibMYOgI7pbSdr6DgEFjxJrgsUlCgEsYn/aMnWwMg5JM2WCj6
         +4psgcYx/NYJZT1mKWchIOjf3rg5O2Ob7ySwbvue6RngPKEAuuuf4xUQJzkCISb7/zZt
         q7V+zzLib7jJT7liobBbghF3zPcuuk3yVqiakGmK6dhBWLTpHmwpYiJx/7aMoVcsPP3C
         0KAw==
X-Forwarded-Encrypted: i=1; AJvYcCWTiVb5PG4ham+CzYUxbsBune4TUzZ+BNo2Jf7+UX6war0cyiGkwTYiWL62Ql2TGABMSfIoZP2dW/AG@vger.kernel.org
X-Gm-Message-State: AOJu0Yziq34Dk8a5Et0QG1fbw30N9Fbo4E44Hb5kzDJLGc5HQTzQK3Jl
	h0gsb6+n0zrux497Hj8WQ3x7SKWzLw+dD/OKRYWyDHdB1pVFdSHou99eofrpbfCT1CVSIJcKRfE
	A
X-Google-Smtp-Source: AGHT+IFV8N0zfKLqSXeC4VxoLuFPCTp5JfwKgqTkJ4GlP9W5j2kpVgRQhJqygCon+ojugTmE1ye//A==
X-Received: by 2002:a05:600c:3b8e:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-42bb01b556bmr105669045e9.15.1725268240243;
        Mon, 02 Sep 2024 02:10:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df9705sm130386395e9.27.2024.09.02.02.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:10:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alban Bedel <albeu@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/4] gpio: ath79: order headers alphabetically
Date: Mon,  2 Sep 2024 11:10:38 +0200
Message-ID: <172526822993.12544.15229198628969363906.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821121456.19553-1-brgl@bgdev.pl>
References: <20240821121456.19553-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 21 Aug 2024 14:14:53 +0200, Bartosz Golaszewski wrote:
> Put all headers in alphabetical order.
> 
> 

Applied, thanks!

[1/4] gpio: ath79: order headers alphabetically
      commit: 7b4b93e260c684d346998a3dddc5335957b8be78
[2/4] gpio: ath79: add missing header
      commit: 4acde50b4d15373b55ff23424526378efa681dc6
[3/4] gpio: ath79: use generic device property getters
      commit: 10a968b21b89c647faa26b1f06ea82aa2eef1f9a
[4/4] gpio: ath79: remove support for platform data
      commit: c4a315eaf8eff0d3234600e13db7e7c71c0b3405

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

