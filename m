Return-Path: <linux-gpio+bounces-14446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E232AA002CE
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 03:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E0697A1ABE
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 02:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A8F1A841F;
	Fri,  3 Jan 2025 02:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="pQMOm+Ml"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129973D68
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 02:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735871872; cv=none; b=iXEHftgMLukV/Az8fuWol8bFTNjhOLbCJIliYI/XM2f+ey5Ee1aAZHn/3p9VL4G3PzyDwYdFmQSEARa69uhnWxSpfUQku25ORUAPcBjrMg7T6yuKKp0FPSzcr5c/wmB1u61ugOqlcjz6rxyp5rJdKXU4vcu+YzI6w4uU81KrffA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735871872; c=relaxed/simple;
	bh=XSMQquJfkAml6CE1JSkS57RbQcGdf47sgEO3cDPmSKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8aCFQgLoY390mRAqPde5lowoO5Rx53RbT7xZaWDjMjD+wcXb51wcppymGd0t61wBfvcHfiTIw9rbClgyXuB+nTsWiwKc6vlcCu3/BwLXJQXOJRg68MWT5K+mDvclvbKgh1bRxocxmbgg/Ztb0L/OA2BHLZvZ/al9aOAJDWwF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=pQMOm+Ml; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9E61340FAA
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 02:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735871868;
	bh=zoFHtRt9wDFyfF0AIy4GtCMy+QiqQpcG+QHgNcK0JdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=pQMOm+MlSK9wBYxjZt9fHUujzR0+C2Tql+pMT0KHp6ImYi1Joe9CjfDeZkP+bM9KH
	 ELQ/EpHqR2J4bsydhzWGJ7TRFvlcePpHGt+0uKrAuRDYrWFiGke1PUDy6lPLXYlXQ0
	 PJUdWZQkJ6V2yZXemFl5CGbbnNqh7E+ib5MRltJbu9fc+I+xmoJEdZbxINYBrGjDoU
	 kEE+MIImEzofinbDbp85p6SKK1fdRsvSsVZdhtOd2ydeXfTVdB6YMONLr5VCbhcnvu
	 4YdA8yROzwTkq5ib8WSJghllmV56whqbcs4dnDIqIuf5e9CL4qAMq/6VjYgbcoeTp/
	 U8e8OXmOaI4eg==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2163c2f32fdso260877725ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 18:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735871867; x=1736476667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoFHtRt9wDFyfF0AIy4GtCMy+QiqQpcG+QHgNcK0JdI=;
        b=a4LafR6VbrRX/y1p0G2Clx6OVvmoUKGYAwSTa6DpLvNpjXd+m9Va5VWcmuywoWTNph
         vyIuMLIAf8QxDQ9r9DacSno4F/J4VUJUHqKNvtOTMaHYTvKqAp8SQXr5xNZcj1W+RZmT
         MNBTmWDIKuuj5FZAmET918cZXdO69aG7lLbJDXWQZw7cUUeY6XIVsXMeBfzwZauZr8fW
         xQhJf9B4MZgC/k2jnLcu0Q8hKUS2OlPUF6Nh+nlFYOS4vS0My+yWERlkolDUFhUn80HO
         4gMQ5npHtDs2tQfTCfPJtkru4+3jQZfyGS80hdi4eMn1n5Bq1mDrkehmXNca5OgMgaX0
         Pg8Q==
X-Gm-Message-State: AOJu0Ywybw3WZBKMS2Olcs8fBv2V1Bhc0crTc2gqEjbBBDyTUHC5gQR1
	YIdzIDc//M/uA+mfLb4YDksV+2BAOeieXdgKJkdZ5uA6FaH5y7urryfCRZHF365T4i3tqF7XDDN
	uUQqx0CO4P1cPukIWkwGaUPgZ7sorMrMA/aOJq4Pih7xyjW+pbVlZ4MGkorKxwL/3Qfq9cqIsf9
	o=
X-Gm-Gg: ASbGncu+RNKhzO/IC8gmfml0HNe6G1Sf3LYT5gqFsxajZYYw6CSQAdeYcPdhbTMKND9
	uBNhVhc2kVhxsC06DqsNfDzUr4gJzN7rxPLqW8FxgYbYdYT9AUIFr1AEgKO1UAskppSJNI0hdwg
	T6byu+7t/WOniWD8nR/oL266ivH1Vd4jg8I48NZEBJMV0ApAtDzJgm0yhbnYvNxjWtKWA0SpjVi
	gUQCg1XDHAiL5m1XkvAgX7Bd/ImTdHzIillxljYrZ5poBGb47pX1Pk73mw=
X-Received: by 2002:a17:902:c943:b0:216:2e5e:96ff with SMTP id d9443c01a7336-219e6cd7bc3mr797113945ad.0.1735871867143;
        Thu, 02 Jan 2025 18:37:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYciOBYJWn2IaQlR/VCVsTJ9pN9L+dklQHTWNRO/N1pB4Yjab14/tiZg70LgEc44n3EN4Q+Q==
