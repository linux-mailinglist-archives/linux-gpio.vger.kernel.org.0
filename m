Return-Path: <linux-gpio+bounces-17996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FAFA70FDF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 05:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4F0D3B453B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 04:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B841517A2EB;
	Wed, 26 Mar 2025 04:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2DJSmGX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243FF174EF0
	for <linux-gpio@vger.kernel.org>; Wed, 26 Mar 2025 04:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742962636; cv=none; b=ieECC7tcsj7bMYiuzW3hRcGezc6L4ye8gBPIhgvH386EQsSSx9XQjfbHnbhb9QTXC8FDAnX3hXNHt55rTR3lDs6MXFFv7xy1GkWoZ+0Z7k6ge2LaEY5pZDFxJGxarxSMxhfdpB/WAuIAXdmgCUJf+ZU3s2yiIhBheml28t4rMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742962636; c=relaxed/simple;
	bh=bOUI3r6JG5LCSThQrc0xHbg9KxyhqJeaSsTqdUc9XtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ldtw8LR5+V/sBTwzC2PELr+XbxDY2rTf/oammE8Eev/4oHseHgIOpYwhDRFTql8EuICnuM01yyMxC52gQgMbJ5UjaOS1V4bAjq+1hhDHfideccl3NMsbYoswNej0qdi0hQDUIge6X+jT9Be3yfVCRV8pR57wBi+dcPNqKxHtW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2DJSmGX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22580c9ee0aso130940475ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 21:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742962633; x=1743567433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ygf9o5IR+nEYKJlVNAohJuQKt2tO3CCdfoQdpeFBmjU=;
        b=O2DJSmGXDb/NG9VO6q0Icnc0H1wPJqRRileZfWMzvkpQTf2JpV/qBiRsImUUnq16Xd
         Rp9hxMcGvyYyWXnCL76FoJ5f1s5IMUddH9NoyQgu0u9psr3bJsuerfU4gY7HzdUPoeJH
         olmJ5SmWSDtMN01vNwL2cD5pYRoo7moqZlZxWTRCpB101AtbWDRL7rsCDBzh5IbDHRS9
         A6mMk9e5Vdhls6wHwpl9t7yUzQZ/VrTLxrTo6fdyHkB46KvQoWWOvDHOTRMHRAZNJGra
         vHhUU6RZvnDEzeIKetVJR7XT0lDAQ7wbH4t16fY1Vg5c9S/0G7FbXgQ5zvTPJHR69Bto
         WsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742962633; x=1743567433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ygf9o5IR+nEYKJlVNAohJuQKt2tO3CCdfoQdpeFBmjU=;
        b=VV7Ck6RdW0qobHaSURIexvsCw0FljnUa6Yd1WhS98+PepU+YuBJp42bq94dVmBaWgk
         2fWjyqiO/pQyEngkW8Rsru/7SLoIL4VP2mXfYI1bo133snh9zavTYXDg+fiQLoc6MNce
         C8l4kTM+0AdXVPTO7q1uYcI/m6TF/+pTqnKZRvEnUvdxWvuSHoWoNU3/ujw3CQxdmrwV
         fxG1+Kg9RjBQTJGWsru7f/FAmPs/AEWEugVTkp00LvM04XiN+58L1dzCP6o/wXkessi+
         muv4APqoPTcQVKRSWPbAkGRadDSYDSoMFYU/VErlcdmohLKPELGx5KLOgOW9rTDUwnm3
         QthA==
X-Gm-Message-State: AOJu0Yyf+oHzkAvh8RP5i6AlKLfMP4Au67L/uROnadRpAxfb9155jRCg
	0h3qTRtgW1Nrx9AXiROPKYbqISfE5pkYvDU4HedW5dC8XYzPOan4
X-Gm-Gg: ASbGnctVyNbCSekZQ3n7zTXVowpxK4fBkGP3ZVen2Egc5kv/iFwRhXuGhvK0QfT+ZWO
	NmcHXNlXkXBJ9uzT3fKJcmTtK9/uEafY849d4Ga990EdyNelHnKFoDDiKH59EDMIx7/bpEd56Yy
	uTUD2fbEpCv+Bnj/klsyJ+CdGEOmVsl8KJLb/SPSEOY+dVuRFF/uN8HGd7kS2xEvsQQuB4k0FVh
	gKT8NZYY1cPIj+IKxDS2stMp98xrabWKsETnJJNNwHXDRX/E+R4cToUNfMs24urVT+NAd9uHq2e
	zrfqfDiJ4hObVveRd267HIsAJHwNdNB7KsLvUQ==
X-Google-Smtp-Source: AGHT+IHtv4L5hteZxEr9AxI3ysy4zbE19JB/eh9dMK3Yqdo3cbyaUwcXgk5vK9YA8vAvuOxqPAh6mA==
X-Received: by 2002:a17:902:d549:b0:223:5a6e:b20 with SMTP id d9443c01a7336-22780c55215mr324382725ad.7.1742962632920;
        Tue, 25 Mar 2025 21:17:12 -0700 (PDT)
Received: from rigel ([115.131.241.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45e67sm99492375ad.91.2025.03.25.21.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 21:17:11 -0700 (PDT)
Date: Wed, 26 Mar 2025 12:17:07 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Rostyslav Lobov <rostislavlobov.k@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: Remove useless code in example [libgpiod]
Message-ID: <20250326041707.GA62833@rigel>
References: <34108b89c6fe4ab05b65a0688a3d3e3742371074.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34108b89c6fe4ab05b65a0688a3d3e3742371074.camel@gmail.com>

On Mon, Mar 24, 2025 at 11:23:17PM -0400, Rostyslav Lobov wrote:
> Hello, I noticed that `libgpiod/examples/reconfigure_input_to_output.c`
> has some useless declaration `struct gpiod_request_config *req_cfg =
> NULL;` and later free `gpiod_request_config_free(req_cfg);` of the
> variable which is never used...
> So I'm attaching a fix patch.
> Rostyslav Lobov

> diff --git a/examples/reconfigure_input_to_output.c b/examples/reconfigure_input_to_output.c
> index 451bb0e..734a99c 100644
> --- a/examples/reconfigure_input_to_output.c
> +++ b/examples/reconfigure_input_to_output.c
> @@ -71,7 +71,6 @@ static int reconfigure_as_output_line(struct gpiod_line_request *request,
>  				      unsigned int offset,
>  				      enum gpiod_line_value value)
>  {
> -	struct gpiod_request_config *req_cfg = NULL;
>  	struct gpiod_line_settings *settings;
>  	struct gpiod_line_config *line_cfg;
>  	int ret = -1;
> @@ -95,8 +94,6 @@ static int reconfigure_as_output_line(struct gpiod_line_request *request,
>
>  	ret = gpiod_line_request_reconfigure_lines(request, line_cfg);
>
> -	gpiod_request_config_free(req_cfg);
> -
>  free_line_config:
>  	gpiod_line_config_free(line_cfg);
>

The patch makes sense, that code looks like a leftover from a cut-and-paste,
but please re-submit as per the CONTRIBUTING section of the README.

Cheers,
Kent.

