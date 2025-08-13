Return-Path: <linux-gpio+bounces-24369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BDB25405
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 21:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0D65A6287
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 19:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242982F99B6;
	Wed, 13 Aug 2025 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JLGhNqv2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35DD2F999D
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755114031; cv=none; b=goF/JuwgaP6PYomMzhU0j56ex2GBRhWBDRFuX8JryyWdtIf4I9mDT9YItCE99ajqYm6M5ReITXVAS0BJyNO3RIx8PL4lhgvYFabauRzL4oW+C9HFbPeP1UmbZcWjx7pPDsEnQg+3rMaHYcWUlparJ9ccwZiXxK8SwM+vVN48aTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755114031; c=relaxed/simple;
	bh=9nSdP9e937hC8d3i0s8ozTY0XOgg1Kd2xe4LORw4IzQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V73UyQ/SNvbEvXiuPAHpzpTlxPftSQ/Eq0isP65y9u/tN8ewyO5wpgPbGFD7ECszIq4rlLh4qvRgpZenMqcscqpJnRqY3elSW19mIK2VRLu2EnIYH+ZxXxAHCMaaMXsxTFsm7zZHQXpsbBhO/3bu5amkVAJgYBm/wdrBak0AYZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JLGhNqv2; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-6188b793d21so264128a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755114028; x=1755718828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ikxKGvNRrHWapXobM1CVpjG5F3QIhCjs1u3Ja46/fsg=;
        b=JLGhNqv253lQnrcLCd50DkJTvCzzQ+GC0ms4IgEBPf6AOw6bKWZfFQ1Uf0naammBS+
         Ax0mPL6hz9AevFzDPN6SJp7lEhtoH6bGb7hyc0rr4D0/Zxf8gQu13kbd46gFee3m6bX/
         hVomb2ev8sGHmvdE3Gohhj9OArEXJUJkeMhX7O+vgw4/xIQhY+sUymq0JFfL6eNdJ5ry
         Lb2Ait9X9+EdbGupXOaXSGSB2jfEMhOK/ZakVDalgjVg5QFNFrZnpBRBhwFtMODnqu+b
         8r16/uUIlPebgljG4afZ6x5EKDK2gy5u0bEYdXWR+J8EMlyPYXv7FBxpNIgiNGGzDWV3
         WdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755114028; x=1755718828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikxKGvNRrHWapXobM1CVpjG5F3QIhCjs1u3Ja46/fsg=;
        b=AQjdBATNC2ls3BOlkX2gNDXyOLcd7mYV+bL36L8eU75+GiFI9eOeUMqh07vfiGnssE
         eOqnlVdjpQZCaExYTqbtMC4Ny79TjwCIbLB/uvBmUC5UT3AxbGmVO4xs5tGVbSedTWLZ
         ZnHbB/gSrvgbnwwroPQJf0ET6jDqxnKeVP3UurRehOLlfFe9teNg00HI7w65RH6anfeu
         UMQuWUnJyH3vEp3iE3muGS4a3n0ug102yV5C6ZC680JlCb+OaF8Go/MshNV/EbjDwyw0
         4GjrE/gz6D/ozym6587l7xa5Lg8L9S4JwEpCd9kIT9nLWUZs8zB5MWJhXXpCOqemd4Vj
         1Mqg==
X-Forwarded-Encrypted: i=1; AJvYcCW5uSVVPT3+eUcz3uZAYvaAGMt2DxC2j6N12nUk0huLg3ID/G/X5ZqLwQV+euhTGJ91/T0r9pRNhDl9@vger.kernel.org
X-Gm-Message-State: AOJu0YxZa69MHHEI+vA43ULEH0+NMKCUYw7HgQDQlGMODDhmWbl7bpP6
	KyJiuwwgEnxjwTl6xCvodCjIp1SQ1wMokKHoHeKfliRrVaW7CcFxvBDnfzAldoasnjs=
X-Gm-Gg: ASbGncvSPjp7KtUwUSmh9Te56mjBzpbdant7wA1jAEzJ9BuYKEjBCqeP9XO27aSuxJI
	oFqkxIYhMTmapPZYrkEmg80WW+ZycdhOtNFqZKlUIA+a4D+PC27q3BZA0tomRblsFO+YFh/MS3k
	FPT0IvJO4DPMDMLsRjmf6jcb/4BfvwW15n0QyzbG/mFUTr1NXZyk+3WnFereHT0w1x9wsMVkcqa
	WkCH62wz4arVuId8Bvxkj0P9jthXcUDSoM0yEeeH8GvK/2CaaF5Fq4a8mynUn0fMLADtUpbF8Q3
	9R/+H/doxyLqHaAfVwFJ6HgEQDlxlFGm/4vlSOFiXVJNfSZAZCOsJFWhxFVDb1Us9ROeeVXgYDr
	o126hQwxz5lpPNAy7A5pzxRBTFrhXOivigEzxVNzfBXgNk50JU9rdfx2cT+TuWqgXVg==
X-Google-Smtp-Source: AGHT+IFp2RG0LgRoFaOLonOUx+vXqcvq3x+VAp7KQCkcMtBWU1dgV0oww0grLbiSpynhH5XQMCEZNA==
X-Received: by 2002:a05:6402:46c6:b0:618:20c1:7e5e with SMTP id 4fb4d7f45d1cf-6188c20ff2dmr306875a12.27.1755114028014;
        Wed, 13 Aug 2025 12:40:28 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618465fb431sm4296301a12.33.2025.08.13.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 12:40:27 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 13 Aug 2025 21:42:17 +0200
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 13/21] pinctrl: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aJzqmX-Nh3bWgjWn@apocalypse>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-14-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On 18:14 Wed 13 Aug     , Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>  drivers/pinctrl/pinctrl-rp1.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
> index dadafc935dbb..6699b36349d0 100644
> --- a/drivers/pinctrl/pinctrl-rp1.c
> +++ b/drivers/pinctrl/pinctrl-rp1.c
> @@ -1627,7 +1627,6 @@ static const struct regmap_config rp1_pinctrl_regmap_cfg = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
>  	.reg_stride = 4,
> -	.fast_io = true,
>  	.name = "rp1-pinctrl",
>  };

Looks fine to me, just a little heads up: the following patch
https://lore.kernel.org/all/20250812092618.14270-1-andrea.porta@suse.com/

adds other two regmap_config with fast_io set to true, so we can
get rid of them too. I can do it in my patch in case I have to send a
second revision, or you can amend yours to cope with my changes and set
my patch as a prerequisite. I guess that it's easier for me since
I have only a single patch, while yours is a big patchset so better
to avoid the noise of a second revision.

Many thanks,
Andrea

>  
> -- 
> 2.47.2
> 

