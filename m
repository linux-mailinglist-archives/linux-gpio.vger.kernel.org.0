Return-Path: <linux-gpio+bounces-2225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2682D856
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 12:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5E001F210CF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 11:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5778F2BD00;
	Mon, 15 Jan 2024 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsqL4TD2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20E22C683
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d426ad4433so51168055ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 03:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705318258; x=1705923058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VmEkkMG+D7NfvVBZzoCW2RYfji3+B+GZluZvowg/poM=;
        b=LsqL4TD2vnAacqGdNA2qfkOAMYRlTM24zoKjKrHz4LNx2+88IEbfDmP755b7UweeiC
         t/KneGGvBjrXelqbAjxli1MxwFPDboIOYeYwsx+fXIh7P9kTFgoiIPo1TGGnsT2zboiE
         xJVIsC9O2x+qnU/gTIuhpAXb65zWwh0MsitAwPkQ8lF9YdxsQsErtfD2/2h4OceSQGsb
         rgP7ECUaARjpOoSE+f4+nHGMs8OqTJx9pD/ilhrslZUbGwE7160utYUHxiHA78B2vV/w
         FzprEjvg4Nqis8Odu8mpp29wHhCMnTaVLwfK+Qn59FpDRlrH1hdBdI5Igdzld6K8WR0N
         rOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705318258; x=1705923058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmEkkMG+D7NfvVBZzoCW2RYfji3+B+GZluZvowg/poM=;
        b=Q+XJPInr0/USacgTPREcWPYnsUUKHD4Y1AumB7UnATo7ziKhyiIKTQ4nfQUXHYQTZK
         /3F+XgQsQVM9qTB6qy/UH9QWHRgJIv5jLrWNJmKTmaL4mbbM+Xx8y7r9gG58w23nctEQ
         Esl6j4pFnwBrytrU2p9qOWfc/PYhyLHFbyT2XG1Mj3u7hIMUt66vxA6sYf1CSjNetYyV
         fPYJsfElkuVC2+Wn12qOJAnqcwUdOVGAxKcYLvbwBPZ+fjMPBUy9mNdBCJ4kP/PzIang
         /8fnsXLSUDVGDxnCccl1Ncw/2jtYtOqeuOc0imEhdPoQ2LW5o1WBC8FTnuLY/fmLmQRm
         3ygg==
X-Gm-Message-State: AOJu0YyRTaX5228INdjwUUUSkzLzFAF8y5nP+QcfaPMr6j94MqnemNVA
	aeoDcOAEXSyaaI5stLJJOKc=
X-Google-Smtp-Source: AGHT+IHld6aTQsON2sRqnyw1twT0P9THLdQnPFeM/pIq5FiKVUyf8XJeT0JLS08GNM4u4skNDMesBQ==
X-Received: by 2002:a17:903:40c1:b0:1d5:2b3:5feb with SMTP id t1-20020a17090340c100b001d502b35febmr3077731pld.133.1705318258177;
        Mon, 15 Jan 2024 03:30:58 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id jc22-20020a17090325d600b001d5a79547cdsm5519540plb.131.2024.01.15.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 03:30:57 -0800 (PST)
Date: Mon, 15 Jan 2024 19:30:53 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 2/2] README: mention the linux v5.10
 requirement for libgpiod v2
Message-ID: <20240115113053.GA45220@rigel>
References: <20240115111929.28628-1-brgl@bgdev.pl>
 <20240115111929.28628-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115111929.28628-2-brgl@bgdev.pl>

On Mon, Jan 15, 2024 at 12:19:29PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Major version 2 of libgpiod requires linux kernel uAPI v2 to be available.
> This was released in linux v5.10 so mention it in the README.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  README | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/README b/README
> index 632aab3..7680915 100644
> --- a/README
> +++ b/README
> @@ -8,8 +8,10 @@ libgpiod
>               character device (gpiod stands for GPIO device)
>
>  Since linux 4.8 the GPIO sysfs interface is deprecated. User space should use
> -the character device instead. This library encapsulates the ioctl calls and
> -data structures behind a straightforward API.
> +the character device instead. Version 2 of libgpiod requires the new GPIO
> +character device uAPI to be available which was first released in linux v5.10.
> +This library encapsulates the ioctl calls and data structures behind a
> +straightforward API.


This wording is a bit awkward.  How about:

  Version 2 of libgpiod requires GPIO character device uAPI v2 which was
  first released in linux v5.10.

I prefer the "v2" over "new".  I would settle for "latest".
The "to be available" feels a bit redundant.

I also tend to drop the "v" from Linux release versions, and capitalise
Linux. So I would use Linux 5.10. Is there a preference?

Patch 1 looks good to me.

Cheers,
Kent.

