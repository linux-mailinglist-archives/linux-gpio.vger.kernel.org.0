Return-Path: <linux-gpio+bounces-23673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E8B0ED77
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80BCA1C83169
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE26A280CE5;
	Wed, 23 Jul 2025 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rnULUYYc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB7F1F4161
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753260114; cv=none; b=gMPJdILSxMkKzJaGrm2B2TGKbt4U1xVaAPJAniOzVCdsT5uGJqQH9EbGX1A5pPzefLQKdFziNDO9dD6nqUQQhug9Htp79A085WeTPQSEa/OoueWpZPS3CmPce7GAjEMl1JBgepRzZqshLDJjZVI+JLObEpVQT6Vh1DgruaktVzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753260114; c=relaxed/simple;
	bh=KPyVi5/nZIxHwgKBKEtm0zjwA8f1A+achXnMoLW2vT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KhgS2bzAxBR+MEkdZxx8WJCm6H1lRihNOWytuDmK/yfURMPMg5BFjewnaXHQXdBreAAp5cuow8fC0tJGMF5m2jp7W2AOPkBt+RCxBRs6zytxsGaNWOkYlrQSC/yq6YcNZQKWf37XM23GYvnan9szPZIY9OWeb2w2JU2n29QH+pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rnULUYYc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d7b50815so48484855e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753260110; x=1753864910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IH2wjrzjfdJrOxGA250VAbjT2mkP9Bdn7D4A8cGWXR4=;
        b=rnULUYYcg8/jtFdUraWVTX7g94L77SsKP9NMZQUDuePXW2SYPcVlih29fsLMU1h+QQ
         wKRA2BzDYBfM+sEx11nJB3OB1Gnb47TzzOC8qrDTzNAe+cIYG4ChUrPVdm4k5xbIkTvm
         WuO6u4v9glGhV5A2zf1GyFuj19DRKlQqu2Rx/rTatguR6kggdYTq7heZmv4SG4+I4+6Y
         PKO1xbpO6xntn4f3knB2gxsGxg6+b1j8YQvYBpkyHrV2hLtVbqRmJgNYmoCsAmPxH7ur
         3vPwTjZegba3vbI7F08O2MMm2tTJMdaBI1PkSn5EkTNCZST9G+rLJmEayuV2wY0SV7tI
         6gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753260110; x=1753864910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IH2wjrzjfdJrOxGA250VAbjT2mkP9Bdn7D4A8cGWXR4=;
        b=QLG4PZ8IFrAT4PRewXAINT4HAfbKLYaZw7+NlNGC023z9L8dU+tOt8o821xt1a68IH
         j8+1Kb1hZpv6/7/IpHrKrT/Mz2zCsXiG1VwA3l+Py7hprl4jF/bKdy5m8xHjoU91clhw
         23zphJCrFTAUfazTYjO4RSEYIugxwl2mS/ncOx6A9pVkMzv3rE5/umseIZP7oJt95hIB
         9brfGyfiE3H88X5gYIXp0i4GCJn7EcVCBMsrfsvjzw/OqxLMOL2fH0PRSTxCid2JV7fT
         hrx/VODIMvGDKJgPzR+eVRTW2KiDmQWzVeJNjKP4T0yvCwPOiv9rXvD/FHmw4itctQGw
         lqHw==
X-Forwarded-Encrypted: i=1; AJvYcCWjRAEBBQmmibPR9Jan30KxdHDeN2I1sKTIdrs0x8X0oqe0cuo8t1jLPJoyGF90oWHc8e5zrBX+8cQc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4JX/EFyxld8pkaLfcL1FR3cWeJgq/+quxHkVX3klHy8UliL8i
	DdICK4s6twbcaQcDluYQ+E4pSgZ1HSJvGNaRyWE3kGcGzcOtks/6QV+vjQ9dGERdQWY=
X-Gm-Gg: ASbGnct/dAuydn2aYwgvQlmHvKYJ34Mw/t6hRC4XJbU4oHZu3Jcz81YbvojTazzAIO9
	78kqYX7W6PnheRvHxSpgFzGXzKPmzfsMqcR4PFtOIRfdECQ9nCdcw+v3dr21Wrx08HaxxepCgRy
	ITesEq31zQlC8dtpAgwVZLjMZXRPq1KrbATwiQhd7AJqpQBp7L3INF6/1Q4ejErafOoJ59vaDSj
	Bbs9ejVek2kpKEutBp0JJORL8IPowIFa7SbvyqcePFXG4OAFtNeJyuILoyTqEV7Jzbh6kajsUjb
	DFIFdCZZKSrPfDEO70rOmsJN1qkDafYTReWilqtsUBWUtDrS3oOhOGq+n7WIORwI4oSy8GBBiip
	FRaMP3j362UkKFkaCnMAp/w==
X-Google-Smtp-Source: AGHT+IEnkZ9kTvvy9gav3s0JzoKsMp4FgmfJDaesNEPydYLSgAB6l6bF9ogt0Gu+vaSL9hZoEPeqlw==
X-Received: by 2002:a05:600c:a40e:b0:456:2698:d4d9 with SMTP id 5b1f17b1804b1-45868dcee82mr14396555e9.3.1753260110040;
        Wed, 23 Jul 2025 01:41:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34cd:b1d:d4f9:be03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458691aaec8sm16123955e9.23.2025.07.23.01.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 01:41:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Yang Li <yang.lee@linux.alibaba.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] gpio: cadence: Remove duplicated include in gpio-cadence.c
Date: Wed, 23 Jul 2025 10:41:48 +0200
Message-ID: <175326010614.34828.11615771707320405154.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250723064608.2178024-1-yang.lee@linux.alibaba.com>
References: <20250723064608.2178024-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 23 Jul 2025 14:46:08 +0800, Yang Li wrote:
> The header files linux/gpio/driver.h is included twice in gpio-cadence.c,
> so one inclusion of each can be removed.
> 
> 

Applied, thanks!

[1/1] gpio: cadence: Remove duplicated include in gpio-cadence.c
      https://git.kernel.org/brgl/linux/c/ff4322b22f35c010643de16c6f13e285bf314d83

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

