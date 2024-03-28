Return-Path: <linux-gpio+bounces-4786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE089063B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 17:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6036C1F27F2D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 16:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AAE130E4F;
	Thu, 28 Mar 2024 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBKp0cH6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9911F40854
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 16:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711644312; cv=none; b=IXX+r3a4xEssf9MQ0mT4euuErHiQEkwkz3VYv4E7RiLvzsVzyTMXytqWw6ly45O0cNd3OeZkr6idX3LWVm3GkUAnlSGEN3MHQmk4JgOQ/IeVazHzjQuxbq5UiR5KXP26v5r/9sUtsLSgTMYnDY6QRWdaFIzD7nyszJq04n0QIms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711644312; c=relaxed/simple;
	bh=/Zja/MFSFGzAJAXJparFQCQuW62bnc3U1YwOvbEie24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcS2YFQ/+xWI/m7HLXI/5OiBwXu2fT5ehhv96mqKX5cfT7Vh/CuRtyKhiOX7geLVErC6Iqv9KK+5XGYgelmzJNpRFDw1TRw+ppkA8p7s3vvODmCfAeT8KW0I1xM7J3BK/5MP9MGisd/FvUv8xAfF873HnYtexnwpore7JQLSrDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FBKp0cH6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a47385a4379so409810966b.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711644308; x=1712249108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9i7dgEJFTBVALJHo9iymqx4jH03OiP2GHtz27o4I/YA=;
        b=FBKp0cH6JBI5BTwRg4YB1wQnoUJwePw10SH6p1CtR2lTZtZgzOKFIAfDTGISK0Falw
         qONzuR8MS+Tm30ysJ7aHuOW4BAcgmEEra/wWDys/lxw34Qe37S9iNZ3n8TBechxlH1N8
         81+lvMEisjylwiB1xfaUB/o+QNILhxOQ47MeGAjMZS8QjsktFiibvmkM++3HHicKBiyN
         6dfTt6wctjjp5TkTj284IloxfxA18brkCY7LK+HMavjOU0iuAoeQeIL79qUVOUiIbWF5
         o1ZoPyGmOUYmtyJ0r0pH6eqwJAPB+FH4TUk3jRHwvbq4JZNKMj49zWNyT+CKdJuNN5ZO
         SXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711644308; x=1712249108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i7dgEJFTBVALJHo9iymqx4jH03OiP2GHtz27o4I/YA=;
        b=kbG1Oq448XO7aAfA8cCAEAxM5HnU2XyPudMcfm6d5m7lMPsSRB7KOihTvFMXy5bz9O
         JsCzWkYdQrj5fjAZas9AhVmvoRzpFlpEhw06UnJSFqS5g7gmA/G9B46Pzq9YoN+6cPVf
         2gBKwUokVhIkKsW0Tp/NILRutV9WW4v/yhmcRKaRVGuARlHlIwUECxYW0LjCx77FaHMz
         NUrhcP03EUsmkP9NR5jKulDytSN9gbvz1X0yD8j62f3ZK1kPR3TK7yi5at2hK+L880mb
         6lpCfVQX+ZgU92TG6MwwuMAKEC3IWOUgnru3XpHr40O7ywYzjpTK8dWcAClZVgt5gg8X
         3qvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbNxsuTBX80sLj5wrNX4TAyY3gqKlvU3Svj9JT5CrDHHRHPTWM0agGYWRYFVFBJBUZ2OdaRHXlj6JeQoSRvvmv9skvrUBs/l9Jvw==
X-Gm-Message-State: AOJu0YxPagNnwnKTYaJkq5ndS+4+I65To/PqM8vplLW70+KfuTFU4k+v
	VBHdqbwuYNnSs58PgrRvnirbjMyN05cCn98HVIZjJ/RqbEgeoX8hOxXrayp1U2U=
X-Google-Smtp-Source: AGHT+IE0k8W/uLy+pu3KFmEyPFgRSutvM+32xUNhKooZng/RRL2AQD0j9iJCAcXm19WSPYGUAycJqQ==
X-Received: by 2002:a17:906:388a:b0:a46:852e:2a63 with SMTP id q10-20020a170906388a00b00a46852e2a63mr2269137ejd.29.1711644307845;
        Thu, 28 Mar 2024 09:45:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r18-20020a170906c29200b00a4e2a1146f8sm343291ejz.48.2024.03.28.09.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:45:07 -0700 (PDT)
Date: Thu, 28 Mar 2024 19:45:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Aleksandr Mishin <amishin@t-argos.ru>, Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, "Andrew F. Davis" <afd@ti.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] gpio: davinci: Fix potential buffer overflow
Message-ID: <cbfb9094-2574-4e00-b401-1ddd81a2850b@moroto.mountain>
References: <20240328091021.18027-1-amishin@t-argos.ru>
 <b2c6bc3e-11c5-4a20-8a30-666821ab2613@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2c6bc3e-11c5-4a20-8a30-666821ab2613@intel.com>

On Thu, Mar 28, 2024 at 04:27:24PM +0100, Alexander Lobakin wrote:
> > diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> > index bb499e362912..b65df1f2b83f 100644
> > --- a/drivers/gpio/gpio-davinci.c
> > +++ b/drivers/gpio/gpio-davinci.c
> > @@ -257,6 +257,9 @@ static int davinci_gpio_probe(struct platform_device *pdev)
> >  	spin_lock_init(&chips->lock);
> >  
> >  	nbank = DIV_ROUND_UP(ngpio, 32);
> > +    if (nbank > MAX_REGS_BANKS || nbank > 5) {
> > +        nbank = MAX_REGS_BANKS < 5 ? MAX_REGS_BANKS : 5;
> > +	}
> 
> Static analysis warnings make no sense until you provide a reliable way
> to trigger the problem on real systems.

This patch isn't correct, but we merge a few static checker fixes every
day.

regards,
dan carpenter

