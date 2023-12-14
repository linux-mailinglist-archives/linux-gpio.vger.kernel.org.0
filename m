Return-Path: <linux-gpio+bounces-1483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C452381349F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 030551C20BD8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E2D5CD02;
	Thu, 14 Dec 2023 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adlxYrNl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA66181;
	Thu, 14 Dec 2023 07:23:07 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28b0016d989so964678a91.1;
        Thu, 14 Dec 2023 07:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702567387; x=1703172187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohq2TqyeCp7vALWI2lnBhc2DS++39eptkisQfLH66MU=;
        b=adlxYrNloCruW6m0g9Jvz/b0MaBi3M4vvMe4BXK6LsFnHJ0u+FOLGUVDsTXwk+rLeu
         aGgPZd3ujf9CDL8sJ/Opc9GIVpaodIlvtBO5NoCesid3MY+ncNg0jtrlU4jQaZIzXrW9
         OWe5g3RlEnFwzEIRKMjJW12deVvXqJnpqD1mt64XpMPbuzUGF9++OJfpTwZLM/r9Cy7x
         PiPi0m1/ysUSRNrMvkTpVxuiTu5To5eTmB13Km3YfrvwZ9UdZvJsKH0CSC+OI3qzAx+M
         UvxjcoZsoa0zId2LU3rKAsEolo0Oe+y7nIQL4lZorMhZiHObA+lNJhgObkMZIwQU3xH9
         ETng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702567387; x=1703172187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ohq2TqyeCp7vALWI2lnBhc2DS++39eptkisQfLH66MU=;
        b=W3jbPc1zjePagFYJ1mS8G9Q1+jGQHKiwlxblEwBQVzJi5ql2jVYG51ptfdxRWA8pbM
         kAA7Pjty6rSjz1DLz2ayA5HoWcbBhshf0PI1bQ6FLQHaweYCZPf2vdcECyporle+sMHf
         CxuQW8p20BKcTh1856NdEEpm1KcSJ0+nkWFcwMaJQz7EnocTU1ZN/wuYKcEbZtVLdP2+
         Ii8ha9GfvoXciU8i3vRuvXIq98PEHDlIho3A6yf/Pn12u4PNDYOUTejG1uW/WivOzLp3
         c8rQpS90iPp6hqGSBqHhxN4M+9yuvpaDqSEX1g9cHpTOqxGNrf+KY/jKVhcbnaEWDa2F
         ZPJg==
X-Gm-Message-State: AOJu0YzruoP+F6aNKcR9cnNrXFT5wi4cnF+fz48XFEdYMcdeCkdRUzzE
	2I/LaIk1+gnhR9HE2EOTq9LF0ZqI4LU=
X-Google-Smtp-Source: AGHT+IGD+rRvReMP6h2SdpAYoybvnIr/ZhP8lpc4PfPaVQm+NxJKk3LyWFOMGt+1LL0zWTlEfF2VAA==
X-Received: by 2002:a17:90a:eac1:b0:28b:1d62:bfe with SMTP id ev1-20020a17090aeac100b0028b1d620bfemr263811pjb.43.1702567386644;
        Thu, 14 Dec 2023 07:23:06 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id nb11-20020a17090b35cb00b0028017a2a8fasm13412214pjb.3.2023.12.14.07.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:23:06 -0800 (PST)
Date: Thu, 14 Dec 2023 23:23:01 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 5/5] gpiolib: cdev: improve documentation of get/set
 values
Message-ID: <ZXsd1Uhzg328Zdsy@rigel>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-6-warthog618@gmail.com>
 <ZXsbZOEjpTN_8oZQ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsbZOEjpTN_8oZQ@smile.fi.intel.com>

On Thu, Dec 14, 2023 at 05:12:36PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 14, 2023 at 05:58:14PM +0800, Kent Gibson wrote:
> > Add documentation of the algorithm used to perform scatter/gather
> > of the requested lines and values in linereq_get_values() and
> > linereq_set_values_unlocked() to improve maintainability.
>
> I believe this is based on the old discussion in the thread where I proposed
> the patch to convert this (unreadable in my opinion) code to use bitmap APIs.
>

I believe you are correct - that the code is unreadable in your
opinion.  And I noted that you were the origin of this change in the
cover letter.

I'm not usually comforable with this level of hand holding, but I made
an exception in your case.

Cheers,
Kent.

