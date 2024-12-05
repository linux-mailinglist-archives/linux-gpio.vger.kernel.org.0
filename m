Return-Path: <linux-gpio+bounces-13557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0DA9E58E1
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 15:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A8CB16A494
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 14:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1E321A437;
	Thu,  5 Dec 2024 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lS5E696G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC99921A421
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733410322; cv=none; b=MTTN6SFsFfDc0Hw1v2mAzQw/8tDcZ0alLUP6rwtMpqmIiQnYSlLN4QefCFKWYIwuFLSrSnpDB0Wrf6z0JpjJ4cJRGv/qGDnXQgNJRYUDZoUFFG+SbKz2ocsiXLoVFpZm8SJMJFy2O7I5fn1bwps5PAjg/YEaoGNv59/YFTiO4IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733410322; c=relaxed/simple;
	bh=Eoaus0qky9xWzQ1H+e7NYl1NMhLuaCg2rD/885DuwKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKNjqqGAi6nDwSgWw3XHk4KFxuO1qpNWMBbO2hp0WiNTXXjRQ1MjybLxEUQ+QkxEuWs0BOqmjpZDGdejrOvmZstMXPsuCGCj1pazpQsnGIp1c7vxF+bAwnbCqd/+z7z6+1wD9RBuG4kkTMaUBvLDA5BAzUVqKsksvhZgfoMYXqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lS5E696G; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fcf8406d8bso1769768a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2024 06:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733410320; x=1734015120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OSGX5Uzh6mOhImb4biOls4fVu8gAfzc/827p0xtvIs4=;
        b=lS5E696G/WoO7bgBV27Z1tXsaw6ePJZXNainmrY2dUYCpy6CGNNrUjMR58mvN5oUV/
         yXKJdGsy4z738PaUiEHOr2mXnNUBTTe5t5297oaKIIo0vJ3ehexSgl+ctPFbu35g5m0+
         CwZWCqgxacB2XNrTUqKwPbgAJ2pwDS7/LWoJpUmz8mRDSgGLKbTx8lIzDKtgekij8MoM
         h4EHR5IytXTvilrTW66CTQqJ0ZResWC6QiTTEHUsDJNRQ5mKT1H3aGLF3rD5SZ8bFHJf
         MBfrfsSFoTv2GTOegpBhujDm94VMoHKNm1OkDv+Gy41PjZYZ0cRvitkFSrXdOBZ6xmRa
         PFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410320; x=1734015120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSGX5Uzh6mOhImb4biOls4fVu8gAfzc/827p0xtvIs4=;
        b=R5S3Sg2KKy/cVNdFhrCUuIgtIPGbSSQzy4Y53oOFjzzK2L1zAJ4XgM2g3HvFl7VoYs
         qCIU1qFIZfBci0MOvf6Mu2fGBWOGHMvYwdEadTkwLA0VpmUiIwNujfLm65NcifcqRUIC
         6nlBkIL6y9bP39cX+x4SfCavCjDognK4gvknzIqz4ylsps7wfTU4o1gqdCOjK3sirFQX
         njuk+tzJbA+z5aIVKULh3jrwGkwUc5v+A3N9BltyL9gSQuYvGIwCPGRtm3b2OiU/MnmB
         BY/ZlIrpLV2AB28xwFnW5/sxFSjgha6fpaP6crmh5EVK+h/ZsaCCAgRjZ+Dql6KRz5sf
         hiDw==
X-Forwarded-Encrypted: i=1; AJvYcCW4xXEVAib2A/9FHxugaXKP33bFfmCcXmrT16G0we2Kh2oex612AWkf6aDdUgki27wOEqHHjOOKZBkF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4aLBR3RoYrKkkQiU1zbFGCPYzR7abACAExcEa1Uj9Gcc1iDcH
	fXjccxje00cPMiiNZGJJqJmVxdezCo6SWbhc9HVzipY1J+9y2dcp4DySyg==
X-Gm-Gg: ASbGncvftWXXyJujbuSfQpln1uYc+PP6xIyiiYD4vexJrTuiFCM53s60g3EXPBS6zO6
	5KGcUeMox3O78+dBfocBOjqqIyYcKOAPg7xh81JaG2vpzTr+gPlv65TnBrwD1JFtz+zgnXPUN7S
	Rrvza0LgbbHGp6Cu6ZsZlVTY4xsFnkMqaZVFYUavXCwolTMjZ3ezwrSz3WMd6FaM36ZIjnUTEFN
	dQXc8Qw46v/FTHjwDotEbGoz2RGrP9rpbKFyfotD2kem0enMUNgBH30pkDWLh/SQx5J0Q==
X-Google-Smtp-Source: AGHT+IFUkElHE74cUsqYN6eXBa/ESlSZ44YFr8KK68QeBCFF4ZyQIu6fcbOtDBem+wuHbjhUm4sTGw==
X-Received: by 2002:a05:6a20:d43:b0:1e0:d105:1f5f with SMTP id adf61e73a8af0-1e17d3709bfmr5598617637.4.1733410319904;
        Thu, 05 Dec 2024 06:51:59 -0800 (PST)
Received: from rigel (106-68-208-191.tpgi.com.au. [106.68.208.191])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd1570b6fdsm1385431a12.46.2024.12.05.06.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 06:51:59 -0800 (PST)
Date: Thu, 5 Dec 2024 22:51:54 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Phil Howard <phil@gadgetoid.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] bindings: python: fix license tags
Message-ID: <20241205145154.GA293842@rigel>
References: <20241127150529.126896-1-brgl@bgdev.pl>
 <173340338516.43992.7014674664044743650.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173340338516.43992.7014674664044743650.b4-ty@linaro.org>

On Thu, Dec 05, 2024 at 01:56:48PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>
> On Wed, 27 Nov 2024 16:05:29 +0100, Bartosz Golaszewski wrote:
> > Several files under bindings/python/ have wrong license tags.
> >
> > In general:
> > - Makefiles should be covered by GPL
> > - all python sources under bindings/python/gpiod/ and
> >   bindings/python/tests/ that are part of importable modules should be
> >   licensed under LGPL
> > - executable examples should be licensed under GPL
> >
> > [...]
>
> I haven't heard from Kent but I doubt he would object so patch applied.
>

Sorry - missed this one, but I have no objections.

Cheers,
Kent.


