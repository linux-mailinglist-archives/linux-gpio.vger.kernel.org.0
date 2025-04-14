Return-Path: <linux-gpio+bounces-18796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AE0A88D25
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 22:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3F80189B219
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 20:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF6D1DF971;
	Mon, 14 Apr 2025 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xGMgyMB/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB21D63CF
	for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662626; cv=none; b=VrlAd1Yk3MfaKLY3YKsMabMR61rsYangl+tt19OZkPxb1W8L1TzXuznJDBA2I9hud14lWJ3fmoqYZKcHFqx3FL86RKIWV0ggLwAW3XGbPYux26DX+t3d2aLRx1TSvEdKRnSEdV7WgFVAYBsovV4ly2/VM4Hj00X78v1AFQTTIM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662626; c=relaxed/simple;
	bh=kcpXaZHBO/DH75qNWenAtc1oMgVDZhFC8WpCuySDPwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSdCibQ/wmXW8jtyqtTRDbeG2K8HFh4leV5wryxhsr3WxpqFGU9I6Hz6sO6vjhe7gmxQf9722rJlzkOcMPuB/WVQSzh7UnwrzOcFG0cjYmvLm2/6xaoecypLMVVKb15hTCxHcHMhmzR3U1tQs0RNH6Jr0o0aMKfpC7y9Ha0vsws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xGMgyMB/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so51536165e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 13:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744662622; x=1745267422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/tvYAr482dMhW0r4PAzZsFCs7NAvJS6DBb+Huw3i8w=;
        b=xGMgyMB/4bEvu0Jtx3cXts+vRiovsUmN3BTLMDJ932uh3tbGTBxR8p2NG4x4izHDnO
         wKx+MPhIQ0NDBfAAyu5/Z8AxVm7n61VfoAmF44O5AXCKWQAIrLUMwJAExG9ASjg9gyCo
         Ns9dKkQASMESuRmmoxtE3mbvwHJ1iMpQvUV1DtXu/AB17x6NO2RzB89TnSDqUXaHRuZt
         fHUr8AucIGcjdjofHVrTYo63QgbNGuaGgGaLnKJZZLtRUuIAfcXiTpoxOAIIewEY7l+A
         sP8gqXssj8L88nOdRWEKwg7NHypwbvYqUb6+G7wjSg/2l8sQ4gcoFNSH4NsLpiKCzpZh
         qzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662622; x=1745267422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/tvYAr482dMhW0r4PAzZsFCs7NAvJS6DBb+Huw3i8w=;
        b=UpDKB+hpfaDup2Yzcp/BInfh1iny95RQqRTnK1mh0PwUDebyq7QTXraDsUAM6ZYLJT
         Uc7svXpmwR4o1da1jFrjPV+KGJhVgUfGHmMRVlnY22nNvEn2bw1RXZplEEyRCS9nuhQr
         eQadAS6gg1XUgZlwgJY88ShrBEsGXUxc85LaoanASz5XcGU8Si9wSodk2kN3zO73P/Gf
         DdcprkRyF4mJV/bR394CxEW8iRzJQ1uubUxJVJpbI6vp5/YjSngj9k9ZlGZTx6L6rZov
         B1HeLpEOZsudv9XA+qRP2JnV0q+0Xl034FXj5IcNC2mgNvZODumOf8gBlJLVtOW7XgsQ
         LQxg==
X-Gm-Message-State: AOJu0YzS25PXErOlvHIUvmfOZBZ7cAw8jOq73rk03l7zOxtHgB/FGbjm
	v20cQgHt1dwHxwFbReGLRAXuYq1OvonnbuhNj50askj2rqfnSqzRBliY8nxldpFKNbzgfkaEO5A
	MWeg=
X-Gm-Gg: ASbGncvj35lQH6N0HU3Qot6OTUVpl4m6yar6kQ2AcwFbkFo08LQ2yvq+6yEo7DxMyAI
	ez0NjHdKGjpGomssTDSFN3h1xQa19ESu2Xm56V1zMQBJF0Xv+80RL9yXqKAbFlD2wSLFzw8eS/1
	euU19gcqBcgvtHW/lGIlB0rUz28dPohp1miYNtk9JwzmBjKxzT3D/z2A7PLkEUCEwhjOTLTuOU2
	RZGwdsiz068613w3jG0yr+v4pOePCQo0Nbh9xQCISxW5LMidqjvsUTjFmjssngye6/JPzy53zk4
	KmlSLb/gKoD/5CIXy+R0aDtCeO4s+Pz1ppCr
X-Google-Smtp-Source: AGHT+IG+igl0QfPnghXbFE3JAeWIIJz7aro/zmK8/VTRG+4DBeiUV6KX+a7AKu3pXrc8+pLTDeT2JQ==
X-Received: by 2002:a05:600c:4fc1:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-43f3a9afc1emr98985365e9.25.1744662622150;
        Mon, 14 Apr 2025 13:30:22 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:5368:1715:4c6b:8be6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae978023sm12001396f8f.47.2025.04.14.13.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:30:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: gpio: gpio-aggregator: add a test case for _sysfs prefix reservation
Date: Mon, 14 Apr 2025 22:30:20 +0200
Message-ID: <174466261151.5278.12313728766071795892.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250412150119.1461023-1-koichiro.den@canonical.com>
References: <20250412150119.1461023-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 13 Apr 2025 00:01:19 +0900, Koichiro Den wrote:
> The kernel doc for gpio-aggregator configfs interface, which was recently
> added, states that users should not be able to create an aggregator with a
> name prefixed by "_sysfs" via configfs. However, it was found that this
> guard does not function as expected (thanks to Dan Carpenter for
> identifying and fixing the issue).
> 
> Add a test case to verify the guard.
> 
> [...]

Applied, thanks!

[1/1] selftests: gpio: gpio-aggregator: add a test case for _sysfs prefix reservation
      https://git.kernel.org/brgl/linux/c/290ffcfe3042dcd5b701a98edd48d7962d35556b

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

