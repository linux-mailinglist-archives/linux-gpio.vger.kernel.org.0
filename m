Return-Path: <linux-gpio+bounces-11369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF099F45E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 19:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51F91F24C0B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 17:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9CA1F76C4;
	Tue, 15 Oct 2024 17:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="z2xencvK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7271B3952
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729014581; cv=none; b=pq0+0qpCMvDNZGzkWxCsezYuzf8/u7ZdAlbQU9BLcHpb2DNHKs+kaeFNxWN1bEAwkXRN3gpFIixTiezFp5pkpB0TktU6PM9ixPc6ysE+Abd7eaiiyGLQ6MpJYoukFX97dqzPHiz3AJj3OGenfNFXVDlpM7wEuqPDY9zMI4zki/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729014581; c=relaxed/simple;
	bh=YuBRRSE62Po+Vp+xajo030QRE/vlgNu3c1bEbLyyrhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQML8mtEcQ2sL6fjAFxHR4ykxSROwqOXFOye+JOdHP0+CfLT1hXN7OAG12B46m0mp0E3VHVwjSgBNE/Gs+1Tp2Xc7sDePn1orKptnGCjGSjyZ9dLxYtUMrK2tXNgBhReVqdlBQqxXgvWh9Pn4+emcblc+Qex+2S60+ReDzS0T+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=z2xencvK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20cdb889222so24785265ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1729014579; x=1729619379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFxZbAiEfgNgS79HfWL3/YAPHzfryH9zP8YnYpi9Hts=;
        b=z2xencvKwDa/N4P2B/LLIk2e+PPzXCcMD7h1PcIr457IiIk6Gnk2Y/9mU3d5S7MXra
         7qcWjofj9MsUbz826evYcb6Vx0jlJZ/ERHGAhNrqrhPV1f1qMSqR+aXFJRzDxruA7YzA
         Htdw9vvtJ5h7BlS6c2E6NxVTVPyzqdhhz/2+8v9JsF8MscPzd8hXxag7g8sEbzQf8SKC
         P6lMDzaI9t5a9scz+mtO1DEP2Ymd2q+0mMvwB725un0IAq1cKaPY/+2eDkklFL/N0Cxd
         S+/fJrqnvBki8dwww2GPT7x9HascAR1zk5mHQ8+LE1O3WCm3UrGDdmVeAcF4bydONl8y
         lnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729014579; x=1729619379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFxZbAiEfgNgS79HfWL3/YAPHzfryH9zP8YnYpi9Hts=;
        b=Rh+UOPCsFgdVhuvzcmEvybVeNIKiZY1GDapfKMoECGrolA67yT8V9MtsaWoFX+8bE3
         6mC0KK1I7B1TMl1eR7jrrI0yNpSVi0v3IXt5LIbsD8GyM6uenUueJXQUorwrWUmk6P6O
         9OdOfgtzReyKj/UpI6FbiiMn/SS0GVWXnMD50BJOczSBr57UOafftw729GbGRLjOF7h+
         ALw0zkZgExR2CGGRt2rL2Ec1uc0dlssyEcZEOCtLV5RJFX2e7/xctC4+G3polkLcL72x
         9lvfgL3g38CrMZXDWSbqi/vI2WpyDJqJnGE+fuaEx0KM2600fgssWXYgbptzclSlptQK
         znSw==
X-Forwarded-Encrypted: i=1; AJvYcCU8sTg39Iwbkh+Ob20z9Fl8XbmjPbsoyJqHghU2kfRvx8jPtWTOuRwoRrGFOQrlV3MaGXTqjIyYw0nN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmk6HRF6iTkiN4oYmXCcgbKtsVe89DJGTcfWcsK0MIbH0QO3uG
	yJAMJHsAiEf2KGFcOqo2fQSJGniqdGjF7XfkWuVwcLpoXIaihgWLz5I3ktg9E0g=
X-Google-Smtp-Source: AGHT+IF13iWmOsMT75jd4Wsl55ZJrrwDNsxHdrFl908+psweQzWneSLg+QZ+YbWznEF4B5H4v3kMxw==
X-Received: by 2002:a17:903:1c4:b0:20b:9f1c:6877 with SMTP id d9443c01a7336-20ca16ca0bbmr242755865ad.57.1729014577630;
        Tue, 15 Oct 2024 10:49:37 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f995bcsm14804225ad.77.2024.10.15.10.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 10:49:37 -0700 (PDT)
Date: Tue, 15 Oct 2024 10:49:35 -0700
From: Drew Fustini <drew@pdp7.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: th1520:  add a CONFIG_OF dependency
Message-ID: <Zw6rL508BnZRwBvC@x1>
References: <20241015151126.2401855-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015151126.2401855-1-arnd@kernel.org>

On Tue, Oct 15, 2024 at 03:11:13PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When compile-testing without CONfIG_OF:
> 
> drivers/pinctrl/pinctrl-th1520.c: In function 'th1520_pinctrl_dt_node_to_map':
> drivers/pinctrl/pinctrl-th1520.c:455:23: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Wimplicit-function-declaration]
>   455 |                 ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
>       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                       pinconf_generic_dump_config
> 
> Enforce this using Kconig dependencies.
> 
> Fixes: bed5cd6f8a98 ("pinctrl: Add driver for the T-Head TH1520 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index a6acc27c9a83..3fab5ebeb2e0 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -564,6 +564,7 @@ config PINCTRL_TPS6594
>  config PINCTRL_TH1520
>  	tristate "Pinctrl driver for the T-Head TH1520 SoC"
>  	depends on ARCH_THEAD || COMPILE_TEST
> +	depends on OF
>  	select GENERIC_PINMUX_FUNCTIONS
>  	select GENERIC_PINCONF
>  	select PINMUX
> -- 
> 2.39.5
> 

Thank you for fixing this.

Acked-by: Drew Fustini <drew@pdp7.com>

