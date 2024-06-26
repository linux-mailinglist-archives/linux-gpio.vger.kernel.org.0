Return-Path: <linux-gpio+bounces-7708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C77917B23
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7461C23D7C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 08:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C2F166302;
	Wed, 26 Jun 2024 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CQ4Rtrw1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63553161935
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 08:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719391184; cv=none; b=Fikbj6vmPbujtX+rqRHropNbmxyi/jukArAMt/kg/TbKgea5TLvjzwRXQS7v1RSu9VbmOufyjVSiCjmx1Y1AdJ08kNepnbYuVb1kcluRnZxmy2d8lHBMDuYLaub0ICC18twBeUS22dNVs+CEWkd1gPqQ20qbyqesrlI1n2ahMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719391184; c=relaxed/simple;
	bh=NLR+N75GA2geLHdSgsfuC4nIH+6DQelAEiCMDVcetsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QPLHYPRmjOifIQG2/+nOaSjU9PSOwBZAHaymxfzOqGftBZ+G97yEUVNsT7ZADTVG02ZKh4tzVKapKKe8p6STdHD5HneJNOjz1GnLQsct7iGzvgbgxfOw3BWCOSPT929tadRnRrCn8a3FSNJGEV3J4Q52wGX7felBqW4XWc1YsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CQ4Rtrw1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-362bc731810so5726875f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 01:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719391181; x=1719995981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9yKfF45fFxX0NqrzvUPKwtywpvOvpdxxd5cgWduHSI=;
        b=CQ4Rtrw1p07b3jX3rxQWJa5yw/7IaTLdpGaC83AbDhvjkCbLW050TOnuC+Stk+QpPp
         +AWU/gMLyaqoTLk5Gl0T4Tw+5zeeWkTNNkjCW/JjaPDp9JGdpjAYVj94NV6rubKhf8gT
         s1NnNiXZsFVWsI2EQsKcRJ41bc+Um404Nzx0mF14xtTYyQPPG27IC0rrjvWm9w0wli7Z
         JCp2ps1YgzABQxzht3MaNDPeNOd70uUsomzIx/KDOeOLpCpAs4TF7fUfLzulbTrR4jza
         2lNPKKWky05TuwOuEClTm8J0lWCG7To7bl/wGZevA3Rqlk2oK9IKj7KabRzdCJdk3Fek
         EERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719391181; x=1719995981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9yKfF45fFxX0NqrzvUPKwtywpvOvpdxxd5cgWduHSI=;
        b=DRtNyhM5DdIItV3UXFodPaGZFg3+4ZxwxdLbsNPEgN8ICOnG9Otc5v1JPaH+Lf41iv
         MuWkNQRn0Xle4BQweEtAErt2JJLsoz2P1P8GLPfam47MZB6QmKd0LnqR0eKr0ISejZmL
         bn3aGmzXGrBGRzy6PoYIBkfVvt+1JDfFSMC4XyQTPdIO/o9rlsOfYW/wB7hWFJ6YFU44
         i9oJNPatbC6yZJLEYVq6LlFUigxnWuCkEEQwi3dGHchEiTtYMecQNK7XY44cr2H3U/jM
         UL+PEpNyjCrWdQir8TKHwEFsx3erOH7AQ+q2J/RUXnnrXKNn1lTcVUS7M30e/jnUWKx9
         Spdg==
X-Gm-Message-State: AOJu0YzZVajTLXsISNl8QgXNc6uq8cLH3e+j9ll24nYCtKxX+0oBipcu
	hWp/u0XWlzB1VHArYnUNseyqFyIUJpDgl0lcYozlAlmYKCXdAktGuWJ+JNlZ56dILXOxeqikWXA
	o
X-Google-Smtp-Source: AGHT+IEs6lBo5otfDhtsB1Twa+uJYgIAh5Rq06nVGafEYvg+dnsr4+FgYr6Io6O6eVtAAkKgbX30UA==
X-Received: by 2002:a5d:6985:0:b0:362:a1e8:15b with SMTP id ffacd0b85a97d-366e949d36bmr8249196f8f.28.1719391180762;
        Wed, 26 Jun 2024 01:39:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a149:6586:c473:97d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3670ca007adsm2458411f8f.25.2024.06.26.01.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 01:39:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alban Bedel <albeu@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org,
	Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH v2] gpio: ath79: convert to dynamic GPIO base allocation
Date: Wed, 26 Jun 2024 10:39:39 +0200
Message-ID: <171939117715.9694.13266518943488176229.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <TYCP286MB089598EA71E964BD8AB9EFD3BCD62@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB089598EA71E964BD8AB9EFD3BCD62@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 26 Jun 2024 08:33:18 +0800, Shiji Yang wrote:
> ath79 target has already been converted to device tree based
> platform. Using dynamic GPIO numberspace base to suppress the
> warning:
> 
> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> 
> Tested on Atheros AR7241 and AR9344.
> 
> [...]

Applied, thanks!

[1/1] gpio: ath79: convert to dynamic GPIO base allocation
      commit: 9a473c2a093e0d1c466bf86073230e2c8b658977

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

