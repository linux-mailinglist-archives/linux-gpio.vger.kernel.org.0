Return-Path: <linux-gpio+bounces-22119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBC1AE791B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 09:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 403E917E347
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 07:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7B5204098;
	Wed, 25 Jun 2025 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DINnN/Dk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F026022083
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838061; cv=none; b=WfDY3xkkTu1Ed+eJI9M5a1E0BQK2aC60F5DpZQdb7h2HKrVBXb8r/dLPwCFNAk1vl+fboAYzQX9Tyhu4ZVQlWT/vyUrYTJp6OuCTa/QGccf1GbHXHabYhvLrW5EKDZNQxQysFK3Qgma7WJkg6GpkFgQCAQB9RhN9Nb1sq3U0pTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838061; c=relaxed/simple;
	bh=V/cKTqS5I6N6Gw4GRuMyE6GPe7ohHi82BZbeNsiAXtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pLK8wU+s7Xu32L6kq0j498Yc2jtEER7ni1EQRdzUomFiOU+B4rBQj4rBbXMtCQpHaULKa5a1yZLkkQCc+l7Ik65gVS6CcdfebxrqhnKxNb0PoxceM4HSnMm1AFwuNJdGqXxVMJZYzNi5c22KddIkR4e8T1rwLrhDopq4ps74N0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DINnN/Dk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453398e90e9so42099665e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 00:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750838056; x=1751442856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGIylCtWYzvUCW3Ait7fyeB6e45G1L47puxB8d2HHKs=;
        b=DINnN/DkAF6lDww1d7U5/+kXW5yzaaiXGjzEYzG1IpOTwbuPxNKoFLXx8MuaL421Q2
         tY4O7D9ycZZord6PnLh+bli2hPuqFmC9EPrGEJyofIrhqNmPDRIhtcrVmlx+tBYlnV7H
         aUfFomtBfPljJY7xuxRY4bJZnkrnJvEyeTSaiY3gb6/vhr+3a0Q4XtpUh2UHCW5M0wCn
         MNnjBCX7oyUQorfvFIIwQQ1vLHk5/Q/rbC2HJ5qSYJKLvPpDUicF0qgkdd5cTLin6JkM
         rH83/NGI6lZHU9KFApJVyc6+uRndWiG7tQ+IoiS1bWE6scOy8gkhrxnOdH1ss102JZeE
         uMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750838056; x=1751442856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGIylCtWYzvUCW3Ait7fyeB6e45G1L47puxB8d2HHKs=;
        b=CXSTaYNFSI30mfnM9zps3Gr4fw3ztphix5VqdLLld5E6BuGJBxgqJcEs7eOXP1qAPB
         WgZTQK6WHenQFVVY6YYIJBTBlidKIK58hmX4nRw4obGHZ7xhyb3UXLKSjEkzS9dcDOyb
         v3U4nQz7ohlqUJscfQrUxc15RJMX86cATEhXBXBMWc5IKy9mf1MGpOqKImC37Vl4J9fH
         lIbDW4LDUEBt52c8KQjwMhaaTtfHlhdDoAyaIBXRKMji7UWn33Fnfs8HhQ+G8G0hPSjX
         uVClGJZAFlX99nTzaYweCO84fecQP15Z3fvh9fG+RCvCUz8XjQJ/dfcp3PoK0QpqLzRR
         Smqw==
X-Forwarded-Encrypted: i=1; AJvYcCXQFqs+/ZArIEG+GvSwz6A+x34cEYRoF3WLN/clDCnglhEkzLBpRV/VjWROWUOCmIjP1aM6BCct6AX8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm5W9Ba71i08il//GRC/a1fpCc1YOA5fWR5AAOBSUNAJFRdkV+
	LXQD0dJqkVDm8yKMT451mBjpVN16Yi9oHEyXkHVuURVoUY5JVdhhA5TKz5zcKyQJV5w=
X-Gm-Gg: ASbGnct/DJX6kDo0reg7hrF/Z36Jmv46jNhuyA0dlmZoBp+aFTRFD6ue+e/uzYEh1PO
	PedqmN78nofsfc0LZ/9+wIi/8cE9AkwwpR+ZqzF5tv60qowBJ033MfIrC1IJOil555C0owgT0H/
	+cU6gyXChozIV9SEBhQi6mY8NZHZzmJ6UOF/C6uMVgohMFRmyvJXNM1HofVmvUemwOTEazYlAbR
	rRCTLfB/7fE5KSovYDU666nAZFK4NiRxL+ltNAsNwh4HfGk8kEemFw4hGfn/OFv5U7LB2G5QN+e
	AmgOK1tGntoVK4w87qq0uuhvuipYV094qbQtU9+0jjmDqfV7hGWegbVzCRHScnx4YmmhUjfhxA=
	=
X-Google-Smtp-Source: AGHT+IFTN+pUF7ig2e5+eSgpV49BEm9FJsw7Px+Alu7qgTSm71Hqmqt+nSXb/t7u0Vhkr0V9xsRnTg==
X-Received: by 2002:a05:600c:a48:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-45381aeff7cmr14873805e9.24.1750838056039;
        Wed, 25 Jun 2025 00:54:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad03asm11650295e9.23.2025.06.25.00.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:54:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: clps711x: drop unneeded platform_set_drvdata()
Date: Wed, 25 Jun 2025 09:54:14 +0200
Message-ID: <175083805259.9312.14360612986153360461.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250618074653.25555-1-brgl@bgdev.pl>
References: <20250618074653.25555-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 18 Jun 2025 09:46:53 +0200, Bartosz Golaszewski wrote:
> There's no corresponding platform_get_drvdata() used in this module or
> the higher-level gpio-mmio. Let's remove the unneeded call to
> platform_set_drvdata().
> 
> 

Applied, thanks!

[1/1] gpio: clps711x: drop unneeded platform_set_drvdata()
      https://git.kernel.org/brgl/linux/c/23b33cf1244185d0432b25afdc04f2fe47a1cc2e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

