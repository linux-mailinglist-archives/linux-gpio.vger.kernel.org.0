Return-Path: <linux-gpio+bounces-23975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA1B194D4
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Aug 2025 21:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B27147A500A
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Aug 2025 19:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD2B1E1DEC;
	Sun,  3 Aug 2025 19:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iVrpSb8N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5136F1DE896
	for <linux-gpio@vger.kernel.org>; Sun,  3 Aug 2025 19:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754247935; cv=none; b=qb6Z+nC8c+eqY1+JS8vAkTjh89EOoNy+i2YLJU9u780qwFvIIPEetuQRIvnZjc9Y5HjyGiyE0PXZHBcTipN65nRnpmUQzu7jKnktu9IEXVBu0ZIVBR74/qJ8x3ut9/NQ9fjEVRPN4d7oy/mjx2y/GU94UhMk2j985h5If5goq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754247935; c=relaxed/simple;
	bh=BwBmtnv/BpaSXrA8JVdt3hc6pH4difSzYPixxu8akJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hd3A2brmW520IibOZjw1FSlXfTgD6q+k0zUfQlMpo4Ttci0IxOYH1DMQgNUEpq6XKBUgQYlOQuwU5Juix26alozttPS3P3G7+tOkGL24OqAvmaPHRZ7nEq3S0vNree9sb7IkzzWg1u1KA2do31wpBH9Dvo1Z71nefeW6DlFhH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iVrpSb8N; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45994a72356so5997675e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 03 Aug 2025 12:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754247932; x=1754852732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=up9M/4hUY4Zre3/HEDOm7wwnikDuaJtzpmpnD4b0pVk=;
        b=iVrpSb8N8MvN6nWxkBBV1RyLLt/msq6AZbGDDPSm37ZtoB5X1Bj1S+IrFJY/5BjQ0A
         xXsIYPB9dWjJdoYXeam88pybWUWBM2yz+zCZak/Fk7QJ/S6voaML2hky/y6ROPYcDWNV
         XNTzLnSlJwXbpVXUGXdH/3pzLtUJ63B0Q7uljQ81vqwoZSqKHgB0cFDD4AcfDD2DkUG8
         wLykUpqvlH7Hyzx7P67dC51qpWeBBok4N5Dsgtn2qVG1sBTttn4sSjl+YdOn0x+D8vge
         BbEvf29AkYXFqIhZO7taAJITyAhJNXcD6Q4JNizTELfjztDB4I57o8r13ito31pCRX/t
         UX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754247932; x=1754852732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=up9M/4hUY4Zre3/HEDOm7wwnikDuaJtzpmpnD4b0pVk=;
        b=uqTeOJyF86v2adQFg6VxxFNlN8EvkOuCdD+FHnA8BtHWgrzP0xO/vyndf7DzyFk6lV
         aMyOH6cMx0ioJkmh/VXuA1OSynS5A9RN2s2HBBHC6YwPD3YxIbk4fASMbLb6iDHohIiW
         Hx8QIhNHMC4IYtH7P+EoAUCzY5T+mKuYsh9Y0q6qQlU8jocckk61NCelaeFdHEk5syUN
         Mq0I+2VCL0m080TNwA/Ok+bmxNHpRuagB5dSdjqKno1Fh5v1u5ECTRWA/E9rmCR79Xg1
         AtPYJm77jDKGMzWjLI3V2tXVaFThVnw5HcfzoK7vO1sF6d/SKBYWr2kjKWs/AxHKwsKc
         aVPA==
X-Forwarded-Encrypted: i=1; AJvYcCXUsIFUjw0Ab9XwFLgftfcaRS1vFuSE+bVkHakG8v8aMBSLISpYXPRU6fcaXNTC9rgqWmTTbQC+rs0c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/3qo9Pn0094QwovOQ2phfcRq/ZZLTdSpNNmB2N+kCF01Smguy
	I9cRgZbyZVRVhHgIF2bgXeLhBEra+0qborxBAxsGKmId2j+UIkiY0NK6ymmTe+hMLDE=
X-Gm-Gg: ASbGnctm7BPFpbsOoVa7J7FManPbXwFjgej6DTp4erxv1Tj7sUc2z2Gb/AQBMV/5WyO
	GEwzLntiSBoAqwJ32bmt+F8+RP01sLmkIzT0doriOHeeiDPjcafSVdqMtU6Spz88yF6KAGxlqsS
	wNMbbyq1rsXV6G8++F91FhTYSdWo65GWnqmLxyBoItuI+05ZxawLlporhcwm+DwJSsnTn0/TZwG
	MHJD8M8rybuBE6X1nHeQCf+abe1LqmTwHKX4T7bTCXy7vroMxEvYl6AMK1JcrOg65hWgOpRFZNc
	6pcnW1Bra+qAL5Y1BGTVcRS06kvt8g/qmEd4lj1Kr/CPcQMnKK3kk39xf/QXJUMYGwSoIWzUAdM
	Ldoep+USIT1T7J8n8YQjV/qKspm4YrrZP4Jbi/LNFFzSbtK5iTn6wqQhL8bf2LguLezL6vNFwrO
	TjwTGTmg==
X-Google-Smtp-Source: AGHT+IEZ0V8vkr0azlFyjnANX82PwFUs8FOonbF7UBmw34xohUJLsmAV3egOIPJEYGsTVHJlXcZaDg==
X-Received: by 2002:a05:600c:1f88:b0:456:189e:223a with SMTP id 5b1f17b1804b1-458b5f0ac7amr52599785e9.10.1754247931531;
        Sun, 03 Aug 2025 12:05:31 -0700 (PDT)
Received: from brgl-pocket.. (2a02-8440-f501-a968-a175-e139-72e5-a366.rev.sfr.net. [2a02:8440:f501:a968:a175:e139:72e5:a366])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4534b3sm12948486f8f.47.2025.08.03.12.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:05:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	davem@davemloft.net,
	asmaa@nvidia.com,
	David Thompson <davthompson@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shravan Kumar Ramani <shravankr@nvidia.com>
Subject: Re: [PATCH v4] gpio-mlxbf2: use platform_get_irq_optional()
Date: Sun,  3 Aug 2025 21:05:24 +0200
Message-ID: <175424788066.7115.11334819523801488773.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250728144619.29894-1-davthompson@nvidia.com>
References: <20250728144619.29894-1-davthompson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 28 Jul 2025 10:46:19 -0400, David Thompson wrote:
> The gpio-mlxbf2 driver interfaces with four GPIO controllers,
> device instances 0-3. There are two IRQ resources shared between
> the four controllers, and they are found in the ACPI table for
> instances 0 and 3. The driver should not use platform_get_irq(),
> otherwise this error is logged when probing instances 1 and 2:
>   mlxbf2_gpio MLNXBF22:01: error -ENXIO: IRQ index 0 not found
> 
> [...]

Subject should have been: "gpio: mlxbf2: ..."

Applied, thanks!

[1/1] gpio-mlxbf2: use platform_get_irq_optional()
      https://git.kernel.org/brgl/linux/c/63c7bc53a35e785accdc2ceab8f72d94501931ab

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

