Return-Path: <linux-gpio+bounces-25613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D5B44626
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3931D16E58D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E90D265637;
	Thu,  4 Sep 2025 19:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="buIFpMzW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F011FECCD
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012894; cv=none; b=D65CNfy9TqVl5mCTLqjIhJm8s7Be1fjJeRefqWpdoBCEOeX8UzdNpDktr5IunqJUBogXLZPBriXQCsqIIEoEflNnAk9Jq+F9cJa+zbAOHutO8p/mrnYXs/8MmlTrImE/EtX28vYkOzzXGrWI2d/MncSK/549Ra3qBhHU2zXOAzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012894; c=relaxed/simple;
	bh=vAc8GWlbS1dNAlArdFmlz8JV/K5D/zFsXv7QiZpMwiE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIK8XAk9fLBSVPsrl50O1eNh5fYYzglV5x20feG9ocw7Z8GRiQULvF3dezyQd1mj+CD1pm2W3ToRTOPQ3cYB6EfFyYZFa+Z9RXiJWTn0D5GisFrs4ox+/G70hmEOcz1WwuTDYU6vlwxXgWe0xNJosYpBh6hVQE6HV/rHHbO1ERU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=buIFpMzW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso1640581e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757012891; x=1757617691; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vo5h9zWwGoqlYpJct4FmDo3z+MmmKvsMCfXCdRWbkd0=;
        b=buIFpMzWhzI1UteyKZo2+nFbuh1svmpvVoAMHuXy03PXBAXPfvBiNAV7T5LFChxUls
         Re38b2oeGWZ03aUrUSgLgPa5IGhfIb60IRGLbt1XfHWFypykZhIMWi74QeitGdgHbFgx
         r1IwH5uwiZvqxvMySdOx736Af8+pLyxzl3vmZZcoWv/vWXdn4M6hmjIhZhV+5D3tapY0
         rvFgj1iuIKpbfNDsIdVkSt1NRZBAbtZHuz9T5n4RqPFZllJzpre8ivLtk+Tnu0nbhW51
         JnnKq1cCBIJF92uTIAXYWiobXYuuJw2lkldiwINUpQ90SyF+hWqLJ64bh5VBTpXm4uiQ
         8T3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012891; x=1757617691;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vo5h9zWwGoqlYpJct4FmDo3z+MmmKvsMCfXCdRWbkd0=;
        b=vIgTuML5lgj1SKlk4smp7mAHPmEPEVQ2WTdF6/SUQMO+uHPMUEEc/HYnr1cPOUWB3W
         wXAxnmcVyaZbyGZsihj+A6pZtaUTtR5UMtL6wB1HJmieOZLlwaMeVlScBskiwD5IaPMr
         GIEjI9JWpndLe8FOQTnZbs1S/xcq+z251coihPPXiy2VI2HCXEhp6xs7Xdf0b9ghUMQt
         DNQZaGYGf07msAmH/qEKOrnddqk0ui36WFbuYfoCKCxWmPEd18auer7D4HvJU5jU5Yee
         MGjSQWOHO9ZSNitUYyelLAb6l1Wvyu2WdoQhKoZPLm9YJTfyprO8e09IkQSjZVUL9gMn
         v4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWjJXv2utW04+fyClKOOm06PpWbS58jYyZKCLZHzyUV19NK+nRMT68cJScAE9gyMKGOuxCLD/MKfQU8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1AAVfgv3T8mcW80Wn/cTrzVAUSH+KZjr2CbjO1TgOgeczKz/
	0XNQKeDtpunZOGi0corKTtM+vNcnuuv5LfpZ2HLtooLadQWrYp/Uonw9YQcBYDdglJ+YteTvRF4
	wYi7vz1aQ6enILow439gjSK0CDJTuOefLJU6LD7IUeg==
X-Gm-Gg: ASbGnctZZbRvPeIVKJsVQY0XwzdxZO5xMG9srWjVZAMcs7careQqQIhR8ZFCfXM4T1d
	TbyuxIL4s2RMuRUa4nPlsfM1+SJ8YfG5ITWk3l3LzltbWd30wunED6bUuvcA87SE8lW8OQoFNV+
	aHWbA571LruWMH9QEsKP0zfemsnP4USmqA2KJixd7f6LQzjRpO4oh2wylUbixJNHzJx3rigy7HL
	oBtq4HeIki+jW5n5nqZZj9AsWJXJwEL7RhzJQ==
X-Google-Smtp-Source: AGHT+IEjg25sWuO3bmaj5PHUknGO0S2JXM45w9uKMpw3odRt7dOKB/ZN0eWo0rVVU5lHI6RtH5iDMCEfa3X9yWzPwAE=
X-Received: by 2002:a05:6512:291a:b0:55f:63f5:747b with SMTP id
 2adb3069b0e04-55f708b4f88mr6505796e87.16.1757012891026; Thu, 04 Sep 2025
 12:08:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 15:08:10 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 15:08:10 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aLnhbpfeweBI1H4N@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aLnhbpfeweBI1H4N@stanley.mountain>
Date: Thu, 4 Sep 2025 15:08:10 -0400
X-Gm-Features: Ac12FXysO6QNdjIEOI33bmHVFPgLJt02PCy8XpvyDgLc8P_ntklQBO8hfnzbYpY
Message-ID: <CAMRc=MfZuB53p2AMG_=zTzERL8+3cfZdXh+c-UhO9S8_aZJoHg@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: keembay: fix double free in keembay_build_functions()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sep 2025 20:58:54 +0200, Dan Carpenter
<dan.carpenter@linaro.org> said:
> This kfree() was accidentally left over when we converted to devm_
> and it would lead to a double free.  Delete it.
>
> Fixes: 995bc9f4826e ("pinctrl: keembay: release allocated memory in detach path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-keembay.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
> index 30122ca90cbe..3241d3ae6219 100644
> --- a/drivers/pinctrl/pinctrl-keembay.c
> +++ b/drivers/pinctrl/pinctrl-keembay.c
> @@ -1643,10 +1643,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
>  	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
>  					kpc->nfuncs, sizeof(*new_funcs),
>  					GFP_KERNEL);
> -	if (!new_funcs) {
> -		kfree(keembay_funcs);
> +	if (!new_funcs)
>  		return -ENOMEM;
> -	}
>
>  	return keembay_add_functions(kpc, new_funcs);
>  }
> --
> 2.47.2
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

