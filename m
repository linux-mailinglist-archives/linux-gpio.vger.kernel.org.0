Return-Path: <linux-gpio+bounces-7756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A591A91D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 16:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87CF5B277BC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 14:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC14195F0D;
	Thu, 27 Jun 2024 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpqB6xqI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4254719306A;
	Thu, 27 Jun 2024 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498175; cv=none; b=F+x+QHPwwX938zFIOgJVBlPTqe2kfIxwwp3aSie7NEc2v1QEUHqt2lDb1YAufbsyGcvuSgfXeXO7bnyNy8ARNH8OJRmHSxDf0oNfF1WqRE2pqFx27w0fS4YuQsm0ErDyODW5nRDtjpQQi0tEFjMb38QrBW4Tytyzv1mvxFPeqSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498175; c=relaxed/simple;
	bh=oHV3OHMIUPZl6GV46fsLps6Cea0pnU28+OVOsPTtCLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MR/0J+zLohAxw9oMasmlXfEi/4snGwzhvyRgeyCRRmop4H3RtCypbxhjpuGXgjDJqaOyKh0Sm03BKg9d9/J93otpdJiwxQS5zZQNs/tiWHnppOgYvuS7kwFItcXclJIDM23M4DbZUzVA2zXGMWoQSxVgTa3LBa8c6Iu2sxh3y4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpqB6xqI; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c80657e4a3so5290597a91.0;
        Thu, 27 Jun 2024 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719498173; x=1720102973; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LlXmCd6thfbhr1DFHJ5mJ6w10qbVvdbhSaguzvZxl4=;
        b=CpqB6xqIf95+VGHTpY+YIg6FbYjbuuvX5NTIpNEIBWPzeMOyxb29CBY5iMYe0kmER7
         2NG+h3gEL3RFiVRsiMa3gvv63J7EZWpIy+WHnfYOKVpnwwEy38jZ4yEGDq8ES3MiYFj1
         5yJZXr3WqcJrTCKO5ChhrhCYzMxOt5GHytrOdw0Konqws03RLkdD8hX17a82OHA6m3nj
         XbdruxDm9RIbV/H0LZqzs/T/sU3YB3UZPdjecqdpX6Wvo7bjqj00SkgYv58lGUKGlNfn
         yCYJB1MFnQPqBLhRrf1ors8Qv+C8n1IY0u+ho9kY4pYF0yOoyDK+iuzFykMyPtgu/hqc
         cxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498173; x=1720102973;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LlXmCd6thfbhr1DFHJ5mJ6w10qbVvdbhSaguzvZxl4=;
        b=oQJa0faL25VwvYft0iwz9Tas3YByZSHNX7cSrjm84p2Ne9KnQk+PdX4udPNfW2w7lh
         RyvXkg30yNrUBTcsCYnr7pOQJgf0DfldGTNTDS37T3ZDyi5Rz5KMXss2t9BWanau7NDI
         HaQ+Zdn8KhX9XLZTQIC+Wjih4NyQvZ79eag3TqwTNPfQdHMjEoz2PlY7xrzWGY1+d/Af
         wqhKQtUXpqrr5VusuehvQ1RA7tZ/2DJ31iLb+UnHkXKD6O1ADVhjfOxPX53WcqTOr4X0
         RkIyVOLGJHsBkvkpQM4ifeMcCC1mNFIL4DUoHPynCG/2t0vsuShEzHDB+vbTF5Qtv1CC
         OuMw==
X-Forwarded-Encrypted: i=1; AJvYcCUbrqcIhGVreTmtvLDCX0yAYYKWB9aQIYb8qkS/UsRRdey5LuwgdB9/Frvy2LBZnj+13vpkYfTGob15AvnS/M/weKo3uKAzU+c19A==
X-Gm-Message-State: AOJu0YyOCN/z5HjVbbmZ9qKFEWff+KQW8cvV8dZKVSC4FhUxlsFBJZK5
	IRH0QTx3ZiF9gJykr6PE0CjlsI+Lcxv+nRh88Bao6fj18c+hZgYi
X-Google-Smtp-Source: AGHT+IG0U8gCeC6H4Lv27x869DpLFMoP289ZkPNOKtVWCPqnht6f7tfJWKLuY//+9rUGf6pGDyLm7w==
X-Received: by 2002:a17:90b:1c12:b0:2c6:e8d4:d0e2 with SMTP id 98e67ed59e1d1-2c8614cbbd4mr10959627a91.43.1719498173381;
        Thu, 27 Jun 2024 07:22:53 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8fe8acddcsm1513785a91.2.2024.06.27.07.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:22:53 -0700 (PDT)
Date: Thu, 27 Jun 2024 22:22:48 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org
Subject: Re: [PATCH 2/4] gpiolib: cdev: Ignore reconfiguration without
 direction
Message-ID: <20240627142248.GA414403@rigel>
References: <20240626052925.174272-1-warthog618@gmail.com>
 <20240626052925.174272-3-warthog618@gmail.com>
 <CAMRc=Me1_4xjbt51j+gFVzR71VUwMSAm+dT=UtgOY-1xYoAF5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me1_4xjbt51j+gFVzR71VUwMSAm+dT=UtgOY-1xYoAF5g@mail.gmail.com>

On Thu, Jun 27, 2024 at 04:06:21PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 26, 2024 at 7:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > linereq_set_config() behaves badly when direction is not set.
> > The configuration validation is borrowed from linereq_create(), where,
> > to verify the intent of the user, the direction must be set to in order to
> > effect a change to the electrical configuration of a line. But, when
> > applied to reconfiguration, that validation does not allow for the unset
> > direction case, making it possible to clear flags set previously without
> > specifying the line direction.
> >
> > Adding to the inconsistency, those changes are not immediately applied by
> > linereq_set_config(), but will take effect when the line value is next get
> > or set.
> >
> > For example, by requesting a configuration with no flags set, an output
> > line with GPIO_V2_LINE_FLAG_ACTIVE_LOW and GPIO_V2_LINE_FLAG_OPEN_DRAIN
> > set could have those flags cleared, inverting the sense of the line and
> > changing the line drive to push-pull on the next line value set.
> >
> > Skip the reconfiguration of lines for which the direction is not set, and
> > only reconfigure the lines for which direction is set.
> >
> > Fixes: a54756cb24ea ("gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL")
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  drivers/gpio/gpiolib-cdev.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index f7a129d67b7d..ef08b23a56e2 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -1534,12 +1534,14 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> >                 line = &lr->lines[i];
> >                 desc = lr->lines[i].desc;
> >                 flags = gpio_v2_line_config_flags(&lc, i);
> > +               /*
> > +                * Lines not explicitly reconfigured as input or output
> > +                * are left unchanged.
> > +                */
> > +               if (!(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
> > +                       continue;
>
> Series looks good, thanks. I'd say that this bit here calls for at
> least a debug-level message since we don't return an error unlike v1.
> What do you think?
>

The change to the libgpiod Python bindings makes use of this to support
reconfiguration of subsets, so on its own it isn't an abnormal path and
I'm not sure it warrants even a debug.

OTOH, I did consider if there should be a check that at least one line
in the reconfig has a direction, returning an error if there are none, but
was on the fence about it and left it out as it added complexity.

Would that make more sense?
Or do you have a problem with reconfiguring subsets?

Cheers,
Kent.

