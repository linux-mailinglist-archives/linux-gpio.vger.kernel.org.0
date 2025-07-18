Return-Path: <linux-gpio+bounces-23446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7671B09D29
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 714AFA84D1F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E9529B218;
	Fri, 18 Jul 2025 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2w5yPR0U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871D299948
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825389; cv=none; b=O0gDr9IabuQPolPPqUuHPFgCca14d0oPet4L++bZmlFp1vgqvy8+SYPbRor2R4nk9K4gz9VLgoDcOye4qHDC9n+hfeZ4OgQk124VwCxRSGEmPjsFj++IqELkK0wivKYuo5pkYdjuuWcJJXPQRfA8fGazmX3J3Q6ZnOrIypgrjBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825389; c=relaxed/simple;
	bh=1fgqSf5aAC9jRJPk5Bk29Dz6jUVTr0soJ6WtJ+UinRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ePkvTlaN+I3b73ecYbZOyYnrOeKJlCG8kfO92gWQnJ/5aYqWlEyvMfok7FMMXYYHe4V9AjiShzcXM7Y7oTrSr22DnLz+8g1Fx+gLRh8Mq+eHPU/49m//YUdZiyq3+O9fdE286ZQFukwN0Q+uvbpJVu7QjpJgctEyrgxAN52RUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2w5yPR0U; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a5257748e1so1076625f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825386; x=1753430186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KwhM/lf9Nerwdb0SADC6wgBP7Bye9fmYsylLUyZDbk=;
        b=2w5yPR0UMI8mfGGYgNQRl26/E2neRmbP/IKDoGmd0rCvqnZjJetcKi7HIz7PJjOOrF
         8HTSOoJ1c1VN2Yg2CXzkMK78LOlnjsFnvzwycn25Rlrl5UgU3SAnwAMcWceypOZkZkTk
         I1b8jyczUAiJSIH0jxEm/nGffj9Jx0JEdkaJXmjgK9RT4ISBB1XFN1rpp5aSze95Iypu
         WSDuaFzNarVcR2gvPbGz5GqoB/K1v+SmRNSGvgt6Xp0UmMB5FnCC2dFjxITOIFUTXxAA
         IN5xa21bd9kgFKrtHUpcM1IaiHihFckLiGIrs/A28gPkdBN1B4CvvcyamBtbFFgd6nDb
         NGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825386; x=1753430186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KwhM/lf9Nerwdb0SADC6wgBP7Bye9fmYsylLUyZDbk=;
        b=ur73BF/SJsHuVMQt+JuVpTDiLEQ7z4b73DcXGlIx2XehWSLLoSuUIbkBbBcgXE4bDh
         t5gqyF08DGrU+8pBGUVjtQhXxToyikiOknQ1fBx1fPYmTTvUEKxewILDtOeNj7051/Tx
         8kHEgw5iBjWdC0XLN5E4BGs7rLbF4ZZ6mLuCI79FM/eK+hE8VxWZDqRWS41iKoGZMj3Y
         l6As9+qhcg0J9/IkDVs97pN8qR5oyRw2BqkyaMaLUmEB3wPSpqTo0Mw6rPjk50JZZXvQ
         GpmxvzYkfTFHKZPHlL1R9DlhjrkCwZDdUyWRTQf7XZTAh6vJGqyFkyTBoCyKq977V5Bs
         Bgaw==
X-Forwarded-Encrypted: i=1; AJvYcCXe14isergCpyhadF6HsbmoVA1G1lEBjhtOKaTWy6VggOX6apx6PHCj45VnOlsA3e3/oGSaTuo6nV8h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo77x9NCf4nexyancuF1m68VwSH+QkhAI2t0U7cUqDdSH2K8nb
	3OYJVRH4q9XEt2/y3d34lwTsr/O644dqMmVznCay2wYB0A51vDg/sP7uPpqwyaHDtBY=
X-Gm-Gg: ASbGnctIcsGsUr1+b068guO6+/CjAHyM6FZj5usZEWX2S8W5vFgLCL2w0IehbczW6+L
	QpKwBnNfILadXUcf8onnG3Lg3bJZht7+6jAjjlPK18Ehq0QxlH4T3ioQ+r5Ydc0oFOw0QzS6yKB
	v0OloE51rkXVpa1kcMZA+0cNdKBuOoKn4A9eyy0LABPFWYfV9NTwKabuqUpyacBMgX0gL7hJm2e
	lQ+bsS3zxW4EY0cQmBO7YEz2dHM0cKlFVbO7Ka6G4teI9zI4mVz7LRbLRc6Dt0uGOTQxNe6pI9k
	DIZauBL3ntqHyJtA3+mQK6p6R4DddOKWI4dqmjetgWSKj/O1963W6sbIU4C9mugmbCxmbDQ488P
	uKG1FupDCOiwvpkqOlFqAlCx7+2HdSYs=
X-Google-Smtp-Source: AGHT+IEfvTTvP20bsmaiA9C+HGIRVnrx6tPmoJoYFi4Nc3WaHVBeqyUGFFLd1Kw4CHeO3KYUvaQJfQ==
X-Received: by 2002:a5d:5c06:0:b0:3a4:ec23:dba7 with SMTP id ffacd0b85a97d-3b60e523dd1mr7539382f8f.31.1752825385991;
        Fri, 18 Jul 2025 00:56:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert maxim,max3191x to DT schema
Date: Fri, 18 Jul 2025 09:55:55 +0200
Message-ID: <175282531517.45055.2981352382275082151.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202843.3011698-1-robh@kernel.org>
References: <20250714202843.3011698-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:28:41 -0500, Rob Herring (Arm) wrote:
> Convert the Maxim MAX3191x and similar GPIO binding to DT schema format.
> It's a straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert maxim,max3191x to DT schema
      https://git.kernel.org/brgl/linux/c/696d8332e591b11e438c4bc17528fc79255f4266

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

