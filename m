Return-Path: <linux-gpio+bounces-28901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B04C743A3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 14:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A21FA30C32
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 13:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB21E33D6C5;
	Thu, 20 Nov 2025 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jsq45588"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C833D6E6
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644931; cv=none; b=Cf5UjCCeOnkLOgWkMmp/eh3jKkO1UkNy3U0qwwt8MgcscW+R0YkmZs4HY6QJUrPuXZhDpAoExD+3XthVuA+HI9eBj3daHWPQzgM0IGoUWKqYlo+a4o/fDe594tAJEZ+D+xmGJ/KNYxu2StkwNdH674k2ufOWsT/xR2fivCtAdk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644931; c=relaxed/simple;
	bh=WWYMzjVMIQFqTKeFaHlkcvp23OzNsnGfvci9JdOhoRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RiloAyiUdr/TIdE1D/ZcLaiXey4uiCZl0qhVMzrDNe12oR33NwWRZQnsTjJFfl9HOvaLuYYSWfyFB3IeaI1sLKl2MyKV0kHyYc1QPIhHgBxtMt6GakLGsj/h9HUdf8oybziXnc/QmP34yI5PjPUKwh7nvfjuTAWw+IBm1mcAZtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jsq45588; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477632b0621so6200225e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 05:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763644926; x=1764249726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTaFIrQa5aLE3eAHiSw+MNrmOJOR8F04PSKZlClg+YM=;
        b=jsq45588x2IsFhp5n5IQGi5TRj8QieF9b9uBPKW9ufIIHhrmWwBnuqdkPrlw5Scx+m
         h896Lig5XRYtEDuZzs/l2Mh7NHY8AvtxZX5wm904IqZK851WeR9lUscuWzbznhZ2MRjN
         +SHUgBM4yMxSH2lmAiwEX3GH0dggj/RvisUTQOUjBLEsUsA++U1gUslTC/lYUR4+5XSR
         pEpXgzthf1Brfq8M4cS9DHcbHPpd4iElISjKW52IynrouGbaxb5lHOs5GRVGaiSddA26
         7fMb8Qjf42ak22SR3fX5jtAedFwzT3dH7IxZl1hDlxcGO3kPSSzX8JEHInnkUoG/NtKX
         OImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763644926; x=1764249726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XTaFIrQa5aLE3eAHiSw+MNrmOJOR8F04PSKZlClg+YM=;
        b=Nim0KgaDGucgsZs8sqgdgT09WtWn0XZxw+DZ+u/G+N5dZKgu6tfKlos6E65WiClMG+
         pIym/G+dpMNo1+H/d6kiXpKzo6SCUP5RfhLKJ/p5G35pXYSTm0Te1FBWVlOwW3WvDEzH
         snztVUZFhrCirGqeVtFs6nLUV7F9wDezvLdnAMU6nxFf5DWFl69Oi0g4xQC5IB7WYI9j
         9ZnOllwy52G1VhU93TegjRa+5zkYC/Ai1jdvKnPIN+L/twXS3PfXqkqkd+AT1A39OLzI
         HNnWDeResUb1uBcESxOmqkgF7A2bISAJj4TaFzAATJOp4jRLubleeqYmrtCZBtSHeP+6
         Wiyg==
X-Forwarded-Encrypted: i=1; AJvYcCUFDZXPXrmOA7qxR9J11rkibFQzZjfeC+0hdMnRhSXxowXb6WYzP5LXasw+SSTJcs4/wzoqPKGUZN/3@vger.kernel.org
X-Gm-Message-State: AOJu0YxdLDOyj39Lee49/+cd0uhtXRaL6g9+lGoCUIKP9R/kO0agZj4q
	X9RhMMTRZyFGl7g1+bDMIH+ttEemHIvhX3mTL3hW1sRLhj3hwJ9sJnyIq8/h3HLver26q3n2I5j
	59Uitt3RGFA==
X-Gm-Gg: ASbGncsbyahmvzRCWqSRlk8k1XwMH2OFr0UykPv2ySlAwHFnOV/GIpNU9PU5b/XRUpD
	czMrNk7Vn0H0nxREttJ4bKcnNTWSqhRYQHyiw4LpixGk8G7x70o2t2O6pr34SJxcOFCn2oFZKXm
	lTZPlrq/iIwG/MeyoX73gWq5zc6d8fZN8jikSBH9w6B8Kzk3TfIW2fWf9kdODwFDMC8VSzjHKL+
	qsPcXdm2ywzqQndJZNHKl87akkoFZ/8kkheUB9OMGsGuXECOcA9Yphnf44opiU14QakXzphx3ti
	rExY1NG3RwpWgEMLYpSxpddTY03pPgU9tVAn2keEpNG/0N5PLjDVP0p+OSi9JMNCjXWGiIuqfXp
	DIsp4W1GwuWGzxalJkWLIiMzMvTr9qburFHJ2MqLtsNjXL5q/nCqa9Hzfc0KDt09qJsirwH4V0C
	lwcwaqnpEXZv1irNQ=
X-Google-Smtp-Source: AGHT+IHHtt6m7WG9ab0KKOz1R7JhxD8gVpCwFgI3lL8YwxQm1nY5ljlgtKf5lmxanTth9uGT6BKPMQ==
X-Received: by 2002:a05:600c:4f51:b0:477:63b5:6f39 with SMTP id 5b1f17b1804b1-477b8a845femr9156795e9.19.1763644925997;
        Thu, 20 Nov 2025 05:22:05 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:37af:6c1f:28a:47d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82cc6c4sm60668925e9.2.2025.11.20.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:22:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] gpio: fxl6408: Add suspend/resume support
Date: Thu, 20 Nov 2025 14:22:01 +0100
Message-ID: <176364491498.19561.10064136221810114647.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119140455.10096-1-jszhang@kernel.org>
References: <20251119140455.10096-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 19 Nov 2025 22:04:55 +0800, Jisheng Zhang wrote:
> Currently, during suspend, do nothing; during resume, just sync the
> regmap cache to hw regs.
> 
> 

Applied, thanks!

[1/1] gpio: fxl6408: Add suspend/resume support
      https://git.kernel.org/brgl/linux/c/87100151e090217b9325d7fc007b2930f6a46f02

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

