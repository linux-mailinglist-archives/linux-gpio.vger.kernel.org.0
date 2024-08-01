Return-Path: <linux-gpio+bounces-8495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C3943A26
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 02:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFDA5281240
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 00:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B019A13BAE5;
	Thu,  1 Aug 2024 00:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3PO4Op2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F015347C7
	for <linux-gpio@vger.kernel.org>; Thu,  1 Aug 2024 00:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722470881; cv=none; b=oPJN7BTi4K+HtrkDHbliUKlbiR7reMFfdFfjxKhTMMMpE8vsjeuonu3GcgNSEcFW5Ln5hy7ck67hOxjlLoXYgbSJVvctIoizhewSgWnbrzHysHl+DSrtjX3Fj2B1RlW4LGOrBwfAQeDIXMJhQpIJozH4d/1aXMGgXTGBosVb9nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722470881; c=relaxed/simple;
	bh=C8pSPMgcwLZA1fhD9Jw0QW5UTev+XIASI8pbDcknumg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igyndVU24yptMACq8I2UlD5lxYvz71FGFjQzCL2UqZMlJhW6peE8Xrrhu/ablCaawM1al49Vufda0nF0scncWvOxzHOqTxlz/oRRJSMoh7tJftUV6C84NIkJlSXcXZ/zHxye2xchsnoBH6ff7zsB/l7J1K97lLdM6rz6en0wkrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3PO4Op2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc60c3ead4so45440375ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 17:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722470879; x=1723075679; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6tNQViHfq90v00oR1PSw+aQThZ11z/b4vYTQLjKd+hk=;
        b=k3PO4Op2oftr/sgrkuIDJ4FA5qPKwJTzLO9bOqvylWV3IlSY2o1DzBLYOMb8ZP5AUZ
         S82Kvpl8JVZlkbntUMcx2UucslkVWVGU614juAJl3ipXPAuECN++uSSZ8LsQoCFYFrmH
         /PvLPx1gakGPqMV4/74hnRLNrXRrGFRjyvyypn3zoktWKAoupaDg7uMjAZMgs/hMgkrH
         gFnAB8K8b+vxnPftn2/d+m7f4T0A/x9aWIfEyTtV4tVrUd2KRV9E2gIJuIRILwHTpAL4
         MKSO5yohTFzQ2c7QT9+ikQpUY7SzT0D6OkSEVSvQf6McEZH//KoNsJeWCTbVugJFnt+S
         ONyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722470879; x=1723075679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tNQViHfq90v00oR1PSw+aQThZ11z/b4vYTQLjKd+hk=;
        b=DXH/Q1FXKYQRU0vpqbV/M0zvuZWxIOXFPF9zF4hWRBhWXviPLX4BGHKoVrddt4B1n+
         1dFNIbAcz05SG4F0nsPb6zixp5uSf8lmhxGRShJKF2POczKSsdD8zuXcTiRUG0DYaO/A
         YU6XmJbnMhhRJGtbS98qbmAB9yx9qzITySGHxdSsrksspxtzYG1apgX5ks5UZqsr0v4l
         sRt6f/ehjHwXHKSqy1MSz0jKKBn2kWa95qtb5TIfM9VexaG9Go5Ibg6cZBI2FnxduZsm
         6HHSZ9xeleOcuaXDRUiid8T4P4/RyY4I/0UOaAf2hJPPDw5JqYG0fINAgU9sF/OObv+a
         JQ/w==
X-Forwarded-Encrypted: i=1; AJvYcCW+UhXIdqMWLzFkW22YMKM/hBWFMTgTyLoQr20AlOEw+ld1FMV62Z+6hPIO930xPL854uG2L5RhwSqxPiRBVTZvIz/5PnLtaMMHFA==
X-Gm-Message-State: AOJu0Yw7cY/GPWMdvEKDldN0PANCw+lwoSHiY+PqJRxZN1pUa32KroaT
	+3owJ+HX/WnxszdwbLVPVBTF/VLhxjZkyjJw/S4ooPAvOvLSFQb7lZ1QRQ==
X-Google-Smtp-Source: AGHT+IEISS0hfleps6LHzbgnOrmU/5BVgUDCuWgzFfFjqBA/8nTtvxfdnRcPnMm9M0S+rVh9lktW2Q==
X-Received: by 2002:a17:902:da92:b0:1fb:35c7:8ea4 with SMTP id d9443c01a7336-1ff4ce85797mr11069495ad.2.1722470879169;
        Wed, 31 Jul 2024 17:07:59 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d37b9asm126248315ad.114.2024.07.31.17.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 17:07:58 -0700 (PDT)
Date: Thu, 1 Aug 2024 08:07:53 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Benjamin =?iso-8859-1?Q?Cab=E9?= <kartben@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod 1/2] bindings: python: properly pass event clock
 settings
Message-ID: <20240801000753.GA10337@rigel>
References: <20240731104658.93117-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731104658.93117-1-brgl@bgdev.pl>

On Wed, Jul 31, 2024 at 12:46:57PM +0200, Bartosz Golaszewski wrote:
> From: Benjamin Cabé <kartben@gmail.com>
>
> Python binding was ignoring event_clock line setting.
>
> Signed-off-by: Benjamin Cabé <kartben@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/python/gpiod/ext/line-settings.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/bindings/python/gpiod/ext/line-settings.c b/bindings/python/gpiod/ext/line-settings.c
> index 2cacbef..650235e 100644
> --- a/bindings/python/gpiod/ext/line-settings.c
> +++ b/bindings/python/gpiod/ext/line-settings.c
> @@ -79,6 +79,10 @@ line_settings_init(line_settings_object *self, PyObject *args, PyObject *kwargs)
>  	if (ret)
>  		return set_error();
>
> +	ret = gpiod_line_settings_set_event_clock(self->settings, event_clock);
> +	if (ret)
> +		return set_error();
> +
>  	return 0;
>  }
>

I'm ok with this series, but the gap this identifies in test coverage
bothers me - are there any other attributes that are not round-trip tested?
Debounce immediately springs to mind.  Bias?  Drive?  Even active_low?
Maybe add or extend a test case to excerise those in a separate patch?

Reviewed-by: Kent Gibson <warthog618@gmail.com>

