Return-Path: <linux-gpio+bounces-27512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F2C000EA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 11:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40BC34E5C46
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E941624C5;
	Thu, 23 Oct 2025 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UNzBVhdK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F56527467B
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210078; cv=none; b=GXMtXtLFS4A1kh9kauvfGILWQnJXM5XifQC2kZnc+1GZqnUmSbr3WNpuMwdEUFn2ugyEiffgrN2n4nwR5Wi/X/8+j1xgdnZdKadSSOH3MH/5Up1EKA0ytH+MEtub1FNv7cWXuWBpwsWhfumkOkVy9eNJCw/iiRUf/RKTwHifq/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210078; c=relaxed/simple;
	bh=sOonaS0zVyHkZru4pIOIWEeCPiF1hPOs/eX1sB4hPdc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gM1cEXP3Sx4aAIEPw7JXs4Yx1DGFSs5KpHi7ir92Vvhxj6niQUS6MkjRuKxiWt16MnGSdetpUzyhQGS/F1kNazQttxXFchZIorsejdJtnFOq/KAsI7b1EO6jMj+JE2cIQcYK9IHAEUDVgS5pFX4bY4C5lhX5dtiU+Yhhy0Vk+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UNzBVhdK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-592ee9a16adso921356e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761210075; x=1761814875; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxTAvgxcr3RQekcyM7RJbXJ1bhcULry0eoTvyMBlhLI=;
        b=UNzBVhdKj6cyYk7MMTkfS84g9lBK4Jr5u4EwvxW7w2hk2YW/nfv+wVmyhHUPLdtxYH
         7qcXn9HbP93OQHBmSCuwp3wzUv4sa2pepUeSBpCPOhcGLnhu82enndB0Oct03J3Tpo1h
         7dTWWMA79U4H+DHESBMC4w/lr8J+lhL03XLyCFLdkjbuoOJ5YFURV1qXi9IEN9S6G+Yg
         phykBI8qmU+tG+a8St6e69ahOI3ZJgUGuKi6qj1Xfj+k+nfO/cGqyo4sjGyPmXQ/1W58
         zdC2H0/9kyodasJo7Jc8BcK2mVzJH3oBNAMSyyo8SvsE1Iqx7NHbTS7Xl2+avwLNVUIj
         5GQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210075; x=1761814875;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxTAvgxcr3RQekcyM7RJbXJ1bhcULry0eoTvyMBlhLI=;
        b=kt6mGPNfRf0VUisgK2dVjuQaYy0VTrXNZs8tL2kjJWbotoGOF4cfFPbgrhMppFggZo
         lrJE9kRa+aDEUHBD3AE5ezxpGA8/BpyIFl4KNSSaQMhffGMFaCvwEekDp/LT9v6+5pYj
         FlCVmUCMdJIDYty5d34UhCfJwqIMol4el4c/kH4qdlw2/5/6woaRn1k8an8nu15X71TB
         lEZh2pGqGcItp3ulRimKoaX8PUPx5+4FgUdCS4sWfnzl4fD3u1+5FpEKXnhqIunJQhEE
         gl7zYfcJP0P0EVuolYarRhqPpFkcbzhGzjztt1ACGL16JIYPt3ZGGa3sRvDe1QPnOluT
         sPag==
X-Gm-Message-State: AOJu0Yx/cvrRgn94AiSuaEWs+2mn3MBhed/RyauA236vizc5fb7Z5KgG
	5v/WclG9NJKo3FQfArqZ2FcPyCbu3flRhhGasSEWpvaIMjwN3fMi6XxSBD+9rkQXvIWlczX8dE+
	Z4BsJ4ka8wGuf0xWHLKJQKtp4NVtd2Y9RPZv/zwRsQg==
X-Gm-Gg: ASbGncsgQW635BNq83f440hPmYqLH2oJc3KK0Qgj+TcwmJ/uIvkuRpVtkmJ4rRkVrLv
	ukENfD7xAzRpwV02YWdQZH7JUYIahEd7IKZaQKaMU05kohjY4Q6qwpflJwCjTrWY4SNTvrcgE4s
	Wq054VEViu4KTTB9o5zpoLnaBELIfjpBg9gDSE/VS7cItkz7IUtfxOJipfk8Hd/pK29yItZcKBL
	jfzUj7qbUDQ53+dJjoXBzv7jgZgxuK1kAwQzx26gVNqoLej8b04VAAp7de7+KidSF2fcrrlUDZx
	c0rCwznQA1CxQ0bL2yFGgl3HSCiyDY8oRxEx
X-Google-Smtp-Source: AGHT+IEI4wJt38DG8TB4VZgiQ0ZzvBLeGaNvQT9RHM+HyEQpEQe6hKaVo1PAVM+qmQ/V2QKOeptZQMmWPbzIWrFebzU=
X-Received: by 2002:a05:6512:220f:b0:55f:4b01:30ab with SMTP id
 2adb3069b0e04-591d8451946mr7993264e87.0.1761210074768; Thu, 23 Oct 2025
 02:01:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Oct 2025 09:01:13 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Oct 2025 09:01:13 +0000
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251022-function-is-gpio-kerneldoc-v3-1-7f6930bebb2b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-function-is-gpio-kerneldoc-v3-1-7f6930bebb2b@linaro.org>
Date: Thu, 23 Oct 2025 09:01:13 +0000
X-Gm-Features: AS18NWBN6FRmY75muewbiBJigx0hp1Yn7-ef4Mzcdrd2T13aZkf4ruCBW68KD4Y
Message-ID: <CAMRc=Mct27g2DovHn6vV+Ovu1WusH0zZtEjSCdSq7zkrhKjtdQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: pinmux: Add missing .function_is_gpio kerneldoc
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Oct 2025 15:23:42 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> This callback was undocumented, add the docs.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v3:
> - Still managed to leave a speling error in there, I don't believe it.
> - Link to v2: https://lore.kernel.org/r/20251022-function-is-gpio-kerneldoc-v2-1-e1f200a94c5f@linaro.org
>
> Changes in v2:
> - Think over how this function is actually used and make the docs
>   more useful.
> - Fix grammar and words.
> - Link to v1: https://lore.kernel.org/r/20251014-function-is-gpio-kerneldoc-v1-1-4e6940a2b37f@linaro.org
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

