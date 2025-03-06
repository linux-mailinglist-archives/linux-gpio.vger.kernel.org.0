Return-Path: <linux-gpio+bounces-17143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB2DA544C8
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 09:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BEAC3AD2A7
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 08:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B4D1FBEA6;
	Thu,  6 Mar 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sPWAFcle"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD211C7000
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249517; cv=none; b=o9rXZjRCCdqdZeqi5CQCN+8VHdMiQsJXEAXrwq31u38vQOIYezLNvAJYwiwaVYE9GveN0lHQlLRuJGE0Uaqd3dn/y26mcApnyPV8Gipv9zrYQZp7gmLdKut/NKURNF7MC6Vehfm/7KClhHq1XR8i5i1trcZsgoZ04iTHmjCl5cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249517; c=relaxed/simple;
	bh=7blf1HM2Rgz7cPSi6+aOLoGn1wtkmeeZrL6LLuLFIN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p2l1foDvm0nClJBR4VaI2ZpmOgfDH7mjEuk/UyQZxgRK4WxUcWGeLJ/fXir/t64q+RRi2mTdv+4rAYlGRWlUuBWHQJ1Ktr5DeO4P1jYsfbDi3m5uVEux54LDepgzXxHBfnlD0Cl3VPsJdZoQaVJhiQe1ojTLo0G1up8T+08UA5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sPWAFcle; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bd87f7c2eso1752325e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 00:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741249514; x=1741854314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38xMwicGvP21YZCuem2zWHYfFPio2TDIjqcZv2bh+mQ=;
        b=sPWAFcleJrpAiBoWGt3axTPfKsU813oe5zMS6AQ8FNPtaa7cU7xcVcTEBoeepjTWMg
         iZz8vaY5mmnXgMEj+cU5lkcnT9FxTcdUmwb1Ruj1mflyUrs7/yDvxiRY7KnfHFUmurNW
         E1Mv3pZOnLuTOL3QsurGCQM9RJSrfMiTJP5Sq+h+WfBUe4SMvNpMRAwgHJ+BPNZCA1Nt
         n3ii3BkkmZ4KOTi1ayu7oJB7HHaJfnZx2FqKdXDE4L6usH9IYvOWf/AYGdn/moQpIbFe
         kuVKLM1DV7EkA9yuzqgo/F/m+TbiryAOOosoximbmy4OUFOkLsbqsC9Ayo06ypcawuY9
         gGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741249514; x=1741854314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38xMwicGvP21YZCuem2zWHYfFPio2TDIjqcZv2bh+mQ=;
        b=PLz9UdKNiWcoaNSJbWmFUFng2wbmKl50sX0bI3vWwGXkXqoEfXAAcZ1qocQ/PSQgLF
         lxnb9FyKtXb1pPKK0dboOQLFA04qw297cDuvwslp1S90AD48fSn6dLy+/Ynt2akVnSv3
         L5uPZ6hvkFZSm5LEB2I4vVse4S7Q2+2ImiZzFpScm4YVx5lT/RxmNnQsqWP7eC3QX+s6
         AygtV/EXJx7aLdeI3JU8+4cVUtNHviGod8q3N2wGXqhobL++2L+AIEuxp8l9tgzufFsR
         eJQ483fG/TpOOIxcng1rrS4mdsiwYWRQ6T5zSYuPU8ae1viXj34U6nhTlOyhuK9qW1Lx
         zsQw==
X-Forwarded-Encrypted: i=1; AJvYcCU+WZoJKJWH8WI9fBkiEXjr9Ey2lmW0BPXomKwzusb0qCXLrTtPHIa+FhKtYYkHFz7TIV6qkVF/4HPk@vger.kernel.org
X-Gm-Message-State: AOJu0YxI22dNGYcdFZQy6TtZTWcVVWAfhqzkC27JX7CchuMa7wNcTgzH
	EvIZxFlPxaCqy2hbMXTVJA9aPa24koQVSuJBo5bYwQTCgvWNxNyrugVPZY0zzzo=
X-Gm-Gg: ASbGncurZTOFFZbkLZutLPUGBpZp3nTl67zmaO/sA51GxjH0H5QgykZdOO/9H60fa4o
	l8BPsSxKdSs5eYEMbIiRH6uhlKImR0LiUPsOVycvgRBWYD3S0nmCCuoJVosAgvfoJd3Qqxwn/MV
	E7eSz9TRoJKLgW54hjIsJegNGfPUiLKQAEh1/4sqeIsmrLtCl5mlwW5taGE0D6vTF8ATC8JY2wy
	61bNFmrCT29di2meTJ503vzixXff8PGaAjExnL2EzkPRmcVyBFbuSKXPe1m/erqbl8lOw7fe948
	ynwg/kyvtBXgkTyzZ7Pr9vdXN8rh4m700+DXGiz5Xls=
X-Google-Smtp-Source: AGHT+IEeS0vsBvB0L304XkSysGvXWBoOMOT1GlwzL9MRzSLRJYDOHSkssynYuuLiIOL+qgD4aMdSbQ==
X-Received: by 2002:a05:600c:3544:b0:43b:c878:144c with SMTP id 5b1f17b1804b1-43bd2940b68mr53718885e9.12.1741249513850;
        Thu, 06 Mar 2025 00:25:13 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ce13:b3e4:d0d:c6a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1037bfsm1250297f8f.96.2025.03.06.00.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:25:13 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] gpiolib: fix kerneldoc
Date: Thu,  6 Mar 2025 09:25:12 +0100
Message-ID: <174124951041.10974.13766856355488023425.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250305094939.40011-1-brgl@bgdev.pl>
References: <20250305094939.40011-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 05 Mar 2025 10:49:39 +0100, Bartosz Golaszewski wrote:
> Add missing '@' to the kernel doc for the new of_node_instance_match
> field of struct gpio_chip.
> 
> 

Applied, thanks!

[1/1] gpiolib: fix kerneldoc
      commit: 9b443b68d97983dfb9a92009a5c951364fa35985

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

