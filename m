Return-Path: <linux-gpio+bounces-11026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731D994288
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D45C2926F6
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 08:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111CA1D26EE;
	Tue,  8 Oct 2024 08:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yAqPJoPe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E901D1E64
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375539; cv=none; b=qhZ2ZNSFqeSirNqibmN82f4dYKJuzCC87n/RJG/0u5ng6Bv8V6XulF5ltO4B7z6GppjoJXMspnzB200Yb8w7d5Nk1/gk1zoQZB7mS2yAwNzIsSzjQzV0kEBZSAGBos91R9kP3mY1/toq5hNNkFMEj/p4LCeR0g3n47A239964MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375539; c=relaxed/simple;
	bh=tLvuPEpepgU4RJM4KI7MRRF3Et/OaAde3/mgSKqc6lU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAG6OedAuLgrnR0BmsYPcgBTJbeBmeBleeJurj62fDxfZ7SdRYTgHZNxxhcGFIiA7RhYcrl+sIVeLSt6zTSNkTcl5cJt33Lr8OfzsX5QPiZezU1Nkn9DVTtD1cqkVNMoLzMnNIkU+ubgd6TGNIAJhTJOjnLk1OLWNtHibpbcxqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yAqPJoPe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so42474295e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728375536; x=1728980336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2StmPmbja5fYuqiM+sLh6WnPvoikNxdmYVvGktcDxS4=;
        b=yAqPJoPeKuq8EoB4d0VSEiEDhxvwAFtMk/DsioyUc/Ovz/K4kfDF+F7YYj2y6fssRh
         0bMAmxDHPrRkslErdDYBVfSohKs7/W3YTY5LOwOJi9nBYqzbrzgQtwmY32jHzCaqZPth
         ZLhaBWT7oIJpZymVRyiFWR6lZ3x8ikDT9kDJrh6UXUzncupZ7g8nB3ZEQeqOu5gv+gcn
         vxZ4kAERTCO2WIaBXw+FDi+q9+7nYmzndZ7Eh39osl+SZhV0GNBtUOiD/6a6FPNjSazR
         +bEFK1zeQ8gRUnrvSrujEnnagL4ZlU4qTH21qe5OlWk5ucxsehRWNaAm6TXvSKfp66q+
         XHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375536; x=1728980336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2StmPmbja5fYuqiM+sLh6WnPvoikNxdmYVvGktcDxS4=;
        b=YQelEAAsa8wJ5WG5izQFnuU5yl1Ry9BfHxzfF//6Ub8k2A4sCrP8pDlBNsHKKylyCj
         0ArkSjFrwmIpO2J6SrA/H6ZF+AYYxG233FCW/DX7b2G3KB1G9V4/3+jE2+Xvcb61HpLi
         vdsEbu1SOCAR8s29gc3uY6Kb8IlMwjuYHfynN2xaX6dGKN1z55AlkLIciQgD89mDVV4z
         H73iLj8og8ltnH59OKLlC51CCTH9jjfxX6KTPgH8SzHyJd2ZK15/JkkdAnFDW2UEVVJ+
         DGeKMQd2jMFJdypeY+Y4V76RSox09Aq691XCsteJmaWn4oovOHMUpBnaOCd1HZJq/pzT
         8ZsA==
X-Forwarded-Encrypted: i=1; AJvYcCWjPaUazdczwdft5mSkCkipv6vbmcmuIlxaIp65V5dHvoAPyTD9k4mp1CsvSMjPam0+nfaCp+0YF4Qq@vger.kernel.org
X-Gm-Message-State: AOJu0YwSueC8ksR2bbMBidPy9Zi5BO/7aXRmui7UKS+4kYIgn8K0r3sl
	GqY+2fTC4fcTIi3kcpy9LECdt+0A2GLiyxCidQOWn7wEn9gLwpzsMnIb40N9KMg=
X-Google-Smtp-Source: AGHT+IGpKAQXCKDMOAI2nbiLf1o2ijIGHXPfJ9LhBRTcYmfvpOasFBLX5x7Gs+ZKCrg2AgdYqL9Pgw==
X-Received: by 2002:a05:600c:4514:b0:42c:a802:a8b4 with SMTP id 5b1f17b1804b1-42f859b0f48mr103797015e9.0.1728375536509;
        Tue, 08 Oct 2024 01:18:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:738a:20da:f541:94ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89eda81csm100386535e9.43.2024.10.08.01.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:18:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] gpio: xilinx: drop dependency on GPIO_OF
Date: Tue,  8 Oct 2024 10:18:55 +0200
Message-ID: <172837553265.34754.1564717505896795969.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930144804.75068-1-brgl@bgdev.pl>
References: <20240930144804.75068-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 30 Sep 2024 16:48:02 +0200, Bartosz Golaszewski wrote:
> This driver doesn't really depend on gpiolib-of being built and can be
> compiled without it.
> 
> 

Applied, thanks!

[1/3] gpio: xilinx: drop dependency on GPIO_OF
      commit: e96c6de61233bfea7d0d0c32a7d539906ac23180
[2/3] gpio: xilinx: use helper variable to store the address of pdev->dev
      commit: 3cc3af160be758e95c9b4008b3bf06f4a81b653f
[3/3] gpio: xilinx: use generic device properties
      commit: 06c88b7ac9eed417f02cd748499b29318a9795be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

