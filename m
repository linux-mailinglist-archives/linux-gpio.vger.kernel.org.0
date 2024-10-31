Return-Path: <linux-gpio+bounces-12366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3E9B7ACC
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 13:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E92631C22835
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 12:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F7F19F105;
	Thu, 31 Oct 2024 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jri/CprH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E65919D087
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 12:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378307; cv=none; b=A8o0kPYfYOKRzoAuH/VvSPZMveY/7egL/9JFH0krEmsozh+jxhRhik8gNuzB2/4dKpBmIElWOgLMj2OVxVk7aZoBvmcpSfcapBXpfbKzDDCoaq67y9OH+KP/UW9wjeOd5DP+9iqrwkHOgH11lBtnT+CtZIlQT3bB1TuSnSZB2Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378307; c=relaxed/simple;
	bh=1cJTeyzn7vDLqCc8PIINomXm7QXgOrkmmDCiJ2+ovRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbOLgR9n9Z5RTGGC5+YgykhwDMcNP6N6Lz/JhVLCDMO8WtoIQ++bpk5xASKGD2qU7+vyZNjTFjVNhHc++d7hiGWlo0Av55WaFFWA7DrrXSbYxj6igi61kSF+0Hy7tRthLaOipTEvzWC3nccGcuptNtn+mTHFWUeH7ZdPCCIePSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jri/CprH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso7332285e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 05:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730378303; x=1730983103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmBF5h/TWefDrRULij++C6U7yHFjsi/cLL82N9hFyCw=;
        b=jri/CprHhv++bxYADekYZ/5DOINN/mphtP+neVuQyCIDIkGxaq1Wks1xVaICPyskbs
         +ZyGyHCXaxsAZRDoW+dSxO9Rrafj9STcw9CIHRZ/faDpTROc6Ss+ddy8aX5uDmKGmXVH
         NCPtiy/l2RVVS7QxvBeuNXz5oWfnmCRqvZyh0u72l0P/xx/Hdo6rh1HYMXQA9jGjuNb5
         Rsd4AdLn/bOUYJFqL+9o/pUN/xN5fY+3g2CeNS5V3D+FaZooRPQH+MXrqkziajaVzn3T
         4noBKFf71Vx1PKGor+BXhbJg35f/3n4Tf/nAtNZv5QID1Nxdwzunk1qBpuaRSsZ1iska
         bh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378303; x=1730983103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmBF5h/TWefDrRULij++C6U7yHFjsi/cLL82N9hFyCw=;
        b=iTHsErdqblK/zycuLFnrDXRtUZoGGMneMrOOgxFf36ZLMrMaE0namvifz1oUufwueI
         8SIXQ59sh3kj7RlFfGc+yyy8uavFmzMxNM5TRt8J0tyiO9NIyvjzW6m1d2pint/fDoBj
         L9QLCdGf+GJ4IuGYo7z8coN/gwuno7cKXVKMVmNz09/cf7vJnLX6WCrXFJScpyDZ+X3O
         w/EuMJJQ5eaJ3Oz72049uteSUaYjtQSK6w9surOc9Ec/eOKOODOh/b8Yg91ccDXb+jfL
         0EFWRlnn2qutj77LrDHLcfP1bzVl0Ki9qri+wivcGjibRrZd5P2apatnJLtaYX/eEbA/
         ZH8g==
X-Forwarded-Encrypted: i=1; AJvYcCVuuUwRvTfusAQw6txqGArsOiHV9D/Pr+3LCtHWI9AsiLTL3FygPWCGX5FWIcuiYlk/0NP1HqP6/JLP@vger.kernel.org
X-Gm-Message-State: AOJu0YzgQUcYyqv+Na42cvHtPnOHnauIDuuDd9GZ+9U9jgH9v0RZZIWd
	n3haJ/R4jn4BUp7szN9Fv92eqdHznvImibJt73r4KZ2mqYKxgGcSHJV0ywoXh50=
X-Google-Smtp-Source: AGHT+IEQ2s2Wn1EUmBJ4pYgNUgAtY8LV8iDEw8uwuEQMEgFeh5e058Ixt31/ZtENFYdEnTHUT3w/Qw==
X-Received: by 2002:a05:600c:3c9a:b0:431:518a:683b with SMTP id 5b1f17b1804b1-4319acacb3cmr148709535e9.18.1730378303342;
        Thu, 31 Oct 2024 05:38:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a6bc:32f9:21fc:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bb78b809sm67432055e9.1.2024.10.31.05.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:38:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: Add ACPI HID for DWAPB GPIO controller on Fujitsu MONAKA
Date: Thu, 31 Oct 2024 13:38:21 +0100
Message-ID: <173037828242.6687.4733700709962580211.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018015640.2924794-1-fj5100bi@fujitsu.com>
References: <20241018015640.2924794-1-fj5100bi@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 18 Oct 2024 01:56:40 +0000, Yoshihiro Furudera wrote:
> This patch enables DWAPB GPIO controller support on Fujitsu MONAKA.
> 
> 

No objections from DWAPB maintainer so applied, thanks!

[1/1] gpio: dwapb: Add ACPI HID for DWAPB GPIO controller on Fujitsu MONAKA
      commit: 4f61d7fdcbc422f82acddf33cc966a13de577ce1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

