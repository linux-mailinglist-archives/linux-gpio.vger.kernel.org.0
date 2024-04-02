Return-Path: <linux-gpio+bounces-4986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B1894F5B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 11:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3304B20B75
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 09:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AAB5915A;
	Tue,  2 Apr 2024 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KngIa3hu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A906651C52
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051991; cv=none; b=bFbh8a+NYPNTIQeAhxRRA6RUW7SjN7a1TwgO2oEVZ3YQCn40lT7aRbQithQrxNFTxixAFKyp+pgRylqUj1ryMM8MHTlYOUjrr1aeBkFqYUJeKE4/RvhrhxBu1yXq5Thtr+yVai4l3YmkAcIIGgOG5qnWMuL3dP1CqiYPCAUdYIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051991; c=relaxed/simple;
	bh=Kgs/Vdaio0oR2w2PgaAMR40kUb748GCJI4HpRtOWrCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8po9qaABnR1XoHDQMG690592j05kJIP6C+nsVhRVt0EtxEl9O9ej6iayS9Ak63qK7K+XBKDsFk3s7JomKHmAc890LSKLBh8WNuMD3GCmeNe3xva927iuIsBSL3GxA+Z5SlbHXdWWubEqLR5lyXhdl9xZ6yL47lxSoXB+dWj/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KngIa3hu; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56df1dbb15dso381580a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712051988; x=1712656788; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LIK3my8ABKRdtJyG7KGkkQYs6AXtO/OOQOFft5RPt10=;
        b=KngIa3hubClapZ5U7t6gBiUajdEt7MjQBFh6AWAhyxAehQe/674ybfXfl2J/lErROz
         9DBGl8zHKjx/jS1B61NtZVzUoCNivwlzvnCijWF67xvEpCnqXgIjBN0bemO0sNfYMslK
         XT83n+3PvI0ecD4GBkJIJ/T4V8thDxSLf+MNrgjvM8KxK34HavcjYWVB7plU4V/3keBC
         pqGTHA9NK0Ist48tQ0yuiohEuPrLqkhzLlwupKNsZq2YfEu6r3rUmXkAkLpLku1Wz/fE
         lY/y2mht0YXdsufOwo/zysvgism2hY7ckLQYwW+dt1vV0NQ/cq5175NSvqrr7YMVs/dP
         /elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051988; x=1712656788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIK3my8ABKRdtJyG7KGkkQYs6AXtO/OOQOFft5RPt10=;
        b=en4FWlC4BMeYFmSSMF3vlARkHvtbMGz5yXl1oa+nKRnJvfzb7T6kCN6gqsUFJrJ2sr
         s08t3HRC+xSlYq1mHDiuTrP6CydgDhFhKBk9fckAPg8AgmKEXRRqTutXrHtXiFKywELq
         hs9ThfekiIlvqnapV+VdYc95rcojB+AgGUKZe/8AIWVHjwPSFVWUPO2qzYnFbVUfAWId
         L5VSLnx1lwxAjGu20btlMJrz6+ku/a1steK8x6r30UdfI6XODoNfshyFxAz8+wgIcPJ6
         shWEp6RLRX73F7xK86W6XnnECPtqeygn+3+oJ7Oek0eOA5+/TyR4mQG5crVNwvLQWn60
         gw1w==
X-Forwarded-Encrypted: i=1; AJvYcCVKwN/ODE7O2a/D+9AfHmliNxUUS3Ca48jhZzqSRxhZ128mFml1p/9CRS9vyARivxnKrq8hbnG7drE+TvUomKY043wQ+m/qdwCUTg==
X-Gm-Message-State: AOJu0Yz/3i8H5U51h16Mi3DL8qiikg4iAWoSmqjlEaUHtLBX+96FHKFq
	4BtnylPd/7l74OchxHdBNz1in7nP2U4xTybJ8iJkn8si+ZacmIsFOElcc/Q+b9A9bBw9VgZVXvm
	c
X-Google-Smtp-Source: AGHT+IHiPuNBTdnlzshXbP/5TpbBgxsfsjL3mHvPWbZ/i8OnttVYGnTesKL64t9BOLVMqjcBTGlyrw==
X-Received: by 2002:a17:906:aa4c:b0:a47:4e09:e685 with SMTP id kn12-20020a170906aa4c00b00a474e09e685mr8026763ejb.32.1712051987776;
        Tue, 02 Apr 2024 02:59:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k5-20020a170906a38500b00a4761c94a5esm6360373ejz.107.2024.04.02.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:59:47 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:59:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
	arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 03/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <38fc3188-7c44-4797-b2ab-b06b7f60d1a9@moroto.mountain>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-4-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240323164359.21642-4-kabel@kernel.org>

On Sat, Mar 23, 2024 at 05:43:51PM +0100, Marek Behún wrote:
> +static ssize_t front_button_mode_store(struct device *dev,
> +				       struct device_attribute *a,
> +				       const char *buf, size_t count)
> +{
> +	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
> +	u8 mask, val;
> +	int err, i;
> +
> +	mask = CTL_BUTTON_MODE;

No need for the mask variable.  Just use CTL_BUTTON_MODE directly.

regards,
dan carpenter

> +
> +	i = sysfs_match_string(front_button_modes, buf);
> +	if (i < 0)
> +		return i;
> +
> +	val = i ? mask : 0;
> +	err = omnia_ctl_cmd_locked(mcu, CMD_GENERAL_CONTROL, val, mask);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(front_button_mode);


