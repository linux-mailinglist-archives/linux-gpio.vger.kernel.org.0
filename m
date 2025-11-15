Return-Path: <linux-gpio+bounces-28536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E2AC60A8C
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 20:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 797863B8ECA
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 19:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673D9308F23;
	Sat, 15 Nov 2025 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNVf+g02"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776A7155326
	for <linux-gpio@vger.kernel.org>; Sat, 15 Nov 2025 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763236503; cv=none; b=RT40WplTTxAzWwzNPRUAH8qHogSDpYUY49ng1ipWp9077NmkMgvZPFGnjcB9gE+ElIlKTUj9IHzhXAvSQFPIO7QZLgpLmwW2z9ETVj3Af/x6HKhyuxKMlrVoGvKcRY57/4A6mFxfJNMnnKkT5+mKZyMaojb1Oe/zekLJL57cQi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763236503; c=relaxed/simple;
	bh=Wiwp1Q+OvYMcsGdBWtQcyoDwE7jV4tPDZZbsA8/uaMY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urbJWuP5rhUQDGsxkTFkAomdbg0EvCtZiosxNHmvuzoLiH24L35v+mU7eFO9AJvubcnsiypwCEUMdN1AaG/b2NXAfHPy3OmbJGMetVWOd01vdaLS+2CTh788ELfyVv/NLAPPiQsTjAoRkJ2niD5hFDiENelPYMdT25GzVHge+rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNVf+g02; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so1424702f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 15 Nov 2025 11:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763236500; x=1763841300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SBUMvmH/FE2NkP+rH9gUjMt6Dd3cDonURWl8AiaS8Jg=;
        b=HNVf+g02oqgXwDiqrK+iE1J1VccJkQ62WuZHuRXXTR+eH0XgyXLlIFv2xu/URQNim2
         g56lHaeX9KnoyVyaVpo/MR+08SjZpIUXQ18DgWyAL8oZlg3RDW5dcp0DgKfA+2RMVhZ9
         DMEJtCFL4NPyYb4G7ldFl4623c6CoPzb1SiP362/s2pD8++17Rawdwz3vmftTy+khWxX
         ehE0HDndkc/li2+k4dZkP9T/05BUnn5VmgzmEovtrRDYqtQqA0qytL2t51Y9p1sZ3SCE
         I7yFK+DSt7YLudAdrtDVUBSXuSIU83hzewqyqocLkoJx8A29etb0e0AZ04eGDVNc/09K
         S8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763236500; x=1763841300;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBUMvmH/FE2NkP+rH9gUjMt6Dd3cDonURWl8AiaS8Jg=;
        b=CkbddUbHdvZFvounhjI3nmAyevbCXH+cvEE+1ZGubzkHedKiMrNELUMoDRq9xkvjRk
         MJPMLM0qiIyOnDOkDs+VoD4aYLj8f2rA00D4P/QDarOp+pezPNoRjKTVMjRfGjaZ9wef
         Y99/Q96ilWBTIEfCRd8hKjwjxkJrCmVdmXr5MdHSiIBBl21XrsXfDIt8/WJ5XgYMqa6Q
         k1j8sts87H7zfjYO6OK48KdGuxCFiHRm1KEF4+y85N6ILLVu0EMIdbsoNjk/sVvG/q8h
         MfJU4wRfytAKcGzCbksEvto9ZuSVGRnzS2kINLLPTV3YLFKA3jzJAbaxmZaeDlpSP52P
         5eKw==
X-Forwarded-Encrypted: i=1; AJvYcCUpTcA0oxE/pPCnJ66K/tSr1ZuySn7AT8ag+ucvLeK0kpf99Kd3xWoEG/sjisMCNgtWD8jFyLX8LNZD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HhpovNn1P9fMEvKEyGP9jd6yw6AGI2rFZRtTQML55SFsPSJ7
	JOKyw//hDnJUgsAuFxM2pM3EJssa4CM2jKn7ECZCP6cKB1FrjZ1SoADa
