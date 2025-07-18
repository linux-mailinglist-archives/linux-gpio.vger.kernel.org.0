Return-Path: <linux-gpio+bounces-23443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F73B09D16
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AFD67B4F3D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E08215798;
	Fri, 18 Jul 2025 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xUkr4Kzu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C31295DB2
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825385; cv=none; b=fE9hOwn+7khkxdSoiZZT/aYzBeAXZLRAz/nXYiBsBYs3lwYL8kIbCSjuXpzmeCHN7EZmXn4TuTUNlRb84h6y6J9ypVp0jD3r1beBCF17L/gCL1As2kp3Him9ntgjTQlUQPDCajPnvDxBPTKfu1VLzizjD+ZGHDjBV7OFZUdpoyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825385; c=relaxed/simple;
	bh=2A1loBDb854iz5IQdoH2bIEYXerlPh2Ru0ZVi8wyLEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YMH8XIsupcCdKGbFJZoXnK4HoHQ/efLbQKlgTgTi6m4Gv29n3ylhDE4/qf/VA05uKDj9bT2r+r0AxYxR32Oxoq3K0EG2H24ldwMyRnCVOtHltIsPSUziAQ3Mr72dQ8kfg65idvMe5P0VCYfyinp7XhJIK7JjYNP4e/13Ukp4FmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xUkr4Kzu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ab112dea41so1035889f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825382; x=1753430182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjQCwSpR5lvt5YX/H/PDgTWHm660VgOlZGdE184M3is=;
        b=xUkr4Kzu6erVfpYtvEkMnYWE/Li6csvdfQiQG98HLSG63kz4ke+MX4uCM3s5ZjN1He
         nym4oVAcEK5ZwECOzrUsTdbQsVzgc2KZdSPu8ghS3gfUuyBhCyNiJBdy65dWfhZuzuji
         dG87ylqBG0fUtiXmH9iO9Jf2rnp3xTCWriAdDqotPbSzBgfnAR/g33xcW3mFyZURtytM
         Pta5LUgV3f/Or5I51EUjBWaN1XXVDwZx2kRch3TNgRpO8Vflx0LWbDrQXc9fTqxtOkA6
         fJ/56jg2FilSgKdGOme0DZakVJ4RkFiVbbuG7wQkt8T/nPL66164Zc8znoQYN/ukw0Mp
         pQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825382; x=1753430182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjQCwSpR5lvt5YX/H/PDgTWHm660VgOlZGdE184M3is=;
        b=VeFiPUEkfRtcYjQjh2qnu2lw/Eyku05IclSpVDKdoN9XvXFEFvoRuTIFxmV4uXVFIC
         /pVzGuy+kbX2ykDXfbKfgEaUdiWcgx9ZIz0XoksMClpSCjsVsZWbtC7Gd3Cg9pDhXXSM
         vISmcCl5X5PP/NcdFWQfVH8VHbpNZOYJMrt4VM4cLsEg8z5IqH02m/HqupbBOndTT+px
         kx4HZ2zYE93aVn8eiO+JY/ZDHYcikiBuUH4CJbMhHj3SdytqQcBFR6va4YVwJ8NWsM89
         lC1Q+nfqT9JHySGUHCCX+1AEZotvlHwTLs7FcvaqjM+PTehFrmzdAR3smLC/pbjXT4Wh
         XFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu6HacdDY/ORSfr9zfHSbJ/SvhNr0D6UDMHHiEiNtih36xikYZFIhfPPvHru/B9dTlN86xJqSTYMqt@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/GTgBjFQPc3NqvKkwIM/56ErbdfK0bzX6D9GW8Da4fEAE6EM
	7eztjv14jCOMjrs++aNUHvRTQjfwV2Hjx/ZLbU8Sy8kq1xdcHAEAaycdKh89tTHqz8o=
X-Gm-Gg: ASbGncs4NnS/vy+v3xbL5R0aEUggtWly/yGByjvFL1CActv/RMgX/8V9p+WHZVB4mu+
	CbMbSEfa1X29y+ZSfiXXx+cOXxqaRKbUFW/Y1E1IX5TJYrEG45suIKgUOPMfHFHwhI2TLL/xKxe
	KMbRBHgTcQZfLzn63nfBcXdxwggxPEd6JZYjrS6jSu7Yro/hisC43ucJ5FOkT94u/1wYneRencN
	IeEhGth2uFbl3xL1lAv3XE+8P9XJ05L8KuB+BuSiw1SzHhtF+5BLFCjvVXtwkzKeQlNx5Nh9oSA
	BzuuIC4t2TKf+sHlyFCKTDP7GkEvXAEmQTDnqmrjQKJpqD3Rt/+gHigZyQdfL1odXEJUQb/VVzX
	jTJIctIXs9wUQbcH9Bcr0
X-Google-Smtp-Source: AGHT+IGPCUEkqgHVJg6R4fbFP1ZlBiNb3elfa6RwsvXWjbk9lObILtb/LVMOrlsR5TdYqteiqsB9dQ==
X-Received: by 2002:a5d:5d11:0:b0:3a6:f2da:7fe5 with SMTP id ffacd0b85a97d-3b60ddc6571mr7969046f8f.55.1752825381613;
        Fri, 18 Jul 2025 00:56:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nandor Han <nandor.han@ge.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert exar,xra1403 to DT schema
Date: Fri, 18 Jul 2025 09:55:52 +0200
Message-ID: <175282531511.45055.1602529625640804266.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202813.3010879-1-robh@kernel.org>
References: <20250714202813.3010879-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:28:12 -0500, Rob Herring (Arm) wrote:
> Convert XRA1403 16-bit GPIO Expander binding to DT schema format. It's a
> straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert exar,xra1403 to DT schema
      https://git.kernel.org/brgl/linux/c/98ce0e1c4a46049faf63bc02e1916bd219465974

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

