Return-Path: <linux-gpio+bounces-23449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A9B09D2A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8D3F17DFB1
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0278829E0F6;
	Fri, 18 Jul 2025 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GMFeRoOj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6B229C330
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825392; cv=none; b=ArVDuiIroJaiTTFRgLQPNwfQQI5WPhSsJCjtU0xuMEqBJCcA0HMBS3DbfXOXczRtI8vsLETVA2cyMA2qj7oGwE0x9tmZD1afv6OogOUQG1VN1aJSfxvyc4XPGJHneUkMmjpRc0PtIquRsm+8xsDaTQSlchix03dZUAZCdfocK8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825392; c=relaxed/simple;
	bh=2zSrbkBN1qgdayu2lKnPKxAZnlK/9cpO6m2rcBz+RfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rZezYfK9mQxfPoPQBMiz3VlsoMB+ng3uz9VY5ziF8U53BRlV6FQUcF+lT30d8vGWhsfYkj3l6/XnB/G1RiWIjLprK21VWGCo221BunbtkLaPA2RPjEmoPnMynlHSLz8tqKF3zhRpt+wN/IK/RBgALV1pO93Ekz4bu1LAokASohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GMFeRoOj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1029153f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825389; x=1753430189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKZhnFJ0UZWMgAl5cwKz/S/30VP8TEq2FhHcHdAs4+M=;
        b=GMFeRoOjOvooxJKlZAnUZgzTWlMLaZYoP62GD1e1YrFzgKVMK5/SBcCA7FwCiMTJV0
         2c8ebX9tx0XbHzZgAQMCRYlctxrQrWYKDnxTr5MDRDdFZ/+hlxZbtkP25HMm+HpcTk0k
         8bU763W50m+lfdyAALtK7oLJb5Bq/Zogocc8nDqY4e+Qcd0iBzHokWqs8h+CA7icXhKU
         TLIi9q31oHSmtJnItpgeQHBdJOYtWSMnF8SPDc/QsjG9DTASOnJB6OsH70c3971iSWFX
         8vhFZaxtTkiNeeI+KKVqAV+iuLZsTBZ/SCs5bHf5GOsG03rtBCEW2f8xoDZ0qjqJLM5y
         XfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825389; x=1753430189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKZhnFJ0UZWMgAl5cwKz/S/30VP8TEq2FhHcHdAs4+M=;
        b=cNM+ScSO3rZz9KdkhThbkGSw3y8yKWe3XupIflLGEXmTKrtrtD9l7jjoMu3n2TdScH
         Seacmsx8MB5FO39gRwkTwz/CcSFx5t8PzK/tl12fAiQw1TMsJ9MA3m7BLWnyNjqX7z4m
         Gno1HBAVhplFSDj4I5dvj8b6NN3SNeWO3j4hg5sr8MlnJX3I/WKSCdXg8nOxlOYBi9P0
         p35Wdcws8lQK9D6nvI8tPQGdF0LplXYEYRfxfGRzP+jzJ0EGd1g4BXzHHXEbnH2NJVIS
         LUVrWPQ4Wm2d415hV/j6tc69rK50Xjo6f3cFp5jbPwEUhQGVQxHGKHi4qKr0396xhnnE
         qgxg==
X-Forwarded-Encrypted: i=1; AJvYcCU977v6NJmo/AByCP2N2lA3K4L9DSwqa4ioHJapbrZn4RfBJvVuLiEM1R5QzfqeIB5nvtZb0LkablX4@vger.kernel.org
X-Gm-Message-State: AOJu0YzqOngGDFbRZWhvaX25pC2Kj9v65iVy33D63f/8bEzlQpPGK3GG
	c9BYJsZHQiMIyzpmUYmMKrIe7Ia/6A5uLMDG7VNzFwJOU6g6H4t2Ns5Ht+kmYlr1A94=
X-Gm-Gg: ASbGncs6KAytDxNDlK8RJWgQ++PMfgAEN7uMzgLvDbG2DHZFKVDD//7wJgIe3HGC38x
	HWEBnonx9voOsXg2n2od0BUYMzNFd8RVYhKtoLFI3oMWJ9w9NAs+EHri7z72aFEyCJyViN+WwSX
	IWiNVrNjNTpvVq3+WLYtNKQ8FiizqyDLWvVW+8tRBzF17t1zE+E929bNCHc+hR1yL7rHyVY/kGJ
	TTXF1s3P0fXUrHRG0U43H64ZLLzNQ6dvedm4XO0aK8k2Tpym+DWFHK9SGk+wj/n2pq/PQnNgrhD
	jJBvOU1b9sozuUgtXrFDRSUlL7DhCco+7vpzBzpJIu+TLVkg8uGvQybQSt6gg0md1lt8zGtIFwr
	oEQvmwfogAldy59/8Wx5AHM6LL8yYSVI=
X-Google-Smtp-Source: AGHT+IGt4Sp/2DbN6c5CNaWJJ3OCnBcFOsqcxfA4oO8tiDItFVCLYx8dWbwX87QOuiDeXXZ5HwvMkw==
X-Received: by 2002:a05:6000:4911:b0:3b6:119d:58a3 with SMTP id ffacd0b85a97d-3b61b0f6a35mr1231316f8f.26.1752825389525;
        Fri, 18 Jul 2025 00:56:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema
Date: Fri, 18 Jul 2025 09:55:58 +0200
Message-ID: <175282531513.45055.12673543088829296239.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202850.3011952-1-robh@kernel.org>
References: <20250714202850.3011952-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:28:49 -0500, Rob Herring (Arm) wrote:
> Convert the TI Keystone DSP GPIO binding to DT schema format. The
> "ti,syscon-dev" property was wrong and should be "gpio,syscon-dev"
> instead.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema
      https://git.kernel.org/brgl/linux/c/aff0a1701b020c8e6b172f28828fd4f3e6eed41a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

