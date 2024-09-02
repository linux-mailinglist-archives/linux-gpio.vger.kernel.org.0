Return-Path: <linux-gpio+bounces-9540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 022B296840E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC9B51F21227
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FCF13D2B2;
	Mon,  2 Sep 2024 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WNpx7uEq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE00B1311B6
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271471; cv=none; b=o+0x1FaeWCdl+wTx/s5Hv8gtgGKoHZmajG47Hdp2MpYN3/sjqalOQnByEzK2qNaYhTwGZk72FBtuq3+udQT6jn3awFTZzpx3lCcDaSYrQsZw84RaziMD8lfUhh41v65mAOYAUksI4+A99pfgHLhY68gPCJA6GygFH95pJNBCrC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271471; c=relaxed/simple;
	bh=Q6lLUdMLNVY7KRdyFJOJqymSa1u3r0Zl9GXLAfvFvQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQ0tWOPclR5rveSa5psfhOoyRodP6Jk+xvtc4Zb0puVtD8zqoFk8GX88EbSJvzwYVobvKC/d+t84eKPG+1yFiq+RjbzA1I8TJLNNn4Xlg0AP6Nn6Q5Pa4eNyLG8o1q5tpOYicP7HiVEW/DkK8e/m2Olq/GbKtapP0T9Ae7+ycNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WNpx7uEq; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a868b8bb0feso487956866b.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725271468; x=1725876268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydRN3I4GrEFH/xpqDgiDkMkKRNOVjBBE3bF8QBJmcso=;
        b=WNpx7uEqmpfyL0d6QvYsg7iS5uDySuEXRd5zwCUmoBU761CFHlSjcW2RS1uJ5wuB1X
         ja7799PWxhYCr7ZvG3bxY7sdjlVnKwvXw+8gEU0qnMEkXiLffhtdoWYFXVhK7WmxmQhc
         r7vTQg3wjebYjaTjGuwM9Dd1DTUPd5lKWJD8rsSBe4pOIDEbNoLtNWF2Q7hEqvsoEnNa
         s0fSYNqDQIxOfAZcxoMkS1GwW/vw5NqKCQabyJau8aCg+Vd/lZ4+WdSaJjeYMjCY7Soc
         QAT9Nmw5cnNi9d2L7vmSfudLelx9l/zmatMxNDbslnvwWtvhotEU59kOnXMViSy7b2hJ
         lLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271468; x=1725876268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydRN3I4GrEFH/xpqDgiDkMkKRNOVjBBE3bF8QBJmcso=;
        b=GegfdB2DT0EvLHHiDvDjWoMOtWviTNwTUaWIHDRRSeydggTQpGDqQjO1OUdQYfQIwW
         c58z72MfSsvpUJNcVtfg0q/AvId1e5Snox8SXjF1HUhrci5dZB2hf/5oWgHb0BlJgoyL
         IhWaUQq3tQ0/3R4ZM55VmwVOCy+dOK21W3IAluDndPvUJ1fFCwF/SigxQjl5fl2iD7E3
         rne/TeNlLEovHvSUpWHp/23l/mKLJlMgToXk1+Yt3/750UsrGrHnPmTlmxxzLS9VhjDK
         XsEQgIiEGEwgYB67HDEqpZjLvl1GWWH2+yg99v5AklRqc0zGVCJdw4PBp/meRwTXT4za
         yEHw==
X-Forwarded-Encrypted: i=1; AJvYcCWUbTZZDUJ+7DyF+O8PLQQrleeBrM4rYXYnN0TJe7wz40KVyfN3NhYMLmzxMeP7iKSWh9BGS7C7TzGm@vger.kernel.org
X-Gm-Message-State: AOJu0YyxUKTsCcNzOM+JPzVquCJ2AF8vkjKXZPSuXXki+i9bpDgDeJxK
	C5aiH3dT3ZzhuJ84KT28zmgD0aYqHPe1R9535DSi7V9WHTWTOi0KX/131IuKRdg=
X-Google-Smtp-Source: AGHT+IHqyuVfgbkCF7KXkJ3l/WmbImvTjgX4iZBNFikwm0ruLIxEAsO7ukBfh3M5eyDDTKeTfRWrfw==
X-Received: by 2002:a17:907:72c7:b0:a86:a30f:4aef with SMTP id a640c23a62f3a-a89a35dee4cmr658399266b.22.1725271467462;
        Mon, 02 Sep 2024 03:04:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891daf9dsm535587866b.164.2024.09.02.03.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:04:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	warthog618@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: rm .*.cmd when make clean
Date: Mon,  2 Sep 2024 12:04:25 +0200
Message-ID: <172527146272.22707.17761530234726654365.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829062942.11487-1-zhangjiao2@cmss.chinamobile.com>
References: <20240829062942.11487-1-zhangjiao2@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 29 Aug 2024 14:29:42 +0800, zhangjiao2 wrote:
> rm .*.cmd when make clean
> 
> 

Applied, thanks!

[1/1] tools: gpio: rm .*.cmd when make clean
      commit: 4a6c1621338af5c7dbf6d32b9806d06ab7de926d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

