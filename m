Return-Path: <linux-gpio+bounces-8060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A839282F5
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 09:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D64101C243E1
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 07:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE5E14535B;
	Fri,  5 Jul 2024 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x+kEQv3G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893EE14533F
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165298; cv=none; b=eIBcumNpi15xFftBXPCJFsX5b2xqNCgghOBePk7p0eSbOyE1a8CG1XD9WlLTeGWHpZ4vpt0betSujLZZcTPJR+F8TTffULxHZJh8E06MtGx48K0JIvloCKMj0NE/TQm0Cjw+upCcTyWhG+XQeHrYhlskwTbednZOAoDNxTgAGao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165298; c=relaxed/simple;
	bh=QhpaGGWteXFElMH7jcluYeoEpLhQ1WjMx//bGvzH6T0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2Qx1y6iheWlHKnxU8NFFpwXdHshdEpOiyjlQujNCQEUiSABpLa71t5iWtjcgWOyqJOEt3EtMsuIjyZFOhIHs+hyuUPQxa6M4EapQzq/8RzB7LG3EhVCL/c5CJw2y1DCGwUPOHpp1MReJybEOc0ETtkGBqB1UAKpXmyFulGtaic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x+kEQv3G; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4256742f67fso9082015e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720165294; x=1720770094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWBpRkAHJA341wIm+idz1ihwKmrdjtmhzxdKDl080Lg=;
        b=x+kEQv3GNvZv+aWDt5WRWlvGyHWKSKxo8eOjP3OZHm1OViE9UU9rXpDPEtAvFwFnvH
         T65ysUzM1SXzs3T9f58xUMhorjkTOq64rUPLeBV9X3z08OTlTsGCPHFH8R+bwbBK/WMR
         QfA5Xwkjaj3yL6ncVbvYLdVapd5r+jh1biGV8I8R/3AbkQNLmK7td6dq+yMTu8SH5fRi
         zh4PTKT3cc29d/F1cKfQxtypTgIsuXAEsc4vfSz/YtsbcZvCVE7yYWe2V4UpGvdQHYxV
         g0aUFMooebh10v4kP4MpviweMS74UEAWX8NCcvXW6Py19r4po8kc7nrT/FjdmgT/ddIZ
         WH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720165294; x=1720770094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWBpRkAHJA341wIm+idz1ihwKmrdjtmhzxdKDl080Lg=;
        b=jUgLB/SVhkCKRp9DVqgRCR3vOjrE4N7dh9njhdl7mk2m4Fy2UL+PdP9xzS+YebjbAq
         sAybR6kGo9pLXW1FxeOAJO6H6jlDh2mM6OXFV0gfwURSM337AQufk4h8rYlg15eMZqdH
         QPYeKFu+NX8Y/rwNKYETuHDH2e6geux4eByDzIQptukxzWQ7Y02AXRH67GP+uapTl3x9
         X9dNaGBPWNpmrJ/+FfvCab1J9I9MiybN1r45gevH96OLS8rBfYU9y5RUrmZP9pOdBUaQ
         HTLrZdb4RROJJYyR7/3VdQkEy3nx2fmyD5cjI/OgLL/95SCayNBTrbswuU32goM/clPT
         VEAg==
X-Gm-Message-State: AOJu0YxayMxYHKfkPOdRtW7um56KCI+fX6TlWsHLREyMnTfUwCtTMoSx
	UxpOAzclN0n+ES9G7/mWqOhzUZy9iclVeJQO+jr6gEv/Bp1AmsGffagA7yy0mcfgEgnN8HH4lLf
	j
X-Google-Smtp-Source: AGHT+IHi8ddO5no9eVqGKViFSPlnurWh55TU2ipEPL9MHhoAaPgMDXHJQYvp9eMRKpPV36IoHl2UXQ==
X-Received: by 2002:a5d:62d2:0:b0:367:9c46:19c with SMTP id ffacd0b85a97d-3679dd3133cmr2314000f8f.31.1720165293857;
        Fri, 05 Jul 2024 00:41:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c688:2842:8675:211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679744be1fsm5065329f8f.2.2024.07.05.00.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:41:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: python: correct spelling of repetitions
Date: Fri,  5 Jul 2024 09:41:30 +0200
Message-ID: <172016528818.6599.3383963670424737763.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240705021731.43143-1-warthog618@gmail.com>
References: <20240705021731.43143-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 05 Jul 2024 10:17:31 +0800, Kent Gibson wrote:
> In another one of those spelling quirks, 'repetitions', which is
> indicative of something being repeated, is not a direct extension of
> 'repeat'.
> 
> Correct the spelling of 'repetitions'.
> 
> 
> [...]

Applied, thanks!

[1/1] bindings: python: correct spelling of repetitions
      commit: 6ee321061e9ede45614bc79e6712961379648ebc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

