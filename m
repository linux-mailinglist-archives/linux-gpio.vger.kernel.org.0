Return-Path: <linux-gpio+bounces-4314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2587B83C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 08:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FDAF1C20D62
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 07:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF1B539E;
	Thu, 14 Mar 2024 07:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAeheVaZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E934DD27E
	for <linux-gpio@vger.kernel.org>; Thu, 14 Mar 2024 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710399867; cv=none; b=ToGK3nBK0khUFztrYXc1qErmBR71adn2nk866sc2wufM/6rC9iAHYjbtFyMFZ6ULK6vshew+6PPEMl5L+e+4m4q0x8K8k/P2160Zie0eLvN2wYJqmEgsSW39laA6J19oT2PSqJ89r5+VOJ5X307oPmOGHq/J2WPbvxC0LijLWjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710399867; c=relaxed/simple;
	bh=ESA+BAU7x6gm8T930yqItEQ7MXJmuXARJY+Dy9dipeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOExd5Qv5EQ+zHYllrXvoBPpHRChpxdu6aIfR6izPypMh5p/Hagg5WRng+rWOc4gV7CY5bKCjxxSYgI5V1AJXrY6qUKw5w3bVM8dXBNgHgkHXabZgtms2iM7WOkoaEGpiGI1RmUq1zt5hd61G6eYwqTPyNAu6cr/yMG5VnL00IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wAeheVaZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-413f76ff0daso56585e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Mar 2024 00:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710399864; x=1711004664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=guS8/Cyciijzh6TTeyIVTuVDEBzzzQx5jtXor9e0bWk=;
        b=wAeheVaZRfFm5c8Ue7jM3V7LComF8lwiFOD6+kRL4+T+9Zq8mnJj7w9OHpENDnH83E
         HaD5NcZ334fE1OwYxkhF4ld3mw+PV1b27ke+hZnquVKa01luY92kMUo5zVclpWma8VaG
         /Bi2xA7VzHAr8Do+5YFwNqi6qtRw25a5w0z5d8Ca8Gyp5z54hmyXHmmWQiQ2QX4o5PKe
         JgZu/3SoYXjeiejsjCm+uWMYRlyyQmb0QdMmXPK2R3FRGzv9OKXYlpuKemKdFJ1DG0op
         b5hdI08Byw4kNO65j67CfFGaUMNRmn+ewQhnM7uFn3+qonnL6ZgdYyJMoL4+iIKUJBFD
         0ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710399864; x=1711004664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guS8/Cyciijzh6TTeyIVTuVDEBzzzQx5jtXor9e0bWk=;
        b=YuDc5zjXINwtplx2kBKUJ3mDEAvq/tivsJsgR9cLAjYQDVLRrNRgl+SfysjWUiyClc
         QH65erdwIyIU0cUM9+30M3J6kCBkG7eI0gdHKyScYo0+jidX2/5bC9xttYJJeleKXY64
         H88bvGbH3ZVBJeTQQW4bumPX50PBLsi4vFlqIlVFIlvy+ihYDIE8au3KKwd/yCusl5lU
         0+mjjTSsUTYC2qfhg74bKX1T7pLLmXzt50Ll/RR8wqvwJDQ8gWegz+mjmk9a+QdZSApB
         0Z9gVuomo2hY1tocIHlSHw5uGnMqiQ9lDtpv/pPqpD7Ae+SaPpp1EltXAUbSTKlMURwl
         8/mg==
X-Forwarded-Encrypted: i=1; AJvYcCVfb17GzrRqJCY7yZ7vP/zsgGaj8iSMy5U+/STyN5xPz2KkrPYytTNlx2qPecn1zKPBvhT5csLm1o0QOS1Sl9SAHqSFueCWaz5cdg==
X-Gm-Message-State: AOJu0YyfKFfZaA60RRZDBwptqPAiNxgK8iI7NkbYtdoI73QQgdFr01Bx
	58ARAt+fzgEG0CiGeXstxIaWCWMn3tPJ39M70Sn3nWXhIxTguyOgraT/cPuKeq0=
X-Google-Smtp-Source: AGHT+IHujeMOrjOWKV3UzAfwlbNTOdDVlpE4Du2VK/oHCZTRFcL7kCbrTG3u3YZsCnhX8+4UA0nayw==
X-Received: by 2002:a05:600c:19c9:b0:413:1f65:ec19 with SMTP id u9-20020a05600c19c900b004131f65ec19mr647448wmq.37.1710399864190;
        Thu, 14 Mar 2024 00:04:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c468d00b004130fef5134sm4616393wmo.11.2024.03.14.00.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:04:23 -0700 (PDT)
Date: Thu, 14 Mar 2024 10:04:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/11] pinctrl: aw9523: number of cleanups
Message-ID: <18668ee1-7d0a-48cb-bef4-1d310b030837@moroto.mountain>
References: <20240313235422.180075-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313235422.180075-1-andy.shevchenko@gmail.com>

On Thu, Mar 14, 2024 at 01:52:03AM +0200, Andy Shevchenko wrote:
> Just noticed that the newly introduced driver has some leftovers or unneeded
> customisation. Hence this series. It may (or may not :-) be sent as an update
> after v6.9-rc1 for v6.9 cycle, but TBH there is nothing functional critical.
> 

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


