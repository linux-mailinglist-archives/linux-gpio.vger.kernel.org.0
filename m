Return-Path: <linux-gpio+bounces-13303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0CF9DA064
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 02:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03FC4284774
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 01:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B046A156CF;
	Wed, 27 Nov 2024 01:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG7p5v0D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E03ED517;
	Wed, 27 Nov 2024 01:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732671413; cv=none; b=L1Or3r+1kpY677CNsf/GsD4X0unwQM76Uje2rplb0RpQMhXs7FEXqv907uUqfFrTR29Dmo+G5IqNZx76vwkSghhlKQo3cQ9sZXBMO++YZ/BN2ZXduoIL362fPseS3M4a+BP3hzJ0jkhpN8gCbbr08kBTwQCf5zJLjZ2pQ9eonK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732671413; c=relaxed/simple;
	bh=KoJWINl7wcK/irWT94Gpv91Utfe983Ywl60ocSc2p0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rb514QZKNeks8/xIZFMtsqxpGc21l9rN9vyWtX6ZbwcL8i+Vg4hT6M4dMGWV3pNKQpRpbW1ypJkddQbTlihUEkwA7B9OfUfqAO3d7nsdKXGAZFfu51R29tfeePfoBkU8ZGYnMFUVAHBpgTT1ijR+0vGkMfkavGObeI6/HGFqu3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG7p5v0D; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-724f383c5bfso3184630b3a.1;
        Tue, 26 Nov 2024 17:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732671411; x=1733276211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/DAAOo/BfHGFLYsnsJkmsGGn3x3hbk9HtvuhKuPcdNk=;
        b=QG7p5v0DPNaOLeWvubtk0QlGXsoClQ33YMyf+Qj+F3+tBlZKIrooDg9lfuyY+wdIey
         cUpT388bYrkY+Nbq0nCzxycifeGVoQhm34AFjQtqW2n4qfxPlXhE9up8NP/XcERaPKk4
         zDkOAz+RGddwf8lflaxeGnrPD0a1aNPNKY3KSN7/SlyakF/sfaOTDwKoFGBDMzDKNEXB
         8ADtl4vghgU8WJDZgz4tlMkHH0dNVy9dwajAn+qT+rT6FW2DUek8UVojzvDFI1/O6Crl
         FgCVpqX4cf+TqNJw95CSzhRfGvGWJ2bPVRVkJ+XqPYPhl/YdWqC4rUqNMZVJUK7Pejrt
         FYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732671411; x=1733276211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DAAOo/BfHGFLYsnsJkmsGGn3x3hbk9HtvuhKuPcdNk=;
        b=EQAB+AZg4/QGSldSZ+ERsFEQuVdFeJ2EZBo0EGN476nPEL09kQfHFtI7eTAcXjNdNI
         LS6VfnYc8yyOPnnbtzpP9H7xxiLmyeYb1mIJKjg+u+vlIiMRjFqufuJd8ucl+WE36JV7
         dtGTTpUdFV+3C5wbTGTBi2TPa0XHtpPnJ8IDmNQWr9q9oVfDeK2HThsCC/tbdN1vU5Q5
         t7kuI+/wU/+oPE3GZLMM5Dk7tJIrrStpUUpWtn5CBAxVjv3DGjuBe/3hJi1wBwyiCp45
         e2G9FEyiQjzSpLN58+NkhtnFYmMwC3++FQQZ5p/vB3Bj9Htud7IS9P8Dp63crYPqL4RK
         rx+w==
X-Forwarded-Encrypted: i=1; AJvYcCVDKwlStVd+QbXqUFUjObNWUyhl1EJgTwLcxtVf+x4D9SGyfo1iR04uBL/lbGF2UZzsqtARA/0J2vNkKb8W@vger.kernel.org, AJvYcCVsfj6AVOiByFnONhcf4OcJMOGXHsJDsg6imeZrFNW0JaYvDDchQDzeeYuPMB9SCQKl1oSGTcvCgCUtPEY=@vger.kernel.org, AJvYcCVwVQ6xXc4Gj/eXbhOS5rHpqnYR9qF2lsKIbTgYKw0fsFkqLo7N2XtCd8cHJjlbzHfhxHR2VQl/NPVS@vger.kernel.org, AJvYcCWx82qfSerO4DVmUjfqhH41/4PDlCayA0bFYqBdX0qAGsmHur8StCzL/xvY3uR0+RpNfQ36LKJSL86Wdiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VX6bm82r39uCM3MaXh9XkCdDr7wdz31C78KgnFaqmEpIK2sA
	1ifiqg8JaXsu7GKhkATY+3lubQKKwkj3lTYCquUA7Fn9DAUoLhpV
X-Gm-Gg: ASbGncuA5Ga9VEUXc/eFg9+5Za7OtjELCuI+24MCa6uq2SQDdf/AEjEwfsD3f9UXreC
	wIzams9IV4ArSo18mRjxagZraLej/8GTR5l0nm1BADgviNJp0CljeqAfUvoaY82PObRF5eQ/ong
	SAO3hsMt6gQxeL5zUbjfnosdJehSpOVa8r4u6HJBnFRgoEXSG6EECIKu9Jmhh2qH7VB/aHBgRqw
	k7zQ0zJYIC8EsbDC+wJpWDMzo2g+KiYI6z7low2ccAvNEG936o=
X-Google-Smtp-Source: AGHT+IEK/ok24a/4v8DvDdIvc005FH0kaHrKEQDVtZqZKKAHEjDOuddEyrtJq70zY+dYL31HJAhd+g==
X-Received: by 2002:a05:6a00:2da2:b0:71e:7674:4cf6 with SMTP id d2e1a72fcca58-7253002489amr2740514b3a.8.1732671411310;
        Tue, 26 Nov 2024 17:36:51 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc218527sm8111085a12.38.2024.11.26.17.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 17:36:50 -0800 (PST)
Date: Tue, 26 Nov 2024 17:36:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 5/6] input: sparse-keymap: use devm_kmemdup_array()
Message-ID: <Z0Z3sBZsHz14ceiW@google.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <20241126172240.6044-6-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126172240.6044-6-raag.jadav@intel.com>

On Tue, Nov 26, 2024 at 10:52:39PM +0530, Raag Jadav wrote:
> Convert to use devm_kmemdup_array() which is more robust.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/sparse-keymap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/sparse-keymap.c b/drivers/input/sparse-keymap.c
> index 25bf8be6e711..5ec3b9ebcac5 100644
> --- a/drivers/input/sparse-keymap.c
> +++ b/drivers/input/sparse-keymap.c
> @@ -176,8 +176,7 @@ int sparse_keymap_setup(struct input_dev *dev,
>  	for (e = keymap; e->type != KE_END; e++)
>  		map_size++;
>  
> -	map = devm_kmemdup(&dev->dev, keymap, map_size * sizeof(*map),
> -			   GFP_KERNEL);
> +	map = devm_kmemdup_array(&dev->dev, keymap, map_size, sizeof(*map), GFP_KERNEL);
>  	if (!map)
>  		return -ENOMEM;
>  
> -- 
> 2.35.3
> 

-- 
Dmitry

