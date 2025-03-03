Return-Path: <linux-gpio+bounces-16924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDEBA4C186
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88FC316E035
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B363F211A10;
	Mon,  3 Mar 2025 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GOaFLujZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD8E20D4E9
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007923; cv=none; b=enBAAiO4zce4zG+wt1JFMJF03fwjAHhuG48IA6geWh/oApuKY8cSnhvTVJ75f34AnREk4o06aSzBSH1CpTfVkUUIfBjfX0Zhef1e6FqSh7FzRBELVequyHF6lnn8mkg2j505nwoDpsFEnEzgu3W6dwNChIjTGmHO37NY3WP0XZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007923; c=relaxed/simple;
	bh=FTj6xoyS39LnNrJXGLhXAeRS3nQ1U42Zly5B+pL7Yio=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KdeBIlXWMaMUt4amsD/tCvozTr1cgozuEzI9V9lH0lhRzBLmdcp13DSQ5F/p51UebLE1zPsZ3JPcvqyfVW9DMwdr+YZJOmNQ0O+xuiTrPG1eKTVaQ1lYHW9brjiZi39GcVOOTn9rI8Tb7hRH41A9grE5XcQkIVG0Ghw5lOEPEhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GOaFLujZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so42034285e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007918; x=1741612718; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yy1JVRlXR6nmaQaZdHV5up9VNNk75+ZYeI4CrMOgdUU=;
        b=GOaFLujZHGXooYlEWWQz5AjEHgwejfTVVRQM5UGhXJVQ4yQ0ho3zhacYPYYLamJfMp
         h1o1C/UsqQm6J4LLSPtnZXbkFyOL9nZmLhoEcWDPHnQtVobu3N2PnIXtuAX0pLalYShi
         CH8Q80o/d2E5J3Lp8qILRRk9tXRBgoTHMJYg0fpbW7sToelzDnXYGlbaTBGT10DKtViR
         6+EIQ11BXIvgDSayItZ5VrOsor4ciHuAhqzi0CK3McNcfY4CbHrQP4mE7ABMP4f4krSP
         Eo72eLuzKkUBC4/HHWHNszGsoywymba0lOhamtJM2NUrGI9WesorQGPx+Sf4NHmrXlO5
         GZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007918; x=1741612718;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yy1JVRlXR6nmaQaZdHV5up9VNNk75+ZYeI4CrMOgdUU=;
        b=NtpcbMYWVMBo/FTeTdwg2pRdMpNVGFu0sCQ+TN4jfBqTrrNmcL6jOUdIrNzHUUnIzO
         I6Q0ST6QW28lovaJt3uVczrCxEFVdan3DVO4Fvai939FuRut1MRMoUBb8VmkpfoD2a5J
         KlyOkuwR+289FWeznD3nQn6BNKOlXa6VeapVDTjmDbeD912B10GBFhoSurrxDq3zrlej
         uyrLvJAfFBdIfKkdkPllLH9VfGG2kj/OOILCDwmlICbIVXSdaZEvnyQhKiUUnQttWMg8
         iDzNpyQYNVzCdKfeKfJs75rgyKpE8AvHWg10zlka4ze9C6+aPyDr994RVTEUcxcN+f0d
         1DHw==
X-Gm-Message-State: AOJu0Yw/O05PulwBD2f40xmb+/LWkVSAeJu5+/4IUP/CnKWq4aT4qoOG
	z5usyDPKrMCcPN+SYbGKoqN/ATAPNB0KhMc6UrXydwz0MgbPY5HKY1m22QF61HA=
X-Gm-Gg: ASbGnctY8qxC/In6yliuvACM0Aw5Ks0JOvpHqaoswTylNkcBgv7kXOZx7EfdTxHvBbt
	SciYXHRrXh6rhpVkSgnvbpDdoBVlM8Vl/yqa7rfgLfAlprR+ucBwnWKqcOFrE6A1bpsbY5SB4Rk
	2HekrcwoSTw16qPBh8Jv6T7L8x7iwc6RXZSVah06BEhU2aT98+weREXiZzVbJiWM08UGINZwwkD
	NRzCZbpaR0KnyIdobhFcDjqXdR2oALLT1bUTBavd6wNAnUe4DSWiIYZPFLOpirAVk3V+QxQ2AWx
	8+cBmyRJf3G9W1ee0Bn1J25Ebxb7C58VNad80g==
X-Google-Smtp-Source: AGHT+IEYSoFbgh9Yo6fzCpbmc4OD7ixVh8/Qc+gBT9GOh1lnAk3c6PmzNiyXxz2KhEi+3a6qb7fiqw==
X-Received: by 2002:a05:600c:44d6:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43bc0fb007dmr31862825e9.7.1741007917860;
        Mon, 03 Mar 2025 05:18:37 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:37 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/15] gpio: convert more drivers to using the new value
 setters
