Return-Path: <linux-gpio+bounces-23447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 870FEB09D23
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC9A016540C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D331929B8D2;
	Fri, 18 Jul 2025 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2upAj3hA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3BD29AB1A
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825390; cv=none; b=boTs0hvYrAn91H8HWnfbcPGYz9ys5k6+XLKNOCmb/RqKgupTrDMZmt0NI4cPeyX0P36YkINfTgH82NSKPg9swXgpbNIujltv4SSG6xBAXr32o9iQovlMjkz3OKuwLwpaiY+m2G+n5DIQN15cVTiet7VnizIuO2Do859YcTFLo5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825390; c=relaxed/simple;
	bh=y7+hycb3D0CBE8U3Q0YDzmdLnL7oASq79gdF5oDq6Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QeBhFTK2SyVDFmyc+NpPX6yyR/yHZVfdRlZdlLIRkuUniJfg1ybH8orYW7d4wcemE8ih2UJpbcSQl62sSvYVhsSBoVhsd3BvWXfFoQlCXGn/mqHv/Eiv4D2TZ46hk33NDhnDFu1c01t9f3ol+g2kU1rOhFdPdlUvE8Q6DlCsahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2upAj3hA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso1607362f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825387; x=1753430187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3gYttOWpdgwpp/zXG5WCQv10lk4U+RHywnhkxe+we8=;
        b=2upAj3hAPyeFQ+CkuBztZBH++G1YsxkvIhiix6265U8gvKDMsTRaf7IPMKWtra5P8Q
         XeaNbsjmxpKaAQawJh9vnWrRedDj9gxjHWikRtQaKmGoEtmbaCuGgsZlmXjQRjMM1EyY
         5ThN+zR8qyZLSqnwmkEAJLpq72Hp6J7ycWT6FpnerZ8D7C/iG8pzs72yyZ/0omoTlokH
         czpTKP8UhYTGqL9h5++UdEauLyGROl50ds4t5RzQ5u0C8k8I42rlubCMc2PgwmDh1Qq4
         u0LnLueuVICn4iERSQbzU20EcIkZkLxUHHR9VsrDAzSRdyeBogcUtmLPSqxXVx6yd2sL
         WZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825387; x=1753430187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3gYttOWpdgwpp/zXG5WCQv10lk4U+RHywnhkxe+we8=;
        b=jQ1B+R4hnYwlQXpfat3Kfi/3tDZuRc+ve3tkz7VhdLGZbQFk4aW23lrUgtpQ/f4DKG
         m3qDRFc5L28H+VS9y1R8pxqAQpg94g8wMe4lA1lXiwzvnnire3cuqwLQOdilOIsnARsu
         UKg3O5pJgO9giXPaMj42hUxc3FACrEVJHt9ztWTt+zPJarXqCzFSKrg9keS2aw4qC2Fi
         CTT7x+zr0jNIl+WpWwaiNu1dp3GTgRpoBymMbYKrxso85uzLaiVAXNViCneU6oHyrKO/
         A6TNlhjILM6QAXCZT3BhymGkmMWoq3z6GnBkz6ndkl/E+A8xXq3Z64bQZLhv2vJlLSJX
         CNcw==
X-Forwarded-Encrypted: i=1; AJvYcCX4PHsysZfxhXnixC3JmssYWei49GqDif8nzOvHRl6ExemuKaXOtI/OHRAz5gB+KVW/280cv6mYBwTE@vger.kernel.org
X-Gm-Message-State: AOJu0YyicQYFIeNcegNzgq+0biXDi4tsPRsZ2/026A/63inRj6yqf5gF
	gf4t1F+2yWZYl2GDini0MhGxFANHzLR9+4LWCEyGf0e5E8F3Rfmc/R0GRGfn3MgbCdY=
X-Gm-Gg: ASbGncsD/k8r7awgrb2dOl9WJo1tOeBQrTbhr+/Edn/A0t1PMeV3iCf+KoxhO3pzjwK
	eZckfeGWEFlD1mWQ/POgslQeZNeO/m4jc89K6ilDdQMLcdhqNB6KN267DRyOHsr8PT1ZYeRjsSn
	/7icz0NqoLP4KH0eqyL3SgmrRCsfjIFf3/rSLRg9Ins27aamC6/Y81QAVx6toIVSHtmJAWiks7G
	Ds/DMsoLuPuPP8oGcPCKFlZLcFedVilb0CDX1LlNGOAZMsi9MSu1QjCT/fPz2uDuYhc8cQyC9JY
	mYH4ZxVF/F9jgPo6Khav1JiuxbMuA0lwCBd7v6jsQS0im6AafPe9CBe4YiLSRwyBEfo0Got0N/f
	kNJHpx9ARczZ+tOOiqTG+/TjMdyKGVns=
X-Google-Smtp-Source: AGHT+IFpBXve8FC6yVzffBshmiK1SoLpAGkXD5ALpQXwZZeSlSPGznPrAYcEYYzhbx0iAh7iK181EA==
X-Received: by 2002:a05:6000:4701:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3b60e4d5d4dmr6575703f8f.22.1752825387228;
        Fri, 18 Jul 2025 00:56:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Henderson <joshua.henderson@microchip.com>,
	Chandra Mandal <purna.mandal@microchip.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert microchip,pic32mzda-gpio to DT schema
Date: Fri, 18 Jul 2025 09:55:56 +0200
Message-ID: <175282531511.45055.13712449219071610465.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202807.3010652-1-robh@kernel.org>
References: <20250714202807.3010652-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:28:06 -0500, Rob Herring (Arm) wrote:
> Convert the Microchip PIC32 GPIO binding to DT schema format. It's a
> straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert microchip,pic32mzda-gpio to DT schema
      https://git.kernel.org/brgl/linux/c/82388cb24a2c057316801dc390321cfe2bc0f3e2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

