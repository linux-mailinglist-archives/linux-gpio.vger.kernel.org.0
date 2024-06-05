Return-Path: <linux-gpio+bounces-7150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4668FC477
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 09:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85632B2B4E6
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 07:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2480D1922EC;
	Wed,  5 Jun 2024 07:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YD55qfcj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9311922CA
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717572177; cv=none; b=mcx77tr9b7yuPOGewwV2G23xNQhTKQObKvrYcWJmk1Ee56dHknhy5vWlv6WBaea2OiXnpgr8oZRjOx3flhUKuTcFpIOVFSxQf0e1aq8jerxGKaVPiFjoQgDVhP+4bjKfyQ20Buj3hMscz3NFnQprypxAOv+D2t+VTtbqNrtoKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717572177; c=relaxed/simple;
	bh=R4YKIM6OKd1WIlOGsM6YjhBav9nZ9U9MhpDx2XiXALo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9ZZfYUAnfQs6jG8+PYNBd6aAUnYUhTziM19nbO9pbJYH2GCU+setlm37YezLG/GviHKc1e27JQUyP/phzRuG6UocHjg6Yz1QINK4uxfly2SqW0RkQs1s1YhFBInqDeGNfDMvxX6nCE71wZdqMqiJcz47IBctkmM+PSnHTbILDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YD55qfcj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b8b638437so2160867e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717572174; x=1718176974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqnZdFgvboe7tX2UKgOGW0Pa1N7zuJuJPg9c9wyxQMg=;
        b=YD55qfcjDfOPWxSNsWWoCc7hMBzAWe+akRiI8lzSH8z/iGpBGcYp0JFqNsj3je+ItV
         P1V6WizYoA/H0X5EsVo03D2uWwuj3nt648KNBkko/8+xZIHTi8NF35GhdFEJgMBHAfwA
         0CrWixDkKgPJjXRXdHIMPsc90/VuMNk7X8HX+5nSzmTUidkjHs91TPIXzvSIjxkU+w31
         EqRBBlF6p50NGZAYwFW9USrK5daTHT+T9/NihUkPrJ0F03W5KiGZMVQJXz9beozjj7Bz
         V5QfTpO/kxaiEqr04mcE7etRSEon+zfE4F+aVLK6p70w5phZf57JmDX41BEjFlSOLlqh
         pDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717572174; x=1718176974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqnZdFgvboe7tX2UKgOGW0Pa1N7zuJuJPg9c9wyxQMg=;
        b=U86x0YXzE/EcEXiYaye8ToqVWAQkfFzmFXzWJF4UaXorLFHLZDtNPVnWhC8Y7axT0c
         q9kU2Z9BWtsuw5k9Vzd/8l9LnrmwqZp3MU/QPThp+anzC1V4xRM+QvDq4imhd2/nnm4l
         K5ZcdqkUYn2IwcLZ1KBK94lcX3M/gpGHsyTou5juZUBAOuBnKbrx2G7tZ4B30LWBF62F
         x28XjSqeiQuDK5u3wonxWR7e6LE2IQfRDwSIGimfctEk7NjILxSaeqU/yLA4UAdi2Rwa
         fCM73CEsIHjt8xoWjPLoEjUwOKW7moWvDMWQV5dAv/WEja2SNFhfMldkLAqtC7uVM84r
         pB6g==
X-Forwarded-Encrypted: i=1; AJvYcCVJt6H/fsl2KNnNq7raoIJYGkYkb2gXYhgklo+muUalMmktfiT0z9zOTlNysAwyYsi/KSHPZFunTQxPw5TSBzJzsyIKjD9wjw8/PQ==
X-Gm-Message-State: AOJu0Yys2icWgxfpScDhZO6KWUaMXRKwF+K+DCCZaJ3OYiY3pCcQHilu
	loqkJy4kW5xTRTQQM8ZZJk6IhBFLrR7MtfxJEo9dak17Nc8TDmSiZmyRNnQA6/w=
X-Google-Smtp-Source: AGHT+IGrEUTIRlHebCjYcSxaWnRyULJcyEIEq/vcwbc8wOASvTCW7s5vwhOA3Z/T5Q0VVe7HxptVtw==
X-Received: by 2002:a05:6512:2308:b0:52b:83d5:34 with SMTP id 2adb3069b0e04-52bab2843eemr1239519e87.0.1717572173579;
        Wed, 05 Jun 2024 00:22:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68519892c8sm695071366b.65.2024.06.05.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:22:53 -0700 (PDT)
Date: Wed, 5 Jun 2024 10:22:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jianqun Xu <jay.xu@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: rockchip: add rk3308b SoC support
Message-ID: <b5d2d914-0c2b-4cd1-b894-f894a93a54f9@moroto.mountain>
References: <20240604141020.21725-1-dmt.yashin@gmail.com>
 <20240604141020.21725-3-dmt.yashin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604141020.21725-3-dmt.yashin@gmail.com>

On Tue, Jun 04, 2024 at 07:10:20PM +0500, Dmitry Yashin wrote:
> Add pinctrl support for rk3308b. This pin controller much the same as
> rk3308's, but with additional iomux routes and 3bit iomuxes selected
> via gpio##_sel_src_ctrl registers. Set them up in the function
> rk3308b_soc_sel_src_init to use new 3bit iomuxes over some 2bit old
> ones and update iomux_recalced and iomux_routes for the new SoC's.
> 
> Fixes: 1f3e25a06883 ("pinctrl: rockchip: fix RK3308 pinmux bits")

Why does this one have a Fixes tag?  Isn't this new hardware support?
Possibly patch 1/2 was not actually a fix but just preparation for this
patch?

regards,
dan carpenter

> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


