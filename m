Return-Path: <linux-gpio+bounces-15332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EAAA274AD
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 15:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F3D618829AA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 14:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6300213E66;
	Tue,  4 Feb 2025 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="mBFcWt/Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA62139C1
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680299; cv=none; b=Uv0KMDr4QGOxOruX47oJ9Htgcx/L/fFnOY98yxgtEXf0CuXuoCr6Ws9ifnKbaaVT7nk4E+bkHTuIZLQI4zXKwhwm3t/mnjLlFuwRtph6wYuRBOBo6VjkogvVxust9bSmBemDv7ABN1PuEH5bui5c0ZC7YucxhCwpMjTQJwfAQRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680299; c=relaxed/simple;
	bh=9teYJwqqzM5RFJ+8dP6uj/h5FosolVaZCmXIUOJI1Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCEJivc1qTdpjfqtlIiS8023blWltLo8bOk0b61oQkciNGivXmVeQzIoYvqLYnsKoggQv2R+gsImyIBhh9hXEQMh4faDWAe2z36O4fW/5XBFJWLCJSYYUjTBXJvXLS3l84cy7bhF+S+WQSj8E8t/NRVkXC/Tv7ENpCyW8yAcrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=mBFcWt/Y; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5C7453F181
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738680294;
	bh=zxOwQXHcqsZg1DYdwRGnMofNXrezdocUt5b4vJLNAf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=mBFcWt/YUhc7lZ3sBwotdOLwjSnxBmMxE9+2fR58N+YnnpxSQNxGpnRA44SorPbWS
	 fafAZf/QutS9viHZq+AB2rhFf1kI6U1vPL6aVezOTqYG1bZPIdsfatE7RIljLH/wCl
	 7JJrKcQG6IgzvdaFPAwRo+jT084XCySeJIugYE/XLHWufFO6diOWCvKH0Y6v7zIXiO
	 XQDBStRy4Iuo8ScZNhjG8zY+DxySDWd4CWKl51E3HOgBHKusD+wNYv2orqExHY5mfU
	 arliI7SVZMxI2ExutM+wjLjjrURmc4DE9TP8fY0atGmLNgv1HG8TaFh5GCg8xfto36
	 s6AV0CO+xHzdw==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21f022fc6a3so19471595ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2025 06:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680293; x=1739285093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxOwQXHcqsZg1DYdwRGnMofNXrezdocUt5b4vJLNAf0=;
        b=tZK3rvTpo1sR7T4KhW4nTrr2l7TDjRygbm+rss76SGyv6FuY+J+wu9fmpGz8ctkQyf
         0Cq82ozbpjnGpfTRifWAA/6x6HtPHiFA53evXu0YRJlFiK+Y2fVQwZLY3T9ygRpcYRpH
         y/fHj7GWdlxHc/OKhnblug2AsgToHn6WDWlUyWS3LVdkvjuGp08MVBWOf/O9U4ZnfCS+
         a6Jortj5QwdKLdxMtJhOZOUE94SinJuD3e4Ss+eJsLvvn+1zY9K41aHhRERMhUTeh0oq
         WMd91TuIiJ8TCmBT9tUoD8+rrCkvH4WwzNuypO3iXp0S/o1o1/Tagfc5KnLHYpVDliTz
         HeHQ==
X-Gm-Message-State: AOJu0YxwIgzvQ59m8p/p8WrzF61H3VMQz7tnJWbOAwdYKJX71IAOjC3t
	/yP9yyDODEFmOCeu4wikkkcEyZC9gU2SYcCqqRTZ5Gc0rfaKNoM5Mh9fB+nMp1lf6Dm+OJh9FD4
	jaY3AVxemF7wXABj3ZRtFT8IF7Sg8B6fJdej+sHQee9wjM7PAHHs6PvbzlVmrKJSJnc6Gi/yjtd
	c=
