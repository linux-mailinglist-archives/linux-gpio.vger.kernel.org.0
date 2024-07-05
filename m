Return-Path: <linux-gpio+bounces-8061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F69282F6
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 09:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59E6F285B59
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 07:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C33C14533F;
	Fri,  5 Jul 2024 07:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xMEURiqq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553DB145345
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165299; cv=none; b=eqp5WvwzkXzoARMhUzU8i0qIrKJeNcM2xiP11RtEirywz6SuhiGnbROIsf61NmK22qV7PbqYv7pB4/HiN21WT+Bsx9laQcfaRZGJTR0TOL8ulSGZlpgWLf4O5COX2/u/0IHR/KEAV4sCZPtsyNh8s2Pk4rnoR2HDMHdAvyky9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165299; c=relaxed/simple;
	bh=KiQ9sPzsg6qf3IWtnTgMxnzsokPNgo02FatNuPANgBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KcliLQRxfGDkPrCzn0V8Xj9aVdYKf3k+zdxz+S0YVYkhHveSvydR8cIQDGra+lJTvw6tX8IAGS1ZRg8lYWBCOGvgepxltIficZBlrEiOfGjKOUTHbQmjWK18PJPJmZuMuMkrMU/Zn2zH+JDbA+6MyF4fj0gTmK8sx2prpszY12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xMEURiqq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42562a984d3so8933595e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 00:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720165294; x=1720770094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOP7zp4h8ca8wP5NU2WrKsZOwPM6Udh8BHMGxnknMCM=;
        b=xMEURiqqPpvjfTXywVvcKPFlq9QmJgXcGVGQOxblxVVormbqVOCYHwKSfKJ12auS7A
         HSqfvMWzNoGLthXEj+o/NRp3kiqpm3Jau2qygGY+LVOMcBhKaHGdPEHMJ857l4MxljMk
         og/XV4ouH3VRP3xD2JWCf+GFNfHiZTfQsuPoSmkkx4f3gZEcT/KTZGwoVfKM1ExRSSSt
         xr4OulumnAuGqbNOiBdn9wTTH2/fBNlzWrAaXGOxy3ChRZS0qWotRlUmEgtwZm4OuJL3
         he6g61TJjpG9qqEZqTRDbLL5qGb9YGIbywUurIo65S2gOlQtjIIZAp5aRgy0+bTP7zdp
         k9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720165294; x=1720770094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOP7zp4h8ca8wP5NU2WrKsZOwPM6Udh8BHMGxnknMCM=;
        b=nHJUcvRdPKYp/oqZFfXkKcdNpFw6Pgb5oMV77BMKXnyGFxK3TYuFtsNi6Dl9rbZLji
         Zo5EiU1g1z/S1G5fuV3JuO9eTb6v71kl/YIc6Qv1ekswl4KF8aQQKNrzHFI1mxPpe8Sg
         XKR6qvFQqQr6vC6MAa6U6EJ/6Ld21C7smwRqYPjtB4CDSWd3/SLrB5gKuwOFS4Ex3iuE
         hHWVJB+SzFQUZ9LUGJD1UrqWJb+hzaZXe6PcSkJ6ZAdOs37RYLc0rJfIWA9dj0tIhnq4
         WQ1LIaNxhxUK4I2l1Y4DXhKPVvY0Cv6hK3+HtJLPJ5vYLl5VaFOKWor0voektKd8UrZB
         zaCQ==
X-Gm-Message-State: AOJu0YwX8sU3dJi57yFQvy6KHXBc69F2eOzvZv4j1E4Tx/DYIruoF1Iw
	NlVDmQ0dAenA5pOSCiFWnP+dzGlLu7YNTy+b6UhbHqsF11KC44OEEiJpbT6llR5cHD/BE229S2p
	7
X-Google-Smtp-Source: AGHT+IGI+fojlojyY3QUhGKt8NqCt35s1tWPMlXI5eVonj1Ey7ZoGeXfrN/l3YIOH53N6bwHOcbVeA==
X-Received: by 2002:a05:600c:4393:b0:424:8f97:8069 with SMTP id 5b1f17b1804b1-4264a3f60b1mr26438515e9.30.1720165294483;
        Fri, 05 Jul 2024 00:41:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c688:2842:8675:211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679744be1fsm5065329f8f.2.2024.07.05.00.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:41:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
Date: Fri,  5 Jul 2024 09:41:31 +0200
Message-ID: <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240705021750.43197-1-warthog618@gmail.com>
References: <20240705021750.43197-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 05 Jul 2024 10:17:50 +0800, Kent Gibson wrote:
> Generating the latest documentation on readthedocs is broken as the
> index.html generated by Doxygen is now being overwritten by one
> generated by Sphinx.
> 
> Make Sphinx generate a differently named root page that does not
> conflict with the index.html generated by Doxygen.
> 
> [...]

Applied, thanks!

[1/1] doc: fix sphinx config for rtd
      commit: 824c1f39347c2ef46919dfc45e8247441b908827

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

