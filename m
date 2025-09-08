Return-Path: <linux-gpio+bounces-25726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D43B485B5
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 09:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A47E717FA93
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 07:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B4F2EB86D;
	Mon,  8 Sep 2025 07:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bn0+CyOL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17C12EAD0D
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317143; cv=none; b=gsU8QQjU436svBEExr7E/ol5E435Kxa9CSuPN1V5m9yOfzh0+4lh3Q+QCUM+8OYQvePaNGNQlbPMNMafEITbNLOUtqDrHPHKZnngLKHRRxIrR4i5n/zzAkWc/OP1njzRYuTzoIRhNEn1X+bP/+ifniTwM8BjlmXndLRICsuDxOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317143; c=relaxed/simple;
	bh=MPT8NiohwpIH2FRM+/GL0Zo9ZEY8NsCZTxRtvHtMSMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIjjQnbcXKrsDDMt6amJjTQON/0Lyonxcf5BF9kMnkb9vSv3+y7yLbEiBsHICA3mmmcSxhUKMuPFSN0AVpenGwyx1+eYgs6kZMF+ndfhQr+msOuL8+644Y9zg9fxoUS+v5fmPqOWXb3fbbzD1q6QMF1ajSnMbXaT4A/sQ80uGXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bn0+CyOL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45de1084868so5412215e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757317139; x=1757921939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6Qgw00JLihNswGsKUrWXq3EQB6PCDyKUk5esdN3dkc=;
        b=bn0+CyOL4Zht1NuKe0AMRI5SUB8Bvx7QhKI61DOQSyNZ/3KGk4LrAq81gipNoy3EAt
         T4qffOU7W8jhZg4VQ7vKLmsUgFKgN54Q08KRuxh41lMy7UGr5U7ea8nVZQKN2+PSXAez
         Ik+7c+UQwiZJ0FxNnRmJS+f/yCvtlKSaijp3u3aYPVjL+cFJfHfP8LM+Wc1eUkjE+Ixx
         A7cOtsR1/FS470qvoWLvge1W4W+e0q2aE+J7wqKCQvAonu0CUgr4bMwfbtAS3Voy2xOB
         e/sMW6ggObVlGOlosPPMTo1zGXhOaeYdMwkLsP8eP1HdHEYQ8FcCiquTw9M8Scia+UQm
         9IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317139; x=1757921939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6Qgw00JLihNswGsKUrWXq3EQB6PCDyKUk5esdN3dkc=;
        b=L2wfA66O6cd3tG4QxqLLDW6x0z0DxRuDMjhsod0DreNbtV7XtcRSkUPHwWw0yfjQ9j
         TScH4YBVcMgXqyE3+6SFyijRoF9600xthmyNDpKl5alAspg63dJmvtEVC686KLju8u+p
         8/DgC6CrGpim1siRfx/ST0AVJdpmOoXbAYvY5Rd45cJs2VQpw50+ymQ644VAt2LQYUHu
         ZV3pewBX0V/7YR4NxOrNctCohQgZab7voCQTOFyDCqB5PZczWH6n4p3gB0WejBWeJuE4
         /UK6sfv4j4pfbegT/wTVrnUlG85nEWptL37UelKr8QJCuMoKgw/QXeyT3TEhrEH4ftda
         W+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXtPvJgVNkOCLg2rAUpKylOJWArbBjGGZEMd4wbXkp8AyPmnEJv2pI0+1gfQjUE9bq4+J7dzFuQs1h6@vger.kernel.org
X-Gm-Message-State: AOJu0YwT5jF/yRyl2H1ImAWvZm6orI9b8AiliFDd9UV6I8PFQv4JAC/l
	62qifSu7w3CtCFCgxVTBZ6OO5r8TsRYm5pySZJaP7T8K+UwSFL7R4YQ2DiCFl5FYk58=
X-Gm-Gg: ASbGnctdJPSWJN5oY1nQzfASvzIGzSBVxLh5yfAqh2wrpDfImMiH+U6g/mNcZ8EnJ6U
	LKdYcyWiqTc60xfjDp5eX1FhxvmOdxEQwcyggUkdy/q8Ea+5yHl2W4MH29wicTrwNJlArwpljNO
	IYu7BW7my3KU9sWjoMvJiQTm/YCYEMBOp+n7lVuwrKmUc73vTN4i43s9tSdRH2Kmzc3p0QoxeSk
	MObi3hmoEXoH6cwNQL7/HqfDKJGED3CEbia/WFYWL790nCn9n/9LN+jkH7igX9o39DQzaW07cmF
	cT0ShvA+Z50C+3mALla5l38bE4SWl/cbG5BGinAFJEgfuaNWvTffYSBa79Wt1ZA4KqK3PlHtZCT
	L6MTT4JRNqWZCDn4CX6mqKK1JqdVL/zTL8XxHkr36UnIT8w==
X-Google-Smtp-Source: AGHT+IE11TRP6jW/sA1IoRyIuD/EMwHLllVmU+DHqF0PMbyJk/g8CcFlOS/FaP1Ivex22BkhPP0yAA==
X-Received: by 2002:a05:600c:4e51:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45dde66c671mr59265535e9.12.1757317139282;
        Mon, 08 Sep 2025 00:38:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5cdc:d980:b6fb:1eb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e92a42asm429977665e9.20.2025.09.08.00.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:38:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: pisosr: Use devm_mutex_init()
Date: Mon,  8 Sep 2025 09:38:52 +0200
Message-ID: <175731712491.48218.6418145557482787417.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <01910ebdaba7d8d0cdc4ac60eb70da8e29cb85f1.1757251512.git.christophe.jaillet@wanadoo.fr>
References: <01910ebdaba7d8d0cdc4ac60eb70da8e29cb85f1.1757251512.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 07 Sep 2025 15:25:38 +0200, Christophe JAILLET wrote:
> Use devm_mutex_init() instead of hand-writing it.
> 
> This saves some LoC, improves readability and saves some space in the
> generated .o file.
> 
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    8431	   1808	    192	  10431	   28bf	drivers/gpio/gpio-pisosr.o
> 
> [...]

Applied, thanks!

[1/1] gpio: pisosr: Use devm_mutex_init()
      https://git.kernel.org/brgl/linux/c/474014cdec1758e1802082b94043189e198c58a4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

