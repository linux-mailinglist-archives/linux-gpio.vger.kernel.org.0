Return-Path: <linux-gpio+bounces-27000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FF4BD1E3E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 09:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CE093BADB1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 07:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BD32EB858;
	Mon, 13 Oct 2025 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t+7bdIpf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB762EB5B0
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342209; cv=none; b=ifZwFevsNIQlbgYIcftffnFKudpSuIfWZlttVF4fnp9E5ya2FNQ33tdKdnVLZ296ccSajUcxSeQRtjxu22TYWCE5sqivnRyLa5xBq45nFJlQUwNAbi4rC0PWW87ezSp7yjzRguyiTpVjDYPs26MfySjOYaUZc9YDut+TvLJtbDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342209; c=relaxed/simple;
	bh=sEIvW6x+4sTQzQpZS8eYIM18pCv2WKw2KDmKBteSd/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H73pcNa7V+cQBj2dmWNVxiYMu3KQJ3J3xt/SQZAAJU3TJN92rTiVdixmWDAAPxAK6PD7j/uS40QTZoizx0wzS4yplgEUtWSLKfn/3F5jxpFdxG6ZF+94mG8tbwyIh9f+1cgWjozkD1dvqC4z4qiAmWWv1JzbzX9SRICyvO+hRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t+7bdIpf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso28856885e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 00:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760342205; x=1760947005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0aoo737rUcrndFNFlvfDOz8wB9RR5RiC0gdxVfmpG8=;
        b=t+7bdIpfOLj2wjeNyXoGflsID2qYz9+o7fbQrCB1TtWYDKlbqmCzObYB5gk9XtPTMt
         aX/kavLLH92E+Rm88CQ5nL3QApuCIbY9uXxEc+y7SPM0B81FykikVkQI11QHtYS5kcoK
         lyWFudtWG5HNRoPltnRrrgPvIujvIG5rRQ6QlfXm5cZ89lswb2lAWblRuuPBUADy/tY9
         dXQWpbzpabtWDTLmFnBmUEQ76J5LZ1Q0XlLIxnuyIW18BFUNH5GN/yqn17SOo0t8hVu/
         apLqbl9UUiD753Gxi+ZytEoSUb/Lf5Ewi5b4vT2sNahq56AHMWg22iRvIKxj9MJrB0aa
         pZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760342205; x=1760947005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0aoo737rUcrndFNFlvfDOz8wB9RR5RiC0gdxVfmpG8=;
        b=CEKHqPliGFuJRLpgcQCB5B5KFQgdx5qoAIjXVGnqNzKIeGG1hT1/fjaQ+zUq2ZHvWd
         cVwwpGESgXKkSIdR3T27G1QHmpI12vkF0Ohx+6zC4TrA2qdyCiO5LZPU5FQzQ2VOEYmm
         v7bRurJRIj6UOhO4qUuEXzwisLhQqfwUt5L9A0XOm9kQ6zDWnewLGSkaE0cLBaP2tXBm
         Ik0WYgxzjV78kqqH8YmnxoY85gEGStb5OlbEdnwOP4GCBFQWFdgZ05eUV6pJ+T4pe0YS
         e+NwVKDCtx91VPNiyBF10xwn4y9bALIzAuX+YxmfNWb0RS+N67dLrF0H8so9AgfHz8RL
         HiuA==
X-Forwarded-Encrypted: i=1; AJvYcCXUnuTaMQTe+e5na+xHuzHNQGCb7ozar6y5/w3RgRK/D2SqPFshLUmUQSrT+Yn7P7Bg0l1vphdkBVKK@vger.kernel.org
X-Gm-Message-State: AOJu0YyRoPzsXS2iMJ+d31dyvMxuaNd8G8FppXJoNcIIpkl1FMdeO+2h
	xcSXWtkrGqR68sdld5U52IpjsgP2hlNcMl3WcINKZd/Nof0RMaejm5MmntsgWL76II4=
X-Gm-Gg: ASbGncsJEXiXCyJSuQWlC01Cg1428/HvrkqAD3sFotiyDySb1Wb03GmNwFQG6xx1GKM
	t9rvAT2BzZSRXSIH+H8sr26EwLkyGKY5bbPnF6KFJJekQlksJysg4RYM32Axxp1i9Iostkx/aeK
	+ycuGvg2JAj5qcJbpNnGHNfSrvL5NWBRt/g+Q/II+6ZnCdgQHhJMhUhZZ6t33ZZm65xmnV4+Ohj
	awaykECZwXLtsmPvjR/5RLwPNpUwhX+Ss8Rr1kQ9+uWent5bPPmusJTs09UlNnOlyumOpvDGbRs
	q/MDDUz4/rSwIVM2Y95wnmnaj+PZfBezZ7L0ZnrvKZBwjlLKCR+MRjO9zlNC6rnoJp83zAOyks2
	HP5GS+nd11YHt8l0gqeE5gggYifmGwVhW4BVhFdwni8GKZv7Yaa79
X-Google-Smtp-Source: AGHT+IHbBMNeuHP6tB+J+HPOKsz3zV/StZbuZtzRNYS/jnkQ9BzVlYWtECo63vrhgtc/+iqlaZmKBQ==
X-Received: by 2002:a05:600c:138a:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-46fa9b092aemr121418325e9.26.1760342204324;
        Mon, 13 Oct 2025 00:56:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fc45:d50e:e755:a6e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb32a84edsm96545345e9.4.2025.10.13.00.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 00:56:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] gpio: rework debug macros
Date: Mon, 13 Oct 2025 09:56:40 +0200
Message-ID: <176034219937.9647.13899884811798472759.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
References: <20250922-gpio-debug-macros-v1-0-d99739dff711@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 22 Sep 2025 11:54:01 +0200, Bartosz Golaszewski wrote:
> Rename the chip_$level() macros to gpiochip_$level() and reuse some code
> in macro definitions.
> 
> No functional change.
> 
> 

Applied, thanks!

[1/4] gpiolib: remove unnecessary 'out of memory' messages
      https://git.kernel.org/brgl/linux/c/0ba6f1ed3808b1f095fbdb490006f0ecd00f52bd
[2/4] gpiolib: rename GPIO chip printk macros
      https://git.kernel.org/brgl/linux/c/d4f335b410ddbe3e99f48f8b5ea78a25041274f1
[3/4] gpiolib: reuse macro code in GPIO descriptor printk helpers
      https://git.kernel.org/brgl/linux/c/3f0be1783a8ff57f77e6f9a12621903b5a496d40
[4/4] gpiolib: reuse macro code in GPIO chip printk helpers
      https://git.kernel.org/brgl/linux/c/1540b799d271b545bf04726906184bdf29ab272b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

