Return-Path: <linux-gpio+bounces-24183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67AB20AA4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A9C42A50D6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8F11A2632;
	Mon, 11 Aug 2025 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1wmiJ1RT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A23818B47E
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920093; cv=none; b=frtShnH55fZyq6frKvw94Gx8RU1MdEy86DQaj2CWCvgHDf21Q2EI3OFEHhzDGPsd9A91MI4Rx3RHwdGCtGLA7G9JZIfZpSjhOFFs/Y03r31GkbhPAhs9pLWTzM7KW3iKgEQuEs2Oe0orr9dpgMKLfiU/J31hvBc3QD1RL43i92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920093; c=relaxed/simple;
	bh=bVX0v89UAUdnlBPHEZSVVlNvOwpGXSx6cfiZ8LKvlF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N5jf7sFRMuC9pG4p+ehmJWh3ruP1smcg8sncfCHeDuzWNDh6840suyGveqAlJQoYAFET4sVjcEmjQl55SAv0thk5ZAyrC3PT6LnFwoR/D32sdZidk0v+ZePqXDZsjl/J8WBjxao6OMQyh1kLighsD0tG5X+yyqzHphJnpTLkprk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1wmiJ1RT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b786421e36so2342663f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754920090; x=1755524890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQbmbUuIO/FixqY/FscMGC9UsXtq4qbXi7Jq+h158Fk=;
        b=1wmiJ1RTPygsbLfiLHXj0okugYCiXJvQuzSQ69FEUWU62KQUvBSQZW+9OfnvHxPQXP
         lp6U7kp52F1tGp8ubS4thCJfvC2SGlfIwVjT914DBBhhCE9sqf789SYLzEQk74XqSJxO
         CR1senOhxEK3j4AIc11wWobL0aIZlYcwzTCUA6VZJBleBGfgna000lN4n2ezhcbv1XyP
         kiOzUauMBUSpKqJd2ZA1KKIOH2crRrXQDXbgPEJYol0SKZxVjGPeBupSu+f4jdBZ8Bs1
         SalRk7jwd95xdnWKYV6+HZjGF3GkPdGrTs+53lEkmTwnUUnpgYMIyxnVmFf7pe56VBHZ
         B90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920090; x=1755524890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQbmbUuIO/FixqY/FscMGC9UsXtq4qbXi7Jq+h158Fk=;
        b=PNo7OL8kZGFggX99JFy4pMo5wnYdq0uhg89m9iapnFR/0PP5iKBarnsdzss+uAnULp
         60dzjbzohb3N/vLU44rldDhHu5LPYQ6slqhx9Dc3PPGLgDKEFl5UkKZH8uIifQubHUWt
         eX7lHbULbzQimMfmENZymfwWdr6qE51NS0aITUCOHh2JqS6tETw+QO/l2pUZF3DFbJxL
         waMLoj1HjSpLaRWphkflZFWnwfcD4n4V4XzKqj8l/YKeO+BKMp3EZRdMHo8eXTdyZnQW
         oQJs86Tv6Xpf60uAAujf/BfI6jHb7JnY/3VZ/pvU0COYuutpmEPg5sYOdwWTR9R0v7U4
         w85w==
X-Forwarded-Encrypted: i=1; AJvYcCUXtoqny0dVlOqmZSodFSbW7CfM65ApOiLOCKJK0ObAya+xpiF+N5ZMLL4KRGfBDB83TSLGCBwzAG6k@vger.kernel.org
X-Gm-Message-State: AOJu0YyoBnXp2QikHlZjNutQCf0iDzwPnjuTLbRm6fCUT9cFWb/kVfbk
	znmADDSxoY9diulKN7AaZKkazTp9AfLovZFOu7Z7mptnoEORydOwPFJAlIoZLtqz4z4=
