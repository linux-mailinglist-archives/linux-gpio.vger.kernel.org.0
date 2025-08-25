Return-Path: <linux-gpio+bounces-24916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0283B33C20
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 12:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A9881745F6
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 10:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2333B2D9787;
	Mon, 25 Aug 2025 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GhjuDSTj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833632D5432
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116364; cv=none; b=SPLpx1zBDUqKgen1qxbWalWNp16ftuS6jirg7OQfLXNH7O849LAjb1dEhA7pinyVsnyVQigeqNsD7XF4OVRivBMZlf9bsoFysWFf2BS7wlbaWq3UGQ/2dsMBQrpENu3fsD07qtl0zYVHp0NVjwJfC2V7Ggs8FpOdHC/SudUjHfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116364; c=relaxed/simple;
	bh=/WoMjBZkgovZ6rm/ZceYUZ6EzVaLu8EL3FycFjx7JII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LlnifKhyIO3gydjViylNVxyaZMn4+GBw+Qh7FgqM3dirDqGtGXLxPW+ulGu1P0fzePWHeeJDmcIcCBUpsGlyOcO9deMba0vWyArqtdXvoSDCJ7OJB574d3DinWg6zwUonFSglyv7mG4aO6f5i8wrncn3EuTk6sF1XNWh52UCWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GhjuDSTj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso35589065e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756116360; x=1756721160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09DtYv4WNzf78Fw81VXM88NLotx0thkz5LaiABUFgy0=;
        b=GhjuDSTj1L8H61jekJg2ze0a3J43Sqk/QsOg30NMvIk/ggQSBtq5Rtm44/KxzbQk8Y
         ZSb1xWhnen/RLqQi4qkm+hV0V4wt0DrYnC7FteFFYyxC4yeu5vEbdULKd0bPzp9UIlgN
         LYVfnS0gUVk//SwR1USK0rCd4mjaeDxMelTmTkClttBtRWW5fH2MYh+TB+B0grRVvbb2
         7yYgyOx+Hvcb93/PASxMRU2rhpkdFPMFO4081tR/7HUvysK2V477vzyGbqeveITY7498
         FxHZF8sHI5u6GnVCntLDyCO9UIOcV/YOLh7Rx5PAV3RoqJvwIw+LcwIo3V+wpINcFwwL
         mX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116360; x=1756721160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09DtYv4WNzf78Fw81VXM88NLotx0thkz5LaiABUFgy0=;
        b=YC0xhIpmjHhI5UfrW3iLw7GxNIMezjBY9jAw0oUEbsC79ienOMDV4EFRRCAPy7v4YF
         yir29SJubMUvy7DQ6YSeSFDelDaV26t30NLFHiyoWF5ni3UedmKoD7aXxZS7evwxN+Lz
         iC6aCk+Sdq+HYhQyGgBG5yN8Qg4j9Z3ZgWdi+UeyNg0nKDPMUHYl4wSqItRuEjU2POSh
         IPIjJhZGOm/ZQH6EMzB+ZeXOupsdNPLPLsKmBl6nEPr2EepUGvvBzxhDe6TIfVuz189H
         szB41b9NkD8SNpWxtw/Qnz3NcDKGzo6gEvy+PZatqPJSyAxIHQvzG0t/moY0g+4P3CJA
         G4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtyJAT1PMFvw+AFqIpPiq+/+TwWnpGc9I5sN4H07rLM8ESVkHZN/gbjJCUhwm359lfNH4itJjxcxBX@vger.kernel.org
X-Gm-Message-State: AOJu0YxnC9/cbuuMaIazDIjw2XBNZB1dgkyiV/N34z+M7ECriQAuJOP3
	LPeubnwyUmgiN+sQlxfxHsj86ZNgyQa7pb6xo6CgJKvcuG9VT+x7zlaLzYNkQQULA3Bg2oAMPKG
	Lnlvv
