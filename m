Return-Path: <linux-gpio+bounces-6856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0B8D3953
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF331F2748C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C108215AAC6;
	Wed, 29 May 2024 14:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVPyv7hF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2715A4BC
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993173; cv=none; b=LWUUpG7EjVyYj97Q4AQzJnuD+u8Ao3ghgT6vurLygFkAuOrHGSMTbfhngJucistvFv844eS2YZQcrITCSFwlnQCMoFMFLbpZronKWMvGfs3qMAkbyle90WC+5aSTZn45Nm0GOUudQHifSjTNfgkH+fTsspP8lRBsp6hi4T+3uiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993173; c=relaxed/simple;
	bh=dVJ+EvwFT4Heb4Cx07/uQgdH1ZEbjDU3smi2K9tnUTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxeAsCkEfZryDhDO1xZQq6de8TXTFwwlL68kvXWwI9OBYM5q0tkdf/TzQM8Keiu43TQ7nsmAHpARz8WsDpI2llTi2a7LbMh/VTYdoTIG1Lx+T0Bhm7Sf7/vaAjszi8HvhzNcCcIE8ridRFYUESMTuWbg68uYHuDC+E2pET5CZ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVPyv7hF; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6302bdb54aso313611666b.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993170; x=1717597970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yhL9Q7EwnBs27v2LEV5NKZLimYfj6QTltIE7lVekQTA=;
        b=QVPyv7hFYfdvAge+P1PhDzAXHKd+67lYDtTRoHHNdcF+875YFuFvobBl/b5gEBPuP6
         RnS3xscoIzaN1GpPMq0ffn5DWQO62n2Uo46UY5cMb1wnPzcvohesmZLzud1bbHl0Bs9z
         fyN+0uK78T5qUfFyUaxUcKjY77cYlTvECJQcRJk7RuQIEBY29gRhBGgHEBI9ZhjwGnrk
         lJuLVktf1QXIWcKFxBXtLYEJn6H8DbwVYj8GMcE4lhPWOQpOlVy5v5NHGEsbiuDXYZYq
         qtdjGb4YDv0I7guJFg4eJmLyBx28JqfNwMVd2CrdXDcn3uMV+KXzZFyUjxM5oLucxaeM
         aQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993170; x=1717597970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhL9Q7EwnBs27v2LEV5NKZLimYfj6QTltIE7lVekQTA=;
        b=oQfK8QL9rvHKSGiEHNMbnMFRs4J2Mz/IxRMRn0b3ribxzWNgYz4foCnqV99orKpFz7
         J27dRR7hgEUXARFOd1diVf2hv7QBtDu6+LTzL/xyNkrqoJbrVSTwgEEeVbL5HQOxLWyf
         ObR54cbde32aIUsQsGk0ZkAnEVvGOptoNPn6MXDSh0HoC7F+bJr0JjmhovRGL8btmRPj
         4ou7v+dMmdgcQVJP30Nv7gz7gulwY2UjbxNlcPIdzQXQxnCwM06TAROQZGFPs37UYldr
         i8CZfRKOcZNncJ5wKW3wHaoutaM6TxCtl/AvfiL/2QMQwq/ZX3VLR1J9T+WkUsLdWToA
         yYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkHLGPtbX4Jsb8PZHxu8vOlOWksGOH1WV6ayeE4GECVMBX7pa5Ze2YBuEEHu6wu3E3LNEdOshBxUWtuGpVsn8YbgsrsVJt3H+lAQ==
X-Gm-Message-State: AOJu0YwfbOROf+NS9Xy6fjVtYpU1pAoyL1UlxVJmG5YKzt2txBHF9Hpy
	CLG03UfLah/h/m4c4y//NldVy+fPQTaEBrStkxK5WmIBOAqjKG4xhwLJPE7NcpM=
X-Google-Smtp-Source: AGHT+IGfQCqqRfxMIiISzvS9/g8UPvhr1QZ45ocg7vu1MZ6Ig+gY0oCIAZ6h2UT5aAvZRkeeCfsndA==
X-Received: by 2002:a17:906:379a:b0:a63:41d4:ca86 with SMTP id a640c23a62f3a-a6341d4cbe1mr320147166b.24.1716993170311;
        Wed, 29 May 2024 07:32:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6590d02e53sm40275466b.119.2024.05.29.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:32:50 -0700 (PDT)
Date: Wed, 29 May 2024 17:32:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v7] gpio: virtuser: new virtual driver
Message-ID: <c5799a51-b39b-49b7-89ef-9cec2509330a@moroto.mountain>
References: <20240527144054.155503-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527144054.155503-1-brgl@bgdev.pl>

On Mon, May 27, 2024 at 04:40:54PM +0200, Bartosz Golaszewski wrote:
> +static ssize_t
> +gpio_virtuser_sysfs_consumer_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t len)
> +{
> +	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
> +	int ret;
> +
> +	if (strlen(buf) > GPIO_CONSUMER_NAME_MAX_LEN)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is off by one.  strlen() doesn't count the NUL terminator.

> +		return -EINVAL;
> +
> +	guard(mutex)(&data->consumer_lock);
> +
> +	ret = gpiod_set_consumer_name(data->desc, buf);
> +	if (ret)
> +		return ret;
> +
> +	sprintf(data->consumer, buf);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
It results in a buffer overflow here.

> +
> +	return len;
> +}

regards,
dan carpenter


