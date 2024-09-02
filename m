Return-Path: <linux-gpio+bounces-9535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF87A96838D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 11:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C1E281987
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 09:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CE71C3314;
	Mon,  2 Sep 2024 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Df/yJN/b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19C615C15E
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270518; cv=none; b=oTJ5lW2nzExW861PAMqe8u8vp3swTuFTpVQOhXlgX9IBuG6qT3L0ohzyQw7Zta6mvMEyHSZ6lZe0b2q/zyzEs6V+Jx9iCV9ngqBXcqPN6gW4UmYjUdveLbxlcmYvVQd8rrwKlqPJs6aSnaliSHtVRx8RN2fdNXIW1mOONFTxvWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270518; c=relaxed/simple;
	bh=QBtZb9KD65n3yGJNh39xwVrcqogeAGovn0MZaaZxugo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lEtT765oCU63wj0YU8bB/KT5BVE9sIW86mJqCZWc4j90VQVxtKt3Iu3eoPTe/YGNDwvy5n8MVly9zHPtm+XsrjdXQzSjriT2OSgWyK+DDKyTLf4KBcUtjVx/Gg5LIoTUVHnuuZUAosoHKqDd9HyKBdVVnjJATHS2OXl50+V6e4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Df/yJN/b; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so17755345e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270515; x=1725875315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbxcEkt76T9GZt/fg4Jcw8wx9AJnOQd77mqSZSN+ck4=;
        b=Df/yJN/baAGEOH+EsVWH5TI2o1Fcac771+g/j8WXcQzmoaLCMArGN3asU3KYiG6Yr+
         KDaf/SflvkEcGFH/ziTY6DE213aqlfUKOxuYuM8KlIcq/HcBKNyCC0ar6AsmvPwGh8cO
         hu+uMaGPUHdrp5yipmutlTfZoYuWFO7Hif0Cqua7qOs7OB7/uPVcRisaEiuggcwtI/5g
         Z1wfdizLoZdK6IyszoR1/uC+9iS5XV6bInSRKodlExfGMY5Uy0BkXa2+WxWT9omxKQTt
         Q41x/dCm90xXggy1MO7u3KAMpi2VSQPeOcCw7ub6zaR8LUbk4RlhjxuZj6DqUWnsWnEV
         0kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270515; x=1725875315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbxcEkt76T9GZt/fg4Jcw8wx9AJnOQd77mqSZSN+ck4=;
        b=op2yjx8wlIsNNHhJCi++XPD8rm2syr+c8KAITBcbfZh7SNzgpdStTuku/mXPxqfITc
         ZxFScR+MiEHKq3kTXjNiv62qJXdOhGmQKC4eT7SR8u2KVYTpcsSGIIxfuC6DIk0Gmt2N
         VXvt2MflCvZTgK0Dnn6ELX2hLconsOIdCTxxAwuafsvp532AqQzWQ8VpkLQvx9M0fUnW
         hg/mEC1inb4TRQN5RnmXheA0dLVugUgB5AOTKrzEPnNRQYnd4stLqblWgYVGVwF2jJwa
         K768ZKg7dFOVoiBJ5W6ldymU4zJZZF0DajXouFgiTT86/kTREJHe4eGGT/ehuqBIOpcG
         Lp1A==
X-Forwarded-Encrypted: i=1; AJvYcCXnCt3QTF0nx4rK5YnVL9VfjrRVtjDxUr6rNMDDfNrpEdNK5PObZkzjwIQMlAcEV5GnHHajI+kI4CPG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc3JXIOL0nJbGBlplh4jE1vGvenosybhxwSk11PuaGz7pTwwn8
	1EZ71TW7tFlPfD1rEv/KbjoitJ3Bu/KXeT8wU8nLMKNwWbNue23D6iy+LlYPJsY=
X-Google-Smtp-Source: AGHT+IF7hvbwuW4A6Gp8/WmsXKfPAcTMn7Cze0fDD5ugsq9mnAbtwMteHUBdg1kKX+fyaVbQTLE9JQ==
X-Received: by 2002:a05:600c:4505:b0:426:5c81:2538 with SMTP id 5b1f17b1804b1-42bb01b92e0mr100921455e9.14.1725270514148;
        Mon, 02 Sep 2024 02:48:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bba7f9f94sm67701665e9.0.2024.09.02.02.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:48:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to GPIO hogs
Date: Mon,  2 Sep 2024 11:48:32 +0200
Message-ID: <172527050971.21449.969240784108554117.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 28 Aug 2024 11:35:57 +0200, Krzysztof Kozlowski wrote:
> GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> properties would be allowed.
> 
> 

Applied, thanks!

[1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to GPIO hogs
      commit: 6a9f2c1b1cbbcd49a1ccf18771e68f7cf52709ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

