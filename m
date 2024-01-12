Return-Path: <linux-gpio+bounces-2160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F382BFC0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 13:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BCB41C238B8
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 12:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824736A34F;
	Fri, 12 Jan 2024 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ghKQQZmo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CC12AEEC
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-336990fb8fbso5053211f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 04:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705062490; x=1705667290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7yL9/thET/fft18cDCrypkB/pvHiV4PG3Ki0Ul2Kq+U=;
        b=ghKQQZmohHe1tnKiJwZV7A80es/Bsd3N/JvHOKzpYKvcImWmvKQCXQ3bIvMJgoZU5y
         f6lCR6zG2DJzjPRz9hpyhViEwVdS0t4Y/lJoA4/RI1NiM8So0qusQ6DY0C19ARz/GMsM
         r3y1RyMrgqpOdItHMMl02LmMBDXb6e9+dogn32jLezYk+JnXkq9Pl4tVk8qQGa+ljTI5
         87yrRV/WCm6gaCjgFG93RrlLV38wKuaoS51aqaRa1/FRzlFgbKstbqb+RtdO/1wpGAkk
         6q4t6uh7qwQt/dK6t9G5PrmD0A+i+jVcTTasK01u8btDulJ/yn5P+R79aoXrNu3MqGoG
         sXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705062490; x=1705667290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yL9/thET/fft18cDCrypkB/pvHiV4PG3Ki0Ul2Kq+U=;
        b=PW+YAxCUXOF5Z+hgC4wy1Hd38OACQKhaIxvNLzVKTZDwfc1n+L5T2QLGzG6j9jmAUB
         nQIHC9mrYeQAfFlDTYAHOwwO6Bk5aJYVKuV593Xzi+BMt5Ks/3/l5GO559tlkbeJXG4h
         dSgI1vNAdWySMHR7d98Xr5jeUnxB+fxdDj99MZRjGYstHm41GXBtanCBIWA18pmjDuOg
         YeSTyrUgK8v6bNpVeXthIBRUgUAJO8p7E+ZNC9ZE1D50SRUbPaSTppOkfrqoA3Oc0rs6
         UyDLqAPio4XGZW6tP0RQY2rP2Ibbq/Y9ZGdPwvTrwJqZjcvoKEGsAPsSmMalRtNsFOBV
         Zb4Q==
X-Gm-Message-State: AOJu0YxiDf6YOzxa7eVt5xaHo2hJzawXWEvOFuwpCMCJibOZ/Ft4ekiJ
	yJlAabxfErjYfPsmxDLG95uF5YM2l52zaw==
X-Google-Smtp-Source: AGHT+IHMIEOCXQxV+1EHvCyQ9fDGlwpibTa8TnzalEeqFp3EIqmifzHHvMUpyznUlAwtZYz4HMrKsA==
X-Received: by 2002:a05:600c:21a:b0:40d:8bc4:61dc with SMTP id 26-20020a05600c021a00b0040d8bc461dcmr728413wmi.74.1705062490117;
        Fri, 12 Jan 2024 04:28:10 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b0040e541ddcb1sm5652919wms.33.2024.01.12.04.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 04:28:09 -0800 (PST)
Date: Fri, 12 Jan 2024 15:28:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix double unlock in
 rzg2l_dt_subnode_to_map()
Message-ID: <c0f0de0a-140b-48bd-8dde-85c916c32eee@moroto.mountain>
References: <f8c3a3a0-7c48-4e40-8af0-ed4e9d9b049f@moroto.mountain>
 <185128ab-f229-4b40-91cd-ebdc138e11ac@tuxon.dev>
 <300d204b-8151-45f3-9977-7ceb3a5c5eb0@moroto.mountain>
 <98067d77-bfde-45a8-af6b-9eaf4bcc3839@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98067d77-bfde-45a8-af6b-9eaf4bcc3839@tuxon.dev>

On Fri, Jan 12, 2024 at 02:05:17PM +0200, claudiu beznea wrote:
> 
> Ok, I'll prepare a patch as I already tested it on my side on multiple
> platforms.

Awesome.  Thanks!

regards,
dan carpenter


