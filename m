Return-Path: <linux-gpio+bounces-5248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1F89E07D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 18:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8467AB24406
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 16:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD5213D63C;
	Tue,  9 Apr 2024 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWg4Bz1a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB5D13D62B
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712678724; cv=none; b=qXkrKz2iWjmbcvV8SfNeSS3ZiFaUCk9KHnPJu/OQlN/+YiUDN/oyoJ1qTURa6dg7HHPnF2IaEo7fJhEHDCFdsyPoOLFB38bpJ9UB5/IgRCHUVxILlPIuhpjrwl5lAmjP67XG0XOWPy41WGnWCKyZ2h73UMRPJNEyy37s4pOiVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712678724; c=relaxed/simple;
	bh=VvS9e3qQZ+8nCUrq1f6JWpascHTYUQAH3mrCBSkYoYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MF99BMEyLqWXYnc2TJ3bWi9AxSVk28KmqyMXtwZtxHHPJdWcuai0SZ2Ge/xDHYadvRawb2cdjgYaLTPWG335y7KBhOGKdpM0E1dqqcMPSeQdn2a/3rdVTE/7OBXFmlBmkpPaUkKMkAltvraSE1Eq1I0HDW1bAd51lAHPXUjVtMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWg4Bz1a; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e2b1cd446fso42351935ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712678722; x=1713283522; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvS9e3qQZ+8nCUrq1f6JWpascHTYUQAH3mrCBSkYoYc=;
        b=fWg4Bz1axlpxSWE6bHux6xFoSwXvF3nWRe7I75vOEJeSoPMxe385xa5IiHd5MXZUuD
         XVfDFPBkwkceLyG1bdW9VrYieW7z7pGcVFw/BHvX1AcpCgDoRrZi3FXaUWkYPpWwQUMT
         ijatnojdHKELDb24TkPVqxA/hcItxJdJ4vDp4Mh886ZQBPdPpObDMDpgokXqy9ExrH6U
         cZ2IFbCWDVUgdXAgVpPMYHBcES1cSuS6DpdC4hIf3J6kWmcd3ds5rdDsr5ER83us6gUJ
         zKPmruytJMZbppxCb/XmIb738Kwllzg9GNkXMYOE85He7hYc5G5IievWkUk7in+37omM
         +X4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712678722; x=1713283522;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvS9e3qQZ+8nCUrq1f6JWpascHTYUQAH3mrCBSkYoYc=;
        b=blcTAIYURdKXHF9MULY5JTPzzhkP9RRzab6IygB1LlIdA09ZmSauolnH9pofsNs3ci
         b4pkbr36rdL+Sp3T+n3n8UxSYe0+N7UUb66dkRJ9GZkbBfAQVLuV9d/qbSTvNG0+Gt2u
         EcCw35dbEl25yJ1XHNq5aWgyc3rbWIBTeZuLjbFKY0qAD9JNBCBHrmzoLOByU5N/3KbM
         p/qGI/gPt51MFLFOq2BHZl9CQcipgGbpiGGM8O2tgFmq7neW7ZOBCGfFa4nfqyIsZqcA
         fmsdsnp6iUgbwAfar5+bHm5a2vDT8RWfFT4buA/GpvcKLPZOsedFbWZHC911i0i2RxT8
         aRxg==
X-Forwarded-Encrypted: i=1; AJvYcCV1O/AFQNt2oC1hrlHgdf5oHru///GoSidDcIvN22T0OO+pvt69T08uK+WwL+mVbEEoLGFIDiCbI7RPCg/mITK0PHuEMxBFjh542Q==
X-Gm-Message-State: AOJu0YxfUR8e7KcdHbNQIklTy7VLnFsTwUFRlyilWBaV+qXWRBjmaVl1
	THm2Ive6mMZ4SQTwuZE21YkbPMaerQ9IyvKJAik2hPAttrPg4SyypBjmc4Jd
X-Google-Smtp-Source: AGHT+IFe6lMQfeNflWgnigC4nOMyyGDHrgbFwfC3PUKB9SS3nXzOU/FsqlvFY2GuMYzQey/6KY16FQ==
X-Received: by 2002:a17:902:fc48:b0:1e4:9bce:adcf with SMTP id me8-20020a170902fc4800b001e49bceadcfmr156475plb.63.1712678721968;
        Tue, 09 Apr 2024 09:05:21 -0700 (PDT)
Received: from rigel (194-223-186-215.tpgi.com.au. [194.223.186.215])
        by smtp.gmail.com with ESMTPSA id jb11-20020a170903258b00b001e27557050dsm9061963plb.178.2024.04.09.09.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 09:05:21 -0700 (PDT)
Date: Wed, 10 Apr 2024 00:05:16 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Gunnar =?iso-8859-1?Q?Th=F6rnqvist?= <gunnar@igl.se>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 2/2] tools: allow longer time periods
Message-ID: <20240409160516.GA211845@rigel>
References: <20240409093333.138408-1-brgl@bgdev.pl>
 <20240409093333.138408-3-brgl@bgdev.pl>
 <20240409125551.GA69328@rigel>
 <3f31c7bc-de8a-4552-ba48-4432b335f413@igl.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f31c7bc-de8a-4552-ba48-4432b335f413@igl.se>

On Tue, Apr 09, 2024 at 04:58:52PM +0200, Gunnar Thörnqvist wrote:
> Hi, Got a use case where a hold period is measured in more than seconds?
> Specifically for a get.:::
>
> I can see a large number of use cases where the time can be hours, days and
> weeks. In my case, pin 17 controls a relay that heats water when electricity
> is cheapest. It is ok to only have seconds as unit but the range must be
> larger. /Gunnar
>

I was asking specifically about the case for gpioget, where a long hold
period makes absolutely no sense.

Cheers,
Kent.


