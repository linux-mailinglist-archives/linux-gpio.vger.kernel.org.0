Return-Path: <linux-gpio+bounces-15040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C19A1A5EF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 15:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80603169735
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 14:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FE72101B5;
	Thu, 23 Jan 2025 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wsTPFG0o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B728420F971
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737643591; cv=none; b=a1NIKPz6yQASjt2bToC8jTqd+2zWgNOUqcxESfV9xNoS5SCIhqj+F7WGdXQdDyrX/C2Uxlnc0B/M31vX+VCD837X8s6buALxNQUzK1YWCnqLAwx9rD3sfpVyJ4SMymqOUdnQGQGMhuUkTrsLuQPOyTygZT3dMp6IYOBPnELzkFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737643591; c=relaxed/simple;
	bh=ZSXcYW7RW1lm0Y5aBlQdpdnEzWwcYwnyMHayjpCNWzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=irDgQny3qqad743ja3z6UnvkCQpHO8tQ536SZeW7akhidS4IQ6MDszUf67AefyYrlRIcElduvVPW/EGrKw6/qWqNAXAqNknWn403JVSkDuSssGcP6xH9U9F+Ra20gwlwSqFDHhqU/KFJm/rd0X6G9+QQB+yWWvM+LlaDv+W1gQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wsTPFG0o; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385de59c1a0so585284f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 06:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737643588; x=1738248388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE9njkO5rlhGWyfm/wwoDDQos0GMgUfQpTo3o3WC4dE=;
        b=wsTPFG0oew1+KwU/0S6hYo7ggOKWl+yR8ElHOQ2+drr3jP5v+9utno8JlWOgmPM8y0
         NQgy+0K8IL6hTnI0I+VDt7Fwy5+Ii4Omovk2bLatPNeZaYG/cSxVbi1zXJprIXZPPe1s
         Vs2Dj/JEKnpeqxRLKsmxexQ6T1kZni/TKgzXT4fl26g7476e7tiPLjmletwQS3efWCnp
         O3kO/nd6/dWFTx8M+Eg3gqYf9CgpsVPWuU+QmS7sWgkVS3qrDgenf8M/Y/GKAVX0veyT
         e0Kcx0a5LioQz5T7Ozgps60E0As8B5C8KzbiOPBuhO6VE1KSmgOEE81cQPDnFJsmfKWh
         /54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737643588; x=1738248388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gE9njkO5rlhGWyfm/wwoDDQos0GMgUfQpTo3o3WC4dE=;
        b=aEv6avbN6VpYr5wbCpn4HBp+S1KvTRy0GyPvwVKhxwQyqjNM2MVH3Pu08kzIAIeXAc
         cTHDJYY8H3w7O8KMHJiE7npAqL7hF6AGlc+yRd15BqN7tdrb2r9S1c9Vy1kLaQ4T4X0P
         Tm3hKtaycD1a5vIRu73NmgoN2WgRUlQe04ZgLDsWmykPR8hRku63khw8KUOw5L/TE0Ha
         rKE8Xw60o2/F8hgHGYS7YE87VnzPFrUdvm5LyVvIguBSFn9zMS2fX5nOGaU7PQjDxBkW
         COpMYmxZxHEVfQ1XUBQ6cN1i8pwkDZL90z3ZrSL7Aqo9uC7k/UiCoLByVQ4vtu7Jhtay
         LYqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSwf4s+Dr3nxlwmQ+kG0YDRDeycNCCHSvGPCtQRZiNdOovFVRE53E3uXyoYhHKDF2CTgmP7/+qZ1YL@vger.kernel.org
X-Gm-Message-State: AOJu0YzF5c0QjN+aku/zSWxqGfbp9Xipv6HIR8C9P0EjmM7FOeiIwP+H
	00Vxjhk38hSWcrPlPmJgF90DutcAfNe8+egajJ2Jw09FwnSaMt2LYnU7X46qCn0=
X-Gm-Gg: ASbGncvBKJdSCVCy9QcjHs5iOoMAOwLXoR2+hrkkaezvF38EXBEmQ2IwkKKLqa05Ib+
	sNXkARJ252N1O5J938guQHMrwHpOnlEW3PiLenNtatlZ8qPiWVO/9OnNEwCdFRWL21L6xTjuG4j
	HNMGHy0+bd0d7Q0bq6DeRyHeV9M1r4npH35puFfSFVv6BIN+DgXXwOWRi92CXEwRurHXwFl9H0k
	1MRwkGO/wMvdK3FDiX8Kmf911IeB+YvejC7HH5XMO/72gUlJnH6igrZJyVZiJAN6eMfuSRq71Wn
	4TYJ
X-Google-Smtp-Source: AGHT+IHSbJRP89PUvqCfe6XVziReSXL1TAuXKxVQkpUrbJ+a9b++AdJiYrNdmEQf29DsriG4tW3pUg==
X-Received: by 2002:a5d:6da3:0:b0:38a:4b8b:1ba with SMTP id ffacd0b85a97d-38bf5662598mr27554504f8f.14.1737643587792;
        Thu, 23 Jan 2025 06:46:27 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad40:de3b:e658:a016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327df12sm19671794f8f.92.2025.01.23.06.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 06:46:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kselftest@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	bamv2005@gmail.com,
	shuah@kernel.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: gpio: gpio-sim: Fix missing chip disablements
Date: Thu, 23 Jan 2025 15:46:25 +0100
Message-ID: <173764358055.127143.13169466880971669873.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250122043309.304621-1-koichiro.den@canonical.com>
References: <20250122043309.304621-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 22 Jan 2025 13:33:09 +0900, Koichiro Den wrote:
> Since upstream commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
> instantiated device depends on"), rmdir for an active virtual devices
> been prohibited.
> 
> Update gpio-sim selftest to align with the change.
> 
> 
> [...]

Applied, thanks!

[1/1] selftests: gpio: gpio-sim: Fix missing chip disablements
      commit: f8524ac33cd452aef5384504b3264db6039a455e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