Date: Mon, 03 Mar 2025 14:18:25 +0100
Message-Id: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACGsxWcC/x3MTQqAIBBA4avErBuwTPu5SrQom2w2KhoRRHfPW
 r7F925IFJkSDMUNkU5O7F2OqizA7LOzhLzmhlrUSkgh0Qb2ZueAiQ403p0UP4Ot1NuiVdP1rYK
 sQ6SNr/88Ts/zAth7bp9pAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FTj6xoyS39LnNrJXGLhXAeRS3nQ1U42Zly5B+pL7Yio=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawlRSaTKbF/S2ubujlU+T5mOtA2wT+5FfqLz
 f0O24SM9OuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsJQAKCRARpy6gFHHX
 ckWGD/9u+ceNcDwkzEAzs9WbMfq5vXhzHtIGaKqnxBBxx8KhWYFPKP7Se3MIVRL9v0JnhQ87GKy
 HDgBiwVyHynXsOKVlQw0APVr2LPRIaJaggMbPEmN6tfFWYJFXsseLQH6tF86XmqyVRZFj6c3Ony
 a2Ji8lD8KdpKO/hTUEHaEk1Y7QRzZR3e8sgS3FMq9xzd5GWdbGNLbVCi3bIcPaowv+oqGTsktY8
 IxJz2cM8pV89YbZvcWD4mJlhwti/GUcqKMlzqaiaGYSviLcYsgCdCp7UsOjsNZa9+BRiFp6+u2G
 HEc+at4+FRdvN14vwP083vAkOasL2iFM66uCpowT/QcpOV7uFMZsOYtaq9yzbx78N6FWFdahWYh
 9JwMY5WrPG9p4eUzMdEsDKKQN6u8tgZk1LUGg/uq3c4jH4NXUarz+uzydzMFxqXfRi/AoL9g+60
 VUkNIpSaLu1JefQwXm4VOq72a8rl9Ko95MHqVnuwKQJFNCyOieV5D07Lg6VTQwq3189BSB8faoi
 zlWMU1AEuEHIsLPV5ccoXeZEXD+S2JuM4av48cV6RU4YuT+xCqSPmjnhzwnl4JOxdJ7CFu72AsK
 SoU70k9bxmFIe9uGlfJiCdi28nlSkLv3bW09urYrHNMjhGHjTXNTOdEJ32yXwu8R2VpkIqc9rs2
 0+3p2O8qDdv/SiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

New variants of set() and set_multiple() callbacks allow drivers to
indicate failures back to callers. Convert more GPIO drivers to using
them as the old ones are now deprecated.

This series also contains some additional refactoring to the affected
drivers wherever it makes the conversion easier.

To: 

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (15):
      gpio: 74x164: use new line value setter callbacks
      gpio: adnp: use lock guards for the I2C lock
      gpio: adnp: use devm_mutex_init()
      gpio: adnp: use new line value setter callbacks
      gpio: adp5520: use new line value setter callbacks
      gpio: adp5585: use new line value setter callbacks
      gpio: altera-a10sr: use new line value setter callbacks
      gpio: altera: use new line value setter callbacks
      gpio: amd8111: use new line value setter callbacks
      gpio: amd-fch: use new line value setter callbacks
      gpio: arizona: use new line value setter callbacks
      gpio: aspeed: use lock guards
      gpio: aspeed: use new line value setter callbacks
      gpio: aspeed-sgpio: use lock guards
      gpio: aspeed-sgpio: use new line value setter callbacks

 drivers/gpio/gpio-74x164.c       |  16 ++---
 drivers/gpio/gpio-adnp.c         | 136 +++++++++++++++++----------------------
 drivers/gpio/gpio-adp5520.c      |  12 ++--
 drivers/gpio/gpio-adp5585.c      |  10 +--
 drivers/gpio/gpio-altera-a10sr.c |  14 ++--
 drivers/gpio/gpio-altera.c       |   6 +-
 drivers/gpio/gpio-amd-fch.c      |   7 +-
 drivers/gpio/gpio-amd8111.c      |   6 +-
 drivers/gpio/gpio-arizona.c      |   9 +--
 drivers/gpio/gpio-aspeed-sgpio.c |  82 +++++++++--------------
 drivers/gpio/gpio-aspeed.c       | 108 ++++++++++++-------------------
 11 files changed, 177 insertions(+), 229 deletions(-)
---
base-commit: 9778568dede2166c7bd124d473f9ec365f782935
change-id: 20250303-gpiochip-set-conversion-736fb6548975

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


