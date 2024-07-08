Return-Path: <linux-gpio+bounces-8103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B3E92A52D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 16:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33DE51F237BD
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 14:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA991419B5;
	Mon,  8 Jul 2024 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XL1CqNZw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1914B13FD69
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720450430; cv=none; b=BDvu13hlUo/6QaJlqcEYOo1QpW+RtzgvujGeuzil7t9rzCoM+N0wxAvK+NWo1w6w4eRGiFjV2sRQxYtnl6gIK5Z+JZm9QYKHgbeXsBRMY7pg4XXzqyIiDUBC6Iko75BhEHiDS3a49ogHLxrwQB9rRFI/GBtUculhG2mL+/x2doY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720450430; c=relaxed/simple;
	bh=oS/9j3dsYpP59idtGgIC4uuWK33USwlviNFf2Yb9edY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbBYsw0BztKTzR0w5PWK95UQrgXZEohx0zgzhT3jgDKFDDraM/x3h6d6fLAA00RDqYA+r/WkbYtlIvcPzRt630Vm6FVC8B24IjKAvFzQe/Upy7JAKeIvk9iZw6iLsfaXgPJQ+GbM8kGh0q5/NosmF8rQLUzQ0vXyf2SbFepEaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XL1CqNZw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4266ea6a488so3440695e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720450427; x=1721055227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyqFib4M3rqlBFw/ZGzz1LaByQHFqZPSGdvyPY+IPB0=;
        b=XL1CqNZwkkWELRYJEe9haeA07ZsDwWWm3PbUZF6DzOWI9yTLS72PRr5QecEoUmuh8J
         0GfgCfxRnSi6ULMkKakl8H2DB0negyPnLI8hfGTZvLI3lSBGAkWJZBgKhItFFd6FxT6U
         tiqxTPMdbygQQGo7b8KysReMrE0+rAWzf8LiS65c59/lIRE0p38E8ug9RD/XlqCysSzO
         KkeNopZ0pVr3RHd4LKMrZ6SaMdohrnT1BaxughNmfw4DP3+5Xlq/lw+ybwLZIYiB3xk4
         sX3yM4vAQYNhJjAeivmQL1nxKvH4oghdPG2rng5EehQHriKFJe0dFTyL/RRV7Oi8KShr
         HNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720450427; x=1721055227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyqFib4M3rqlBFw/ZGzz1LaByQHFqZPSGdvyPY+IPB0=;
        b=fv9lJ+RzJlx5CFC/zgEHe4HVZdB65iLV9IHbRAKM6ft/be+IFexD1uIeMc9FEDZ9k6
         5Ml5BBMKmG8EhXVwKKpMvMvCPsqhPZRz8jEtzv7mZe6LB3JItdanrEryCEqWzIFWA0+G
         83fnmzmXA74thk9YNIERN1c5verPGzRPpgF0WDZmI4Asc1KlUaFz768Nf2rypkKKMBLA
         R4pf3lSvNf5KYoDBO47IA+7Q4LagaHWKtl054TMyJ5krHEF2tQ1T5ca8td9OuzZrNnVn
         wzLKDvMqNipovTnNrI3e7qcFIG3e1LLaD51ekhMPV0sokG6B/gFRKsw1rcTO2zHExboi
         8OMg==
X-Forwarded-Encrypted: i=1; AJvYcCUhzfdsDOgiQJUu09psVJubwIHQ0l9+G88TCKHLZU6fszPLdk1dXHbCv3xyTZnsx13ZAgMnAhLVs0999kZ+Yg89vJxN/TFElq4DSw==
X-Gm-Message-State: AOJu0YypH4mNM48y/h7q/X6le6/68ic7EjEOkFShVevps74RDutCuVCk
	Jk1aHKmQXIT3NHza7bL3kZiylumqhamfzzQoQFRPhnHCSmgY0Kv6vp3934164JM=
X-Google-Smtp-Source: AGHT+IEBuhdhAHUYp56NAUgYnKaRIraX3CZBvDDbgKXiz0kpyc8NLn1O5Tq1/i1agiHJxKvs5l9b7Q==
X-Received: by 2002:a05:600c:378b:b0:426:6f87:65fc with SMTP id 5b1f17b1804b1-4266f876712mr488425e9.17.1720450427358;
        Mon, 08 Jul 2024 07:53:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09fcsm1933645e9.4.2024.07.08.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 07:53:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Stefan Agner <stefan@agner.ch>,
	Frieder Schrempf <frieder@fris.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: gpio: vf610: Allow gpio-line-names to be set
Date: Mon,  8 Jul 2024 16:53:45 +0200
Message-ID: <172045041379.123415.15663684790489482699.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708084107.38986-2-frieder@fris.de>
References: <20240708084107.38986-1-frieder@fris.de> <20240708084107.38986-2-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 08 Jul 2024 10:40:31 +0200, Frieder Schrempf wrote:
> Describe common "gpio-line-names" property to allow DTs to
> specify names for GPIO lines.
> 
> 

Applied, thanks!

[1/5] dt-bindings: gpio: vf610: Allow gpio-line-names to be set
      commit: 8060be2489f9bfa0c603373fa71cc2f93e46e462

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

