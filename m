Return-Path: <linux-gpio+bounces-7246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67AF8FFDC3
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 10:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DCDF289AD2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 08:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC12015AD86;
	Fri,  7 Jun 2024 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dzGUdEI8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5440155321
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 08:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717747555; cv=none; b=CS2s0ptoYQBEP7sURmsTTFg7qN/tUqK7x7FUqlfFUt0FsBstMnGzTvbGREAFfl5ajqTRHCjV5tP10MaoISDe0yXNjKSw6ioRYPN9vGL0Yyf7qOc1DJ5CRhvkPPoCMVzYtz79z+IKOQo6kMWMhDMFnN5CIxFMhmp7rGncbevtBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717747555; c=relaxed/simple;
	bh=gnlAq205GQPusvDIjdvBcbL3y/ncq5aXSIijyUU7/FU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NAxUrMksyuIqmyAoJYUSo9+oRYn4p8ebvKdcYNmzfJ89JjNRWu79mH7EoQY2tNvUg3GwFTqdgyzvVDcNYQdcNwxEetIUaKPx5g7CDI8bCBlR9JjzmJnSF1h4qPIwQE249mwTDS12Zp2ps92YxmulEACGUSS62ocV5QZdMScgpMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dzGUdEI8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4215f694749so12055415e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2024 01:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717747552; x=1718352352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rk5BY9qiJfHIXWxmctnqBMHu2thNQ/7XaWFUtMhjgs=;
        b=dzGUdEI88pN2l52x+EMbIvc2BWd3PMM+d7MRcVHSoPvgpF4I6yniRVXgK/yWDaCCiH
         UKmb0kzwMgICPjK+pyGY5l4EGthLJpU5x5mePn4+MKjjao9IK2b3EplsXheZyBsEKSwf
         y9+V5msrKNN0NZOD8yzXN1b0SZg4XmmIRIKEvIJ/ib8kcGZ6CyHyuzVKhSVWlhDDUCZ3
         bvJDycg+ruRPOYkNtNJXrcXu3U+Qtf4XWvWyAjJ2ffFP7lvXib5Gn9kXnoULvN8aL99f
         1LTjyxm/xQpzByq/qvDolwcor9ZUlRT3Lj4WMYytASr7PJDpnzCnkinp5ICsj8Dbw/Rj
         Fn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717747552; x=1718352352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rk5BY9qiJfHIXWxmctnqBMHu2thNQ/7XaWFUtMhjgs=;
        b=aFUyk4Ac5qmdeccVB2U8s6lHT0yDwY5hi7Uzwe4i8u002Oed2O3ILvMx4xlq34Ve/0
         DI/JLefp96PTTXHn9nya/q4caerQzRuTWNYOIbLALLVCNFPrlhgaytfDAmW489AU12xC
         j1EZCa/H8VQJJbe5iNTI+yi8aSv8XrWmtE032f/FnPYxz9xsg5BXwHCIGGjwXj70IuM/
         dSG4FLcHGkMQShvCndaMqRlwXJY46HZqMljheLyC47vKJPjQnNvfY3IQ/SPi6eSE0K4D
         nDNb3W4ni3rfMT/JT68nX/Deh4Gu3Uk4YxgPnDcGb67gCP1m6pJZZFm1ucwB6z6bFGYW
         jMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZLXFrHRWNMWXWAD2FSpeEyMisgXpWOBrxRqw5usUXP57acbZz/s57QMC8NcAAUfcGsL39ZgXXqhXCosmYyDrQH8UdDqhi8NRR/g==
X-Gm-Message-State: AOJu0Yx9IG1D3hkA0FqSpGOoS1Rxd8MUSNOmaemd4vfcLO43tdWRZK+i
	G6MCHPVVnF6wV3ZMmhdsogHBUgX1EuxzDje84xdZHn0aDzQRh0e3kDt9oNxvwCA=
X-Google-Smtp-Source: AGHT+IF+s0BOL1jUgPRca9EA8yczStlqMhBoMMl5RAdNkRjoKuYWcZMJItMNW5eUaRT9inHyhM87cQ==
X-Received: by 2002:a05:600c:350f:b0:41f:e10f:889a with SMTP id 5b1f17b1804b1-421649ea055mr14134335e9.7.1717747551951;
        Fri, 07 Jun 2024 01:05:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:69a7:93d5:5355:af67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814e7cbsm79119225e9.39.2024.06.07.01.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 01:05:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpio: add missing MODULE_DESCRIPTION() macros
Date: Fri,  7 Jun 2024 10:05:50 +0200
Message-ID: <171774754776.5536.13807607706868576187.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240606-md-drivers-gpio-v1-1-cb42d240ca5c@quicinc.com>
References: <20240606-md-drivers-gpio-v1-1-cb42d240ca5c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 06 Jun 2024 20:23:50 -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-gw-pld.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-mc33880.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro,
> including the one missing in gpio-pl061.c, which is not built for x86.
> 
> [...]

Applied, thanks!

[1/1] gpio: add missing MODULE_DESCRIPTION() macros
      commit: 64054eb716db52e4246527dc9414377c5bc5b01d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

