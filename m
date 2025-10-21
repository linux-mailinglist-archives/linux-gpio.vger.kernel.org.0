Return-Path: <linux-gpio+bounces-27367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E41BF6661
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27B875463DF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A219B355038;
	Tue, 21 Oct 2025 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wDcIHRtd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EC0355026
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761048660; cv=none; b=WWskL1up95e0s9hceXG3PfG30oQbRrd3piccpR8zPMaVsSSfNpvGxI8+xW264Pec01xr+dYYDjG4dVa/+HEQal11ZnJpMKzuZD4vIZc6/XXPFFiu186dlZfVBllFqi+uiH1wU0K00zpWt74iZtxhuSd6vWp0rE1OT8T3MNP3AgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761048660; c=relaxed/simple;
	bh=SaL5Hdd+AlAzhu7CLNV0IFeRBUqzc12u5Qcc72oUets=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NyJpGlSKnfoQpD6pTy+GqETmWJBm880B/wWk1ma62wXXfVqXORh1v7yx097239o5QBPpez/Vxpkjd38GW+N89oQop1MMWPQUbyYBclMNoMQYIfTaGwdZeQM8bI7MRefiwb043SbgZBT9aKf8dER10dF8bHvY6B6ahy0JthI2PEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wDcIHRtd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-471075c0a18so57969115e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761048657; x=1761653457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtxly3kQYxnRyXoIDVW2wTlRezx+MmDctdv2f14Gy50=;
        b=wDcIHRtdz6Eicqkz54qp5JjwZkpVBuKzO3/rfbxH1a7hE5NCere7366EtYn09gLwgq
         XSAjSzEpvvLpxCNsHb3x1tAMDiujVkHaZCZcIY+0iHhQVf5IKwZcpXYTQI/6Ou3L+ltR
         EDmtw1lnNCDoC/8Cb70N9EtKJjchq0roHhmaZu4jsu6Nf1LklfaM4z9pjLw1Xn6ic0cL
         TO9+np3eJUpZ+rvVm4EZSGZp3r7oKSNvdczA29T7S/q2BSeZolq3JZ83rq2SqgRBZ7rr
         tk2kIkRLMCyBfbi8ghalf03jkTwYrT23dyWXe2aAxmIjgTQ/dYGRj4yMw+6b+4wdwgYk
         kwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761048657; x=1761653457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtxly3kQYxnRyXoIDVW2wTlRezx+MmDctdv2f14Gy50=;
        b=D2U/6rPMlrsHTNzC/J7XfN0o2GVqVlcvVJB2lCG4fyXq02Mn/SP4/DzLIk6WecENmE
         vOFhRhzUMYlGfO65WS45QWwUE9bgpBk6lMyxEC8Frud1dZ0qutsS0ssSbUUu5Hz9MZef
         tVNvqDnM6Jx0aPAkxPQ8x5uuMSC7y0iGPs722dE8c2uMBLwmaofbZv8tc/r470sj3ldU
         xPEMpnNLr/mRQrQli61LDHpgCSK+9Mhz9PXa9dbbppxcvOH6M1bdiP9AWd7P3yIEhsRU
         eQJkHUHCFHSMfhDo/ZM5qOOwDUGeMUbNNGUvaf+kI/XC3Y32V0nqsT92sIAkhdCMWf8r
         Oe6g==
X-Forwarded-Encrypted: i=1; AJvYcCUvwhQofeOzzcPI+g11KbFqrwKCB8rg0kDkZttnZMSema1ANytxhSZXSgZJKipobQuXYVXI54jH2Jdk@vger.kernel.org
X-Gm-Message-State: AOJu0YxoUe9ElOC2Bm5yXu+132Gc0/cEjHYfrmwvzwqJLR+Dywzoe8sH
	+tUMzbqGoFzAw9kvw87yR57Q2W6JeDpYg+wF/Aei0uEgw+UA1Vi3pSdJNcDs8OvWufg=
X-Gm-Gg: ASbGncvnJxHMK8ixXRpCkjfrXOy4WONKrO8PTDjd4b8HVsjKy0j6dw6O2Xmc3klfLZZ
	n3s5HuchrOo5eT+Ye5oNKsoCi68jwf0tiHl5TtAGBi7+qtG8TpLZGTpOGfywUjGK7hzVE9XMtU/
	KJfmKmKyUhOGdOJVmLedWcrLxbcDFzr9pX0bJSZo3MSGxyrMsGWc0LYGdcEajQScRZdH0StJoRg
	JSDLc0Qf8B7X7MLYq0OklQ/B2gJK0rqJTrCL8B/ZxdbKm7yrIdUdFQOhsjRz7wSU6LYnIs5AJMW
	wwqb1q/N3bDbs7MR+R/Yn4xGSpHReBOlDXuQ40ilogAA0Jh4+JSN3wfbxeR5hOHdVCGsVzp9aqh
	LTf+ELu0QUlHkMC0CYKIGSptdQpnOj9mkh5b+IilLQq7zmiQc7f5uQL6ZO9yAslUMmKc2AGWIax
	nGng==
X-Google-Smtp-Source: AGHT+IHhcHl2PtK3D7ZC0ypOA/rvfMUFfHo341+xc//oeoL6V5waS6eofKQEiAaatQp+riu9Ujue0w==
X-Received: by 2002:a05:600c:350b:b0:46e:19f8:88d8 with SMTP id 5b1f17b1804b1-4711791cd8fmr159636965e9.34.1761048656876;
        Tue, 21 Oct 2025 05:10:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2979:9ff9:6677:97c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496bee326sm15474005e9.3.2025.10.21.05.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:10:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	tzungbi@kernel.org,
	dan.carpenter@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/4] gpio: mpsse: add support for bryx brik
Date: Tue, 21 Oct 2025 14:10:55 +0200
Message-ID: <176104865318.22669.16904591051236557444.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251014133530.3592716-1-mstrodl@csh.rit.edu>
References: <20251014133530.3592716-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 14 Oct 2025 09:35:26 -0400, Mary Strodl wrote:
> Hey all,
> 
> This series adds support for the Bryx Radio Interface Kit to the gpio-mpsse
> driver
> 
> Here are some of the major differences compared to the sealevel device this
> driver currently supports:
> * Uses an FT232HL chip instead of FT2232HL (this is easy, just populates as
>   only one interface rather than two)
> * There are only two exposed GPIO lines, and each is hardware restricted to
>   a particular direction.
> * This is an external device, therefore hotpluggable. This caused me to
>   discover the race condition in the polling worker teradown, which
>   accounts for the bulk of the changes.
> 
> [...]

Applied, thanks!

[1/4] gpio: mpsse: propagate error from direction_input
      https://git.kernel.org/brgl/linux/c/523ebae1cdcf8056dfe090f31284d1e5f5d1b73f
[2/4] gpio: mpsse: ensure worker is torn down
      https://git.kernel.org/brgl/linux/c/179ef1127d7a4f09f0e741fa9f30b8a8e7886271
[3/4] gpio: mpsse: add quirk support
      https://git.kernel.org/brgl/linux/c/f13b0f72af238d63bb9a2e417657da8b45d72544
[4/4] gpio: mpsse: support bryx radio interface kit
      https://git.kernel.org/brgl/linux/c/03ac8183c9a5f0a635184d3f4eceb47480fcd4a7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

