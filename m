Return-Path: <linux-gpio+bounces-15408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD7DA28C03
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 14:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA6207A452F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 13:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AEC149C7D;
	Wed,  5 Feb 2025 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RaxhFnAL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA3913B58C
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762806; cv=none; b=E/JQ1gDI3Am9iki+t2pHjbImf7FlwWPxgWEC16sPYkEk8oQmptnlKOWLi8p8FQynhfgHFoPt/l5go9sjM0KzS6WSvexymZMo0f2gXkk/P15Yk1pltnDPzg9Wa5IZ7soMf0phq7+8K6YYwP3Qsx0JgFd/zUPeY1sc6xJhB1GTrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762806; c=relaxed/simple;
	bh=Ve93mwsrLnKqcrL4b+tMX3AMLTjOmyr9pkgOW1Gk9IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d2cZyS+9v3pDd/k8NbgiZD+0/XbCgseG4SgGw07rhIsggyN4oof20qrbHup+KosIVEFr6xGkcu0BZekEDbA0buzsCUK7fIGi7k1l/FSdkSw3uwmwRe7ssR/Z2JoM5RSOmQq2wDb8LBoRB6ZEHrkwmimEKN+/Gr2afGZ+xdFileQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RaxhFnAL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso47340325e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2025 05:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738762803; x=1739367603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0I5UAPNb7leRiFQPea3Mwu4N+fMvAxuwxayNKEzT8o=;
        b=RaxhFnALX3PPMurloh4Yy/tHpkdiPrvrZ7zhcQx4FEeQJWQTyfFduEq0YXhwb2wI25
         crCFuBnDLMaKxhgvNWSJz7K94Q+si7zDCadlhWInYy59ibs5zjt+3uoHB2a857BConzV
         uXyBUAt1qzTFo2RtcniUIPW+b3ScGaVFqGtHaFxRvltR19Bmo5YlRAKYrjh4UrrVj7nq
         UobYr6Qogt4BGD4bOebfKfEZYhEB2L/D6O9H1tsHFDiPf+Ee5Ytj8w+2FQBVIH/oZ6/Y
         CITsGQ2RGtDNtYazPHLwJusGehqjti1I15pkLiKUjJWgcwTCqwnO8LgO6JKfA9LwXzxH
         nDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762803; x=1739367603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0I5UAPNb7leRiFQPea3Mwu4N+fMvAxuwxayNKEzT8o=;
        b=mxgpBbKx0XHwZ0u/5/YUhWQr+ZDRbhdA98zOX1d5QRluVsqJD3CadS4YkLcEVDOHEm
         3mZG/yLQNwKBm9Bl8foG9j9QPq7f+PANwyBCATqnpkJyYIH33QHxljICX7RKK/WwNuQr
         L5quitYg+atWr2wjBxBPoUVU92ZK8lMs+8i4BShqD0TatRBSp/C8BNbsxvKKaBgJw64v
         SrpfCdjNq8CoK7ZWpguMJPCw5zsSPriWkcr9bt0uRmfHvvgr4hKEmWeA2BpmKkJZNHig
         q3hy8mD4gSJYAI1ldJESQOrIWxGdW6oNRJjfh7Y2ErUOUoz8brU3i+5AdRaS/SvOnB7C
         Iomw==
X-Forwarded-Encrypted: i=1; AJvYcCV4csr0y59Pr2oVCrAiX2wgvxN7tS3pFI4TgYSUUWhZua65gs7YTq7h/FAjaIHUaNI48Y8P5Nl1dIsz@vger.kernel.org
X-Gm-Message-State: AOJu0YymWZwhmOjLkEHlN/gxbNHUjHUIBL40geaCwAouHY+paFO/tZQO
	TQHaMXF3z860DHKxF/BW7ob+SvDvQRZUcc+2so6SFdDDorNoiIzrYyQpaldlbALYdJwnFV8VZ5V
	vtQA=
X-Gm-Gg: ASbGncufcTbk85jHcEeQN+omvh74reZH3M9YIwk5JLZFfEHDlrmsu296jvBCQKrbP2K
	AJEZC4RK7DJFbwyYf37Qt1WXIK2ceqZeMr2lXTz7OKb66S9oh9NNJSaOhTxZFK7w8IlktXP0ygq
	noUwWo/l9g5Htf2VxRSZnw+Yz0BLBpSpnX96bvLL9uMKPV2niBFpaFV0V3M1kq0s3wRxbDD2oQ5
	65+Mjc54aTEc/g81oUwk7dHpUN+lDGDq2Y6J7pekUy/PN+GZdW3nGJccVM7Qqh1ErocjoabknfA
	B7ZhtEjKTmyuzs4=
X-Google-Smtp-Source: AGHT+IFIv1roL1rPhbpQ94pwMrGgfqFC2BuKj9zjxmrwhOwb5I8/JHDgxOSRNY8p9y2VWAoPPehu+w==
X-Received: by 2002:a05:600c:46d0:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-4390d57762amr23467005e9.31.1738762802750;
        Wed, 05 Feb 2025 05:40:02 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3239:b668:f15e:fed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm21974185e9.3.2025.02.05.05.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:40:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Use my kernel.org address for ACPI GPIO work
Date: Wed,  5 Feb 2025 14:39:58 +0100
Message-ID: <173876277709.18360.13170516746376335320.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250204114515.3971923-1-mika.westerberg@linux.intel.com>
References: <20250204114515.3971923-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 04 Feb 2025 13:45:15 +0200, Mika Westerberg wrote:
> Switch to use my kernel.org address for ACPI GPIO work.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Use my kernel.org address for ACPI GPIO work
      commit: 59ff2040f0a58923c787fdba5999100667338230

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

