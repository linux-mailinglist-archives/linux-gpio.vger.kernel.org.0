Return-Path: <linux-gpio+bounces-784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A435F7FF14E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 15:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4751CB20E70
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00C848CD1;
	Thu, 30 Nov 2023 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wi2vk/Sd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3CB1FF5
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 06:08:59 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-58d3c9badf5so563904eaf.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 06:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701353338; x=1701958138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGm3fLcq9TYYkeJn9nu2yfmsGxpSD3YbOVEzHPjzsS4=;
        b=wi2vk/SdwyiQMo4sqe6WPzLtBfZpuxrRPWHoxoJLL3bc6CwJHgWbb5zkt/FcfPEn7D
         7RHKxBgsRMCGJg51FnxFtd2CUE0NiFwz8S1gh+57civxq/uxRg2gSsSstb8hrhVTGSzO
         Ddpm5tvYtEItr+BQ4JPaiNyBR2CelOSZP4Qze60KsEiiozpSJZ6fJ5SuTMR7mpiC/Nba
         LSdzps5t2GKz/TBbiMvAVtcjjkm7bdl6PkWsGiV3TwdQ6N9iwvseu7r5Zjs1542VcTIK
         We80SPXHA4xOD/JL03zvwNqW0G4I/u7FLzmVo1XVId4zXbKo552k6uk259Rclu6M7ff6
         rMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701353338; x=1701958138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGm3fLcq9TYYkeJn9nu2yfmsGxpSD3YbOVEzHPjzsS4=;
        b=noSB1VuSylZaBbXEsWq8UtHNN5hm8nBQgM2qkgz2xzy3B+D3MNAdW8A9vlXxH932Co
         Q6vA6n4Fn86NgwG+8OMdBn3+s1s0+SSR6p0u4DM//LVIdvLQBZUwjKRU8O41MCQkvIQM
         1aQMlYno9AQN+OLU0YDt0gkafwTRL2G0y8Zkr4JkxUiC8I5OSL+pyw0A2gMSubR3pL+W
         NncWKnVz+f82en1T74QhAMGuRnFLBJNn648dyR5Aph9PPq7bxJpWC+73PD8hO+jZWXDH
         RiERrf6TMTQ3VhSDQpW4GPdNMjV9uQkJ9OIaE8KD7DFBrBnB7WzDgp0bzBl20e8ebQtj
         oDgQ==
X-Gm-Message-State: AOJu0YxNSMd3OG5Sz8FfqQMtUqDcg6IYOZCuLJonilMu2v8yH7aQjgFz
	nmVvCrKzpuMn6Eg9kKhZoqdIWxRFqasKrb9Pq7mBVQ==
X-Google-Smtp-Source: AGHT+IFZJ66hXQZpSa3F0ainHjBlvJpUNMobOd2fvHDH78gdeU9vlpCH8X12pp7pXP2TseZvDBjfp1Goide8q2/TvKE=
X-Received: by 2002:a05:6358:78c:b0:16b:c401:955b with SMTP id
 n12-20020a056358078c00b0016bc401955bmr25149652rwj.2.1701353338323; Thu, 30
 Nov 2023 06:08:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130104023.11885-1-brgl@bgdev.pl> <ZWiQLEz6P3vbZgx0@smile.fi.intel.com>
In-Reply-To: <ZWiQLEz6P3vbZgx0@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Nov 2023 15:08:47 +0100
Message-ID: <CAMRc=McUbCnadoPyRwtmeqckg3LEoC2NKy4xSeje8i3dfSh5ng@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: implement the dbg_show() callback
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 2:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 30, 2023 at 11:40:23AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Provide a custom implementation of the dbg_show() callback that prints
> > all requested lines together with their label, direction, value and
> > bias. This improves the code coverage of GPIOLIB.
>
> ...
>
> > +#else
> > +#define gpio_sim_dbg_show NULL
> > +#endif /* CONFIG_DEBUG_FS */
>
> I;m wondering if you can use PTR_IF() instead of this ugly ifdeffery.
>

I wasn't aware of this. Thanks for bringing it to my attention, I'll use it=
.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

