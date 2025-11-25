Return-Path: <linux-gpio+bounces-29065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE80C851FB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 14:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 58684350364
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 13:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C796320CA2;
	Tue, 25 Nov 2025 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ohQq98jq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244572ED15D
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076293; cv=none; b=k1Qv5lryakEgeM5l3iy43R+CPjQg3lvDkI78fVvAqyvTQn6Y2Wskd1GQiqvQGCxKUEQsXzdreNHV2smGb6o4F8M2ai0gFuZG7enxueM16vvtTFnR4aX7FNf1syg3HqFECsfiR+XGf9OzG48Hk9N6+igENMt9BQf2eQYVmdpvTMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076293; c=relaxed/simple;
	bh=fBpUblSc3O1DzyBy7QcSE5g7YN0o/5l40ZKytPpEwNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=drdWYfYb31cZ4weEsuZa9VParPkxKfIgh9RtldMoi5gOp1HroGPzEOna4U8elc0hcilb6wpEfp5w67MuTtIOYyyN6ta6UnKw1BPglGEKhHpzy8inho1vZ8w2Qx9F1cCm60n9Z/sr56Ep4g03Fg+phYxsnCHizMOQ9yh3HnlYrL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ohQq98jq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso53704725e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 05:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764076290; x=1764681090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AF/ymKNU/IWkNzMOHS5V+glJ5rwSWoJx1hh9KxmKoDw=;
        b=ohQq98jqY0dIQaSn4JBuLcz9OMEMzTflYms+E0aPrY3nirlBjahAIeALTZjFaPpcB5
         KXFwkF8grL29+UKFdejHQMNhqrNF4pVV3FdsJQcVGUgoJy8iHD4w4cW6yaIKVPcABvpZ
         Rkz9feNHnzA/zxjwOfKY3m5qYveikukBCNGy86WZ9w2IIFo3VMYNqtvE9/9eHfnCHEIO
         TLJ38PZvDHiiLBTBk/XsdmlUSStZuBMBy+g8bu9q0gdCtKVjhwe5nnRNgx4XKRQKCagu
         GqYbjPzXg5c7Cylf3sm55kkn2jI63b2YfdmmiWcaarvQC/c0q6dlVTg4RicKfNWRopch
         5I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764076290; x=1764681090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AF/ymKNU/IWkNzMOHS5V+glJ5rwSWoJx1hh9KxmKoDw=;
        b=lxL9NhANkrWyoTxyoPr3G1trQwVaf9zNqpvfdecTLc/XqKpUkaDusCTLXo8Vf+i5FK
         r1CtAKm0V2QrmCrOEoTOqf9osG4Ek6tlhIkdj/OPfyvKp5Jf5zvBCglezqJ639tKiia5
         ycEtrDHS/fqli5hP3p61WxfeyH3Ufg6kNUChhNf8kkfWBbHRbemOviAZtdtc3WeiHryz
         PoHWDboa5TYWT9Tcz36F8JVB4sqgwhdA3b49eoWo5T070rdL7pJ0+XF7p/fsdV1riB98
         sM04qt9BFx2BzFt/CYZTIJO6DtmyT6NtHwkAsO9r+wegKmlstUob19rS1UZBGK4wWqk5
         C/PA==
X-Forwarded-Encrypted: i=1; AJvYcCVZsQ+eyOjZJUcHzmnA2sFqJCEk5EzlOruUOIsUigwdy5Cq5Q1GEIhVSsqQNvi7gAR/OUb6ZZ4wI0ek@vger.kernel.org
X-Gm-Message-State: AOJu0YyOhxI+MCRavPqGUB2PFAKpYiJIcdIJMSnm7HmxRd6KlPj0yucL
	BzvbEgTWdrpkxZklgtT3dXtX9y21r96T2InQ7wXvRdD0OWKBYrqHotqCl3HdlSJg2EQ=
X-Gm-Gg: ASbGncvdTUaLneGAZ54baoyKAlVsMRmX+Iu9E0GGy+/Hc2ADwSTMEdOFPjtiOLUROSg
	JNLvvP5bR95/P4DSbXPtLUlNNO8T73hy1VSNMLdN/RGMXy89+yavTPgRFIQqAd1grqchzF2H8ii
	IJ7Vq/ota1DwhYatFewo8bWuK65JsrUSvNeSm/TFTPdfPiut+VMv/F2Q2gQcFDjgPZ6EiOrQspo
	pK5/4HvJwIzboOW6BOr3ECyaB/XCC0D2gLjrnMzp4Yqty149Tj1+Jq93VZZDrFi1Cj4jIV2mnDI
	xr4QeAN11ccJZKYnexAm7vaqfNrLSDccraOtJJx8OflJWbFnGiUIovIFlIlRK2+jE4+p1VwZF7B
	ge0a8T7JQZODDzuePCiuuahCFY9Ou24TQ5k3p5k46KEkxmxbo/RmyeC95Gqmueejp550feFY6bp
	rzAS9B
X-Google-Smtp-Source: AGHT+IF2d1dNaLQQ0BE1lb2WDqjp5F/ItE0EG7UTuAPSQpK/RrXI2v4HqgZHJSatvjjVOjwrU182GQ==
X-Received: by 2002:a05:600c:354b:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-477c0184c45mr143467535e9.9.1764076290301;
        Tue, 25 Nov 2025 05:11:30 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:df0c:79ae:5345:c3b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf226c2asm249328865e9.10.2025.11.25.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:11:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 00/14] gpio: Use modern PM macros
Date: Tue, 25 Nov 2025 14:11:26 +0100
Message-ID: <176407621592.26035.10745445614533794233.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 24 Nov 2025 08:20:51 +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> [...]

Let's give it some time in linux-next to spot any potential build issues.

[01/14] gpio: dwapb: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/3f19e57cbfb55d743d60aeebf5d5c48cc7fd5d4e
[02/14] gpio: brcmstb: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/56f3a6d7538d2e0dfb8d9df7871d2a9aec3115ac
[03/14] gpio: htc-egpio: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/2557b1f4f21a75650a03c74a56ea30bd4214866e
[04/14] gpio: pl061: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/b40c4dacf48a42ddcd701552575945e90f5c8060
[05/14] gpio: ml-ioh: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/1f37a9f7d1fa582833cc8e226d77e5b2397df9fa
[06/14] gpio: mlxbf2: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/a92f492a1473eb2255be9b7b767d0720c5c3b2a9
[07/14] gpio: msc313: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/07a251bfe3b690ebfaef7c46f6ce25ea9ccba8da
[08/14] gpio: omap: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/2b3c8bd8e13bd101fe8833b1f02ef5e5a6e9920b
[09/14] gpio: pch: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/0ed358a87d6ef9782dca161ef3f1311d21f257d2
[10/14] gpio: tqmx86: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/75ff16234bf3af747b9c77b81d7ce3df5c09df8c
[11/14] gpio: uniphier: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/46e90d3924cb58b161c2dd57ba05f3a706c1c0e2
[12/14] gpio: xgene: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/353fdaebdc6991f1cf03ae3aaec266ad0516859b
[13/14] gpio: xilinx: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/dbedf93d1082b4e755eb62338e5f6566f4e31fb8
[14/14] gpio: zynq: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/23ac52a4a2dceb704d8dc1674abb8beefd93bf1a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

