Return-Path: <linux-gpio+bounces-6674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 493368D0583
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 17:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0EC8B347A2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C9616FF59;
	Mon, 27 May 2024 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nrTFd1KC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAEF15F309
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819975; cv=none; b=QSeWcuWSHUEVpkfaq8WQqpS7PRBoz/m3Lwz+yzdvPJRYoN7FxCEkIPS64LJjmeCo6aSviR1ZoIJSja15t4hmuEetX25/roX1/pUk9Y5RMXQK4hhsGx3XhtsMN/SGinfAjPZ5l3Lwc2DsCTg7A5nwO7CssZEIqQ9f6bTNGP4uzwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819975; c=relaxed/simple;
	bh=mIexTCXVeUPx/vSiQvIkN6fMNuyrTcPp/6jeHHlIuU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAUBoKe1+h5B05zTVkbZ+wCbQG1rBGbQqBJ3RQtY/qUttpVHLNaAc47+xu3FvRn+tYJq8cTECOHEex83YRA7ygK3yp2CYD18A+wrF/6/KDbGVXeZO7ViSI+kBdswiFb72k/9PMab35PA+6jaTCcCaPo7qXS8hoi+NlrCMHxAmu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nrTFd1KC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a626776cc50so381191266b.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716819971; x=1717424771; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v7c0ZrJPynvxMLH92Q3X2WTOon5tSRNZ2c7KU9q10EA=;
        b=nrTFd1KCvlLfA//4I+gCqd8ZcWdfnLCJ3ucTz510/Os2KxkVEy/PwsXga90ubfXQiS
         belfAJa7pFpPIqeygLzvUlwUdW2WNMOQ8lfAfJmPXVjRIA86bfTA0ilOc7YnsFuGgDWN
         LRAATof3mgk1AQ5AQuHKGxCpFx9t8LDjCMeBja5hVF1GZR6stDUd62+RZfK8K9MNcQJB
         VuiXxiZbZkawFldGGq667R7AdA6X7gsuhZCaIptDCeUJ8v5w4LLNuJ3Tjng1IqZ+MD5l
         GTCDzY4+w5YJzZ6eIhqM1CtveMyzWcA5AQxGHLWQWASQWZrWfIv14ZhuNm91OSu2KKvv
         7nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716819971; x=1717424771;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7c0ZrJPynvxMLH92Q3X2WTOon5tSRNZ2c7KU9q10EA=;
        b=BPOSJ3cYcLoNmJ1J7C9OeSRYDliXp5Wrihb9JSXI+3T82LTDT5i//SKKM3cE2Pj+Yq
         ln/oK5nEdiKjuzt5WyPctMVoD7phHoVQQmVc9Hn3R2KOwRQZfNfn1PWnDqkGLN4dQHzU
         gVTiV+WKQj3S41/v6ZJkQ2pbZLL+HJ1TfgaKRF6N2WiW+XrBjfCLPY6uViktkztmyA9g
         RgT6JOUFOotGcbt2q017HAEba96a74Bus3gJ/oWhDMCrWKTK/toBSQhFdOmct2jrRuKK
         HMLwr5mfKrcPBPdiIRn/jHpQyWD9UgZSM14Bdm9JfC81xr+VRtCPfk78EC2xtiLbvYNs
         a6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUJ0/SQFsWutU0P/ckpyP3RFWU/tMGM+7MMYD/hJ6njpFoRKvAtmq8fQnm+FesK84ABOd2ublS38RBAejTIAhAheIeVReafkUyHg==
X-Gm-Message-State: AOJu0YwDMAoArLLF4o7P5UGyZWe1wU0hocst59KBK05y+UT35i1Ui7It
	iF8BlQaYfI+QeR4/S84eE7tTT1squNhmtcrlK7mpeJ1fhAmtPrvfKRqE+lpPNgA=
X-Google-Smtp-Source: AGHT+IGDy6lBIZRlSXWUHrbdvlDpDLY1u7lkMBWjrjOr4cWf2ElMKM1ipIguJpApXRrP72OijJSLjA==
X-Received: by 2002:a17:906:3614:b0:a62:8116:cb59 with SMTP id a640c23a62f3a-a628116cbf3mr535401266b.30.1716819970946;
        Mon, 27 May 2024 07:26:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6283119b12sm420845566b.192.2024.05.27.07.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:26:10 -0700 (PDT)
Date: Mon, 27 May 2024 17:26:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-gpio@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: amd8111: Convert PCIBIOS_* return codes to
 errnos
Message-ID: <50e1c6a7-f583-4b5b-997b-2e505b3df0ec@moroto.mountain>
References: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
 <09f2f3ac-94a7-43d3-8c43-0d264a1d9c65@moroto.mountain>
 <7d475c6c-8bbf-86f4-b2d8-8bc11cb9043e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d475c6c-8bbf-86f4-b2d8-8bc11cb9043e@linux.intel.com>

On Mon, May 27, 2024 at 05:11:32PM +0300, Ilpo Järvinen wrote:
> On Mon, 27 May 2024, Dan Carpenter wrote:
> 
> > On Mon, May 27, 2024 at 04:23:44PM +0300, Ilpo Järvinen wrote:
> > > diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
> > > index 6f3ded619c8b..3377667a28de 100644
> > > --- a/drivers/gpio/gpio-amd8111.c
> > > +++ b/drivers/gpio/gpio-amd8111.c
> > > @@ -195,8 +195,10 @@ static int __init amd_gpio_init(void)
> > >  
> > >  found:
> > >  	err = pci_read_config_dword(pdev, 0x58, &gp.pmbase);
> > > -	if (err)
> > > +	if (err) {
> > > +		err = pcibios_err_to_errno(err);
> > 
> > The patch is correct, but is the CC to stable necessary?  Is this a real
> > concern?
> > 
> > Most callers don't check.  Linus Torvalds, once said something to the
> > effect that if your PCI bus starts failing, there isn't anything the
> > operating system can do, so checking is pointless.  The only fix is to
> > buy new hardware.  There was a hotpluggable PCI back in the day but I
> > don't think it exists any more.
> 
> I don't mind if the CC stable isn't there.

I don't mind either way.  I was hoping you were going to say it was for
some new hotswap hardware Intel was working on.

Smatch deletes all the failure paths from the pci_read_ functions
because otherwise you end up with a lot of warnings that no one cares
about.  Uninitialized variables mostly?

regards,
dan carpenter

