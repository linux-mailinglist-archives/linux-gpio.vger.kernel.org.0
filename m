Return-Path: <linux-gpio+bounces-13423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0F9E0995
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 18:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87D15B29D5A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 15:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F03A13AD29;
	Mon,  2 Dec 2024 15:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6vuUL/d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B641137C37
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154500; cv=none; b=k1u/BsxE0YlPY/DdX9A3geNUkcWSwBzz4fbt6xUU3IEnfuZ2NYCBXGgh7d7+Bslnb5fIWh1O6cNw69lwmIQeaGKkECwkkRkksF3df8rBRmYNlAq4V6pDeY6LU9l9XdMmwgAxJjvFIH2rRvisFuFcMENdS05PxW12pBcsKvxeBHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154500; c=relaxed/simple;
	bh=uHjedfVRrZ+e3sFGTNQ46N0aIuL9DX4TX/57voliHDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiVC7owfzu34VIvBdxRPFAKUDQqlqFXfguqJU+yiTn0V1Scpd0EnIU1/ci65UfSHyhWjABqyBShrugAU3spHo+AV7BoKawjL2/S7L1D2phYsYoiCR7Kz+NqhXg6npz4VJK6kgAq8SdF9OgnJXWhFIpDziknUdwk+TaiuAsXzkWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6vuUL/d; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de92be287so6349127e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733154496; x=1733759296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xfHRG0ckbabpB5WkAOGLFC/tsNXMkX3A9rmcYDbuN4Y=;
        b=F6vuUL/dRzR82uF/XRVcmZTG8/Y4/wgxNwdZHxTWoxaPrEB/JZ5NMlnZqUdAjguM5F
         ohGJYa+nj0V6bBpWDRK8oCNmQvNxbMO0E83UPzy8W3jIm07MSd2Y2GHjjyGcrRSwmVLz
         d/GiO/N99sVuezwZ1NUljKwtaBCu+dB/SRoQyULOSEtSS4nh8JTtA6HLkZ4b6fjj3yJi
         P5qPiFNiHi22Jijmjhh7FKABnHUdk9AxF0+pSAJAbYJFv4HO3Q5/jcpssYErye59ipuK
         j5GWsnEJa9aqAy/r+N1BQ3y3Zakk2JqzN5NPScJyF/LPrwvoP1sFLYq16g9f1jIGMDFL
         xKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154496; x=1733759296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfHRG0ckbabpB5WkAOGLFC/tsNXMkX3A9rmcYDbuN4Y=;
        b=SjwmYWD+k+8LdbceN+yx34Sg6ubuPlL+8mjfwrO8zy3/p+l6vxrvwkOkvUuLaM5ip0
         /gsDX6C0iQtYOOn9/p6ZjjuzTWK8x5q7j0whBjq/DSzGPWJz+UoDMAkbGrnfvxHXvJzT
         ayF27vhEkXJGrkDIKkDuBrTa/y4Jz0ZVlm/TqTaPfuf2skHFsYjukEBrANnxvn7uPvcR
         +EPzSdvVdEr2n6htmVKxOu02S1AUH1A1mBUV7jiU/D0TfdYAcGDj+rZ3Nt2tfE1+cjtJ
         mw+GE8WzJ9IUIl3MvkaRZ+17eFNHrPWZkYUhg6jhIVwNOI7zYThZDdDZHXJws5OSfkwS
         ngpw==
X-Forwarded-Encrypted: i=1; AJvYcCVaD6FgHVFGYPwhoTHkjkgTDAS4Bib8wlQBwVwZybWaPdL8mihPmEolPdBcjK4GFAcYgJn6kfMteY+w@vger.kernel.org
X-Gm-Message-State: AOJu0Ywifuuce9jjnBhh/BheQZt3vJV3ZwZRoYqBv+TMDLLE4hJRvBUY
	cX4kqjG8OtHbqigUEXbrBHZrjJdbpj2Z3qQrVjjyKWmt63chjBtj/Lu6QFCtEAQ=
X-Gm-Gg: ASbGnctbm69wtyMiaKzDsRM/azab/4J3cnxBVABVrYYQNzt0h3ttHuVwVrnLizbVs5O
	LaLz7eXyx6BJuBSYvsrTpgG/D2vO07PWvd/TUrbzXcYKtv0Xc/zaRAcOqAKLmZwgzliXNGvK1vD
	9G0Ig31LoPjYieSkL5NmHen+Sh4g8FkDjCh0Dh588lmcVFE/MvKUecI59sUuNLYstp1q+Ystm83
	c85yQia5Hd0YttW6/hv17+q6o6cMhOKZZ19Ok0lFcGI+khEOSihsk/nTgns9A1NKse2iVg6RQjb
	ETS9WtYiFDMziF/EnV0jZl01/B9VOA==
X-Google-Smtp-Source: AGHT+IG0Q5k/W3ed0OQwMlkM6qlSogEM4cPmSjYiJhbwpudSDr/7EC5mlTOxyGWNLuXKmiBWsxS+wQ==
X-Received: by 2002:a05:6512:3b0d:b0:53d:ed95:9bfa with SMTP id 2adb3069b0e04-53df00a96d2mr17148818e87.7.1733154496365;
        Mon, 02 Dec 2024 07:48:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649f638sm1511742e87.239.2024.12.02.07.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:48:15 -0800 (PST)
Date: Mon, 2 Dec 2024 17:48:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on
 QCS615
Message-ID: <gnrdym5o345fsbtxmfis6ykep7mzvhkxxnizlj5xplrsaaijjq@5465y2oamqoh>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <b310587f-c6c3-41dd-83bf-6affbcc65730@kernel.org>
 <22600892-3b0d-4b0f-9c46-e74241960dda@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22600892-3b0d-4b0f-9c46-e74241960dda@quicinc.com>

On Mon, Dec 02, 2024 at 06:31:44PM +0800, Xiangxu Yin wrote:
> 
> 
> On 11/29/2024 4:18 PM, Krzysztof Kozlowski wrote:
> > On 29/11/2024 08:57, Xiangxu Yin wrote:
> >> +static int qmp_usbc_com_init(struct phy *phy)
> >>  {
> >>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> >> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> >> -	void __iomem *pcs = qmp->pcs;
> >> +	int num_vregs;
> >>  	u32 val = 0;
> >>  	int ret;
> >> +	unsigned int reg_pwr_dn;
> >>  
> >> -	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> >> +	if (qmp->type == QMP_PHY_USBC_USB) {
> > 
> > 
> > Sorry, all this code is unreviewable. Organize your changes in logical,
> > reviewable chunks.
> > 
> Will create new patch list and seperate patchsets.

Please respond to the comment regarding the single PHY vs multiple PHYs
first.

> >> +		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
> >> +
> >> +		num_vregs = cfg->num_vregs;
> >> +		reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
> >> +	} else {
> > 

-- 
With best wishes
Dmitry

