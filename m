Return-Path: <linux-gpio+bounces-28728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 02709C6D2DE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 08:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5FD7A3853A5
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 07:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCA2256C70;
	Wed, 19 Nov 2025 07:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hrloEoWL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173DE2DC789
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537660; cv=none; b=kS+y+V5S8ryx591BpMkYUhJcmh5NyLR9tuvYMDpS62+BTu6Ht0ayXnguHZfxoNOCsyqYlw91RrN9GHeUL7dgnlEZAlSCFbLs5yWBV6d1aAAXjB5H1Nw9nlX9eZ8UOPTVCeCQ/i8ZAB4Y0i8F5jD8qs4fS0wxyqdxkuUwQx2pSf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537660; c=relaxed/simple;
	bh=p3/bkIH9uPKWWEW+7YsF0SDtCCOGidwg7jFqQqayV4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rLFbH/9owgeyvAeOnPh7UwJfNzEMW3CSBcbWuWE3/LibUyhRvHPEKpId/0ca3r6spR08UAmUi8StSUNsZrKto338yKWCFkIeFWFPm547E6ii9FQqThQnj53Y2VMlv+lMS2BKbf+1SkEsKoo1TRJKA9p+pGLAmto2qe1R2DcjU70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hrloEoWL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so43590245e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 23:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763537656; x=1764142456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyTLlJKv+uAgKMwsKAiL1OaM2pLcedKUFa+Uuk5yJtA=;
        b=hrloEoWLE/4DS5C2ocl/SdJ9oSiiRBgXzFC/rz0jg6gD/oGGoaX+V7ZknOfVFgBJNu
         7gF87fBCmK8yPFBbfB5FfvT3kSLLrsl8sv+DbxSDIaVA5jpoqE455rncrFj+SMTI9r4g
         blbGd5dpBelbNGRngWf3eXfFLe1kuxBSyQ66t7T83TWllJ3i2Tp+8HsQZZLcnWIcG5HP
         m7kmRHDr2j0NfecxZ7bjcRpniPbQB/hluW+skwdiD1YW2Zzs2QogfuTKbvjBMQThG/UZ
         OfcEn/9HHnl3MKs7Mdsa94FZqkR2ZSNBmvmfDOPB1O7dsDZkJHcRn/zkmQ92CL5RF4eS
         C45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537656; x=1764142456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dyTLlJKv+uAgKMwsKAiL1OaM2pLcedKUFa+Uuk5yJtA=;
        b=enWcm9E/y+D9zbrrqn5fjjr5eLW5+MhcIfLQi3FAfIPQmUHML692W3dpm1g9Ccq596
         KBZduQ9yQWNVNJGmcptDg3rhbQDr9obAhHTN4UEjqsiwAaFa3EKPt4jmMS+aXffNnbwR
         gwmgl67QxQRVWb+VqJF9g5aDRdSnXBC3UeBazcB6wfgop3lsGz+HQiBGl4iu5K9OewPv
         BKybw0cA/reWoUnfF0PyNlLbtPn0o9XnT6zghMRin9+u8LjKsfpQWc4+dF2dpItR3o0v
         R/+GkcWZeGd10Jy25FHqKD0e7Ab3NGFsFfB+QpswBfxpvqbBItOVDCq0/vRBtAkU02c+
         cvVw==
X-Forwarded-Encrypted: i=1; AJvYcCUzXFBbW28SoatOc1yS/ANHPpNUnthn4DfyIw8q+0wbZhrjvpfY58oy91Y8iFi1voOeExIUO2pz8m9s@vger.kernel.org
X-Gm-Message-State: AOJu0YzSIOPZJqbkmkFVWiCyqivrq6qrGBJaZAYtv1cA4hI/Am73E5HG
	umZcDGLbxry/N1UdNui9quPF4L7lL3Mfr71LKBtnyhASP9f2Y33GsAfHG13BQV2ASz8=
X-Gm-Gg: ASbGncuIegyzGoa3El346pWXB6S46p9WfbAqpEVwTPg3vFAphO5pdqi6KhHjFu7aOi+
	hye7ssdWIyAGrGB6FcXzKvlreBQ3wDhiOe29IhBljV8q6t52DAmm6oJ7zPK2o7k0R4P5aj3S2zh
	PQY5N+KDFcHw+7aAuMTBHWvCJKssDaezOznPAJACz2INMUy0LUiP0wKopXyhHainPhewQCpQ3z8
	CMXEW2kszc8K9hfqrSezfmVxGQ4mJ21jWNgPrCJDCl6xxRp058WWR7YZwFH13/3Z53/b97zq/9C
	f9w0SeaQaH6ia+ZKr+5J5PquH/kRbuE93w5nsFw7B2nwX9IOV/bZhGD34DfdhawQd7vx7tvGoal
	G5ylo2sctXRa546Q79x1giZObLNgnFbjCfy9ToIHP+OPiNhkbicKT4mkPArYoMFAWJl5UWQihi+
	VFTMhMhKsg6eiJV0MP
X-Google-Smtp-Source: AGHT+IEQLtiCcUKorpUqJvnCuEOzgVs3btSJq4wj/wk6sqacbEOSqhfrutWB4Ya+bmSm6YG7pDeccA==
X-Received: by 2002:a05:600c:c4aa:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-4778fe88fefmr158552575e9.32.1763537655583;
        Tue, 18 Nov 2025 23:34:15 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm36511233f8f.0.2025.11.18.23.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:34:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: shared: extend the ifdef guard to gpio_shared_find_entry()
Date: Wed, 19 Nov 2025 08:34:13 +0100
Message-ID: <176353765188.7241.4280556403219196515.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118-gpiolib-shared-of-guard-v1-1-e4ef149a2e0b@linaro.org>
References: <20251118-gpiolib-shared-of-guard-v1-1-e4ef149a2e0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 18 Nov 2025 11:54:51 +0100, Bartosz Golaszewski wrote:
> While this function is supposed to be used by all scanning functions, so
> far we only have a single one for OF trees. Once we add support for ACPI
> and software nodes, we'll drop the CONFIG_OF guard around this routine
> but in order to avoid build warnings, let's extend it to cover it in the
> meantime.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: extend the ifdef guard to gpio_shared_find_entry()
      https://git.kernel.org/brgl/linux/c/8ad236f8a457c88906261411bcafa1a91fa96124

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

