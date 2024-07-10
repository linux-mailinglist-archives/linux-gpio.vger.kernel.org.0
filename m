Return-Path: <linux-gpio+bounces-8167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B6E92D1B0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 14:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D42102814B7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 12:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A6B1922C9;
	Wed, 10 Jul 2024 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ke7Huj3t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC2A128369
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720614785; cv=none; b=js8/F5I/gkJ4hS3Xj3TpZkWS+JhxMro30VUAx2GRIc5r0Cyy9/PQwu2Dxurl/lRW0qYzPVs63zdl+P8bOtHUpcpjv5oKvCtmcKxAc5SzrzkbQLGvJ4EwHR1xk81xccIyzrxc8O1gBfRVvmqSGKtqiNzN71UnIiLOXIPcLMuJpRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720614785; c=relaxed/simple;
	bh=dIIo+DM5L7Mul8SE0Zhy9qKTM/yeDzVXSaC1IfgMUbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fP44E+YR9yB7mYcVe33ivdI2c/oh1tcWq/ENajn+68JQHj/rxE4D/ieWP+sS7Dv6/VuP/CndqUfNzyS0nge4gUPZlieihfZqDkznwKGEbydz168s6VcGZvqrxkrDcZXbGCxphBKl1Tyky4suw9Q9/ZpdZ6WGwpdH0G2CUFsh0G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ke7Huj3t; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4265c2b602aso30738585e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720614781; x=1721219581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omAOzhzF+5hjuGOZq+DFkIky+4Nl9NLvEEwWei7tQTg=;
        b=ke7Huj3tz4CIBKGfnpiwFlANsjJK868mgb6cmkGgysITX5HlNYwcGEnJenaLJImIbC
         gTEJk0aVzjTH7gav8Q32Kb/IKskrPWsPCTMa81cf+sSQPu5UpHE9uee2D0gU9Z7r3Q0n
         z+T66M56n4alSSwAE2KffCa0Evn7h0gRtpxKihMd6DA/TmOCrAyO2h27ZIzfUZ6L9sep
         XzmZhZD12INR0NRwBcGpg/+JMiUtazOsMbyOA2HRj1K9BVa9zh1VwUFdOsQyTLlXwjFN
         oi2xkwNmpmm26JPR14aVeWMUrSDdLcIQKunPvK9M3j2wswTwoBvknPNydv1TcHTcrL7s
         7Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720614781; x=1721219581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omAOzhzF+5hjuGOZq+DFkIky+4Nl9NLvEEwWei7tQTg=;
        b=CSbnbuutotIu09yETNi9lyqjbi4+ZwFVjCeYvPJh+ntkB1naKzNSPSJg6hJflSAVKa
         iyZACnr6GKYElb00CNa33dJOSwYu/OjVLYqkkC+4tK3uqUjLZJHbp9o6UBleBzpzJtwO
         qvSd/t23fnNcoJIf4VBrvQIxZ0HQSaCUr1390g7t7iSHdxK8yzChnNa9pCYbqEiz5z3c
         tFBCI9mO8oAf3Rx2T9WFlboYIIrE+37KeITJUE6j698j1Ydm/PLzSMeuCW8bHNc7Hmte
         9/O/NaSdtFSvQjN9ooGh4qpdtB1s6czSvg/IMmf3GK/mIJSCtAW3i+MECknrG1R/MjRv
         ZppA==
X-Forwarded-Encrypted: i=1; AJvYcCVMzZUDZmR3Kqzpy6J+z7PRboi0gwNRJR0WLVP7NgHnFuADDRdvNEQqdYOS7FB6AgY3GHz/WPXl6mcYruf2H9v1PWGrJIi8Zbj/oQ==
X-Gm-Message-State: AOJu0YyUgNevHkg3/JgT5y7Olf790uWVi2kQqu4u+q7Qu+gTyANaGEp+
	s5M0rdYMt9XbH3APD9NPcmUTZkx36bzxQgnjHdbfjmPyGC0JqbuURHUemQXuC2k=
X-Google-Smtp-Source: AGHT+IGm0BNtklBkwGnNQeIKpkLcx7sWGRESJuSFhHj/Iw2YtA2cK830W6VnyYne51T2Td0PAaIhWw==
X-Received: by 2002:a05:600c:4a05:b0:426:6618:146a with SMTP id 5b1f17b1804b1-426707cf1c8mr33838065e9.2.1720614781170;
        Wed, 10 Jul 2024 05:33:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5d33:75a6:b07c:5579])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e9666sm79376185e9.9.2024.07.10.05.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:33:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	grant.likely@secretlab.ca,
	Chen Ni <nichen@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mc33880: Convert comma to semicolon
Date: Wed, 10 Jul 2024 14:32:58 +0200
Message-ID: <172061477527.26988.2068284231038760044.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710082813.2287329-1-nichen@iscas.ac.cn>
References: <20240710082813.2287329-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 10 Jul 2024 16:28:13 +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> 

Applied, thanks!

[1/1] gpio: mc33880: Convert comma to semicolon
      commit: dfda97e37de4c2fa4a079ae77737c6b9ed021f79

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

