Return-Path: <linux-gpio+bounces-10984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D99934F1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 19:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76AAF1F25F4D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 17:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6FA1DD87A;
	Mon,  7 Oct 2024 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aq8V/GRl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578BD1DD55D
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 17:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728321984; cv=none; b=TY4sqxuwtQQYFtgytSl9H6m4CZiLDDtmZ9amLCy4wNssANqFwunHsDVh9OFoJ4emISI3fOoWxExq8bx+P+CPmtNm9ckkcJMNWNnF3OoapA+FCPmIqLFTOXvmQ9S+A/4HmGmCO9VYLeZc9iLmUVQLDnzXEFbhzcCalOLysfrzo6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728321984; c=relaxed/simple;
	bh=pCCoHi+FSmdP+JsIamKw/AdhMR0e1YaCdPeHGA3r6A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mu7iqzanU0KrMFECpOrb79GI9VaDquM4GkhK8as7tw49WprfueZa0859n3fVcx+ACb1iH1vh4oGQHgCcf2JLsQ4V3FJ7cwAiTx40h6yeviw6K0YznwFWNz8bltsx8F+bLrc2g2TQachuCZ0Ht265sz6iJOD2SDg2PkfyLZdfIlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aq8V/GRl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53997328633so6015460e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728321980; x=1728926780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WlsFqoWgQcVSzxUESq0jNu0AYxuz/E7zW/qrfaTVXzo=;
        b=aq8V/GRlLSworw4+hJ4OWnXQxvjk3cgkyh190qvxNG2p0qHOiIks9T7rzEScVyFfRu
         fmN2n868dtdJQvKChpozv2K0XoojmubId/lZgUF47uFlKcxiBLqvdOYEB9JI/m4ZkmBH
         VmCMjhTE02yLg4IuNY4H7oVe2CLi1qJD/WBOywKV6rqf8iK3ZfrBoCJwrQVPokGJGqLh
         EJPTjSvsu8aZnHoLIuS7RwMRhGLmJCo54hPF/l9fEDOjglv/6jk2LWNelNIyz1FITlPW
         3aaPbnBv0BKrBpHAmWM/YiX34GSev5bOGmFQbGqaucZNBTCUGFhbrNrL0KDb2u5ZMwPb
         52Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728321980; x=1728926780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlsFqoWgQcVSzxUESq0jNu0AYxuz/E7zW/qrfaTVXzo=;
        b=Fd/PvxhmZAkn6hOPHO0QfVPtS8K4Vld7lyvYo7c1oFTNkX4ryB13fZ/RRmuH/W7OFz
         gjz1siJtvIfilErnUmc7nV5OcBf/T4H5/+dH4xExSzfSRTIjcV3J8oGOhmwMZ5X8PHVE
         3Z9yoQinCuCCp7a+qi7WimgzxGm1Fy495zbNoc1HYjfxW9B7qNAvQwVHgS4xtdY4Kh6u
         AOYrJu1wSgPN5qD6EVhmlCQpeXl7n+bjZblAUcQbRwNPYoylYaa+32eQ4mdlxb6uImVo
         spSYXAZK5aGKfdNLm+WFohgGA/zpZjUnaQ83GuOt6sOrQvuCIl0sedqRh0RwiDyzJXKc
         9HHA==
X-Forwarded-Encrypted: i=1; AJvYcCWMCKKYxevoUbyO7Is5QeEz2JTkFSk6kmErJ5cDu1LRb5cDR3NnRSiBMp1ztyaTM1g/WThwlxHqxoZz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxu1E1qFl0cALnetjv3oQvRolNN8QsfeHM7x9BXrIQ8dG+6bCS
	9ftQ095uDIkHkTws/s1ArquBvfPsJxtxHa+Y0lfbAUSYHv3Ut6iTxIfIGbRhRhM=
X-Google-Smtp-Source: AGHT+IFqkmB5EGBLDvkk9w/73LJ1moyAI2DINnegAoUXrSgjT1r9zBJuBEvu/G0C84vFxPAg3A5H/w==
X-Received: by 2002:a05:6512:159d:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-539ab87ddd9mr7298174e87.33.1728321980533;
        Mon, 07 Oct 2024 10:26:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec0f91sm907565e87.36.2024.10.07.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 10:26:19 -0700 (PDT)
Date: Mon, 7 Oct 2024 20:26:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Karl Chan <exxxxkc@getgoogleoff.me>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on
 arm32
Message-ID: <m5tfcqfr35dzeidxqtrxzk454itrlf3dt5u6mezouzievjzlx3@ymkl3qdf72ob>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <20241007163414.32458-5-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163414.32458-5-exxxxkc@getgoogleoff.me>

On Tue, Oct 08, 2024 at 12:34:13AM GMT, Karl Chan wrote:
> There are some ipq5018 based device's firmware only can able to boot
> arm32 but the pinctrl driver dont allow it to be compiled on
> arm32.Therefore this patch needed for those devices.

The same comment:


if there is another revision of the series for whatever reason,

s/this patch needed for those devices/allow GCC for IPQ5018 to be
selected when building ARM32 kernel/


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

