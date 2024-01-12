Return-Path: <linux-gpio+bounces-2172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD382C2B0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 16:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 263EB1F21EEC
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211DD6EB46;
	Fri, 12 Jan 2024 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8EAQUfU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70DC6D1AF
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6db05618c1fso4253450b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 07:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705073107; x=1705677907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jm9ImfpSInEXF4wfgPiOSnFQIV8upBt3o3BwwMAeD2I=;
        b=L8EAQUfULyu4qSO1+/AIat0aNyq5ruAh1y1eTC5pxJP9Yp894JIwIDR3pGpwilLZGk
         31REOlcifB15qG5UsJw9nPFfDRB1TZzOHF6CvBmuCljrr6EQRFfgmWVEazmr4hGFyj1M
         QT2lhcnAVi4J71GAd2z/UXUJqsvACk4Dv4oCrp1fDIVDEGFUN4V90IPeMus9kWHkK+BC
         1YjVaSuWj9HCpEn1uZYCQkFFb8ItbUIxmMdDI8GWQeO9NeRsC5p62s7JYkYVVXMIgTWl
         dCswSpJrNx2UB7XnVUk8cg9xH3sFKwR3lnl8LH2COHPNenzgeRQww08GEnMN1zL/BvWg
         ylbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705073107; x=1705677907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jm9ImfpSInEXF4wfgPiOSnFQIV8upBt3o3BwwMAeD2I=;
        b=iJJ0jX4zNh4MyIn6AHQvUgnDOATmlr3GnLOnb4+qdYZIN6K4Nt1YCY2aJ80bljH5pA
         Rsnfr7u6iYwzQzmEd5+R2iJZMr4GIfT3o8fJEGG1aQC7d9ePWLdzrMfg29JuoMdmavNj
         AUYElBZgTjd8Jdi1hA58DmxFHCvJrbWurHMTWZnrouWCDOuDBYCUe2Hob84nklC6R5I0
         KhvYBqQaU2/hk38/0Sq9YrCFqmAQ+LbgW2VHQm1PIbFNSP5/bV619dSnfyDGNcnmtJoN
         7dAneKIhRCUWC3WPTKEgu5ovLoC66jSJ5BJ11nqgaZD78tcTJtOOqxV2YOw9HJtFf+aq
         oXkg==
X-Gm-Message-State: AOJu0YwVEJpFHyp1AqBOjrqTx5Zao8QoIJ90G5Z1ZRr3zKA4/mRFJkp2
	8t4bzJUoqQiMtYCuENI/TdhsU41y48r2+A==
X-Google-Smtp-Source: AGHT+IETIpLRtbrVMmUnDfdehLDVhzvAGqn5cS7rW6uiEouULUxP+VCnbIgbspPA/VruGCfJSHHUEQ==
X-Received: by 2002:a05:6a20:314a:b0:199:a1d4:76dd with SMTP id 10-20020a056a20314a00b00199a1d476ddmr1001706pzk.93.1705073106866;
        Fri, 12 Jan 2024 07:25:06 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id m3-20020a633f03000000b005cdf84049e7sm3182955pga.12.2024.01.12.07.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 07:25:06 -0800 (PST)
Date: Fri, 12 Jan 2024 23:25:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Phil Howard <phil@gadgetoid.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
Message-ID: <20240112152502.GA92656@rigel>
References: <20240112150546.13891-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112150546.13891-1-brgl@bgdev.pl>

On Fri, Jan 12, 2024 at 04:05:46PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The github page over at https://github.com/brgl/libgpiod has been reopened
> for bug reports and discussions. Add a link and a mention to the README
> file.
>

No problem with the patch, but the github page itself seems to have
Issues and Discussions disabled.  And the Wiki might be useful too?

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  README | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/README b/README
> index 69128dc..41237f4 100644
> --- a/README
> +++ b/README
> @@ -294,9 +294,14 @@ Those also provide examples of the expected formatting.
>  Allow some time for your e-mail to propagate to the list before retrying,
>  particularly if there are no e-mails in the list more recent than yours.
>
> +There is a libgpiod github page[7] available for reporting bugs and general
> +discussions and although PRs can be submitted and discussed, upstreambound
> +patches need to go through the mailing list nevertheless.
> +
>  [1] https://github.com/kward/shunit2
>  [2] http://vger.kernel.org/vger-lists.html#linux-gpio
>  [3] https://docs.kernel.org/process/email-clients.html
>  [4] https://docs.kernel.org/process/coding-style.html
>  [5] https://docs.kernel.org/process/submitting-patches.html
>  [6] https://lore.kernel.org/linux-gpio/
> +[7] https://github.com/brgl/libgpiod
> --
> 2.40.1
>

