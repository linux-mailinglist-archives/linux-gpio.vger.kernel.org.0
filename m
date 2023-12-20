Return-Path: <linux-gpio+bounces-1696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9579819AE7
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 09:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E340281E9A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 08:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1378F1CAB3;
	Wed, 20 Dec 2023 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OYPftctD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699961C694
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d05ebe642so2694275e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 00:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703062297; x=1703667097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtfgLv97mV5DO9TnNkLsn4oa9MmDYWceuLZDcW6WRCs=;
        b=OYPftctDOd0EGGXIzed/QcvvskiQd9DJ7HpbVsUudecxo67KNuKfqwAJIVl0c/eXvV
         sekrVnWPA2zwJ2fBWej099X777rzYG+bU62078RoQG7uOI9BYSuIb7kGqNYGp49EOGkv
         49GzeBk861GBRNPq6UytDZoj9ugNYmIJXTeJUim5r3InE6W/56tSOu2y/erfIN75lIjT
         8cDslRARDNOCOBaoWsGRA/7pdiht8QGtYSdK6y8riI84uts7QGx9sUSmNj9h9qEFCIQf
         c0EvR79n7agl26lzl9HVPuiQPoRVeSw3dKJqhT/HoKaD4zj6TuzPYfldkBhsDd73ZBed
         1aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062297; x=1703667097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtfgLv97mV5DO9TnNkLsn4oa9MmDYWceuLZDcW6WRCs=;
        b=b92Yyg5/HqRnaSqCCYxrmR8QMRy/xSSLtiX6zRlpH3eTQjQrNJSZusjVnfU8EeexCp
         XCZmMs4h2kPyOwMLPAqria3tl19KEDZ/ddg+N7bUoGSaycDFRvYY7+oWExHi/Snf0NBJ
         XZOSartJc2kgnHAoAONkJvfcmJyaYTaKaF2VVXG1CETPzBC15NvSe7lKhqM/BZurV2tV
         0R7b++skbaSBZb1iXmnUEC/Npie7jn8NXDr+zLzuUlP99NQuao6kGH3RqRdKLb80nhmJ
         RDwwo3ZEId3s3MIKYOSxdR+hUxi6quzLPB4UyRJo+7Bat66R7yTPc8IX/on2dkQZRhKT
         E4mA==
X-Gm-Message-State: AOJu0YzTiAIXdISAOPwrgcbkHKR+QB/OTkopxD9BtIUUfrU9EyLCaSk8
	h3IZYD7B8WE0muWVRmj/GZiBmkT/aZrTD2O93PA=
X-Google-Smtp-Source: AGHT+IHevkVtzLWY4Thk0wPFWCO8kIPI/j01K6/wMrTuOTxuF3jI+CG+Vou8zBvdiOuvY1k7+xUQ5g==
X-Received: by 2002:a05:600c:3590:b0:40d:2dbe:b25e with SMTP id p16-20020a05600c359000b0040d2dbeb25emr882142wmq.61.1703062297022;
        Wed, 20 Dec 2023 00:51:37 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id bl40-20020adfe268000000b003365fcc1846sm10866811wrb.52.2023.12.20.00.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:51:36 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pratyush Yadav <pratyush@kernel.org>,
	mwalle@kernel.org
Subject: Re: [PATCH] MAINTAINERS: change my mail to the kernel.org one
Date: Wed, 20 Dec 2023 10:51:30 +0200
Message-Id: <170306224472.10641.8697108168767750915.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219091218.2846297-1-michael@walle.cc>
References: <20231219091218.2846297-1-michael@walle.cc>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=431; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=tloYJ/VxN2gy2w43xs8TGDo0bshxdXBahz4hd3feM40=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlgqsQ137AdkHk/hreamHCQIRz1/ZJIE1RSSAq8 ZKniR8j3WiJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZYKrEAAKCRBLVU9HpY0U 6VXMB/958O9O3xvLgiQGRIvFrYToubfyV8srZ5OU4HBYFsKeamX2rCBm0HAEZjIOArE5pDfJ4q1 toVSQbbMfrcXYPgllQg609ri55F0pMcHnwO4O3p7Ved4g4i11kcpKEEVHbImVIEITVAaxnFUo4g NkGUzd+V09d7LyRwUMYsWOkVm8pNk4JFEZhK8rbf5FiPB6G4lZqWnaOx4mmxBuWfwAGLR5OSPdc mF867HobDAIRw9BvGEJLEhpBa0hHfhN5tDN+J5a8aWrTyob+5dtit8O1Db1TheNn53hL0P+m9l+ ScCqckP0L3eEtjWClWpTgoJj1jyFmRluJk4pBTi4ujOH7ths
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit

On Tue, 19 Dec 2023 10:12:18 +0100, Michael Walle wrote:
> As I'm doing more and more work professionally, move away from my
> private mail address.
> 
> 

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] MAINTAINERS: change my mail to the kernel.org one
      https://git.kernel.org/mtd/c/3c0e1dfa703c

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

