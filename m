Return-Path: <linux-gpio+bounces-25346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38719B3F76C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 10:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51F271886DD9
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 08:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831DC2E8DF1;
	Tue,  2 Sep 2025 08:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KxGEQlbk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DED2E8B9C
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 08:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756800053; cv=none; b=L0zJgkHGJMDvBAC6GWMgsKMZiJBtrFlShnvUSF6Y12Vu987IZk5/stSaEUWmhVI1GAROGZKRbAUbgK13271H8hmxJOYrgef9x5cH1h/4K8ecjpUzFysjsAcYaJpmJNaDuj0YHACDoM5UixcwejYd4Qw1/EI5/U9jDkR0Szm0zec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756800053; c=relaxed/simple;
	bh=NvqvC0LXpBflQi4XPH2cqEYGwt0FJXSu827Ch62xLc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlISVr6FKwQRyvqwjc99R4qnuvKtXiHC3uNEdZLree4O3saUHbVnIi2F8FS0Lqe1dkoF91YOwthgZleG2oe4a7Br7lo2V+MuwCiIAriFNAkGPmF/quH1NJrK5+adP/kj0+gcLEgWvhL+3CtxIZW6b5aSSBZ6FS5cylz69aMIqpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KxGEQlbk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so2387300f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 01:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756800050; x=1757404850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0jfinOMF3Iy1NRRBmWMkFF0IyhirH8/uIMK/or5BdYw=;
        b=KxGEQlbkWKafDmrK5cf2QD2ctSkOnsb6sSpFbCCi0AuLowmOv5qSd4P7OqtvOC7FPG
         iaHcT6XFwE7rzffqdflSZDFANpqqBP2gJPYw4lgKwG0482r/qiPv9bIQW3lajn1t3/C9
         OlFdz2B3Ba/vTUhYRLE2YxmNY6ZZa0XnTOBEtJ5kN8rslUVE3Qq949qW+gS2rVfdNT07
         IRNR1VbEorZT8BBpy3kMdzLzGpukHWefdmxUoB75puI84Msanr8qyF0bFZpc3Jusrr9P
         ewbZ4NSP1cWNRpNKbuNRVm0ECWY6mfYC/C1IU9E0ShNAmPJFkpyRvhUqLT+Ha+t29Z+X
         sOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756800050; x=1757404850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jfinOMF3Iy1NRRBmWMkFF0IyhirH8/uIMK/or5BdYw=;
        b=The9ODXVrORz+Sp3hwKYRvPAFuT5viVhgUjkirSGyN4Yi4sWY8xepVih9YCHvuoW8X
         i9MJ/98MF51J9o0Myh5L1DA/iIhnSZqDFW5DA78BJeqERHC4fL4mvd4yY2UD+rDQduPv
         /16F1Ph02h5zaWaGpV5PT3vZD5QNb49wC18pU850n2/pfXYTUxELvCiPAffg5yXyJVJm
         Vt91wP57X+TlZDoFmpn08XgwT9cY9y4VqIrSKQPdK5EcNeYCLFvFyVqjVsTnXYsujpeH
         /jrSKiRUlfZpnW2HWgjY/4C8nlkJNp+FlYXMNTZwRXdRHFFBqghDpooYZ7l2wdyk6rTy
         vHaA==
X-Gm-Message-State: AOJu0YwlrnppCrZroV7x/688GuUgM7oJxkXxlyrlLK4yeZ0Ou+WwZRU9
	mw6tR5VCDMpo5PoBm5JrD1GdhMx7ks89cq13E1xjKNN0C8xpuoqh1KerdrfTakzoago=