X-Gm-Gg: ASbGncvRC33xQlpeeiBSh9GmkDalEcuC14Y2ORr0dFjuExnj4wRsyGzqgbxC2jMVmmB
	TvdPCFvTrVpp9NPwysAR91o78YYZgwYq5nwFOIWSRdxMQVeLngM/xwwmv+eOPhBmu6hiAntTAlk
	5MhkTbmBZhdIw/sqXnH3mXdSvztns3Bylpql7T3XqKQMcYvRdV2ilZZPd7WiXdYxZpTTYvsxWNy
	5LrPbs3uuo2oTeKJ2YrTj3cHU7Zbh60xfq0OfyOj8TH2Vzv2hT2/c0udcf8agSDn2Cwfpokostw
	bflMTRA=
X-Received: by 2002:a17:902:da84:b0:216:2aec:2d54 with SMTP id d9443c01a7336-21f01c3d2b7mr48082585ad.8.1738680291401;
        Tue, 04 Feb 2025 06:44:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZHYpYZXJFrqgUlIWj+UgazrfCD8t7GMWpQI06MDxwE31jOCPjjfMtRmeJX0yv+O42j2I+eg==
X-Received: by 2002:a17:902:da84:b0:216:2aec:2d54 with SMTP id d9443c01a7336-21f01c3d2b7mr48082305ad.8.1738680291046;
        Tue, 04 Feb 2025 06:44:51 -0800 (PST)
Received: from localhost ([240f:74:7be:1:45f0:d4ba:baba:a275])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33000ebsm97243265ad.159.2025.02.04.06.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:44:50 -0800 (PST)
Date: Tue, 4 Feb 2025 23:44:49 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] gpio: aggregator: add read-only 'dev_name'
 configfs attribute
Message-ID: <rejcrhomapkfyho55bedlfo5cqqly2opzkkym44mqqpsofzjmc@pylnreerkpcc>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-4-koichiro.den@canonical.com>
 <CAMRc=McftUKH_DNvsJPjBP1MMSo94CCXxT+ffoR5F_H=OegBvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McftUKH_DNvsJPjBP1MMSo94CCXxT+ffoR5F_H=OegBvg@mail.gmail.com>

On Tue, Feb 04, 2025 at 01:49:22PM GMT, Bartosz Golaszewski wrote:
> On Mon, Feb 3, 2025 at 4:12 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Add a read-only 'dev_name' attribute to configfs interface, which
> > exposes the platform bus device name. Users can easily identify which
> > gpiochip<N> has been created as follows:
> >
> > $ cat /sys/kernel/config/gpio-aggregator/<aggregator-name>/dev_name
> >   gpio-aggregator.0
> > $ ls -d /sys/devices/platform/gpio-aggregator.0/gpiochip*
> >   gpiochip3
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  drivers/gpio/gpio-aggregator.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> > index c63cf3067ce7..76d3a8677308 100644
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -732,6 +732,23 @@ static struct configfs_attribute *gpio_aggr_line_attrs[] = {
> >         NULL
> >  };
> >
> > +static ssize_t
> > +gpio_aggr_device_dev_name_show(struct config_item *item, char *page)
> > +{
> > +       struct gpio_aggregator *aggr = to_gpio_aggregator(item);
> > +       struct platform_device *pdev;
> > +
> > +       guard(mutex)(&aggr->lock);
> > +
> > +       pdev = aggr->pdev;
> > +       if (pdev)
> > +               return sprintf(page, "%s\n", dev_name(&pdev->dev));
> > +
> > +       return sprintf(page, "%s.%d\n", DRV_NAME, aggr->id);
> > +}
> > +
> > +CONFIGFS_ATTR_RO(gpio_aggr_device_, dev_name);
> > +
> >  static ssize_t
> >  gpio_aggr_device_live_show(struct config_item *item, char *page)
> >  {
> > @@ -781,6 +798,7 @@ gpio_aggr_device_live_store(struct config_item *item, const char *page,
> >  CONFIGFS_ATTR(gpio_aggr_device_, live);
> >
> >  static struct configfs_attribute *gpio_aggr_device_attrs[] = {
> > +       &gpio_aggr_device_attr_dev_name,
> >         &gpio_aggr_device_attr_live,
> >         NULL
> >  };
> > --
> > 2.45.2
> >
> 
> I don't understand why this isn't part of the previous patch?

I just separated it to keep the previous one minimal as possible :)
Ok, I'll squash it.

Koichiro

> 
> Bart

