Return-Path: <linux-gpio+bounces-16349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E56A3EEF3
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 09:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 108BE3ABBC4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 08:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAE7200BA3;
	Fri, 21 Feb 2025 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FW1KnZ9p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E62F1C5F3B
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127536; cv=none; b=VwY+d7T7tYqBBNJhBH10Weq67dRsqciPjnaqnDuJzugFcFrDb2PMc/qntsWLKGulK1qlM8hsSVT5C98Jo5oYz3OSPqfskgGfGFfsmqFlKOXqI3yeFHWXB6Xj53dQ/Zo43/Ui7t5hHWEvDbSfAGvdYYjReIEIEn8gKb6v0rmYnc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127536; c=relaxed/simple;
	bh=JOiSkw3Of29GygdrXa01G2NFBo9/Jd+ajUfDgGEETbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZAFRtHwjuQZ9Rio+9vJMh3hiDuDcs4EXOfcNinzymKPkE+v93emV/6pQ0Z2RVqX9rnBRHBiRwYpoG8CRkJjqj8peI3GxRWfvOm52OUscPHMMb0so6/AakdG1/GPNs4Zm4gNMiwIjRnvjlilMJeYuSG2iqNLODBMq2ZPsZMQmpYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FW1KnZ9p; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f29a1a93bso1488555f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 00:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740127532; x=1740732332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6sHuIYCGIcbnzcIquUs9mIF+IdKdCyx3g4gcUskxo0=;
        b=FW1KnZ9p+nEmSIPsskwiWsnKhfS32JMvKmBggnoDr6B0P54j1WA7FcoYPIytqlE74G
         Gs8FIO5XIOA0SGFU4SV4Yvvyak+3PFQStmPg86UU0mj3wkuJIJKADZ2qhqzhLg+g1P0w
         8KkF4l1124uF30AIm74/cD+n4iIHL4uHhCMUtzkCl/ut0ZsTfJzeWWCLCnUlFWA22arU
         DfYfgzWg3Ghp8fMARM+T3+5beBNbKGbS+H5N05MZSOJ43HtkzNKHr006bPSZr+tARv6T
         OVkH2YadzYsa8XO2bWHWUdPVr9/lPvI2i1t7sMsDGWgWRrQZMcPMx4J9Q/UcCM3ISaSm
         wsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740127532; x=1740732332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6sHuIYCGIcbnzcIquUs9mIF+IdKdCyx3g4gcUskxo0=;
        b=kcAWpwJ1jhgQgaFSzAO03ece1CHuo6RymcuILi+d32qd5iVHxVSHnNUoTpKGG7l6Uh
         yi1YSlroNiN2sGpEWJgFoIIYI6vnQ8uqhQhdD1n79I4LZJUee7BygXgG9JSyZF2ciZJG
         9NMgSzdqJvAWer1YFZ1BHS+U67PXj9yL2USCfIL/ZISurgr8LYEKoYoqcE9PD7lP6zeQ
         1A34azaSJMtyaQ66WxwxBElGq6nfzh6hkhv200X4h5xb9xkASCltJfkV9HW08lAGS4kE
         WCYMERGXNaS9lstxuBZgODELhz8l2eLEazSCSkolxZVio/fmpZok9n2nbYGifkx0yMqp
         987w==
X-Gm-Message-State: AOJu0YwsLMUFNmh9586p4ynYKR3nmGdnP8wKYWD/+XvaFgXEqD9jiWmX
	7/wcf6ffP5k+hazOs9qSRD/diOkpe/fqR7o6nPT6uCMkzXWlekQu/6WdlOBTRRx9PSx/EMtN5zl
	Vs0A=
X-Gm-Gg: ASbGncvhJQZnL1LBbuip6t1nCRqW2GmMAmNEOxBiQ97/dFyfJsKxRlTqYl6cIOxpNFB
	Y/Z3UQsm2AqMUO3P8jZuG3jZ5F3dyOjtI+cLtLBBs71K2k2jVB/MYWeSJOetfUZYD4RG307ZzFy
	I6U/6PALTtaGBkXblmI26kZwoRYBzxL36oMIUDJqaWxHixnWp/ErE/VTtPVj9nqaFoou3dSrpln
	XkcMnhYLqOcRRJWON7M/vdOoS41Q+d48in/3qSKf8aujQDWRbmgPHgiPloWUI2L75WU4cnUp1Ic
	k1JuDykljlsXWYgxcY1B8iva1A==
X-Google-Smtp-Source: AGHT+IFAHTvEXFJzOIEkvB/aBJb6Sj6QnltRBBjY5ZIakODLnKkwmz9VPK9ijSywKE/LojJKWNxV+g==
X-Received: by 2002:a05:6000:156d:b0:38d:d0ea:b04c with SMTP id ffacd0b85a97d-38f6f0b0f03mr2321820f8f.38.1740127532336;
        Fri, 21 Feb 2025 00:45:32 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6cbc:77f7:6f0e:5a7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5efdsm22501778f8f.43.2025.02.21.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 00:45:32 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Date: Fri, 21 Feb 2025 09:45:30 +0100
Message-ID: <174012752846.7834.12670955707272367276.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 13 Feb 2025 21:48:45 +0200, Andy Shevchenko wrote:
> It appears that regmap GPIO doesn't take into account 'ngpios' property
> and requires hard coded values or duplication of the parsing the same
> outside of GPIO library. This miniseries addresses that.
> 
> For the record, I have checked all bgpio_init() users and haven't seen
> the suspicious code that this series might break, e.g., an equivalent of
> something like this:
> 
> [...]

Applied, thanks!

[1/5] gpiolib: Extract gpiochip_choose_fwnode() for wider use
      commit: 375790f18396b2ba706e031b150c58cd37b45a11
[2/5] gpiolib: Use fwnode instead of device in gpiochip_get_ngpios()
      commit: 6f077e575893214136f9739f993bd9fedf61731a
[3/5] gpio: regmap: Group optional assignments together for better understanding
      commit: 97673ea38a77e42eaafcf5181c84f6c8d40b97e7
[4/5] gpio: regmap: Move optional assignments down in the code
      commit: a630d3960b6ac3c37cb0789605056e8845ffbf16
[5/5] gpio: regmap: Allow ngpio to be read from the property
      commit: db305161880a024a43f4b1cbafa7a294793d7a9e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

