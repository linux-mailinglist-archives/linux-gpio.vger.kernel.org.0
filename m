Return-Path: <linux-gpio+bounces-19733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3BAADD67
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 13:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DC0A9A3441
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 11:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A712A221730;
	Wed,  7 May 2025 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vw5ND7Rx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F62221019C
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617553; cv=none; b=uCxBTHBIh2gK9b1un37QBJD2vwhNEBn7FJQD7ldInSp9vlIa15ucOfR3IFVTOK40SsEvkJCkV+/njc9h/UplEl+zslMI/jnUBsAmztM57vokcji4UYd4QtUlO5xaz9saJ8XYS05nO8iZ7c3ZpDlE2teOffXBEtZ7dR6H5s55Vus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617553; c=relaxed/simple;
	bh=3XbAz2PGXTRyrdvEhkXrGX16BDmtijuZ4bay8iyN02Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRY3JZ1Eht/7URqx5r7kQvzoH3k0gQ2tvektCxxdvf09vCIiqdDUFHdPWEPWuOxC6Amf7ziyPhEzN850KUp0P2JteN8ddu2Vc3gJBQH5jSdEAg2Ye9iSZNvtI+HZzdgf2TIEAVvQ5e7WHfUUxCZxJUv2bEcgo/XUjcKJ5zW/C6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vw5ND7Rx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so1044697f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 May 2025 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746617550; x=1747222350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb+zlo587RuPjZXBWr3+oLX8zkFQSZwHVEcLM+1lwB8=;
        b=vw5ND7Rx5+lkbzZeLWZ6WPBEWTxNcVx3hSjMP6HMR3ahY7OyvaI8rC4FfJlJSZYpQp
         eFOkcqNQhOswgb0yznonZ+TskDQt40sao3XnOlMob8Z7DFg80YhPmQ2pHJnt5iriTBYr
         yd8Y5KH5ktQ8mppxSiaxqyvSTsMxZG/zSTxZGQCog+TAd6YCwgfTD7myefBaWW+G8b1Z
         nof97H2C59nvdDi0VknOy8JlDYskeazSHv3glHd73lMViyQWGVnOFNWkXbrmrXEYmuU8
         7HMg7gYzDvnwSJwjlnGcHVasJcABjBi+2XYpAvCNSfIOeSzSjTZomZmiKGTzVshTnkU/
         kkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617550; x=1747222350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nb+zlo587RuPjZXBWr3+oLX8zkFQSZwHVEcLM+1lwB8=;
        b=f1Yg1wZelzOD+N7ztu7+q8htTb8yXkNiLaon40BBQs+ReYnVH+QPPwfFrfONeSUyeN
         UuTSqH+DNuM1PrN9silFxyY0P6fEQ1ur2bG0KY1cvSjAX2GuR7LCrLkb41sgpgdZoBqp
         T8d8QjYZown2lCP2PKGizjeTBz9m/HKSm1ot+iZD5k+AoONKo2sTkkOsF2h1eDeFNUqu
         XwAxxAwf/xICGdSwW0+pBpBDIIVh9Gw3Gcb0uIx2uOvvLugu+cEY3K0dkqb9htUUvF69
         lQNG/WzKI5Hz5hsfvhjD8QXqZm4inS/8DbtAgo6ZJSIY+bnR9kRtvmTqDbVjp0mCgdFL
         rfUA==
X-Forwarded-Encrypted: i=1; AJvYcCWMTMfRY7w0J8SUULb27bxPkRNQnz7xV7rDdYreShjiIyVgEyQK4PpUmCIcWRlMwh2SNqnB8KozbA1D@vger.kernel.org
X-Gm-Message-State: AOJu0YwNc6SSyMon1vTy0KXYBYk1qemoFGhaTDEQg2CArKVH4CBoR7Tl
	XncdHi3FjdcHcI8Ge+T8/ZYQvyOlrB4DoajZ6vSf9SRIB06dG7l98MWPCNLHoB4=
X-Gm-Gg: ASbGncvexeQYlWr/Zas12UcMk/y5vJLIygQ4SVbVTb4pxXCPRkMWf11q67r2vDttwjO
	PvLEE08mYulevBef6Wee01285l9u1lUACG81XdhSwnHgn+SLSRhmXtmdoXC5RK8H3MI/235EHJw
	RKP4RTCUAHmMIhq4k1+FwUXMxL8gfzJW8KnnU+mt9xK3b4anU92/4XVIWO98/DoGhNUGINFjTcx
	hm7O94iF/hmL/6L3PRJge8DzuXXFDehglDgDJ0wGM+3UObRXFiVnLutMQyhLRxI6gUaHgsOIUbS
	5mJFWE4dajmidaq9DIPQkfS/dpGF1CJ6OrinYOkN5xqrkg==
X-Google-Smtp-Source: AGHT+IEItGOXOrk5wMY3AvgagcMlmqm3t9UoMOHncdRejXrITI+PTxVIePkvuItRyBuA1HIIIAv1lQ==
X-Received: by 2002:a05:6000:250d:b0:391:4559:8761 with SMTP id ffacd0b85a97d-3a0b4a4b31emr2533881f8f.36.1746617549892;
        Wed, 07 May 2025 04:32:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b22bd6a3sm4059664f8f.27.2025.05.07.04.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:32:29 -0700 (PDT)
Date: Wed, 7 May 2025 14:32:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: Re: [RFC 3/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <aBtEyciwVip9FaKP@stanley.mountain>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
 <0e982ace876920162d27a521f5f460b1dd6fc929.1746443762.git.dan.carpenter@linaro.org>
 <f59c3493-4630-4cf1-8d25-d4e9fbf23498@oracle.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f59c3493-4630-4cf1-8d25-d4e9fbf23498@oracle.com>

On Mon, May 05, 2025 at 10:00:35PM +0530, ALOK TIWARI wrote:
> > +int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
> > +{
> > +	struct pinctrl_gpio_range *range;
> > +	const struct pinconf_ops *ops;
> > +	struct pinctrl_dev *pctldev;
> > +	int ret, pin;
> > +
> > +	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ops = pctldev->desc->confops;
> > +	if (!ops || !ops->pin_config_get)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&pctldev->mutex);
> > +	pin = gpio_to_pin(range, gc, offset);
> > +	ret = ops->pin_config_get(pctldev, pin, config);
> 
> can we add reason here, as now we are not calling pin_config_get_for_pin()
> 
> https://lore.kernel.org/all/20231002021602.260100-3-takahiro.akashi@linaro.org/
> 

I don't even know why I changed that.  Using pin_config_get_for_pin()
works and it's cleaner.

regards,
dan carpenter


