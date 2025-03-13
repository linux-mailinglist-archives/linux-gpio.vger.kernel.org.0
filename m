Return-Path: <linux-gpio+bounces-17554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33AA5FCD5
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 18:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62C77189C1A7
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 17:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CD9268FDB;
	Thu, 13 Mar 2025 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Q6DWMT4W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A469155382
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885224; cv=none; b=Bx+V9a6IWTvE/gIWJV+5N2qFrfzyPf7VNI9fVi7gSv1MrFQfuJMzXIhXNzP+A3pyCp6/pQLbyUvA5WCCLWFPhjrCYD0SqZzg/h29OC269//zAZr/1WkRDh7gjqefM3kEgthbPHvfJDZWXahwC73zIkRCfcqbZWQ943rZnPHG6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885224; c=relaxed/simple;
	bh=RYxSqwzI/2EnMBRnPRSSojkRPyxDGmcJUxa+ewzJoU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dR61/7+bSNaDT6c/m9yLVjtbBJQScXjIpFG13f8e1+kMBpMqRYegp/yKZE9yaqL/j0YxbeM2rEMlyLcW9o3v3BvF5torOmTdLHRDXcxCHY2hRceLZj0vw6yU4/VO1/NOnCCERMVEPRGPBwjCo6p80hleYeQS/xHCAXnauuld1Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Q6DWMT4W; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E223B3F68D
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 17:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1741885217;
	bh=fUoJ0YlwG+ODRfDs+U2h4d0BcQxrChC2nMxkx+ZtzpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Q6DWMT4W1QkIXBodh0etMRc2nNllX7OfxpUOhEVNhhScqdjvKGCYrKc0m7VECRDpJ
	 rr5Nb9xFNtCH4XuYYygmz+ju32dzCka4cKFa6hWjEZaLtlJnEa0y4ZQhvHm+6+9U7n
	 r3V8TrX7NuqLm5ifibWvocAvL02clmUGWUBCUzIzMNMv0lOEJN91lmlphANQ9W+Ude
	 DtdYDf6Tq7/Yfyj5450uMKbyHDcvLxhHfjtrLlzitjCWNTGXC4ESGB+DPbr8gRqUzY
	 HpGIuE0VV/T1/3wnTWQsch5Z0tEPPhtc/K7H7k1dVofRXQtNaOWDJRuiaEsivsrtXQ
	 6IRcW8kW/rygw==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff7cf599beso2084106a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 10:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741885216; x=1742490016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUoJ0YlwG+ODRfDs+U2h4d0BcQxrChC2nMxkx+ZtzpA=;
        b=CdSlH4h5G26L0pl1C9APqhQkl1EIvu//HRJNEFzUcvDGoei0E7TI4RYRzYTWCSVwmx
         c3zK6cG5SM09V5PW5W+HsLU+mKJXq00XFa1r9xhZuMn3TbEd/2TOVj36BuN6UrE4tUaU
         gaia58nCW9qB8eGsCja4O/HvxgrOWapIAauTVqsn+kyzFJqNkRP0gZR+Ll1eaI3C1hDS
         fam9WfR50CpGRd6aL6IF/WTkan2Z/iZtLN+BJRvagGm7LysGBSfTR1hTF6SA7IMeQG/E
         8Gz5OiJB4328n6QllpoVwr87WHGT9OEoU1KNSmADSTi4QeGrD+jbbgswlgwh2rYBBr/Z
         klBw==
X-Gm-Message-State: AOJu0YweQLY3ShmT8tt9aS4NXe7dPXPqtLz3U84oykWbUfmgYsvxoFoT
	I3PWdYSaM8OFeUOD0MpE1ild/yisG7T888TB+GpJWInbWjvkkI8AKkwgOFtNE7R9uwnrKCLyzKd
	UHQj9tdYRqL64/ba8CHeeCMaEkJ/asceQLRSN7po58l2JsRpNFRonbK1E40aFs4YPr6ykxZIlgr
	w=
X-Gm-Gg: ASbGncswD1L/34SbikjrRox5PtxLsN5AWYuPLdP9S/Ztk7desbEYhQfMi9+lDaEYgwL
	/cEgqXDs027gzPFGCz2Q1dHLplNChclyX2YAbmzKCXHLhmGaqCTAjsczjwF26xUMWMrnigqo8UN
	YiIioClO1yBvz0S43BAAaz9xGV0GHlfF9NqsRZqbll4Oxi8ja4SiUo6hiF5N2bt5yAJIGAkDPeR
	dj9hAFa6tRFUyEVI1WRjqVXIjdhutDP09hHIVilqAic4+VfxM5BILfI1aHDi3DD6JRBhlYXx/7l
	XXBp5buXjYgIqV3f
X-Received: by 2002:a05:6a00:a16:b0:736:53ce:a32c with SMTP id d2e1a72fcca58-736eb87c234mr14988256b3a.17.1741885215969;
        Thu, 13 Mar 2025 10:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZKXbfIRDv2S58V3wGzrMBxEA6UOye0xO53GmJmkmtt9ccYnOJCbY4VXHrfLoqoPoutlG3VQ==
X-Received: by 2002:a05:6a00:a16:b0:736:53ce:a32c with SMTP id d2e1a72fcca58-736eb87c234mr14988216b3a.17.1741885215540;
        Thu, 13 Mar 2025 10:00:15 -0700 (PDT)
