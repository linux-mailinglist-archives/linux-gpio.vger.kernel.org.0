Return-Path: <linux-gpio+bounces-13177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E269D488B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 09:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3E3C1F22440
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 08:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BCB1CB520;
	Thu, 21 Nov 2024 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qSNSMf7K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B301D1CB313
	for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2024 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732176643; cv=none; b=AmZRmxeClaxymrqkhrWREUMcAFtNzTRONlbjsTRXHBH15V7kKa1VwdpWdSDxZE95khh3sjD87TsTbxClky4F9seQUPds6QAI4WXlL+K7FsMhskUY9LdC2an6C+2Xwufj59x5kvMESUwFDc8JjHFp3G1ChR0AXsUml3+kEX1wOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732176643; c=relaxed/simple;
	bh=iDnfgN6PGF/7eyy8/94LuMag65g09uiHiBRee2CmnRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DipVuPc3n5sy4Msm2Ccs+qm99CiQHCM5a2G6Kf9f7MY1k9do5vlXtLcPqNO9kTsyxhku1GhrjqpVY7iaRdhiLIG6HdkP+MompfSTgfEkgzssYwVfNEsmv5QtsW1F3TNaeIetjiqZ/l78AGSitST3DNuiNlqb3WDSS7WJh0Dd9/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qSNSMf7K; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so4938475e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2024 00:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732176639; x=1732781439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQemGKV1Bllv1eo/npoEZbbDyGyqNGRo1Pu4zW5KeD4=;
        b=qSNSMf7KFrZrc4xcOTbAF9Mor1guiCFSsgfuhYw//KYaFhWUz18lrYGalM3baip55G
         o/ebpoRgMrnJthKule/uEmeUqE/gw+2Z5g6zyQ/aynT+l+scKT0dpdJVVUS44vjGidlE
         m839el3mcxdKMMNpB+VHRUp4mizq3Hl6zjggIwG8LTUU2XdqQ8dQsw1G+L2xeoKG6ShW
         0CKGprZ4rH/1g4YDBVTMbNGKwT8l0cqcLnBRZyBb37pShCnPenzuG2ys63rMfmlvIty9
         8KsG7Sovn2As/fqAKVzlYuFTvPwOnghYsJ/caBokYZ22KrOJ8z8ZxqRU96dhQSPEheu0
         qDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732176639; x=1732781439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQemGKV1Bllv1eo/npoEZbbDyGyqNGRo1Pu4zW5KeD4=;
        b=Ytwk8QFuK/g80IsOgPoOrj/YfW997e5StC71yT+csdynWY5L/LneQOd6JvHf3Us3Lx
         OueonYEndQLcym5GmYovNGWmAHxYPudVBliuKXv9o6D3ayuLe0jKKaMShauGfN62jMiB
         dIXaX5hhDcfeZX8CoTdGSA4x+C0kPQvnkpWqsIl09QUhzP4yHNlrD/UsreK1lV4A4/CQ
         Iup49ZoiKoLfMncVF0vbAa0wxlRCALXwbFFlsJoHAGAxhIT9Ptzz6z9RL7g3N48ew9C5
         H60WIIH0qkxT48HHC/TnhrB2rplITXWj2CsjF24+eg311/+F3tzRSQarB3wOM/uJzRoR
         WvOA==
X-Gm-Message-State: AOJu0Yz0KgduThcOSIr5/eEnJ67yC61YTg91bfzzoq0GEGTQNXzGXzcj
	KAJFHrr3EkKEpUEUi2hUG/tc5i4EadDGt/PplzwNni+mME+46D3bujfoRCAXV0vhN9EONltpBCt
	l
X-Google-Smtp-Source: AGHT+IFAtlq3C5FetoSTY9WO82Elg/WGpTD8ieKV2vPhZ+MsbQlICDjhoLXP4IZVp/9ulSV5A7GPcw==
X-Received: by 2002:a05:600c:5125:b0:430:582f:3a9d with SMTP id 5b1f17b1804b1-4334f01f731mr45241085e9.26.1732176638718;
        Thu, 21 Nov 2024 00:10:38 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d902:9409:ef0:268d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1170sm46696195e9.3.2024.11.21.00.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:10:37 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/1] gpio: zevio: Add missed label initialisation
Date: Thu, 21 Nov 2024 09:10:29 +0100
Message-ID: <173217662606.10730.5446470361475878860.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241118092729.516736-1-andriy.shevchenko@linux.intel.com>
References: <20241118092729.516736-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 18 Nov 2024 11:27:07 +0200, Andy Shevchenko wrote:
> Initialise the GPIO chip label correctly as it was done by
> of_mm_gpiochip_add_data() before the below mentioned change.
> 
> 

Applied, thanks!

[1/1] gpio: zevio: Add missed label initialisation
      commit: 5bbed54ba66925ebca19092d0750630f943d7bf2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

