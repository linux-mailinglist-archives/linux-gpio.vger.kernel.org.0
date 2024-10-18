Return-Path: <linux-gpio+bounces-11600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F126A9A38BD
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 10:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93566280EC5
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 08:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEEF18EFDC;
	Fri, 18 Oct 2024 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RJh21MkO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5139D2EB1F
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240773; cv=none; b=S/LZ+fPPw9SCb3ReKooPfMpvYYalkHKvb2a5YQMuDxqkbKMldAqokUfvEgCPREQj/U6hejPoMDv/iryXkSTFvRjim+ekiCEjGryMtTa9jG0WzLJuuFuKtqzV9WDdyJWhINNmAKcLjE0s2EW0Czs/tzXQ2HKCC7DLx+JNpZA5l/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240773; c=relaxed/simple;
	bh=mc6L5X0DUWLJW/OkuS9ePuMADpz3zlh4zv/WCAV31FM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bawivEbgBPlbTlm83zwnkhDyzPxCyF7vxesiFuCf1e5h0lDaUpIu8aVQabgh/SbcMuufLTWF6ayVFcud/zDsmWCYWiFbyNKn1yJENS6VQTKH6EbYRzYwjhT/BfanJL4/DfLtRad1w4rvYQTbNFKHX4+EiLMRbjrPLWp3tiHDXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RJh21MkO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314f38d274so24120285e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729240770; x=1729845570; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrncWdVx0bleY/RhYi61o0nRl8Zpr6NCNC/up3U4baE=;
        b=RJh21MkOuPaNjAw+3zN8rsI9EKXWte9YZ5uck6aCoPB4it2ioUXE+mSSbSrBHNGVZP
         auaqKWone7EmTMnx3GuVWjsrqWuShVVBerE40bbKvGGuwIO0IpKaXh9XNK+HDTQy4hNR
         h5yJF1e3otUZ5WSRY4JTwlfjE2kmRExDc29UzPk4iZkFyRlZ+9ajDIVAP6JcWcUJ3gxk
         IQ3WNpr4So9joz4WtS8GO5f85H//zuCY981qQYlNDnUAI1Q8Tlb/oUxAAMAyLJq7a70K
         3zOElhQ07n2EVCstbWBXRe5xzyScR98RMrxo7ydd2UBidVy76nlEjIUbIodViiyG+/ka
         XJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240770; x=1729845570;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrncWdVx0bleY/RhYi61o0nRl8Zpr6NCNC/up3U4baE=;
        b=nKA8y+2d6Lc4QhAWMC49BFOm2hTRFHWGmrOclWIQg5ZGOuKFRqV+sM62rDaByz3Svu
         EFDcSouVXQ7GV4bKZHZ6w4eB/5xJ97v8/jL3tDoTPp8IjcI3Hl6T/3q5ZSHAlEz3yf80
         e56CilllFauVQPWhqKNUsi2ycDYPJ2k3qm6JDADXP8TXTMxspXwdl2JXtcO8SPHEwlz9
         ypNrF9l3ME9A+pxvYocLfZT7h+BtFAEBLw8SnEl8GPTgF3eTTwNQu2o0wDaPmsEJG8ZY
         9VtLnmADmK20B+mGOD3E/QcH+4F82pTr+PnhJ8rbQC53WvQLnDMQmUXDct66BknIJRFv
         eayg==
X-Forwarded-Encrypted: i=1; AJvYcCVHouBv4JoIzUAVjBEQZKFA0ASMbzR0xHUciAGlYEhb8R8Z0tK4QYsgHJpMp+5M/IUMomKdY1ukO1OJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQrCmUJoCUkeru8CgBYRkEQXGGj3B1+VPzNhby71d2L3Dz6Lzh
	rq3HBOqAVVJ6xemMjCr967u644saZY5NFdgunaJDgTJmimZKB8EvezYxKHDhy8o=
X-Google-Smtp-Source: AGHT+IEtT0VrGwMXWD3f3PNN6+mMk8Niqje0hsKtwQA0iMPfyIkaGazeJqRT2ugGAgBVN1yXC2tZog==
X-Received: by 2002:a05:600c:4e8b:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-43161642386mr15793305e9.21.1729240769641;
        Fri, 18 Oct 2024 01:39:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6e2b:4562:2d66:575e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e4fd55sm17360595e9.45.2024.10.18.01.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:39:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: xianwei.zhao@amlogic.com,  Linus Walleij <linus.walleij@linaro.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Bartosz Golaszewski
 <brgl@bgdev.pl>,  linux-gpio@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
In-Reply-To: <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org> (Krzysztof
	Kozlowski's message of "Fri, 18 Oct 2024 10:28:51 +0200")
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
	<20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
	<4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
Date: Fri, 18 Oct 2024 10:39:28 +0200
Message-ID: <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> 
>> Add the new compatible name for Amlogic A4 pin controller, and add
>> a new dt-binding header file which document the detail pin names.

the change does not do what is described here. At least the description
needs updating.

So if the pin definition is now in the driver, does it mean that pins have
to be referenced in DT directly using the made up numbers that are
created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?

If that's case, it does not look very easy a read.

>> 
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof

-- 
Jerome

