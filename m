Return-Path: <linux-gpio+bounces-1373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC66811493
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C4F02821B3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118E22E850;
	Wed, 13 Dec 2023 14:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYIGPc9c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8850EB;
	Wed, 13 Dec 2023 06:27:43 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d2eb06ab11so29818545ad.1;
        Wed, 13 Dec 2023 06:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702477663; x=1703082463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RF87rT+TCcGi4gpFLCylRe645ttgfQaGUPgi6YFk+ls=;
        b=aYIGPc9cvWTYeind/TYMbD2PkGJsdwZyhKCK4U9eft/VUUS2prQADeN0w18SsLMpmK
         yhNMtVEoDaS/enJHRD9o+VtEGNCwP6SkjvFV3pQJaIe4uOgethzEWuSUaT6z3b/v4EkI
         Zg7vma1/3JBydcE4weG+8YElKOjMjRNzF/VdLIzsj+kQuUegFhUQOsaCyc6qPs2K5Mbl
         7Bq8KeIJOYTIK8zGuH6kW8b8jgNjUKeKsLzPmer1jN04x3++yjr/TnZxFOwfylSO2JCW
         h8/NGaS8HoXYjN+hFFzMqQjALPV6PFFSb4izjiTVlkPU1Cnxar0CsqGRXhV4ouCUsqec
         uofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702477663; x=1703082463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF87rT+TCcGi4gpFLCylRe645ttgfQaGUPgi6YFk+ls=;
        b=E2Lf4Wx3R84yz0W7xHYQdd3xsyrPWNzug2CfFMQ46gyxoneTDBe2tAg1UVdNvM3ykX
         2LqmGOd/iZT3U5dPjeQP0ru6Q0KD9/hXg/jQmt1mt09pkaaaTlNbCAOhzIoz2XJXE6no
         zM/7u2okfVwK1MZO+5fYwEUcLgoTBlg5xcwpg5HuIUMjPxtXj19sxi/7ILueGP3bwfbT
         DIgAecVR8sIIGT8c04dMAGzMvivYQYVPmMdEbPutiXKjkNJlST9sN0x97brXTw5ybVhu
         sUfs705cDWK2mpgZ5TplaJE1UYEH/oCQM8vebTPuqWe+W1YRQjldzLkjwSELtQhC2IcK
         GRzw==
X-Gm-Message-State: AOJu0YySgRhvNao7pOqT3a8HeHiG1RWL9fjsZUljepNlogCwtkgebPH0
	Wh6ZHNLB1gtmrduLdjhyFswJ976oueA=
X-Google-Smtp-Source: AGHT+IHyDL+gHKBvSbY+OKpjWnsxqeUE9q1xrzVuqyk8RPUciIUVv3s9O7Q9qTwTjQA1UsBRVeqeWw==
X-Received: by 2002:a17:902:ced2:b0:1d0:6ffd:6e68 with SMTP id d18-20020a170902ced200b001d06ffd6e68mr4619224plg.96.1702477663267;
        Wed, 13 Dec 2023 06:27:43 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902b58700b001d0c41b1d03sm10659959pls.32.2023.12.13.06.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:27:42 -0800 (PST)
Date: Wed, 13 Dec 2023 22:27:38 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH 1/4] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXm_WsIpgIyOUNHt@rigel>
References: <20231212054253.50094-1-warthog618@gmail.com>
 <20231212054253.50094-2-warthog618@gmail.com>
 <ZXm3rayrcvfO1t1Z@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXm3rayrcvfO1t1Z@smile.fi.intel.com>

On Wed, Dec 13, 2023 at 03:54:53PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 12, 2023 at 01:42:50PM +0800, Kent Gibson wrote:
> > Store the debounce period for a requested line locally, rather than in
> > the debounce_period_us field in the gpiolib struct gpio_desc.
> >
> > Add a global tree of lines containing supplemental line information
> > to make the debounce period available to be reported by the
> > GPIO_V2_GET_LINEINFO_IOCTL and the line change notifier.
>
> ...
>
> >  struct line {
> >  	struct gpio_desc *desc;
> > +	struct rb_node node;
>
> If you swap them, would it benefit in a code generation (bloat-o-meter)?
>

Didn't consider that placement within the scruct could impact code
generation.
Having the rb_nodes at the beginning of struct is preferable?

> >  };
>
> ...
>
> > +struct supinfo {
> > +	spinlock_t lock;
> > +	struct rb_root tree;
> > +};
>
> Same Q.
>

Same - I tend to put locks before the field(s) they cover.
But if the node being first results in nicer code then happy to swap.

> ...
>
> > +static struct supinfo supinfo;
>
> Why supinfo should be a struct to begin with? Seems to me as an unneeded
> complication.
>

Yeah, that is a hangover from an earlier iteration where supinfo was
contained in other object rather than being a global.
Could merge the struct definition into the variable now.

> ...
>
> > +			pr_warn("%s: duplicate line inserted\n", __func__);
>
> I hope at bare minimum we have pr_fmt(), but even though this is poor message
> that might require some information about exact duplication (GPIO chip label /
> name, line number, etc). Generally speaking the __func__ in non-debug messages
> _usually_ is a symptom of poorly written message.
>
> ...

Yeah, I wasn't sure about the best way to log here.

The details of chip or line etc don't add anything - seeing this error
means there is a logic error in the code - we have inserted a line
without erasing it.  Knowing which chip or line it happened to occur on
wont help debug it.  It should never happen, but you can't just leave it
unhandled, so I went with a basic log.

>
> > +out_unlock:
> > +	spin_unlock(&supinfo.lock);
>
> No use of cleanup.h?
>

Again, that is new to me, so no not yet.

> ...
>
> > +static inline bool line_is_supplemental(struct line *line)
> > +{
> > +	return READ_ONCE(line->debounce_period_us) != 0;
>
> " != 0" is redundant.
>

I prefer conversion from int to bool to be explicit, but if you
insist...

> > +}
>
> ...
>
> >  	for (i = 0; i < lr->num_lines; i++) {
> > -		if (lr->lines[i].desc) {
> > -			edge_detector_stop(&lr->lines[i]);
> > -			gpiod_free(lr->lines[i].desc);
> > +		line = &lr->lines[i];
> > +		if (line->desc) {
>
> Perhaps
>
> 		if (!line->desc)
> 			continue;
>
> ?

Seems reasonable - I was just going with what was already there.

>
> > +			edge_detector_stop(line);
> > +			if (line_is_supplemental(line))
> > +				supinfo_erase(line);
> > +			gpiod_free(line->desc);
> >  		}
> >  	}
>
> ...
>
> > +static int __init gpiolib_cdev_init(void)
> > +{
> > +	supinfo_init();
> > +	return 0;
> > +}
>
> It's a good practice to explain initcalls (different to the default ones),
> can you add a comment on top to explain the choice of this initcall, please?
>

Not sure what you mean.  This section used gpiolib-sysfs as a template,
and that has no documentation.

> > +postcore_initcall(gpiolib_cdev_init);
>

Thanks for the review - always instructive.

Cheers,
Kent.

