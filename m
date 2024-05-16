Return-Path: <linux-gpio+bounces-6414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE9D8C7A37
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 18:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAF1C28484D
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 16:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F008914E2D4;
	Thu, 16 May 2024 16:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYLuVycB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8109B14E2C6;
	Thu, 16 May 2024 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715876566; cv=none; b=dx5C91aGVTc7KmcsFPosSKMbHMrlYcFg+I+BajbBad6phdp/nHHKJLpF8i1mdN8hf5DyK//ZS9R3uaPCI3VHbHQuRkZJsS2kXgXiuq6vLywKLI5mY4ecbZmD9fbZDJs3Nn8QIe++yd/i5/jWN+nWeCCPPQAk1iJqefS5VWR3/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715876566; c=relaxed/simple;
	bh=gb1L4jLUSU1Zhbih/GLlnGjB6dmrX3ukdfokLAn+Xss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xj/7t/HtyieXWoWJMfZIMToiSYg7rrpVbPKFcPb3CyzXedFT0CHn7V0l1Wai30snkcGrKnIL9UB1RFkpVgpczS3Fwg/Q79+gMO7tdO4nFc7XWE5uwml8d6SOZUp+Zw5bO5GzdK8uDHOpApeM87+KL/Q7OJIq7SD+trSjUvVDucA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYLuVycB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so408955b3a.1;
        Thu, 16 May 2024 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715876565; x=1716481365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Whh5DjtIx/bucX5mjnvOLaK+szpTem5ldytlDXi5J4=;
        b=hYLuVycBTQqa+dfQykSC221T7T4zVYnSmJGF2hTm9WOy+2qhEnoEssFT3EJDccRWZ2
         eSt45Oh/SFEzhaFsrCqC4Qjc2PKPhq97F5s5dc1+2gkDe6Xo5Z4I2rW3Cf1nQzPyKB3l
         FKG8ftPDb11T7558zM8Dgao0V/R6x4vX78R654SM50GMPTQ0+8aREi6ckLqnI+VC03bQ
         NBr2kA3kFXWVa5DpKsMlnnZz+R+ooSSE+ZkTd6pIIFnVAxfOOHYQ8XOB1JGC3lGYLXGv
         ptWArH5ypvU1/mrsVPaY1Ao+9abHGqzWzv7EDoix2JwZZsNuvFa4wemT+PkoplDafJ0J
         9KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715876565; x=1716481365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Whh5DjtIx/bucX5mjnvOLaK+szpTem5ldytlDXi5J4=;
        b=E45s6W+NhF9ZpDxAY49bHlmEZPCwaI/RkD6xloLQOJAFaJGTQFDrTDgcMUnNYihVCa
         4R6XvzeUYUhHJ/hktntpQY9x9HUk6N1Bz8REV6En3+UC6apG2y90YXYfp62l+iCPB/1/
         Vy5gKQQ7daZO6AwOlgjGdnXJi0RCca8lOWF1cFI6bRTkMQWKxsHEg7lpRhr5aSgxydLr
         BaEtoN5fr10Fg6tzQD6CGCQ+6UBkL/HNQT7GkGOjBD2NSl7OH3AHK4TB+TBcN3zOawml
         M1tBXt699+wEcdfr/lUf486cFIF4dSVLdWYsiJJaR31Oo+QY9d2/BrEDuHVGjg0hzH4i
         tBSg==
X-Forwarded-Encrypted: i=1; AJvYcCXgUCvbrekKNSvERaZgI5Ef3OwWXEIhjqWdKubQrUBGHpC37Bw50FLTgnNwJgJ3l3RWNCyG1kH1ITnzsE7n0wE/uBGUuD47gddYLwP/Qhobs0y8JA6ML/MfP/6+l+jNqIqc0uOXGOGeZQ==
X-Gm-Message-State: AOJu0Ywa2gImqOVzmArPpND3ifz7gUeWDFhcgXvbp+1LRdg1er/mxT42
	RThbBNiEzeBvW+peRAA/oqvoR/PtnsDV/NpqvlLHIZ/XNW3GDaKNIU8Lkw==
X-Google-Smtp-Source: AGHT+IGlIk85rDTE/gGy4ZF4rQnnYiW35TBTg7ui9FEWCny5QY30wMJLVZCXfg1hijoH8quGQmdY4g==
X-Received: by 2002:a05:6a00:1ad0:b0:6ed:1c7:8c65 with SMTP id d2e1a72fcca58-6f4e02aaddamr24423770b3a.10.1715876564631;
        Thu, 16 May 2024 09:22:44 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f676723725sm3505702b3a.78.2024.05.16.09.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:22:44 -0700 (PDT)
Date: Fri, 17 May 2024 00:22:39 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Hagar Hemdan <hagarhem@amazon.com>
Cc: Norbert Manthey <nmanthey@amazon.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: prevent potential speculation leaks in
 gpio_device_get_desc()
Message-ID: <20240516162239.GA184911@rigel>
References: <20240514122601.15261-1-hagarhem@amazon.com>
 <20240514124221.GA76024@rigel>
 <20240516125742.GA14240@amazon.com>
 <20240516145540.GA116534@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516145540.GA116534@rigel>

On Thu, May 16, 2024 at 10:55:40PM +0800, Kent Gibson wrote:
> On Thu, May 16, 2024 at 12:57:42PM +0000, Hagar Hemdan wrote:
> > On Tue, May 14, 2024 at 08:42:21PM +0800, Kent Gibson wrote:
>
> Now I need to test your patch to see what it actually does.
>

Tested.  Fails.  It does what I thought it would - clamps the offset into
bounds BEFORE the call to gpio_device_get_desc().

The appropriate place for this fix is in gpio_device_get_desc(), after
the bounds check.

Cheers,
Kent.


