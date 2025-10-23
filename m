Return-Path: <linux-gpio+bounces-27511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3BC000D5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 10:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00694189D54C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 08:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B408C30504B;
	Thu, 23 Oct 2025 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aztxxpZX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FEE3043C7
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209936; cv=none; b=S9fxw9SNSx2VcC6XRnfcX1N3khwBYLQEWbvBoNQ8J/IQGMs9toSsw4saEB3KvJR+KG/6xBVnZ7ErnyNoxlS9vI/ag7NlUsF/FDBlSQQ2oZrd51VN2vu4xK1ZCTOYbuJZGhggVUTp10aZe+D0jHWCz3H1Tc9ivcB2FJ+7PhsVZYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209936; c=relaxed/simple;
	bh=7pU5zm3QYGIehz40pPqJP74VQIBSh4RuMXSNwFr0sg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xf5NmnTivFvX7QNH2JHorcDguSsQDZhuC8GaqhUEelWEnG08XdDhuTfldV09TTpaSmftAoeOeasc/5AaSWKw0xxz+tzUs4Yuid1nJqpgol6j7DK+AzBhRzSTNrdQfbCMD3GzuQDbNXfAI30JNtsf/VEK5gCafiBi+mdyc2m5X8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aztxxpZX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47114a40161so5209355e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761209932; x=1761814732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eb+OgAnfRHsZk+Au1Zs5qDOwv/80EA0ztNh0lNnxuBU=;
        b=aztxxpZXysRCXCGNcokRhdo/awdJGUSu0k86AeG20W4VHLhfRDjVl8nN+UNejVbgmP
         OwpRh4PCxQxQoSoW3fc34afIrjrqbJD/GTLoxrPF6s/W00QniyRl2hU+zHdVI0sTZUWg
         ROAXiSG+ioc9jmSu060dlqEkSYdMWWjYvbH6iTn2cO3aW1EOz975uxUtE6tfpGGRUdIK
         5OsSod1dIiBsgKE2lPgqtFm1iqCEG/zMj5eT2KYKBTlaeegwBSsZ2vb5FP4gjuflOjQs
         Q4zA/hYNJTA+3pDE9LN3wD0grHUuY2JyBrP/H0zBsxyuB2o1FbDkU9aX03sYTS5yypfD
         quSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209932; x=1761814732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eb+OgAnfRHsZk+Au1Zs5qDOwv/80EA0ztNh0lNnxuBU=;
        b=rYdzQEPK3FCVcgPGLaJKAa1gI0SWZka7qk5ALTTV8a+7UyBUsnwjs2S46oz9lfeDUM
         Jwb2i5ILSQotbFYOrkRQrf3GFLA2+0HghAldXScpV+gH4J5cB0b4i5bM5AtvvmWqVcE6
         SgymDNVdcQSMCCJdLKR+iGe7E6sojqxXRv/E1nTwRgVunFAjMG4ZaGw6agNSPwiKWLTi
         S8sYgbrkPITvmXI7GOY988OGTST2mBdmxrkz0QN+EIFxnaJifbjjmazAmGGnEaePxrok
         Hc2xgDigotqRWzXfVbjcGovN2XtbNE+9femGFv33exe1AS47HZwGe3vjV4JABmIkrDe0
         bTxw==
X-Forwarded-Encrypted: i=1; AJvYcCXO+BQSGVihKn1Ys87AYvCpFLOMnUGm4ZqHZ7BChg3B/02WT2MUlHjSYc3AEqEolFShsQLhWvIeqcE2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9v2dbna4anYfrvFhl6RucnWCO2zHWkO2wN+GS0+Odv8nhj18y
	Hirmq6JF7kWb3Vey896pqi4sE90gTEWPsKEDb2KdohDofEUiSyW69XckEgk8BHsXYng=
X-Gm-Gg: ASbGnct47e4TcpRVqVwt4cJU+uRuubb4AmsCmRxRlB7aeFtVC+ihkAxPXP9fHq2ENah
	ldA16r0eJDQfAIbs54Ek+uZlyDq6kwwEahy/Ub1IpsoO+lce7eXweMurennISoeRaSqYVKwgphi
	VWiyNAwJXZGN+R6z0wx6r5r3UP79yAdYo8Ce/5e7wgX+avW2jmxGO5+S7qZ2LvYA+28JptWIRiZ
	6an9KAeSF7zLmO5IK1SN9tEJH4dPPanvEmSR1k67T0eUjG8Kut5Z3fZ6fjB5kJOzlW06/9p16Xn
	GMCVOsIn9T1f0MGYwvj2ApYbQvDuM4Evo9xqBRWItmqIC3x0t6Hy1ZpQRFHIRcWwzQDtx0C0lm5
	3BysZjmNdVid9Yfz9snbvusEGNT/RizxTYhLdxaJd++z0HB8iGlVDQEaQD2o4+ydQt51NdNwMK2
	S9
X-Google-Smtp-Source: AGHT+IE65Vu8zxlcEflx19PjtIQqmipfYIFP7ArEvVQCvSaJCChgRsffS+61E3E2uArv2eOCZZjqig==
X-Received: by 2002:a05:600c:548d:b0:46e:436c:2191 with SMTP id 5b1f17b1804b1-47117903f96mr183304895e9.25.1761209931899;
        Thu, 23 Oct 2025 01:58:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b4:e02e:c538:6feb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf152absm29456975e9.9.2025.10.23.01.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:58:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Haotian Zhang <vulab@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ljca: Fix duplicated IRQ mapping
Date: Thu, 23 Oct 2025 10:58:49 +0200
Message-ID: <176120992543.30209.6523033336777390844.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251023070231.1305-1-vulab@iscas.ac.cn>
References: <20251023070231.1305-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 23 Oct 2025 15:02:30 +0800, Haotian Zhang wrote:
> The generic_handle_domain_irq() function resolves the hardware IRQ
> internally. The driver performed a duplicative mapping by calling
> irq_find_mapping() first, which could lead to an RCU stall.
> 
> Delete the redundant irq_find_mapping() call and pass the hardware IRQ
> directly to generic_handle_domain_irq().
> 
> [...]

Applied, thanks!

[1/1] gpio: ljca: Fix duplicated IRQ mapping
      https://git.kernel.org/brgl/linux/c/7d168362aedeca451ac22724f90040296dccca14

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