X-Received: by 2002:a17:902:c943:b0:216:2e5e:96ff with SMTP id d9443c01a7336-219e6cd7bc3mr797113705ad.0.1735871866819;
        Thu, 02 Jan 2025 18:37:46 -0800 (PST)
Received: from localhost ([240f:74:7be:1:cb9e:69af:fb16:54f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9704dbsm235751895ad.98.2025.01.02.18.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 18:37:46 -0800 (PST)
Date: Fri, 3 Jan 2025 11:37:45 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] gpio: virtuser: lock up configfs that an
 instantiated device depends on
Message-ID: <pdz63f2y3ivqb3pu6hqvx3ir5gystcy2g77cpd43s7fm75rrgy@eyfkw5vrnx6f>
References: <20241224060819.1492472-1-koichiro.den@canonical.com>
 <20241224060819.1492472-4-koichiro.den@canonical.com>
 <CAMRc=Md+Z9Fd1TRqNB3V41vmxrk8wZ5gk_C9tV4jbCiUgAogsg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md+Z9Fd1TRqNB3V41vmxrk8wZ5gk_C9tV4jbCiUgAogsg@mail.gmail.com>

On Thu, Jan 02, 2025 at 02:21:25PM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 24, 2024 at 7:08 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Once a virtuser device is instantiated and actively used, allowing rmdir
> > for its configfs serves no purpose and can be confusing. Userspace
> > interacts with the virtual consumer at arbitrary times, meaning it
> > depends on its existance.
> >
> > Make the subsystem itself depend on the configfs entry for a virtuser
> > device while it is in active use.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  drivers/gpio/gpio-virtuser.c | 49 ++++++++++++++++++++++++++++++------
> >  1 file changed, 42 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
> > index c9700c1e4126..45b8f192f860 100644
> > --- a/drivers/gpio/gpio-virtuser.c
> > +++ b/drivers/gpio/gpio-virtuser.c
> > @@ -1533,6 +1533,32 @@ gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
> >         kfree(dev->lookup_table);
> >  }
> >
> > +static void
> > +gpio_virtuser_device_lockup_configfs(struct gpio_virtuser_device *dev, bool lock)
> > +{
> > +       struct gpio_virtuser_lookup_entry *entry;
> > +       struct gpio_virtuser_lookup *lookup;
> > +       struct configfs_subsystem *subsys;
> > +
> > +       subsys = dev->group.cg_subsys;
> 
> If there'll be a v2 (patch 1/4 possibly needs it), can you assign it
> at declaration? Same for 4/4.

That's a good idea, I'll do so in v2.
Let me also fix a minor typo in the commit message ("existance").

-Koichiro

> 
> Bart
> 
> > +
> > +       /*
> > +        * The device only needs to depend on leaf lookup entries. This is
> > +        * sufficient to lock up all the configfs entries that the
> > +        * instantiated, alive device depends on.
> > +        */
> > +       list_for_each_entry(lookup, &dev->lookup_list, siblings) {
> > +               list_for_each_entry(entry, &lookup->entry_list, siblings) {
> > +                       if (lock)
> > +                               WARN_ON(configfs_depend_item_unlocked(
> > +                                               subsys, &entry->group.cg_item));
> > +                       else
> > +                               configfs_undepend_item_unlocked(
> > +                                               &entry->group.cg_item);
> > +               }
> > +       }
> > +}
> > +
> >  static ssize_t
> >  gpio_virtuser_device_config_live_store(struct config_item *item,
> >                                        const char *page, size_t count)
> > @@ -1545,15 +1571,24 @@ gpio_virtuser_device_config_live_store(struct config_item *item,
> >         if (ret)
> >                 return ret;
> >
> > -       guard(mutex)(&dev->lock);
> > +       if (live)
> > +               gpio_virtuser_device_lockup_configfs(dev, true);
> >
> > -       if (live == gpio_virtuser_device_is_live(dev))
> > -               return -EPERM;
> > +       scoped_guard(mutex, &dev->lock) {
> > +               if (live == gpio_virtuser_device_is_live(dev))
> > +                       ret = -EPERM;
> > +               else if (live)
> > +                       ret = gpio_virtuser_device_activate(dev);
> > +               else
> > +                       gpio_virtuser_device_deactivate(dev);
> > +       }
> >
> > -       if (live)
> > -               ret = gpio_virtuser_device_activate(dev);
> > -       else
> > -               gpio_virtuser_device_deactivate(dev);
> > +       /*
> > +        * Undepend is required only if device disablement (live == 0)
> > +        * succeeds or if device enablement (live == 1) fails.
> > +        */
> > +       if (live == !!ret)
> > +               gpio_virtuser_device_lockup_configfs(dev, false);
> >
> >         return ret ?: count;
> >  }
> > --
> > 2.43.0
> >

