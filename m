Return-Path: <linux-gpio+bounces-9543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D396844F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27BAFB233F8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F3F13D8A4;
	Mon,  2 Sep 2024 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U+f1ZZrL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4592C13A86C
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271984; cv=none; b=Lo5CKi250gs1jM46xRsY75hq+zsKWpUAmmSb4sNqfQgqKn4Q0NlBtVgvD+cWy3Y4I0gX/MupJAJ+xhY3tB2E/JFpCc80zc1r8rchTDJcaZ2SCpfhftqxUD/tSrrzqJ7z7qbK9HeXgZuGiG7slSGJP1eMrrRDizSwZSY5SXHwtBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271984; c=relaxed/simple;
	bh=yeZfJW74IaCXpzqVM3KRXsaCXolXFKS330brlZIHoQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ix8OQK4nbzI9svFxUVDLyr8sgL7jDmBhvFeM8xe5uYRTko2+9gx0r7DEl8ug4tr2naY9fXvYmM16K+lFJXKFmu4xtmmC5hXkitf9aSTPRvY0yAnaTXrXbwiY9igT09dTkO8gBwEVRCobAsbBH1DGdQOqVzatIwauz7fnT/gVylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U+f1ZZrL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42c7bc97423so17351655e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725271981; x=1725876781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6QuFCa6faxKRcJTh+EWhCDLQ1qy+cPMdZ2uHl8UfkQ=;
        b=U+f1ZZrL5NGp6qAf9VkcXBbSr2iMmtSRHcdNXppw7gpYeBiJ/CquJEQHeZNYqdVRcx
         q/e4NoBJxFIxgV4/saZNElK1adMI4i0lRUVJ/SddkE7pJYihmag1Yt2dz6RX8UO/IzuO
         s3p1TJ0uGOBtHHT2ljkilzWM/XEDvIa0UUbLv8etA05/Bqd3b5uVlc1rvlTANsD+unu/
         uK5hWRMD042GhxBZaYIxNXhdBOt0pXgEZrnAM4LQ7oKWjp2DrURuQtbLOr75IvbP7mt4
         /DMillF2sDs1MGmk4BIKvy5suwJOsld6edpERVvMGlEgfKHsE1wr7IUpllxVGnhO/60R
         HfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271981; x=1725876781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6QuFCa6faxKRcJTh+EWhCDLQ1qy+cPMdZ2uHl8UfkQ=;
        b=tL7CWmPwdCCRRMxFu24Mv7m0Vl1mcXaL2n1tJaHUwDzDaycgUUdAR19LDXUON6hjKh
         +1gilEeWJy3fhzwZiLroR9Bi4LCtgtj3nTxbdCQC68Ipg54fHRU7tpxuSXA1CkNoYqOz
         gykkdAUDoodYW7AFvLSvau+PDPKRWVehlO09YXGWTGuV0r02OTTfS2v3+PqBhi7nhZWG
         /6FgTZbs606VKVzBlXg0BWLn0ibUHGjrwelQnDnpNsXzg9NIyCHNyAkt6iHUHG+Y9lw8
         xIimc4zRDmZD6vIcjqc69Ex7a02wUmSCZ0c+dY14LLQ2ouREyhtGRlTGBkU8XBt56AMl
         x9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXa+4CQtYfZA7WlAEptBP/iko6SiUzDxHxGGFOSxf3Y5r1M8Tr8ycZWPE5kN5mWHzkeMuQsIIQVlpZy@vger.kernel.org
X-Gm-Message-State: AOJu0YyI802kdPnav7HgrpG97Gra0iqe7U79NpDMd1w9F8/LCHoLpTKA
	iQLbo0+yKlR+7YKZ/PhZiNbyBG5aOm+nbhWZeoRWw1fKPqWs/S8auxSyQN/TUNc=
X-Google-Smtp-Source: AGHT+IGpljPS5Q3ZoDSgr/5JetKqjM31lOX75+d9bX8iaaz/poEpVrgxZ4ugPLf5F7NMdxa+tpy2bg==
X-Received: by 2002:adf:fecd:0:b0:374:bf18:6092 with SMTP id ffacd0b85a97d-374bf1866a6mr5115122f8f.38.1725271981066;
        Mon, 02 Sep 2024 03:13:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4d391sm11052415f8f.3.2024.09.02.03.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:13:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 1/1] gpio: tegra: Replace of_node_to_fwnode() with more suitable API
Date: Mon,  2 Sep 2024 12:12:59 +0200
Message-ID: <172527197741.23400.10042043019782849744.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822223845.706346-1-andy.shevchenko@gmail.com>
References: <20240822223845.706346-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 23 Aug 2024 01:38:45 +0300, Andy Shevchenko wrote:
> of_node_to_fwnode() is a IRQ domain specific implementation of
> of_fwnode_handle(). Replace the former with more suitable API.
> 
> 

Applied, thanks!

[1/1] gpio: tegra: Replace of_node_to_fwnode() with more suitable API
      commit: 842da04a99193a8385208a619fe97d0de9f3ed30

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

