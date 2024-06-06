Return-Path: <linux-gpio+bounces-7220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C48FE014
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 09:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E2D31C21466
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 07:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2576813BAFB;
	Thu,  6 Jun 2024 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NL++cvwa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1062260C
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717659763; cv=none; b=fycTvGXlPiz4nR9+92/ehB4mw6wdN0WEAz6iOwcjqCWgybgEmfC/zAkxn72l8XcvuUcwqw/Ta9bfFXCua+DxjAeYGwcoAdpXg4WgwQtrIt8ijEQTz1GvWKiCaP7bFpYuGe+AVuzFu0FJzkknHxoWZmTsPUy8Ig/OBPKfoCyGAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717659763; c=relaxed/simple;
	bh=7OaWmqVFqUj8UiBMIFYvyTDVYpCRKRaVDuAaqAod2/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpEA5ZgPwy3hyBjV+0L9ABM60CxbgSA/+V/pJiBSedfLZf9ukQjIQ9DMc+M3JzDbQY0q75lj+lbAHgoSZtwpVFOT0g22ytLJOyvzoNyH8aca7OYmnDgsBAGDM+mVEuPWLb41b6zAVdj8yhHSxGAXLP4KDz3DIwn8+fnqKqWOh5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NL++cvwa; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a4ce82f30so762306a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jun 2024 00:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717659760; x=1718264560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hn7A2vtREo0E7HfSwjkC9hqptsOSWf7nUvmnuVDMQY=;
        b=NL++cvwa1YzNLaO02KuHXfdUWI0iBeBifsmyZyDIb5uMpknUdYDOeT/BDI/fB1OqHk
         +7gCI0acVsZJ9rqdfi0zaMODPSc2iNqRCIIzabLp1tuBymzYzAtsSw1iGNJhqh8NyJ/4
         bfRhWy9o8GJlE3fdPgPV+MIOX2Zas3+n6dR2PFZyU7rJMR6cFy0R0pMq+kF7E/jGpRD5
         dXGJ+GxjzoVPjGZ3tiwUrB4gUVnyjnHucGul9epeD37Bp6ZiZqmXwZ1hXIrXEdNVrXJF
         ilEl3P0UI+XCbpU9AbkrYXIGfV5G0BBv+rrjrB1As9IXmF71GnivuRMlHZ8mIiUgEiHw
         uAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717659760; x=1718264560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hn7A2vtREo0E7HfSwjkC9hqptsOSWf7nUvmnuVDMQY=;
        b=jxMT7P91g3C/CxkH1lgiKRMtesqCrRpn/Ms2KJilvvpvKzGpCaJiW3vaThVMTJ11Pv
         N6gYkXXPDij+vlUFQRzpUxkL5yvujBwCBbeKzVplYPP6/uFqomCXt/IQ3LztpnB9Yw/r
         EbYvKSzIbAdeYjSVs/UE7X2JuMrbdMn5RkE/LWu25JWojmW/VKuOEhmFpJLI1CjCEcCf
         k5CM2t38SnNRolIu7loVDpPFA2YwUwUs/zWkMRbnJ9k5Wbe6dDzwbn5ECKGEImUsuCJ7
         mCTWbdw21Z/3vwyZsqZ1fv0ja5bXsBscdqV8LFWkETP82Cfdk50mtcsTaZKuvxpsCOOf
         oOVg==
X-Forwarded-Encrypted: i=1; AJvYcCW0Fbmf+rKKY6zU/YUhDtxoWQfvjyymrPWiP/8M5mkWqIWNCf3x+lfHHhieo9U+dEte5cs6JfeWcBxVkgBgAgPnsLl4BFjQU1U28Q==
X-Gm-Message-State: AOJu0Yxo7xTQUs8S2tHEytFLAhcde5GoPBQdgw/53vFfV0kEUalVs0QI
	ntT4oZRNMITwCXftJP/k1e8OjhuZFwkYYLyyDQPa2Z1FgEdPY6HTeWqUoeZQ10U=
X-Google-Smtp-Source: AGHT+IG9fb84ekx6f8HaBtotI1FnubBAZuTJ3dgM/XdsdCeyuhCLEIFdUbolQkfIb3FKjJXzmIhddQ==
X-Received: by 2002:a17:907:900e:b0:a68:fe79:9499 with SMTP id a640c23a62f3a-a699f88b67cmr343464966b.40.1717659760015;
        Thu, 06 Jun 2024 00:42:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806ebc43sm57149266b.141.2024.06.06.00.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:42:39 -0700 (PDT)
Date: Thu, 6 Jun 2024 10:42:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	manugautam@google.com
Subject: Re: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem
 reg_read/write return type
Message-ID: <08ff07f4-034d-4342-89da-d83044871ab1@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-2-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605175953.2613260-2-joychakr@google.com>

On Wed, Jun 05, 2024 at 05:59:45PM +0000, Joy Chakraborty wrote:
> Change nvmem read/write function definition return type to ssize_t.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>  drivers/hwmon/pmbus/adm1266.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 2c4d94cc8729..7eaab5a7b04c 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
>  	return 0;
>  }
>  
> -static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
> +static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
>  {
>  	struct adm1266_data *data = priv;
>  	int ret;
> @@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
>  
>  	memcpy(val, data->dev_mem + offset, bytes);
>  
> -	return 0;
> +	return bytes;
>  }

This breaks the build so it's not allowed.  The way to do it is to:
1) add a new pointer which takes a ssize_t
2) convert everything to the new pointer
3) Rename the new pointer to the old name

regards,
dan carpenter


