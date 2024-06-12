Return-Path: <linux-gpio+bounces-7383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00815904CEE
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 09:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7D291C243CA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 07:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754DA169361;
	Wed, 12 Jun 2024 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POSB4jy1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AA93EA66
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 07:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178112; cv=none; b=Y/zTBr1IjulAi7tLtRQwC4KnychoFp2bBWQi0FSpnXPqf2ve0xXgO7umPVDnbpdn/IBub9kcuhAouh/yP2LmOxxpTkq9WPdDC9pxiy/0YyT+LIbM0W6f5qCFMnURXQfVeJ9vwFsJzQgvk7T2A2H5W7Zqww30V6oGPsAw6yAFYKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178112; c=relaxed/simple;
	bh=pAxEN/pEpk/A/lKna5/aObh83KDjBFmnxO98DMHCy0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PH7OVEa5MBZYtixLuohIpI1vShxoNxW1WNcSMghav3xckpNTFMdUxrDHYuN6ut7eHgro8QgW31HdRzb7dPmw7MPFeDMfg1EX2WRQH3u6nbjb4S1VCdS6F2yChe8DQNX/WirR5379eNfIH7uNWGke2esDiqWHw5pa11s/7d16ZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POSB4jy1; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc3130ae6so4979575e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 00:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718178109; x=1718782909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HhUYOzKS7bxm8hVJN2VTT6LKZPnSimHnSUqc0btaeBA=;
        b=POSB4jy1r4teGlSaeE/AiZhXaA1U6E6LgSgQgDL22EsMbUon/dup+VJwIyo9Bx5S7g
         p1jkVxzqE5YSEg3j4gSp3fvhbwYq95z8tNREisAUTe5AEFl/y0sbQ+w/1X9y3wDJqogf
         84faBxl2QPBKDCGT3+rPUum/kwaAA6RVP/kvyxeMXNToaY8Og6+4dCSXXdbRCKOIpSa9
         TRxgtygdL2Ksim0GCBCjPmdYm974zbtVITfn+bQ/FFdQ/wnO41V64AzECg0vhuGRZ08E
         21vqY2fzNPeedTf4lCSjeX93wBEKBZvJjWKiIa8fi5B2cDz4WM57wwdKN99/m6TNGV/7
         PZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178109; x=1718782909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhUYOzKS7bxm8hVJN2VTT6LKZPnSimHnSUqc0btaeBA=;
        b=U8o/mthgbdMXpnXFTH3Q8omtCyqwoEAnl00HMhvUaBUHRAnY/kI6cKwRm6I79zU3ki
         eAshqwQww0udGwG6abmZxP77DBnbdwE9JENOrKD/u8KHPQHO8ZNja2WzMGkRg80hw0KD
         wu7/c/6f9rRHO8emgtP+TItPbNyF60YUIfgglgjBmrDtGFgIIpG89hjnQ8QqVBRMrhhJ
         GNt3oU/FBWJADG4Cezou+7CaEHFq+5BTLgYct4O2R+ikFWva/HStn2VypNpK7ckeuFlM
         Ei/EUhg0xdcIIpm931WScFl73KUyGZUVdk1lCzhdes2CyBzzZ2QKg9OgpRP/NG42j0Sc
         CGjg==
X-Forwarded-Encrypted: i=1; AJvYcCXl9f6APjzlemv7Vb9FW5e0hAi5ob/I8x1bq7ETgTG05n7C2ZmDAfM5cU50E8uVhvJBF0kgElwpGMW2huhGQ3AKVu/7JCQrftNDbw==
X-Gm-Message-State: AOJu0YypWJoy9dNj2jYHfrHKBfE19DsXezC8XweKD14tr4Hj2Q0qJ/4T
	Tbr4FuIABW3urxQdH3+tWXdBc2dz8dr69xOhKULv1Ax4DDgVquVcPvP2TNAps+w=
X-Google-Smtp-Source: AGHT+IGiFcvWYgMfWy+TBCsBEXUzdu01h4MvSH5Q3a8uPRBVsPEg47UYCX3+/Peoq5J8+bdFWnv9ug==
X-Received: by 2002:ac2:46f6:0:b0:52c:84a2:6e0f with SMTP id 2adb3069b0e04-52c9a3c768fmr482466e87.15.1718178108521;
        Wed, 12 Jun 2024 00:41:48 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871f9068sm14413155e9.43.2024.06.12.00.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 00:41:48 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:41:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] misc: microchip: pci1xxxx: Fix return value of nvmem
 callbacks
Message-ID: <ddfd1887-87b4-4cbb-9f6a-765e50986105@moroto.mountain>
References: <20240612070031.1215558-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612070031.1215558-1-joychakr@google.com>

On Wed, Jun 12, 2024 at 07:00:30AM +0000, Joy Chakraborty wrote:
> Read/write callbacks registered with nvmem core expect 0 to be returned
> on success and a negative value to be returned on failure.
> 
> Currently pci1xxxx_otp_read()/pci1xxxx_otp_write() and
> pci1xxxx_eeprom_read()/pci1xxxx_eeprom_write() return the number of
> bytes read/written on success.
> Fix to return 0 on success.
> 
> Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX EEPROM via NVMEM sysfs")
> Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joy Chakraborty <joychakr@google.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