X-Gm-Gg: ASbGncsGngVqn6ehInOP0bojmDciTlB5yDUC+elUjsOjgKBWxnyLbvCAs/wYcXI4TGn
	PXarJRvgQXcKTjRa5W3Qv4mv4IV5aidBZZldno0wEY7bdpXwIazn49txAN5CuGHsRhN8HShGYYn
	j2IwBjlQlSsA3m+Z/mqPFApLNVdlY1DiaCTHQEvyak536ygveQxqLzm7upLjUXnuvcu36UPxX3G
	DXB2+Sn8B4H7vkGLt9JeuT8tubQ40+m+4Z3bv1d8uQTbT+Ay309w3ZB/sebLThxBijc6gp5qzjM
	Jd+jBjDX7CgvzSnQ60nFkCCO7XCglWcalc639W1R4EUwDS04ohjKW6Krxzyeg6nQUi3U6RVzMPJ
	Ph8tmPMd1OVFwNZcQVuD6WumzWkhrzrxSq+3wsQ==
X-Google-Smtp-Source: AGHT+IGLFSChc7Y4gGNttpA4ImPjySrsuB0Ljkd7thwlipCv1FPzw2mqlMPj1t1bxCASZX3NFWUUoQ==
X-Received: by 2002:a5d:64c9:0:b0:3d8:7c6e:8b08 with SMTP id ffacd0b85a97d-3d87c6e8edamr3421980f8f.13.1756800049599;
        Tue, 02 Sep 2025 01:00:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf276d643dsm18882727f8f.26.2025.09.02.01.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 01:00:48 -0700 (PDT)
Date: Tue, 2 Sep 2025 11:00:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: luyulin@eswincomputing.com
Cc: linux-gpio@vger.kernel.org
Subject: Re: Re: [bug report] pinctrl: eswin: Add EIC7700 pinctrl driver
Message-ID: <aLakLIx5ZMgMTR6e@stanley.mountain>
References: <aKRGiZ-fai0bv0tG@stanley.mountain>
 <2c953e90.a26.1990432fe57.Coremail.luyulin@eswincomputing.com>
 <aLViO8IwbWqZLK-Z@stanley.mountain>
 <3eec843c.ae8.199095d1d4c.Coremail.luyulin@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3eec843c.ae8.199095d1d4c.Coremail.luyulin@eswincomputing.com>

On Tue, Sep 02, 2025 at 03:38:41PM +0800, luyulin@eswincomputing.com wrote:
> Hi, Dan
> 
> Thank you very much for your suggestions and reply.
> I changed IS_ERR_OR_NULL to IS_ERR and added select REGULATOR
> and REGULATOR_FIXED_VOLTAGE in Kconfig. The local tests are normal.
> I also added "Suggested-by: Dan Carpenter dan.carpenter@linaro.org" in the commit.
> Do you think this is acceptable?
> 
> The commit content is as follows:
> 
> From 4bf1f20bafc8dcfaebd43e7c8b42820edb36f028 Mon Sep 17 00:00:00 2001
> From: Yulin Lu <luyulin@eswincomputing.com>
> Date: Tue, 2 Sep 2025 14:41:53 +0800
> Subject: [PATCH] pinctrl: eswin: Fix regulator error check and Kconfig
>  dependency
> 
> Smatch reported the following warning in eic7700_pinctrl_probe():
> 
>   drivers/pinctrl/pinctrl-eic7700.c:638 eic7700_pinctrl_probe()
>   warn: passing zero to 'PTR_ERR'
> 
> The root cause is that devm_regulator_get() may return NULL when
> CONFIG_REGULATOR is disabled. In such case, IS_ERR_OR_NULL() triggers
> PTR_ERR(NULL) which evaluates to 0, leading to passing a success code
> as an error.
> 
> However, this driver cannot work without a regulator. To fix this:
> 
>  - Change the check from IS_ERR_OR_NULL() to IS_ERR()
>  - Update Kconfig to explicitly select REGULATOR and
>    REGULATOR_FIXED_VOLTAGE, ensuring that the regulator framework is
>    always available.
> 
> This resolves the Smatch warning and enforces the correct dependency.
> 
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> 

Sounds good to me.  I'm not a Kconfig expert so I never know if a select
or a depend is more appropriate...

regards,
dan carpenter


