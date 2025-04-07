Return-Path: <linux-gpio+bounces-18263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97559A7D4D9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 519467A1F9C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619B5224B10;
	Mon,  7 Apr 2025 07:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ooH3VC2F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5C7221F0B
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009286; cv=none; b=IUB4DaeQ1u2juGEIoHDHdCd8Y2GXDt/pN7KMiAwEx6Mx3Z/G5QDgE6YybcOffTaDmYJHL7ZYuPYk5r4WMFrK0N99FmWoHlqeoQwSaGx52apYAPTnGvrbbPcn28fG+QTt6FJq7fnwcvsVkg2jim05YojmsLd3B9LBw+zLPzWQLXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009286; c=relaxed/simple;
	bh=5TPgUqd0HmcoLMpGeoe7qeEmcG79pUiSBKIbcb34IvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3JvLEFUipCPlqFTeRlUtBKm3VZzhf5iSPuxOwEuGnxDZZ68z9ZXhFW5tFrQy7G0jnfus7TYAORHjj6YY4dBgx+6CvBKWM51+Sabj7oDL8/PE5hyz7RZd93S8k5KK93fssEWi37GzQpPeRJq6Dm+7dU7DFbNm0xJU6MwRn7UmOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ooH3VC2F; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394a823036so36118465e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009283; x=1744614083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+T/7mYVfolcbjOkCvza3DGMsGSnj+rqjgg+o32/m+M=;
        b=ooH3VC2FeKZdnJ4sLdyFqlfYzIGhaSKg4ym7EzByTIKtKEexoPeaAwNOcZ8QHWy0EN
         ASp4MyeMJsOF4+c4mal4RIfabeGadIgbdrX2fdW17eTDk5GShob+V5MAxuf5nG6Lt8hk
         Yx4DHDB2eiZG/H9qRusVf4qvEzifMpPimPrSPEQ65eeIJgCcxkBdJ3TkSI2aCpnipqxJ
         PMiABwC0TOd9rmHp3ANDno11qA5jGnaHtLCC3KDbiMdOpKEWUNIDxTFM+4V4+oEWqC+B
         XMVT79nKxnqe/4lP2RlX4CCKlCmHzi4LeHg/AFi1RXk2Q0ugDRyAKBYaGkf+zy5HJO+R
         A9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009283; x=1744614083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+T/7mYVfolcbjOkCvza3DGMsGSnj+rqjgg+o32/m+M=;
        b=GtT7cqY4myPYEDN66RczpVk3eWRsutgSD/ZoUPNW9eMMeoFrRMcVKFNfZTSGq5yNwd
         spOTTSe6fnmojYCmpoRXFrfS5t0LE7RDdHpf0IosT+P4IWiTjxN/gHnxFjxcJEJzHa/a
         lKZP5neIbbXq+42SQYeH66QFbDNj+FxyZurOvfAmDMXNGtYiu6j0nF9vSTTdtwNb76MO
         Z9bC/65CSpglNlHDe/E6NC9VvD/vfS60CagjiMmPTEhsepDc41ZzVJZ/2uxCLUTBkcSp
         bO+pPPffDLhICDOnQoORlru/DmFsuzmRhrs0r6jh15kSN8+yM77/ruQJs5hZ7VQnYnWk
         vzBw==
X-Forwarded-Encrypted: i=1; AJvYcCWNC7UMJwxX1x2joys6ySWPLjY+V326VpWVKoEKN17vSRgGI4n4grnlsmbsIh9tE7BwRkPX9x4BwH7y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy17qRI3U5foy/fuos2fc5Gh6wpUkeVQN3bzsIPbo9fe0qGCHCE
	NxUFOrfJFlrng4yHMd12O2fxwrxRzi1ThdJOI2aAbiXBeiUhg9/437T6z3a+1dg=
X-Gm-Gg: ASbGnct/iwef9lT2CZhyDnvj0ORuVQgpE31xfPiPd5ExUQQIeUx3dcpCGMMlE0MFnbu
	sGOLwd+CJ11apfHEiqHTaUF9Qj6LhiTM20ZzyvEzt4c8cnhM1OUrdhJsecsr4xe4d9JZpPkp/T2
	XeUWNrvBR0V5v/H7Uc7j5XYohsuc4loSccH+eiYOHmY3M8d6i6uOt6Bj6CZBatmO4Af1OoXWDj2
	KTvGXQEpCQdbccWYDsvIBFOlrEpjLTYvWKMUlF9ZskJRVyseac7CaToeWdc1zetP3ZA7nw1qU7e
	ack2ccK0f1gr6TIxWf9qZTJDXIcL0Vh/mr6ivXSfoauQ
X-Google-Smtp-Source: AGHT+IGcKOBCa7rGoBkgj13Vd1NuCr6A6oAtcMZqy4G7ftLcXmeJWLhRH4aHf0T9S0fwKZIHepyjOw==
X-Received: by 2002:a05:600c:a4c:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43ee0768c6dmr50754655e9.26.1744009282797;
        Mon, 07 Apr 2025 00:01:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364d071sm119155095e9.32.2025.04.07.00.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:01:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: don't allow setting values on input lines
Date: Mon,  7 Apr 2025 09:01:21 +0200
Message-ID: <174400927858.9816.1582317982480672248.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
References: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Mar 2025 15:19:51 +0100, Bartosz Golaszewski wrote:
> Some drivers as well as the character device and sysfs code check
> whether the line actually is in output mode before allowing the user to
> set a value.
> 
> However, GPIO value setters now return integer values and can indicate
> failures. This allows us to move these checks into the core code.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: don't allow setting values on input lines
      commit: 92ac7de3175e3c17cbb76ae752b598cfb9dadf49

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

