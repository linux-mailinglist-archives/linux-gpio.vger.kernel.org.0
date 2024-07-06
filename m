Return-Path: <linux-gpio+bounces-8077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1639F92901B
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 04:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345DF1C20D6B
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 02:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A6F8825;
	Sat,  6 Jul 2024 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHHPaq3Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD495C138
	for <linux-gpio@vger.kernel.org>; Sat,  6 Jul 2024 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720234503; cv=none; b=ps0Nf128RxUBawbvcuzl+vCVdB/MYE4GRsgKxnHJyPW7VCoTjo2TdFaMOFpt2bqkhZWHX8T4+sznmvtCdx6JVrmql7ZbjvIRtpVNxlrE3ejdLj5NUe3yOWm4R70RN9/sooCDVl9s11cjYzrJFA7wZA55RELrri20D9L4DUHY/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720234503; c=relaxed/simple;
	bh=etbY4pmGTsOeVXnGAXGM1jgkLCvPWOu1z/ZjxcVZy6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzsdqOP8EToeML7tsbU9jd0GroWiqtEUiweDFnrd8x6spU6zATuzYhtRXOSpJf4npd7y7wZa89rzXXqQB8nWgDEJCd0BSi03P2UuBTquFbJWmLlWzpkMLAf2KYH8AGfjtvQCgCGCnqpqHbvC/2dLzMBVi52ctzw3emMhnUfKb/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHHPaq3Y; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70b03ffbb3aso1577994b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 19:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720234501; x=1720839301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xydNOIhuPfsa8lHWcDz6Li4LYbgz9rUd7S4Mx7keng0=;
        b=AHHPaq3YvmwHqPCCT8HMAiE1ZiHXVvlEpNmH89qNTp2DGdJgLSCk9wuxwsM3U2yXPG
         xGfDJXoiEb1cd/HM2ySg2072c+ukUgyYVNEXFKbdbKSRqKKLKacUyxVXICr0aco9L8Af
         By5SotPiVkF12oROHx4ujMEF8DOLvOWhqXcCv4AiU6Rv4Q883FSE3Aey4PJ8NKwErbIv
         WARwv6Q8ZfhscjYWkeTne+gu0YPAyYc5fY6vsMbRzll2TA09ZIorgNMFjhYQQcR07tlq
         4BO8qv+rXHLZ4dxb5F2K8ro7ZAOOpyxOjrSx6VG3SviQz6ezCxUVDGhJDLNaBvTlAo61
         4Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720234501; x=1720839301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xydNOIhuPfsa8lHWcDz6Li4LYbgz9rUd7S4Mx7keng0=;
        b=Prp5gZ977CajH3LRQ4mXi+gJXGWRfg0w8JRLa3WJ72COSAAUjz03D09PTHtZOZsEtr
         nkLYgw2naNq1az1VeMatNhL4ooACpRMQvUXT5QlSZfLi4OYdLTGa1xcoXJdfKIGMpeUs
         mgaahyuGAMrIW5P5ZZt3W6nprODMbgJRZnxCIJAzIlTp5+5bjvNQcEGURCmoxe/ecmnV
         TjrCzyTfwwa0bllSn50TaLe23Pt1EbXd29BNzNEJewPFZoVYwVu2xfPyPuCnXXtwhaRw
         QzW8h2g+vg32NuUi7OtDNfSm1a/zNiFKNvCXDrI9mgViu7S6iJ2PEsF8ph0Zm2O2DamL
         7kww==
X-Gm-Message-State: AOJu0Yw+23iwtz/REDFH4zReJdm6mMwsBqOhhEqSJtw+f8QNWRY2v8Zq
	FeszcneZ/NlGEXTQ3xFCVvcnAcw5u0k0zDZfi4HPyASRKkPwkRVw
X-Google-Smtp-Source: AGHT+IFJRf/2nyt2gpocXcTorfR4VpGDCblUhUtDEo3CspVXX3JSTpMnuHWcNIGJ2ppvkcihaGhqUQ==
X-Received: by 2002:a05:6a00:2e16:b0:70a:f38c:74cc with SMTP id d2e1a72fcca58-70b00a7f1d5mr8320951b3a.8.1720234500848;
        Fri, 05 Jul 2024 19:55:00 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b14f7e7d6sm1079293b3a.81.2024.07.05.19.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 19:55:00 -0700 (PDT)
Date: Sat, 6 Jul 2024 10:54:56 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
Message-ID: <20240706025456.GA13007@rigel>
References: <20240705021750.43197-1-warthog618@gmail.com>
 <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172016528819.6599.11422057058966562764.b4-ty@linaro.org>

On Fri, Jul 05, 2024 at 09:41:31AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>
> On Fri, 05 Jul 2024 10:17:50 +0800, Kent Gibson wrote:
> > Generating the latest documentation on readthedocs is broken as the
> > index.html generated by Doxygen is now being overwritten by one
> > generated by Sphinx.
> >
> > Make Sphinx generate a differently named root page that does not
> > conflict with the index.html generated by Doxygen.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] doc: fix sphinx config for rtd
>       commit: 824c1f39347c2ef46919dfc45e8247441b908827
>

Btw, I ran across this while updating RTD to v2.1 - their default build
config has changed since I last updated, so that didn't go as smoothly
as I had anticipated (the plan was to switch the branch the generation
uses from my fork to your github repo, but now that can wait til v2.2).

I am also looking at reworking the documentation to use Sphinx/Breathe
to generate the html from the xml that Doxygen generates, and
incorporting documentation for the Python bindings, but looking is
about as far as I've gotten so far.

Not sure what to do about the Rust bindings.  I was assuming I could
just link to docs.rs, but the build there[1] is broken.
Can we fix that?

Cheers,
Kent.

[1] https://docs.rs/crate/libgpiod/latest

