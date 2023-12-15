Return-Path: <linux-gpio+bounces-1528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3764C81453F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 11:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1C831F23D28
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 10:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DD218E14;
	Fri, 15 Dec 2023 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4cS0VIg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CE918E24
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28659348677so317694a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 02:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702635303; x=1703240103; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xqcNGU6ck1zcC1JF38W+jlxZ+1VOq4foxBPPizm63hM=;
        b=T4cS0VIgPwfhbk6MNEcL8v7oT7xbaiLON1/WgwYAjgI/L2b3auiK6DOgHpVy0oSsl6
         ROIFXELdbARTMYMQz4/3hJRtytJJM8TX2jqMB38PTP80zsVMM8x2HKD2VP+u/ZOnZjWr
         /N14YCKys6FN1dQptqI6ekmKM+tX3dDvLoMZAdGr50Bz1e1BwSRV4gwuc0BE4jWoRMsP
         Tns0rEA4CUCgSSzal5puQrCpdIe63IWXL1DUTLfp3y0D870vIlLadHB/T6C0iPIpptaj
         D+DezUF0VzzA01xqP818hVEUWDVMnH50butfu9DqMyuwOIZfJafi+n/ZAU3WVkzUFEBJ
         6iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702635303; x=1703240103;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqcNGU6ck1zcC1JF38W+jlxZ+1VOq4foxBPPizm63hM=;
        b=tX53Q5ecwtkQtzUw6jwyrp9CkHhRlF2mh6lC9sl3tckxzv/k3DKxKqze3NsPekewLI
         JtS+csvNuhaDnB03pbVR3M5gGCisJzm/O3WlP9LRPbfV+51qHQJt2iSz/doik89+SgEx
         2/myIEHzET+9OR+KT3nr9GDuY1y5Z5hcW+UDGlVPPpdfl08l9EGQmb6gC8pr1ZJuCHyd
         /CC3wgSSFUFGLF+LuG56D5CULsbWOgOBOEPJbGF7vC0LP6IR46kTSWBvMd979uxquPaP
         OqH8S+XRqOcHg1+1Xk13Tkh8BNJ/hfyZkdlMQsl2cNKwTHsOssEcn4KsDoeD6/HDVyvW
         uZRg==
X-Gm-Message-State: AOJu0Yyv5aX4O/nlVUEnSuvsaGRFREcVJv24/C72ZWMc8cAcMg0xOokP
	qRYd5XZxb7UPxCmONoL713Q=
X-Google-Smtp-Source: AGHT+IFluv1XqB8JaC+7NXy1ilb2TINRrgjPY5DJM+jO/m4pmh9+aqFR+ZxCmIu3Jt5TvtpeVStQNQ==
X-Received: by 2002:a17:90b:216:b0:28b:3917:3cfd with SMTP id fy22-20020a17090b021600b0028b39173cfdmr179451pjb.12.1702635303250;
        Fri, 15 Dec 2023 02:15:03 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id e19-20020a63e013000000b00578b40a4903sm13128935pgh.22.2023.12.15.02.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 02:15:02 -0800 (PST)
Date: Fri, 15 Dec 2023 18:14:59 +0800
From: Kent Gibson <warthog618@gmail.com>
To: "18711529674@163.com" <18711529674@163.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] How to gets gpio status but does not change it
Message-ID: <ZXwnIwtsQ2mf8L1C@rigel>
References: <TYZPR01MB462621CF5B056907A3340C1FF193A@TYZPR01MB4626.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYZPR01MB462621CF5B056907A3340C1FF193A@TYZPR01MB4626.apcprd01.prod.exchangelabs.com>

On Fri, Dec 15, 2023 at 07:49:19AM +0000, 18711529674@163.com wrote:
> Hello.
>
>     According to the example get_line_value. I try to request the status of the gpio, but the return is always low.
>     try 
>       gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_AS_IS);
>   or
>       gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
>   Their result is always low
>
>   Is there any way to get the correct value without changing the original state?
>
>                                            Thank you in advance for your time.

By status you mean the electrical level of the line?
That is returned by this line from the example:

        value = gpiod_line_request_get_value(request, line_offset);

The gpiod_line_settings_set_direction() controls whether the line is
expected to electrically be an input or output or, in the case of
GPIOD_LINE_DIRECTION_AS_IS, left unchanged.
When the line is requested by gpiod_chip_request_lines() those settings
will be applied.

Assuming your line is already configured an input, neither of the examples
you provide would change the electrical settings of the line, so you are
already doing what you have asked for.

Are you sure you have the correct line?
Have you confirmed that the line is being pulled high externally?
What does gpioinfo report for that line?
Have you tried using gpioget on that line to see what value it reports?

Cheers,
Kent.