X-Gm-Gg: ASbGncvsODLtSx+Fric2GXKNworkZEngGfxaOGdPVqlopHZq+l8j6y/Cz2Sb+SKwZ1z
	+h+NFMRHDXkGnc5ZGa5Fc1A/4IWDU1oqcDLMoUK6qYvy7S4xdrHwtNVfGwxBcA2oEl9IXxxklTj
	48d+0XsJNBhDgfjZ9Hlzbf9q/uEf7ylqYAVLo1PF4cyomPrTqYmZ7x9Li9j6OpnSUuUBLrrreCa
	NrbNX2Uw6QvOHq9/YIkx1O7zisibnXGRV/wpp+KBM4f6Oh6zut5lVMeV6WLukwIILXlsyejqLUi
	vdLeDhHy9NRfdPyMTTTHX8pK2MNAUHO5EFcXFH+03n0BfbBy3i8/VkS9DPs1rA+j0gUV6jZEfJt
	hFrhLD86QjuouVjlnZVIMnOK6VwLw9XFQUIo=
X-Google-Smtp-Source: AGHT+IHtwUobtrBAAUNAESRarPU1shgTUZThuJWfmTXbgJ1FgKhgwZ2puOsxCchkyUiwhnhMSjawnA==
X-Received: by 2002:a05:600c:19cb:b0:458:6733:fb5c with SMTP id 5b1f17b1804b1-45b517d2751mr91939255e9.28.1756116359732;
        Mon, 25 Aug 2025 03:05:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753ae41sm102900375e9.9.2025.08.25.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:05:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yang Shen <shenyang39@huawei.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org
Subject: Re: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its modernized alternative
Date: Mon, 25 Aug 2025 12:05:58 +0200
Message-ID: <175611634833.31529.17151272315395600143.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 25 Aug 2025 11:48:41 +0200, Bartosz Golaszewski wrote:
> Resending due to some patches missing in lore.
> 
> This is the first round of GPIO driver conversions to using the
> modernized variant of the gpio-mmio API.
> 
> While at it: sprinkle in some additional tweaks and refactoring.
> 
> [...]

Applied, thanks!

[01/14] gpio: generic: provide to_gpio_generic_chip()
        https://git.kernel.org/brgl/linux/c/6e376f245f19feeadddafb2c3fa5fbd6469ecdfe
[02/14] gpio: generic: provide helpers for reading and writing registers
        https://git.kernel.org/brgl/linux/c/16397871b6e35fa46a2bec27b3558f93b050c6fc
[03/14] gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
        https://git.kernel.org/brgl/linux/c/13ba232ed8455a5decb187d509a0d326fd326b19
[04/14] gpio: ts4800: remove the unnecessary call to platform_set_drvdata()
        https://git.kernel.org/brgl/linux/c/d6307707d50b468d614a80daf60ead8b7036f156
[05/14] gpio: ts4800: use generic device properties
        https://git.kernel.org/brgl/linux/c/8a8e9a1a9272f262699960ca2782de87ea69dd32
[06/14] gpio: ts4800: use dev_err_probe()
        https://git.kernel.org/brgl/linux/c/ac1eca3ab9fc4d17b59da12597c671df7739f934
[07/14] gpio: ts4800: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/9215a4fb59425588233d3362e886dc156c1739af
[08/14] gpio: loongson-64bit: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/4ba2193ce0b94c28ec2095a1bb79353c82214d35
[09/14] gpio: dwapb: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/84bebb7e7ed000a2c4786094698536a3a3f67083
[10/14] gpio: amdpt: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/728e0ca4e196d65e00775ea3f7a49ce008fbd3a7
[11/14] gpio: rda: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/ebd63ab0f20f4e1960191da6989797ac78fedc4c
[12/14] gpio: grgpio: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/67e4be48f409ba70738eef3c195a81455f526f83
[13/14] gpio: mpc8xxx: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/90ab7050358ffd3311c23b1697df2ba3c8f840c6
[14/14] gpio: ge: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/56f548840ed90c30269f29c3bdf6037a8a9414a6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