Received: from localhost ([240f:74:7be:1:4ca:c54c:f4ea:3eea])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711695ad4sm1607514b3a.132.2025.03.13.10.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 10:00:15 -0700 (PDT)
Date: Fri, 14 Mar 2025 02:00:13 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <4xyrmml7f2urxjjkeurnlus375phzhxfqej5dnzdxlrhx7jn5z@5iizxyft4cht>
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
 <CAMRc=Me9_EvVj2U-wGWjoVyH_igZBtUs1ymtE=4_r2EkSBAAcA@mail.gmail.com>
 <oedikhiegt3iqj7xg4vtfhlqxihicd7bdtaglk73q2m3c42zla@roh336fpkszm>
 <CAMRc=MeHBYngume_k-tfqEnkrkt3-axWKXKS1xkxkyH-6QFSkQ@mail.gmail.com>
 <n25f2iho3yn7ahx6isnm55g2cw5ox34rhqukhvgohzmtq22vzl@p5pptw6lw7ln>
 <CAMRc=MdPLpQTeebDPk0+5ovuFCjcpNdb3BN5c7ADAxStE08JBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdPLpQTeebDPk0+5ovuFCjcpNdb3BN5c7ADAxStE08JBQ@mail.gmail.com>

On Mon, Mar 10, 2025 at 06:46:25PM GMT, Bartosz Golaszewski wrote:
> On Mon, Mar 10, 2025 at 5:28 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> 
> [snip!]
> 
> Please remove unnecessary context from responses. You attached
> hundreds of lines of stack traces here. :(

Right, this will never happen. Sorry for inconvenience.

> 
> >
> > Thanks, I've confirmed it. It seems I overlooked it because somehow
> > lockdep and kasan were not enabled for a while.
> >
> > Assuming the v5 patch series rebased onto the latest gpio/for-next
> > 21c853ad9309 ("gpio: adnp: use new line value setter callbacks"),
> > the following follow-up patch should suffice.
> >
> > ------------8<--------------8<---------------
> > diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> > index df34d8fcb79a..56f0fde8c843 100644
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -207,7 +207,18 @@ static void aggr_free_lines(struct gpio_aggregator *aggr)
> >
> >         list_for_each_entry_safe(line, tmp, &aggr->list_head, entry) {
> >                 configfs_unregister_group(&line->group);
> > -               aggr_line_del(aggr, line);
> > +               /*
> > +                * Normally, we acquire aggr->lock within the configfs
> > +                * callback. However, in the legacy sysfs interface case,
> > +                * calling configfs_(un)register_group while holding
> > +                * aggr->lock could cause a deadlock. Fortunately, this is
> > +                * unnecessary because the new_device/delete_device path
> > +                * and the module unload path are mutually exclusive,
> > +                * thanks to an explicit try_module_get. That's why this
> > +                * minimal scoped_guard suffices here.
> > +                */
> > +               scoped_guard(mutex, &aggr->lock)
> > +                       aggr_line_del(aggr, line);
> >                 kfree(line->key);
> >                 kfree(line);
> >         }
> > @@ -926,8 +937,6 @@ static void gpio_aggr_device_release(struct config_item *item)
> >  {
> >         struct gpio_aggregator *aggr = to_gpio_aggregator(item);
> >
> > -       guard(mutex)(&aggr->lock);
> > -
> >         /*
> >          * At this point, aggr is neither active nor activating,
> >          * so calling aggr_deactivate() is always unnecessary.
> > @@ -1072,7 +1081,8 @@ static int aggr_parse(struct gpio_aggregator *aggr)
> >                                                         &line->group);
> >                         if (error)
> >                                 goto err;
> > -                       aggr_line_add(aggr, line);
> > +                       scoped_guard(mutex, &aggr->lock)
> > +                               aggr_line_add(aggr, line);
> >
> >                         error = aggr_add_gpio(aggr, key, U16_MAX, &n);
> >                         if (error)
> > @@ -1101,7 +1111,8 @@ static int aggr_parse(struct gpio_aggregator *aggr)
> >                                                         &line->group);
> >                         if (error)
> >                                 goto err;
> > -                       aggr_line_add(aggr, line);
> > +                       scoped_guard(mutex, &aggr->lock)
> > +                               aggr_line_add(aggr, line);
> >
> >                         error = aggr_add_gpio(aggr, key, i, &n);
> >                         if (error)
> > @@ -1205,8 +1216,10 @@ static DRIVER_ATTR_WO(new_device);
> >
> >  static void gpio_aggregator_free(struct gpio_aggregator *aggr)
> >  {
> > -       if (aggr_is_activating(aggr) || aggr_is_active(aggr))
> > -               aggr_deactivate(aggr);
> > +       scoped_guard(mutex, &aggr->lock) {
> > +               if (aggr_is_activating(aggr) || aggr_is_active(aggr))
> > +                       aggr_deactivate(aggr);
> > +       }
> >         aggr_free_lines(aggr);
> >         configfs_unregister_group(&aggr->group);
> >         kfree(aggr);
> > ------------8<--------------8<---------------
> >
> >
> > * The second hunk should be squashed into
> >   [PATCH v5 4/9] gpio: aggregator: introduce basic configfs interface
> >
> > * The rest of the hunks should be squashed into
> >   [PATCH v5 8/9] gpio: aggregator: expose aggregator created via legacy sysfs to configfs
> >
> > If you agree with the above approach, I'll send out v6,
> > while also addressing your feedback here:
> > https://lore.kernel.org/all/CAMRc=MdoMKdqyzGMFDa3aMz3h=vfZ0OtwARxY7FdsPKcBu9HQA@mail.gmail.com/
> >
> > Koichiro
> >
> 
> I won't be testing in-line diff chunks. Please, just fix these issues
> and send a v6. Also: please do write some sort of a script to automate
> the testing of this driver if possible. Ideally: add test script to
> selftests.

Sorry for the delayed response, I've been so tied up with other tasks this
week. Ok, I'll introduce a kselftest for gpio-aggregator. Actually I've
wanted that from the beginning.. I believe it should rely on gpio-sim for
convenience, but please let me know if you don't think so.

Thanks.

> 
> Bart