X-Gm-Gg: ASbGncvkdaf4KmK8tX5AehJ0QwXkDZSMkIkRk7ipG81+QkxNhvYrdIzaNB/O+7V8ng7
	/JcpuQkT4YXf/Db4XttKot3DEtNHF5A4Wst1KvEFEfVkaiugwtS3u1sLlq/njfFomtvtzWoZy1B
	lchTjrLZX7Ahvd7h1Z0F8vmqE0adJ+hG8yu55m/wYQZVm2YOCZuij8pTIZZ28IFW8Gv/dk8htuA
	1cfSHMjJFOL/l6wg0OtNU8jCGp1AFG+ax0fpXTjG7Nja7apG879pT/VJF3dghdPE6DNFdiff2pJ
	0N7yZFDaaNi9k4zJVXx3JmAOBxgVDqZPt2lPrP8FE0d5ECpNOxda8tYO1bPO2XmBSzA8ZuAQN+y
	GuH5Rxxdq+F/ZfDeKZxScxhMRS5K0DBesl940ZFdoHUrCwBX/nkHkUx7+bR0/1WcYRF78slmCsG
	DHtPWkueCLwLh1lb6AML5toU3/gWCvg3Uqpzy/YMWcwAxT7z998rxJ
X-Google-Smtp-Source: AGHT+IHSPwnyZ4YZke/ZsJzOSxMHljj18mEXOamqRXYe9YIBBAmYoQ9mxQRgJ1dWDU6O1s+9DDZ4pA==
X-Received: by 2002:a05:6000:2f83:b0:42b:3ee9:4772 with SMTP id ffacd0b85a97d-42b5937618emr6490889f8f.52.1763236499409;
        Sat, 15 Nov 2025 11:54:59 -0800 (PST)
Received: from Ansuel-XPS. (host-87-10-15-59.retail.telecomitalia.it. [87.10.15.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae2dsm17786147f8f.5.2025.11.15.11.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 11:54:59 -0800 (PST)
Message-ID: <6918da93.df0a0220.10a972.69d2@mx.google.com>
X-Google-Original-Message-ID: <aRjajP6jIi8QQfJu@Ansuel-XPS.>
Date: Sat, 15 Nov 2025 20:54:52 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	Sean Wang <sean.wang@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/1] pinctrl: airoha: fix pinctrl function mismatch issue
References: <20251115100000.177791-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115100000.177791-1-amadeus@jmu.edu.cn>

On Sat, Nov 15, 2025 at 06:00:00PM +0800, Chukun Pan wrote:
> The blamed commit made the following changes:
> 
> -#define PINCTRL_FUNC_DESC(id)...
> -		.desc = PINCTRL_PINFUNCTION(#id, ...
> +#define PINCTRL_FUNC_DESC(id, table)...
> +		.desc = PINCTRL_PINFUNCTION(#id, ...
> 
> -	PINCTRL_FUNC_DESC(pon)...
> +	PINCTRL_FUNC_DESC("pon", pon)...
> 
> It's clear that the id of funcs doesn't match the definition.
> Remove redundant #string from the definition to fix this issue:
> pinctrl-airoha ...: invalid function mdio in map table
> 
> Fixes: 4043b0c45f85 ("pinctrl: airoha: generalize pins/group/function/confs handling")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Acked-by: Christian Marangi <ansuelsmth@gmail.com>

> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> index bfcedc7f920b..18c952e44229 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -35,7 +35,7 @@
>  
>  #define PINCTRL_FUNC_DESC(id, table)					\
>  	{								\
> -		.desc = PINCTRL_PINFUNCTION(#id, table##_groups,	\
> +		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
>  					    ARRAY_SIZE(table##_groups)),\
>  		.groups = table##_func_group,				\
>  		.group_size = ARRAY_SIZE(table##_func_group),		\
> -- 
> 2.25.1
> 

-- 
	Ansuel

