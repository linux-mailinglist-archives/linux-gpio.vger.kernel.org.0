Return-Path: <linux-gpio+bounces-27686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB5C0E2B1
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 14:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2846419A003D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8987B2FE578;
	Mon, 27 Oct 2025 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Fbtt4Gky"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEAC2D94BB
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572983; cv=none; b=DRicN1uVFiFj50St31gAAbEFZTmZicQXoNgCPTaVuWLOz3nefq8xOXIW3L9vxMmXbk1xalxXrNT/3+PmXc8jVqlaS38Vnu7hD8hBp8k2ri9Z4K7zjvfwBZGnwQhJFmOU58Bl2am7RONoZppz/OhNBhyIqQTWZ56XIqeZy7CPIwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572983; c=relaxed/simple;
	bh=mNZBbrtJBLOI4jfNhqKTpswdu8s3JqH7B1vngw35JCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gR6PfCwlTw79rNNuS+1sDqSM8NKvXqgP3sUKc0V8R6ezSHhyT2ystHk9oCDSoB5oCR3LzwtXPOrbAOn7QQN4xNvgzOD2EiyLIjR086RrI0BfqGeUdVnfiJwxEivYJL2Fqb//rqz00s1+zLC7joB1ac06iw6X3YneMqomH6Yg/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Fbtt4Gky; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47118259fd8so35038065e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761572980; x=1762177780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+kYS15ZJlMDWJI88sBMruJfxX9FP2xe327EPNR98VA=;
        b=Fbtt4GkyAYTAjzdhU1P8RKMna0R/gbOOoW24k8NHv0ocRkqYbPtkbfop5xH/cigDI/
         YqxTp8rqtnQ940osr3VBzS+mwoMqIAGAPVvfAQuXVa/44iypqxc0bbH/2IONnNSt73RX
         ar9ZkhlmRkvJq82NJ/vzod/R594iMdfmkXH6lJ3aGDcGg8Sr0yrk28UkVriSe1yX5ep6
         /okWs0CogLY6tYCQikhGa+DP0Rk34sXlKktc8JiiFsffTs7iwlFm5sVEACVxiataElB0
         wEjPeyR+Evt6MSIYrhcTFmmLiBiIAg0tV61Q54mTI6A+2bae28RzfhtMQ/RygRi/mDsJ
         4I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572980; x=1762177780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+kYS15ZJlMDWJI88sBMruJfxX9FP2xe327EPNR98VA=;
        b=jSvMetFQTYWL79QZQlFx2hCRZ3OWzpu26aVcRqMYBgzjnMs+Gm+pv1UjfOZK4mZRiA
         9skYmXaff7pB8BeFBoHcaVoJLJ025XGXP8LGCxYwUIFub3cS2QDdPV/71ALoIAJsAXMm
         bHm1LftfHcu7N29KBKqTmarBdjnUFXdM7Tm5qVRhpt9wcJzie/0/iRcK5Ik2jstY9N72
         Co2O+5lDNmPcEUbzeTc+YKbqHTkBJ/BJdv8MKIMrMEI3GVmGoD7fylu46wgiBIXhtbla
         wUC2YgrS1S1p2og4u40XGq6HphozCmwyreJGnDGML1Du9WboJbteKFecwPZYR5oSvSA7
         gOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW35QMSrZxYPVs3hYYvLKe/KvZAsI38W6n/nxW5AbIKT105KhVRsySWM/xcnA1tOTKeCxsCgtqYzt2X@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcx5ZRuAUOKLMt6fK6GcZx4wIPGC0DMuM/Aq2xCVT53igSMb3
	PUGKsuBf4+ViI3BtzBiDsY9yoMcFxVb4T7YuKnO9nBVruce/8LlaiQf3pvMYQSYOmM0=
X-Gm-Gg: ASbGncsenQOeFVlAGF1PTn0L7yc1taZuCAea+N7/YXsosM0q7BNxch9kgDM2lf+dCdJ
	qCJ1D6JWudeZbTxjJKU57po6dHwCv3LEvABBmQTpgeWRo64du420yw40E8EMM0a3NMYxOHqhRyk
	xcxZlLwAs30e/STQX4j2dFtIaQIFG48LLWmVQ+TBvfAwenoXRrfrCe0gUzRm9uLpSt3KO+Ofi6a
	tFLhlaRBzCf1YaLKDP6+sME2LKVOAGdcOidap+TpceR5rbtxMtjXZq7Dd4oXch0rrGo6GVkG5NR
	uiMaIjzIqLcCsefLPPhytich4e2YoDx2a5pYaWOINcyCVzzQAf/+EsY2fGpnraDg/3CBJAk9eJt
	RuJEYacuPZONf0CHFkx6K5GY6JKx1HgWuHLbBqt2AMA6ZyLd1si8Z5wJ/OxyaagNwu77XM/roNX
	yB
X-Google-Smtp-Source: AGHT+IGEpSOQmcL1jMgvwj3z/4bH8c3C2ATOI0Cp8JyfgXauzdAS5u+No5z57tgv7OTNqHxMeTrU2w==
X-Received: by 2002:a05:600c:4e93:b0:46e:4329:a4d1 with SMTP id 5b1f17b1804b1-4711786d685mr286976325e9.4.1761572980010;
        Mon, 27 Oct 2025 06:49:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm14939219f8f.26.2025.10.27.06.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:49:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH] gpio: loongson-64bit: Switch to dynamic allocate GPIO base in byte mode
Date: Mon, 27 Oct 2025 14:49:38 +0100
Message-ID: <176157297598.48241.17583971960894913932.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
References: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 23 Oct 2025 17:03:46 +0800, Binbin Zhou wrote:
> gpiolib want to get completely rid of static gpiobase allocation, so
> switch to dynamic allocate GPIO base in byte mode, also can avoid
> warning message:
> 
> [1.529974] gpio gpiochip0: Static allocation of GPIO base is deprecated,
> use dynamic allocation.
> 
> [...]

Applied, thanks!

[1/1] gpio: loongson-64bit: Switch to dynamic allocate GPIO base in byte mode
      https://git.kernel.org/brgl/linux/c/3cde66094575a5b1310a7631d28761bd3dfcea63

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