X-Gm-Gg: ASbGncs1o2zr6EXd8E27uYJYq+oKCP9AvgQ0LzidizEVLjWil8ltk6IJ+1T2oAPx5/j
	47l41ejyTE1FFkP0jKXjvG4M+1mr1phKOkz1pehNAvJBEDePc5z9P2dtbiHoQcx2mePMKRnWKCB
	VQN+abtuC+mFBVRoL7d9PFIB8cpPRkhOuPHt2D/pWxboBsSLNOjlu1KdoHVLOpUGJmi5cCng2er
	TOQ8NWfgUJ6yBs3iKf2UVEkWnLQ7p2/9UEMM9ecrPfo+ET4hz6wJw2TJD3uQRnBP+3FydwbVAz+
	6gkwaokpH0yVxOlnwIUP01FhQEqiK0i1Lv2RKUpVy73vXYPNeboZL/YBpmhKEQm+OmXHxf4Sh5R
	3hJChafwFS8BfcZAoGCU9HJ5O
X-Google-Smtp-Source: AGHT+IEGLWnHTsgY+DQSPIbj10ccfo7+PIuZIGDyIiH0rtT1Xh+G6PRvNotxenNW93+TG3JyihzV1w==
X-Received: by 2002:a05:6000:22c8:b0:3b7:99d4:c967 with SMTP id ffacd0b85a97d-3b900b50d93mr11418569f8f.40.1754920089833;
        Mon, 11 Aug 2025 06:48:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459d712c386sm339621115e9.23.2025.08.11.06.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:48:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw,
	linux-hardening@vger.kernel.org
Subject: Re: (subset) [PATCH v9 00/10] Add pinctrl support for the AAEON UP board FPGA
Date: Mon, 11 Aug 2025 15:48:05 +0200
Message-ID: <175492007083.69870.1998290411416656246.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250811-aaeon-up-board-pinctrl-support-v9-0-29f0cbbdfb30@bootlin.com>
References: <20250811-aaeon-up-board-pinctrl-support-v9-0-29f0cbbdfb30@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 11 Aug 2025 15:25:43 +0200, Thomas Richard wrote:
> This is the nineth version of this series. I rebased it on v6.17-rc1 (the
> only one conflict was in gpio-aggregator due to set() callback migration)
> and added AB from Linus.
> 
> Best Regards,
> 
> Thomas
> 
> [...]

Applied, thanks!

[01/10] gpiolib: add support to register sparse pin range
        https://git.kernel.org/brgl/linux/c/181fe022ecf8a8e85def0e94852c631c59a8b3f6
[02/10] gpio: aggregator: move GPIO forwarder allocation in a dedicated function
        https://git.kernel.org/brgl/linux/c/871c7cd54830c0bda15513238ea9d46fc1cae991
[03/10] gpio: aggregator: refactor the code to add GPIO desc in the forwarder
        https://git.kernel.org/brgl/linux/c/c44ce91b8ada680074aa976e61fcef5633e6f086
[04/10] gpio: aggregator: refactor the forwarder registration part
        https://git.kernel.org/brgl/linux/c/10d022efe2c4bb2020a07b2e4d94b658ce30aca4
[05/10] gpio: aggregator: update gpiochip_fwd_setup_delay_line() parameters
        https://git.kernel.org/brgl/linux/c/b94cf35db606453c64e5da13c56cc6f8cabc6a33
[06/10] gpio: aggregator: export symbols of the GPIO forwarder library
        https://git.kernel.org/brgl/linux/c/6e986f8852f56cf9214ea2ec02b4b432e201d02c
[07/10] gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd
        https://git.kernel.org/brgl/linux/c/b31c68fd851e74526ad963362ea205eb97b9a710
[08/10] gpio: aggregator: add possibility to attach data to the forwarder
        https://git.kernel.org/brgl/linux/c/60e92c1009c7c6abd4a9d0caf33a8cba5d09f67c
[09/10] lib/string_choices: Add str_input_output() helper
        https://git.kernel.org/brgl/linux/c/53ec9169db1345f04174febb90f88a871fc28d9e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

