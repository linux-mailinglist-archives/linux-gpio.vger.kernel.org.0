Return-Path: <linux-gpio+bounces-21645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 663AFADA982
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 166221709F6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FB91E3762;
	Mon, 16 Jun 2025 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XWq5w4cu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EB72C1A2
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059268; cv=none; b=TNsG/fjWFaz8ktAscRfAx0YzyBxtqfXpcWLJNaqOrPmVDP3aRmYzufHccIztCKuD6fJTXPTNJ6bZ9qqw/n/Cx52SJRS1EYWNMwL6hNO6szwE1guCmHFQ39rtqSr/vgr1H7SlSByyl7/KbHdlkmFWwIbUPkvV8m0q7FLqgAqa9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059268; c=relaxed/simple;
	bh=g2iX34IoxrIaM3UBcHz+mdIuH/BJpUNpXaFUUcajRvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B6AS8X+SAVY4J1J5nIBCKBToMIF9KVdeEpKUaJKm+KCCHkt058ajaCUMvwPiSyzf9ZoF3GM30VuwCL09g8Mw0BdWbMqsR1t+lBQacqcW1My3SffndViee042VKxAVhR54zWVwU1i+qrskFhD1cErWhTjsflZM47ZthGu+gUBCtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XWq5w4cu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so2327692f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059266; x=1750664066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NufnnT2z/L01xcT8J/hVS5CTO/xRwDlIelt9on8BTLQ=;
        b=XWq5w4cuLD+9cn6ZYOrhDgpODg4mehTkFByZqT2czVUzAKpe7TrT2f8naPCzYetQcf
         J0WlAvII6X0C6ceIa0j/1yfuLPd3chSrCibu198DD1ES13/Av0ldyadFzkoOesy2c9FT
         ELC9QJ+LXiKRLdo3ewezsKPGGIyEMTxtvEToiRU+gjWouLB+8SL0LQNcxvYPM+0bl0MX
         egEj8bybRM34NBgtY2Es7mMXJEy47oIlhKBjNLXhV0cGb2nj8DpPAIzwEB2ku3LXQC/6
         3Y66KlHaoL561HNR7R3Jt6vkWy/qremLE+e9I8B22iqnexUOr08o1O8qf3p3iqpOy0z9
         NdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059266; x=1750664066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NufnnT2z/L01xcT8J/hVS5CTO/xRwDlIelt9on8BTLQ=;
        b=uMDgz18n52uCHhvnBV1UfP3qYEiEqXo5jbcVT+YIAlvNdmJhdK/5tKkvELEMO5VEsS
         Ax/aoQ4I8B7Jl6dOPi7Lu62TKo+H6ijOwJe5HiQ6GZuVfC+u5GyJ7PACKIZBOraOwNuq
         N5MVVX1poJSanKSxQT2NvpADPWO8yMLYrilWQlbe4qalxgFe/b7h3Hxe4+9+BUjjKLCJ
         5Iy6QK6FYrOHjf36XEVqZRJV/X89MxiwuFFhKqfEWT85ZfIYuIL3faUfVP+12rEg4rsV
         Fjl10mfO2aFrXVU5LB8dUbIeq0lb+2YFOpGkPcopD7tf+0PnwjkH3rWu8A/WfOLnVcrP
         /T5w==
X-Forwarded-Encrypted: i=1; AJvYcCUP7DWUQlZ0I6ZMWCmb0YoTR4WLl++jMVV+QwX/Pf3WDmOMqop+gvpPDezYSLBw3ppLC18tYMI4ZKqw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+g1dySgfU8f0haC5up87Sqvc7uNEyGqcGbrO7R2wPTTugOFra
	V3v7Ert2MTCYNNAj/vaFC1sjzo/tqbW4FHneUdkr9V9xn8fLgxcHiWeofbjSyEFvAIc=
X-Gm-Gg: ASbGncvXIAigaOTvDHMhbHZ06zrcxqaZO+p2zbcmDfnzA0DphtUNvvAIXLVud0vVemB
	/x23W9g0y3pXRM1C87wZnpqhEqOCnMQmffigRcupWurxX8MtTntr8dUpoQ6b/MOEoHEBiGGu4hh
	cSouEw550ngMOT5+YqmwCdtQ50Hjgcd+pfgvzUS3JERWY1FV1pNNfWlqrywBf8P6d1THGIoaJvg
	84F2N5It12dprWpVPRM+hdCiXGEdoDEM5mXThknVN5yNvFaOfE+ZmNdlxtKiwtjiLRfBICqqXOa
	QNoNBkE7M0FBoRNEvVIaZWxfCf0w4ir+NL/EgHqE8PIzyiatdVOoxySCNrYSqMI=
X-Google-Smtp-Source: AGHT+IFV0yz0l2515IeeTm9GioSRgS+MJm0JO7b1ZICcf7COUEwdawqQ7EAIvhjQwyAaNliNSkmk4Q==
X-Received: by 2002:a05:6000:2c13:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a5723a2d79mr7119025f8f.27.1750059265794;
        Mon, 16 Jun 2025 00:34:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm10388705f8f.16.2025.06.16.00.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:34:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	David Lechner <dlechner@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: use gpiod_multi_set_value_cansleep()
Date: Mon, 16 Jun 2025 09:34:22 +0200
Message-ID: <175005925792.13944.4716742075474493399.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250611-gpio-virtuser-use-gpiod_multi_set_value_cansleep-v1-1-43b4adf6c807@baylibre.com>
References: <20250611-gpio-virtuser-use-gpiod_multi_set_value_cansleep-v1-1-43b4adf6c807@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 11 Jun 2025 13:50:26 -0500, David Lechner wrote:
> Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
> gpiod_set_array_value_cansleep().
> 
> 

Applied, thanks!

[1/1] gpio: virtuser: use gpiod_multi_set_value_cansleep()
      https://git.kernel.org/brgl/linux/c/0a99f2d8ff5b31c3aaa70b23bde58692d1300bdc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

