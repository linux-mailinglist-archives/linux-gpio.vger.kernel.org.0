Return-Path: <linux-gpio+bounces-24990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 948EAB3656F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 15:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B49D07AEA79
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 13:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74911350D42;
	Tue, 26 Aug 2025 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zbSI7+ng"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C024350842
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216012; cv=none; b=VjzMAvCewFo/OyaRVhEk7fAoMJNnz1gJFlThnySJKM9vEid7P/WdiOn3581IDnc/r5p3fORImPkK46kRUGkuAhS6NXAqCsmyaQgWPHFKqIF27taczJOIQAPJMfSrBNAVpvJxOw+SX3n0ayeMDqJCizOmKnCc3QugkcB5PmCuwzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216012; c=relaxed/simple;
	bh=jJUBEbotMJc4/7tNagC7dFAxP/nGnFXGjRAa45Uyr30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PX+Tw3icoh0Fe3PJbgLZneynuWc9S7B/Yl0SQPimzlgedXXp+NsggcsMmAF8axlfQ3kix0ry8NrZnb0OMLl5VHJiw5YrOGwS0rNptq3q5a6tpsXEd+dAyZ84NV0JRPJdeGEobcPGmI7FUE2m05CR0u3vdwAa4Mu9jPnks7GyfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zbSI7+ng; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso45766925e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756216009; x=1756820809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bgIZihST00M2CtyLVGqxcGCSa4PCOhuFDLrOFCRzds=;
        b=zbSI7+ngDgAeufBxY0YA69pZH64+vtruMVXY0fyqR9bzvirWkCfc8fpqQYgktIN6oL
         TCzAuzfYTPECbMcualgYwgOna458I1w9IE2MbLNL40qUMFv81WHluAs9VNLNP/ChKn5Y
         cFo0dQjuvvwYYa3C0zitcJgq0yQG2YTihrGUxkVrUert1jGoPehvr+JsE7w/TUi7Veg6
         zxxWKj2+/yhJ5jh5Qi9Y3x2l+ETTRFgjwLt4ZBNOEbXWHOB3lZUV1VideovXGTB+jowx
         /ExQANvRuoH3qrqrLCnD+UINhA3k5UMmLU1q7HAjsUPH9Dg7D3gDElg3hgrGpumwxT/L
         8maQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756216009; x=1756820809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bgIZihST00M2CtyLVGqxcGCSa4PCOhuFDLrOFCRzds=;
        b=VLqrvCtvDtLVuS/NfT0wsuSClYy8xEYvuY10fiypVAPANxXQV80DuyvsjSyZ7IjGTO
         qAC5yuviQkPwGUbFTe+4QAd7L5U43uQyC+nYYA9LfI/CCHU/LDWREHJfEAVOCcFrTAX7
         FtWYVhS8ebcOnJL2TJ2M2A5LlvvVnt1+u5e0HR7ZF9amRAI6YXJwdUy+w36DNSD3k8Iw
         n81jUI4cIamaGDwXKPyDcwAQdFKDUid3g3FBvD2l1gwJ3e885ybA+bcwi1SQy1RPtMaT
         7nVWi20p4x45Dr+HE1F7wACbgZao7SOH/caiebgJvJQDm8iDviSwC/Mr6SXO5Ye2S18w
         JIiw==
X-Forwarded-Encrypted: i=1; AJvYcCWL1XlN1WkTHe8FFPXCOjRrLWc5EnAUwO1o+eNgrj+4CMShagPmGmOP0JZJ8z6A0bHU4j9STGzidAiO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1vDrrRTPga5d5NmdthH+I1nofb/Sx/Y43LXL4odR4jCpbPPgb
	NCLi4Kvnru2qSWozqix8fwAmqucxYyEBgLYPJSDXOXl3t5sIoh6ak99AI+RTXL+Fu2c=
X-Gm-Gg: ASbGncvnsJ0mNu5MwfmqtjoNPn4lHvCBRaN7MrRjTnDR2QT979GhL+6JNuTUf6ROuF8
	K8KIAaX9fVdYX1GrFFdSkS1xDunlN7hj43jhUK2Iw2jmeZQJEbLs5ImuLyYLvFgbJRN6pK8oNFh
	oYbp30Jt0i2UkODVj58g4vFCvmABgOEax92JMtdFkLEZ2M9wGhSrE8LDxEstQHoPZXY+k6XIvJk
	iP+jeJ1jbdbUBEDHos/QV0+DzTpYhnkm6j2LpXgnRPxUjgTJnEKO0GdNUCOt/aToGhsKok/tXQb
	CQ7b0QBucfDJrBZADmIdKUqQYgG2xraT7pCmInORx7HpRG9dlMAuopdWTk+0sVrEG06TMn43Sxk
	0x0dSQrC/kVj2IfEffwWobrGa
X-Google-Smtp-Source: AGHT+IH/vtben+jS8p+rxXWOqr702i8ga9ZchZdA6ANpXGCersQKl3QS+kocMs00UNNWRezs+Fzb3w==
X-Received: by 2002:a05:600c:190e:b0:459:e3f8:9308 with SMTP id 5b1f17b1804b1-45b517ad4bbmr141075015e9.11.1756216008734;
        Tue, 26 Aug 2025 06:46:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm16231162f8f.47.2025.08.26.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:46:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Lukas Wunner <lukas@wunner.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Date: Tue, 26 Aug 2025 15:46:46 +0200
Message-ID: <175621600512.33327.13991412012918423626.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
References: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 21 Aug 2025 10:32:14 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Minor whitespace cleanup in example
      https://git.kernel.org/brgl/linux/c/604642fc148b5d98fbe5f55e4c2688f9ee0b5868

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

