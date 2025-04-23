Return-Path: <linux-gpio+bounces-19215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FCDA98877
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 13:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E41DC17EEE4
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 11:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E5226FA46;
	Wed, 23 Apr 2025 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3VMzw4vT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E58C26E165
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407494; cv=none; b=PEU/7xsa+jQyK9kJe8BTercTI8y+mMhifZxc9D4TJqb76FooE8aj93yP3zOFydtkfpsjAgG4NW5qunaLGZZ4NQKxH3VsT1nUoWAu8UIeRX+FceVI36ttug8SDCPTz2rLp8SPOlZN2i62ePQ/fe0XvL8793behDzf1004oo+yKCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407494; c=relaxed/simple;
	bh=ncxIYZozl3N3HdWJb2uKeAj2BG7Vhq1ZxeJg726Fiys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fr/9kUFhChTi1hUQtCfq06Ga1YvsgsdR8iNo1oRvNTeyToCP26durb9F5h0fSnSPj3dkl8xaUprjYu4Ku9JakrO8A58Q7BWX3+8LUv6pKO0OnyGyV3OUAZ0zQ02nGHf6EBhpX0jZIGBu8OKivjUBJ2OEfNxhoEVjO2Im/FR/NSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3VMzw4vT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso585341f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 04:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745407491; x=1746012291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xEJcSBKi98pRIDlGVSCbCsSC4vSPyuZ//ZIroNx9Q=;
        b=3VMzw4vTb1QfElPB8HBoN3Y/3jdiJjouJcHe8waRkQ2z4ErJLFBlppi3juYedILygk
         7TMVcuAF5OFWSqZtCRrkt97Miux9qOzmBp+ksiYKOvgmjYMUE01zpoMDaC70qMO3qutn
         4KTKyO47x6e0XnGkC/w4zug/Gl02QhX+TJeaeV2fWJ4p6LDQR7KyzFDBxsI2h6KnIFAp
         WShU7akfhtEyXKB63mRYun1ytiBAyRUwx8uz7OgyYUdiP4ZbvW9Y4K0RHi+9Za71setX
         evumo/AlEDPd2fob8bfRUu5q+y/6kYCRuSlY+t366ftoDq4Yg9a3CW2z3gZYBZIJRv7+
         cXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407491; x=1746012291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9xEJcSBKi98pRIDlGVSCbCsSC4vSPyuZ//ZIroNx9Q=;
        b=oqturnJGEBfDhwJ7XQo0opdJz3z4iWNaLGz0iLlDZBvmc49krOiZqajzAtKqSDKgMr
         Tlg60eMQlla8O4AziVzzEyn+w6TRnYDIoHOVFYR0r+S304uu872aus/nn5LeQM4FcBNL
         kn5kFi521emqk/EdRBHVx/Hzg2BEPK1QfFwg9ysqAQJce+prz6wfcpoUV48AmDHiD42i
         a3b4LD/Esl80DWFkIph6fCMVUUEFFxJzOAurr/mvjjSEQfnqu7QqV5aZ8OJDLHVTn9sE
         3MwuGKIAiOOOW2W4ofv8Q8v+b2LaUe0dMVY+8PxrRKIo3NC+V36jcoJNFR2koWloAgRp
         GTfw==
X-Forwarded-Encrypted: i=1; AJvYcCVBdO2AZHqgLAfAtiCTVJQtwl7YytwEXbBHpJV261UsV8z53z7UiB/no2Bfom0nD29sKOCLFqtYDIfA@vger.kernel.org
X-Gm-Message-State: AOJu0YxLWb+4FuJRMh4NLCajXVZjZarWkKKCVY5p6Vah6s8h8tKkiyVG
	SvuA+/3VXhEnV/MRQM7WwOhMi0r8EkVbpMbl+cPLiB9wk7Li9QhHF2m+GuKVAqs=
X-Gm-Gg: ASbGnctJrCeI+xBGJQR52Ozgr5YGgxLwmuoQTJB9113zplyqOz1ucOB3oYuWvkZl/eq
	75Wb6D1rtoDZvMw94Fmm87BnmAkZDDuwbyksbMHOxt3ltwkHETFzlF+FM68RfvGPV3uKWsLnW84
	9BYbbulN22mfDa1IpMHWo0GhpnF3yU7+bQ+7L3RFKmebf50sksbzGWLErvSOUkt/v32/Bzq+5KA
	4N7MP6VqNfbE/rlzp01ujNLd0y9Awjp48IqAnTWZrtSSKW6pqKTSeA5sU6HWBHGrCCb7etpOnY+
	/FB8+2Z5bsQN739xScD+loXYCfDfjYpwAIhg5LWF
X-Google-Smtp-Source: AGHT+IE/8aBMTgDMeNGhw38uYxbthi7915ysYEty/98iC2vU3Ts+4+07GiW/1NU/mZprn7jV6XzjaQ==
X-Received: by 2002:a5d:59a8:0:b0:39c:1401:679e with SMTP id ffacd0b85a97d-3a067222757mr1949294f8f.5.1745407491320;
        Wed, 23 Apr 2025 04:24:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433170sm18245595f8f.25.2025.04.23.04.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:24:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai.pt@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v3] gpio: pca953x: Add support for level-triggered interrupts
Date: Wed, 23 Apr 2025 13:24:47 +0200
Message-ID: <174540748241.56202.13322099226080640371.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409-gpio-pca953x-level-triggered-irq-v3-1-7f184d814934@gmail.com>
References: <20250409-gpio-pca953x-level-triggered-irq-v3-1-7f184d814934@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 09 Apr 2025 23:37:30 +0800, Potin Lai wrote:
> Adds support for level-triggered interrupts in the PCA953x GPIO
> expander driver. Previously, the driver only supported edge-triggered
> interrupts, which could lead to missed events in scenarios where an
> interrupt condition persists until it is explicitly cleared.
> 
> By enabling level-triggered interrupts, the driver can now detect and
> respond to sustained interrupt conditions more reliably.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: Add support for level-triggered interrupts
      https://git.kernel.org/brgl/linux/c/417b0f8d08f878615de9481c6e8827fbc8b57ed2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

