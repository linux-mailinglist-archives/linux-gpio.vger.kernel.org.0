Return-Path: <linux-gpio+bounces-5721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 011DD8AD92E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 01:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96C8AB2172D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 23:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2569F446B6;
	Mon, 22 Apr 2024 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPpSSJM1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2CA1C286
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 23:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713828709; cv=none; b=Iqy9TmffRT1ECed/SOdh4QGKXMehGxzoACf6RKB6QyXIjp2r6Exyp1R04NG293xvDNzyARU/DhKI76n3Id+ypKvKEgi13ZLm3H8SrXbHcPM2+TUJW+YvECVErtO6LEpC01EkcgDO6LwgjHmRzi5IMWxMyTB9khIkIWl1/LmsifM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713828709; c=relaxed/simple;
	bh=3dka/XVkSoJpyx6ajkP38SvtV0kcj68jMNq8f6mjM2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFPIZej6HRgoCOk372+V58omrIheZLvwcWWCU5RdjLXH2483F183KbKSA21lMMgazCndukUqG7p1050I+PZ1K1pfI9VQg3r2U29clWot6RBILp0jjTl5C34bnGbaGGslTwawiyaHG5Lnq8a1DhIh4qfyzGgGt2kzOv3BNJR0E8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPpSSJM1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e8f68f8e0dso21762475ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 16:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713828708; x=1714433508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gmwx2tdXEZv+TDYBPROJBqQiesmBtR5K07TEnJhILCQ=;
        b=FPpSSJM18HF9g/nYCMP3VS43dpK0/w7joNrCRJlhTFUuDJJ8E/f0JsZlaUF8OxSIXJ
         pasZUeqW37ijRNOP0hGa/JpbqNeFrLy3lPB4hjbXlSdN0mBu1PGxm0CW3m1QAtz8ceOU
         MtdZbtBq1QtOXrXwWxqtGRa3NOYAobfBNGXEeZXPZJAMnWzphsbzs52rtlqsJ6EX3FF0
         FM2U3isSpwer3oZNqxkNEATxWHkhQdTCWaRW/NLfNGjK917dz76Z0efQg5AhHDtx0I9q
         CwwjsC1b1kx9nqJjBczh27RmUjXm1gaPryQOfJR8KCV+I9hrchHmb+nvdBAKpRq15Xxh
         0/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713828708; x=1714433508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmwx2tdXEZv+TDYBPROJBqQiesmBtR5K07TEnJhILCQ=;
        b=N0liQR9g6HIYNZZ34uboa41zJpZioa8wLzUqWcHdar2PSkTneaPgILtZc32wPJwmS3
         chyUYmFyT9A3DOfxC8GOoVoJS4fa8jn4t1H1eW0+lkftPm4y4EMThDxayce/1dwVbHl8
         rK1EvpTDLxfSoQJj+dH6k/xGtGXOkEpXqRAWsSdlOKux7OqEvX9oILdX0rQJF0LSAlym
         YPiEb8xYlosUYh6l3s0zc6O2dLnZ1/LrdMFJ4lE6vOv1vUIZFdqRLkkL2AREUkxAaImL
         czywxBrpepozB+oqn5LyGW77Y3+gp2gCUynqF4UCyehL7RLfVlDCgb0SUQJL9pkRiYhi
         6Yhw==
X-Forwarded-Encrypted: i=1; AJvYcCVyUQMBx5ID0vHRQYSsiGtmOdUwCAJt/hAxBrgirCJDlJklwqZ6gEm4xjVt5kD+jqpgIwCSr//vC7zR/tcUpFp9ZSAxJzHsIWzvwQ==
X-Gm-Message-State: AOJu0Yw91eCbiltZlc5y8GB7Ztf49gdPo5WXVBjC3tTCKbx3LG82kckg
	dRO5ctVKasVvm3T9KtRI2kZ6b8kw4EkmNfMecPTcKQOPesvfLNii
X-Google-Smtp-Source: AGHT+IEmaEM8a2hUAVNNHKtIs9sghScc6jH6KyHd8VoXRw8RLsRQtMVUiBE0HqUnejj+va5Wbub/TQ==
X-Received: by 2002:a17:903:238e:b0:1e8:9054:101a with SMTP id v14-20020a170903238e00b001e89054101amr13906360plh.60.1713828707878;
        Mon, 22 Apr 2024 16:31:47 -0700 (PDT)
Received: from rigel (14-202-6-107.static.tpgi.com.au. [14.202.6.107])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090332cf00b001e904f9717asm5551909plr.87.2024.04.22.16.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 16:31:47 -0700 (PDT)
Date: Tue, 23 Apr 2024 07:31:42 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Gunnar =?iso-8859-1?Q?Th=F6rnqvist?= <gunnar@igl.se>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2 2/4] tools: use ppoll() where higher timeout
 resolution makes sense
Message-ID: <20240422233142.GA4078@rigel>
References: <20240416215222.175166-1-brgl@bgdev.pl>
 <20240416215222.175166-3-brgl@bgdev.pl>
 <20240417072350.GA120983@rigel>
 <CAMRc=MfJxFYBoVK5GGks-A++n6naLJ31B6-UJBdxiw7gvnfxfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfJxFYBoVK5GGks-A++n6naLJ31B6-UJBdxiw7gvnfxfQ@mail.gmail.com>

On Mon, Apr 22, 2024 at 08:15:46PM +0200, Bartosz Golaszewski wrote:
> On Wed, Apr 17, 2024 at 9:23 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Apr 16, 2024 at 11:52:20PM +0200, Bartosz Golaszewski wrote:
> > >
> > > -             ret = poll(pollfds, resolver->num_chips, cfg.idle_timeout);
> > > +             if (cfg.idle_timeout > 0) {
> > > +                     idle_timeout.tv_sec = cfg.idle_timeout / 1000000;
> > > +                     idle_timeout.tv_nsec =
> > > +                                     (cfg.idle_timeout % 1000000) * 1000;
> > > +             }
> > > +
> > > +             ret = ppoll(pollfds, resolver->num_chips,
> > > +                         cfg.idle_timeout > 0 ? &idle_timeout : NULL, NULL);
> > >               if (ret < 0)
> > >                       die_perror("error polling for events");
> > >
> >
> > One minor nit - I would introduce a timespec pointer initialised to NULL
> > and set to point to idle_timeout within the if rather than repeat the
> > cfg.idle_timeout > 0 test.
> >
>
> Actually we can avoid it by doing it once before we enter the for(;;)
> loop. It's passed by constant pointer to ppoll() anyway and having the
> struct AND pointer to it initialized to NULL sounds more complex than
> it needs to be. I'll do it in v2.
>

Ah, I overlooked the for loop, so you are right that it should be
initialised before that.

> > But that is just personal preference, so either way,
> >
> > Reviewed-by: Kent Gibson <warthog618@gmail.com>
> >
>
> Thanks, I'll keep the tag if you don't mind the above solution?
>

Sure.

Cheers,
Kent.


