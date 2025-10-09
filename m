Return-Path: <linux-gpio+bounces-26924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07680BC7FC2
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 10:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9FF9421AAD
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 08:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5B323ABA1;
	Thu,  9 Oct 2025 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fe1UoEV/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A621ACED7
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997824; cv=none; b=F48f7umilon7uLYs2onuitxM3zRkqp1BS+g3PDpZmhVLWvklZcqwADREpXT2dxK1kQc2GntmtPADg7XohxPiKDbBRVdxutmPKiqNriKH+dQkgSb3G5kvnFLcoa/KQ2OqS793FpgNsEM40oF11FEA06G8cc0ZbKIhVkkmnVfEyuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997824; c=relaxed/simple;
	bh=zaQkcDogei2G1ewmx9no/uBj4S9Vs3XYvuVq8RvFSE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEPR+6y5NFqDizv2EruSCWe856MhOEw4FDMyKcMlmQjDhWxusLKho7BwuOE+V6CXkmzlG1YRWQgpBwKksdO0X1sFcn9HVK9q7nIXosFUlw2k+UjtZumcM2govFZE2YqegIM4q9CYCE4sSP4lp/MDfN0GO7ML41KIMBuwOwyWgwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fe1UoEV/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e5980471eso3606435e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 01:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759997820; x=1760602620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wESGfUGk9Ekn8+EIpth4qQu4oKkeft56uQtqgD+nImA=;
        b=fe1UoEV/wBQSOG66VJOBph41Px4U58jHBgvZDT3H10uWy7PjyX7VVPLH9gh/Bmbnuh
         XtJneU9gC3iIzAXYuoe5cpid4lPSpm43pg/mm9Cxxo0dmAqSSDdXgmIItvIO/hdjL4Gx
         yaAfHy881OEM/tcGW6vQ5LkkIRBe9L/0fdX70SIQlvegaaIQCoqWae62nXiKnJP7idkI
         0xWGTH5sD+dld49HstpEC3D3Nz71DXvDHAiOkYBpBE61zgby/SCZ8LPv/eAF1Eyb0sIp
         hOn23OtP9c2ols+eNYrxdQGGO9+cQ8DT463y3tdlhn4l8fzQ1+aqPP94LI79nDHFAGAP
         4ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997820; x=1760602620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wESGfUGk9Ekn8+EIpth4qQu4oKkeft56uQtqgD+nImA=;
        b=u96sXK6UFoHTIIA+tA+rb3uaeOPI/nAMXkSMjSjyYvWshEZoqHTT3PUb3YphxoOw3h
         fRiURUN0nIgM7lQ745ZaJtvdLFR3VrWbpOKNg73MQi0/7mkeUwbaaeo1XijiEQaNW7Ad
         JoiqsoRLrrSigaY0Ho0+CB7y61ti/9fQPFnwpPwFgn2ebtf1shv6tghsG9nHUlrrLU4j
         Og/P35K3IOfEp5mSfzvJ8lbboyXOU8YpdxlUsDO8XXEjpdKwqFL8HCojTjOeU/rxXhoc
         AjQtNfunK3pwTgXbdVezVSn97CI1xIFQELXU/zCe9yxMizTGw0/BAQru0TRDG3ZuDqtM
         CA7w==
X-Forwarded-Encrypted: i=1; AJvYcCVYg8gie+u1VS2mM5g8+lRAAglyNSjLCw2U6IOmLZEub5VRHW73NHyNJxkGl1f5vocxPBVktWYMxN3y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp+v9r+LyRi+210wuBZr/gyxmwuYOTLpztcS5tTmBvaTE4HC5o
	oFgsDgV/qasRDupNDyruWbX6EItUlw+M4cSRfM0LFD/wAACH+1QRhlOUKCB+bgWfH0o=
X-Gm-Gg: ASbGncu1CNsMOw+FL7/r+jVwCbfPJXO//gOQ/8+cTJbHCN6dLAJetGX/KFSKn0XuV7z
	d++5m/Gz56YfjuVZ5FCTRGL9pMp3ROqY9X4DuIoC6wxRgo0rctMORcETg3v2xHVp3PfC4uTBIkg
	sTkREfLwCXJmxWLpXObRJEyMgwNJ3M3JjegRIpFbooHu3N7/17awRzVnJPnZSIWokgVUV5OYenE
	GlC5x6vM0a1o8uLiVYXQKYjVdFSqLtKy0sFT1OaT8aL1uNhCWXXfpnShA6JeGkVEHuvfWXVPcvq
	GR3bT8qHhclrnGcqjCT5Aya4boBR9SAOupJp+ge0qgqVRY3u2S3jvmYDV03xM409zCPQqZk1jGC
	RdUYwwtXwOmbL6dEaV1n6CIWR5RkY3twM/vTFQWb6TR/apQ==
X-Google-Smtp-Source: AGHT+IF7zcwP2LSap+ST2qQWZ0NekbmOWMe9oCEI/pCkTheoJ/Y9DeMxTehJvfHWVTkpi6flo6Tr+A==
X-Received: by 2002:a05:600c:1395:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-46fa9a9efaamr46676845e9.9.1759997819549;
        Thu, 09 Oct 2025 01:16:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a78:91ac:9309:82b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abf38sm33103690f8f.20.2025.10.09.01.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:16:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/7] tests: update libgpiosim tests and add a uAPI test case for valid lines
Date: Thu,  9 Oct 2025 10:16:57 +0200
Message-ID: <175999781576.41629.4386423730309766446.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
References: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 06 Oct 2025 13:27:45 +0200, Bartosz Golaszewski wrote:
> This series fixes a couple minor bugs in tests, reworks the libgpiosim
> selftests a bit, adds support for using the new feature of the gpio-sim
> module that is marking GPIO lines as valid/invalid and finally adds a
> test-case for validating the correct kernel behavior with invalid lines.
> 
> 

Applied, thanks!

[1/7] tests: harness: use correct type to capture a boolean retval
      https://git.kernel.org/brgl/libgpiod/c/347adbd698537a32986b2a590fb6e91034d1d479
[2/7] tests: gpiosim: don't allow clearing hogs on active devices
      https://git.kernel.org/brgl/libgpiod/c/1aca992f8b8fc5f3d5a76043ada2a01f740f0066
[3/7] tests: gpiosim: selftests: shrink the self-test code
      https://git.kernel.org/brgl/libgpiod/c/43d100a49c437a842a0585d67ff09861b72567a1
[4/7] tests: gpiosim: selftests: add more test cases
      https://git.kernel.org/brgl/libgpiod/c/8379438130ca12424ef794cae7471736f519f18b
[5/7] tests: gpiosim: provide gpiosim_bank_set_line_valid()
      https://git.kernel.org/brgl/libgpiod/c/b4009e2e6715564ead10424ccba73eb1ecdd8a33
[6/7] tests: harness: support setting invalid lines
      https://git.kernel.org/brgl/libgpiod/c/d6fd0a065a17a98e5761421587fdfd5abaadecb1
[7/7] tests: add a test case for checking invalid lines
      https://git.kernel.org/brgl/libgpiod/c/f4fe71e9405c3dbeab41dc8ea772735fd64562f8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

