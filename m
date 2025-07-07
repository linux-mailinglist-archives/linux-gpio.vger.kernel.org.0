Return-Path: <linux-gpio+bounces-22844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B5AFAD85
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F05F77A83F0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9D8289E2D;
	Mon,  7 Jul 2025 07:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0eU2vdzO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3121B0F1E
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874380; cv=none; b=CzzfxqjjXAiEFOrMfdSgV1/rft0kf467H5RMDs4zPa+K047bg7F79/o9FYu0MW3mTu224G8hj+d10DeNbIIJA8u560oaGZaHYyI/n13+A/eQzX3STYqFeI2bf193BDfjTAaxvee/4J+Q2jkCcVE19FYzHmnwchLsAFmEaDi/96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874380; c=relaxed/simple;
	bh=o64n8HoG1i9o095L4gEk8V0ocOswj4uaUVhng4InqrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yba6mAXdd30dsNKUgVu7eNlrs2M8XJwK52OkUEEUl8E65Tsio9ady96kVXFx1qTmuIgdfYad16VH9k82J1WfVMkIcV9tLT7zjCRziYmj7l/dq1z4EjFw1amkRCQLcMAorp4XqjhztxBT/yjVNAE4S5IXDuV7KhHO4ZPl2g9gUM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0eU2vdzO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45310223677so17290355e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874378; x=1752479178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZ+2wJfPgdP5WPc++dQKTvMgEl9z5w1HH5OLhshcQSs=;
        b=0eU2vdzOQ0Wl2S9F2s6jEqFb/ol7G3W02l7CyhpQmr8Yd/3wSstVJhMCQOrH13aJZz
         ZV3x5nTD50082GLbcHPJnx0weq71Z0kO4tWqw88JI/3Nkn+blGVpRfreNz5qOEAP1sIO
         mbtLV7wxinbCETjzY4i/4gsrvY3iezJlN+pe/xDmhRPc2oTiMVRMua2p1QCGyI15irNh
         BsPgwrOu0BipmGOBR7jfFUf5wA1+WGmegWReGStO22Sk3nXE+cVyC/Ig+AsOBlaCTgQJ
         gZ+XNxaL16WgBcsThoYlD8wkH94rr5JpuIIHw21u6f/oPPhoNweIJ/+DMjQN9K+z7TpD
         q37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874378; x=1752479178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZ+2wJfPgdP5WPc++dQKTvMgEl9z5w1HH5OLhshcQSs=;
        b=dpmhNpeooQEQvQXDBR9CHt8mMbFinih31AvJVHopIR7lZySJZ5dLMhtbv2IjTS4HI9
         zTm6HORPlkqucfu33BFDEPpHq6uR4tNvT1TeR6Yuc+RuMorP2U40Zq+JsYPqzzEeMElk
         5uTOhXglFs0JZMQsi3ZZXLvytHAzVIrKkhqYMPB/4rFp5FAsa7AREcvtNvKad2xEeOKi
         EncHMvUjlgmPoOPPhb3Cg766yqVbHvOIUYQ6vwKIZxIqsYGYxZHYAx6JlXntw5JUdVCC
         MiXwrplDTJ7lucnglxyjbIM+G0csBhaH77XSlkcAjWEjp4pKg7DulJfVajaoryFRagbk
         d66w==
X-Forwarded-Encrypted: i=1; AJvYcCUeejSxnCy7ahZabiJihSR8JXqowsU6v5ycOC8lPeaW4hxql8HfImOE+/aieUW6g5OX5uAfAozLwK5T@vger.kernel.org
X-Gm-Message-State: AOJu0YxwGOYBnMQOSvadoiqL4N/jfQ2jKQ46kTJCqLvrXoaOgC4RsAEs
	VzJ4VTEqPFxXqXQA5p1IhhJyE5+6/1nX950knffMuIk3VdORgz6nzgsrd7GlIhX2tiI=
X-Gm-Gg: ASbGncsw/a+wTxMvB6fl9xOArOgr/Frv99U/OiCb3gAR8CXIMzHAhYZhzDGI1ZT/U4O
	GOvvaYOIN35sxQWrHUxxI/I8eKqjXx6WcRo+P+ciyorg8jHxGC9nrAAOEwR7VYMnZ2FrxOUmNoO
	556j/Vm89FFtMvFrAbI4U9oPXl86DrcLYg6sBfHvdmKGvZbxC3+1u+oUf4AbVBl390ya7S8KNHp
	9BXJwwDhCZ6ekl2DBasecji9LZ9taC2mzmVOueEQCE3pgwKTuYSjbGfu9NCSWtGkL0kJ2Y5OhSt
	pdC1mf7+oGfHiSKLZ13rTfIriUydmSUQBptpepy3SWDWNShRX3XznKgiSXruSOw=
X-Google-Smtp-Source: AGHT+IGTaLLGKNXhhZgLe2AjuiYxPCN/bEhBq84ie1Igf5JBLfyMw4WewC+BXOddVp59zT0kTEeIWg==
X-Received: by 2002:a05:600c:1c21:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-454b4eb8326mr94737935e9.25.1751874377684;
        Mon, 07 Jul 2025 00:46:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8fcsm105474075e9.7.2025.07.07.00.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:46:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Robert Richter <rric@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Mon,  7 Jul 2025 09:46:15 +0200
Message-ID: <175187437017.12064.15350480191939974588.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
References: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 02 Jul 2025 11:14:01 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: tegra186: don't call the set() callback directly
        https://git.kernel.org/brgl/linux/c/47c228d9fc9fe7e3b6f0e7f88f40779f0bb96469
[02/12] gpio: tegra186: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/871e1aee00298fccbda04eacd9e3bb5f46f446b9
[03/12] gpio: tegra: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/8a81d128e1377a7662d0913bc5013eb8a90c3e33
[04/12] gpio: thunderx: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ecf0c0278f4799f6af245131f02dbb8587f87d29
[05/12] gpio: timberdale: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/dd66f8862f8418d989a8e342ff7af26bf4a0ae8f
[06/12] gpio: tpic2810: remove unneeded callbacks
        https://git.kernel.org/brgl/linux/c/00c337cc68c34302fc0af2d9ac47be5c638d4a78
[07/12] gpio: tpic2810: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/4ffdd9d8a37eaf4e25855e1038b9e1091401c252
[08/12] gpio: tps65086: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/2a5be7a80b3b1036fba5dae13dd55c97fb7eabaa
[09/12] gpio: tps65218: remove unneeded callbacks
        https://git.kernel.org/brgl/linux/c/913cbf8a0d4b0554d66cdc608b231cdf2401a496
[10/12] gpio: tps65218: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/4ca81a1f3a46603986cbdd11348433b0746ce483
[11/12] gpio: tps65219: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/fc0e4091afa9b6c02f1cc2ddec75b248c25cefe6
[12/12] gpio: tps6586x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e3ec7ad5ab139ad9e0ed8931ba562f95698c3b2f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

