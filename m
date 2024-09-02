Return-Path: <linux-gpio+bounces-9544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A496845A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 783E9B260CF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCDB1428E0;
	Mon,  2 Sep 2024 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ef4j44xK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608A13FD99
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725272098; cv=none; b=E+h3zVM6fb0rSw7SdfdGUAGofMUefHS4ucHvj6osW1TZD5IppjOnZpCczTSrFWfssFWuZHbzVQNde2j097weJR3BxoXWEL9MR5kpdcajBswiBssVIfoLxu4Bm4wdZ7EWH2qlH9ubu6TtCrfwADznfHtw5yO/eJeBlbj51zVl+xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725272098; c=relaxed/simple;
	bh=NLoiJ17dLlGlaoBkSnITLquaNYkxbQYr7r+JDtYpHcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FPWvw/uhFh2HwdtEsJ/8Msrk3K8cKdWrIQFYBZ26j++khMJrFQlc7zjn//imWne++P2ARaEPmV2E34SKPuD4LbIwIq3ToM+dx15Xmm8OEbWvVSy0FIE39n7IxvKNLFdokQf+xA3gX3viN+VRNLpFvnO7KU5uQ5FtGuYR/4CEP28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ef4j44xK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42bb72a5e0bso35636145e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725272094; x=1725876894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dUUubCQTxhYKT/YP6yuTYQ1xa0NNwhTxFAA5JxSAeI=;
        b=ef4j44xKHruh1ZiS9lTwKA1k0pVKzpXJAzXSIH306TeA1KrGZrgxs5//3fcg2hh0sx
         AjYDsCQSQ6UVM4lULD5Ilm2Nqs9uVKHB+lwJLcxP88jjeCTo877lBaO/fHoXVjQadLlT
         8ZjADlAoT8C6emZEKQlg3i9skBSpdQjyLw3OaCZQdRq2aJwJz/1GFr7XZniaAbVf2AV6
         Sari5WnGdLtaHqGS1FBfPObOloFfObO5rsm7YgHachZCrNPh1ZYYe9XfsdfMRvt0r7II
         JizSkEWJfhr27rW6kIIVWQpdMsmS2ZnoTyQU8LKS4kROp+C+dbpDwpooERhNBpc34z1X
         OMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272094; x=1725876894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dUUubCQTxhYKT/YP6yuTYQ1xa0NNwhTxFAA5JxSAeI=;
        b=gRSOnnoPe0TMgjc9eKXRMOSwxweh2CP1P9ZeUi5phq1qEzqIP7avGAXbrxVAhiFG5U
         EMKghUUH0YvcG4dRThKk4/rHALRQ0+6/VR1Hov2E0vR97u8J4tMiGPFwAX+6Ao9Fu38X
         kyICDCAGQcx3Mpv2duZuz69cMJ3fz+QOfwyz3Jb0QkGLLGxomnFFUe/9c4yChzq3rT8h
         Sm5lWfhP6HnqbejRAjkuwwiyWBYIuvGZPe08v9989uDkEqYgNW2qmKboqbKwYv58ZcjC
         g0Bdhl7md4NaiMEr+YGfET9X1hQ/R6XuwORqJ3Jzcf2JdpCxAUVusOTNsX+5gJgT724k
         dlAA==
X-Gm-Message-State: AOJu0YxQzyhx4w/lMNKiMEpiCmz/2ySUtgJZTgiWCaBSjfp+WLDeYzX2
	96/OejZNCv67dacihegxgc8rvNM3q5fFOJLyHIp4EISyNsCga1MNEs3X5ZlTslgOHwIbXLYEoeK
	1
X-Google-Smtp-Source: AGHT+IH14t9CWtYUnJIADTFnjvzoF+2mTuS7NOIZ/26DZ6lrSVMqJOfeXCGzCvH4ffN+oKeuo7seBg==
X-Received: by 2002:a05:600c:1c83:b0:426:6ed5:d682 with SMTP id 5b1f17b1804b1-42bb01b4419mr95541665e9.12.1725272094057;
        Mon, 02 Sep 2024 03:14:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6396516sm169723265e9.4.2024.09.02.03.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:14:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v1 1/1] gpio: uniphier: Replace of_node_to_fwnode() with more suitable API
Date: Mon,  2 Sep 2024 12:14:52 +0200
Message-ID: <172527207758.23595.16896147913906558315.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822225629.707365-1-andy.shevchenko@gmail.com>
References: <20240822225629.707365-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 23 Aug 2024 01:56:29 +0300, Andy Shevchenko wrote:
> of_node_to_fwnode() is a IRQ domain specific implementation of
> of_fwnode_handle(). Replace the former with more suitable API.
> 
> 

Applied, thanks!

[1/1] gpio: uniphier: Replace of_node_to_fwnode() with more suitable API
      commit: 0a0d849c70de3949646b242209bcf0e3c488da7d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

