Return-Path: <linux-gpio+bounces-8044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37669927946
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 16:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 691D11C20F2D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 14:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05E41AEFF6;
	Thu,  4 Jul 2024 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+CMxBhn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6411AED4D
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jul 2024 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720104658; cv=none; b=J0VG8famaPpsUfGFzj5NPxsA5fD3cE6191/0x+/IZ4z8AU/+OA5OC8APIubebU0OBh/Ut+dG3BzogkhlynsPiFsGoR+V84wTbN2rW7/jJMphnXd5lfLXbG+LVW3ZoJOGtCUT/PxHBNNRbYLHe0mWFUBZuAd4x9jgjQ0Lt391h4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720104658; c=relaxed/simple;
	bh=gpHQtn1GCFQJ1Mpe3GQQNh8wr4tfYXbqGLEfUGnDs8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n24bgTgWtd/LueJSlC8BH2bi5xmYoKer0h/MoxAzuuhWxNrCWhLRpakamXGYinuIfgs/aUKCMaDyZIMKIhmFakBlBve6Q2LUCWyGsMazTDHPSN0V7PMkVe6Dv9RoF1CmxqzPlX7I1Hh84uBpiEXmOZt/z9B9a4WEcPoju4EhsIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+CMxBhn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f65a3abd01so4729605ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2024 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720104656; x=1720709456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahsU2c28lOl0DTdW3Sg76BwS3a9KG8RYK2VnZgKFAzc=;
        b=H+CMxBhnvGS15QD2n6tOtvGKZHV3nL86zQ11z6pyDNU0C6AwYZMYcPg83gpPTEYeoT
         79rwUfRXWwMgdg5V9oWaRdJW5F0knCk4y4OwsPCuynpNgBvHIgLAMPCSW/r0LL7XmESo
         wDHGJ2dSFGFXNKNlLnCm0iozzXcDSDQhwK/GpvxRbvmFa+IwZO+ELK5XhANSiTv0E9H2
         qRPS7XVgb/uII6Xvhn7qMfUZtNb0JL0Q0zpAI+XNYbFOM0TjFBs5a3lTMCul2pGB3v02
         8eLGRaMy9ZV4pnhKj1On7GVQJZGeYkzrc+EnwVsHr8iLgpuNsjcw+VaYhqkPSgWxvoR3
         55CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720104656; x=1720709456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahsU2c28lOl0DTdW3Sg76BwS3a9KG8RYK2VnZgKFAzc=;
        b=QMpcEqxJ3mWXyBNxMOGIaFGY4mdLy/M23gZuds4j+sI90bjPfchCBgoUK2LGuapj0h
         6Us7MstuBj+j+fCuyjEdO5Lov49lRvCwgANsw92dpIR5p7lMb0aWHxDnca2S2qViiQng
         6goLkhWIxROhhDiN8d/IidKbxwKyfPe+nbtoOm2c/FypBjhUDAYoWXSe+/hCxwdaiU9n
         H1kVVHHLSdP1PdnPtobQXbpvz4ENNVVXn/7pKFrs/mmWlu4EKtNIhkwSpVPSarhWW/eC
         gDQDyTOjFHxi2MHlcUZQoX2bLE4qX6zQC5loZeoyJ2go6PJyy9mbE5+iKg405J3WLdFA
         cYCw==
X-Forwarded-Encrypted: i=1; AJvYcCWeDwi13jGr661IMFewG59GVFb86Zw1HgtIjC1eoeLxSKuj8+REPncdfw1Cuj1lyKI9LanSVcVbBeOop0HqxcWQNGFcP1E7cL0sUQ==
X-Gm-Message-State: AOJu0YydElLUAWRHl1mdKTtEYTneTSaYq2MC6sHriHLjFcCMet3ElYxi
	mJMfFIxgDBzEnTBk26wqe2TTsRk36SA07iFQQ0ZiK8l+9jmA7Bvg
X-Google-Smtp-Source: AGHT+IHIP0YyOgCenwK+iwmtOn3QbvAsg3KfKZnQm53+lXtX0sP3/+aK6UMM64dSY4161D2l8T97GQ==
X-Received: by 2002:a17:903:1d2:b0:1f6:e11e:640e with SMTP id d9443c01a7336-1fb33e04f25mr17894985ad.4.1720104656267;
        Thu, 04 Jul 2024 07:50:56 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb2d59abc2sm19064685ad.160.2024.07.04.07.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 07:50:55 -0700 (PDT)
Date: Thu, 4 Jul 2024 22:50:51 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] README: list the development packages required
 to build the library
Message-ID: <20240704145051.GA95228@rigel>
References: <20240704142451.28400-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704142451.28400-1-brgl@bgdev.pl>

On Thu, Jul 04, 2024 at 04:24:51PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The error messages emitted by configure when either libtool, pkg-config
> or autoconf-archive packages are missing on the host are not very clear
> and seem to cause confusion among users building the project from
> sources. List the required packages in the README.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  README | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/README b/README
> index a6f24d1..a20e801 100644
> --- a/README
> +++ b/README
> @@ -34,6 +34,11 @@ BUILDING
>  This is a pretty standard autotools project. The core C library does not have
>  any external dependencies other than the standard C library with GNU extensions.
>
> +The build system requires autotools, autoconf-archive, libtool and pkg-config
> +to be installed on the host system for the basic build. Development files for
> +additional libraries may be required depending on selected options. The
> +configure script will typically prompt the user for them clearly when missing.
> +

typically?  Shouldn't that always be the case?

"prompt" makes it seem interactive.
I would reword as "The configure script will report any missing additional
required dependencies."

Cheers,
Kent.

