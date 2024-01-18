Return-Path: <linux-gpio+bounces-2352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7FF832261
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jan 2024 00:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A9D6B21458
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 23:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D7D1EA78;
	Thu, 18 Jan 2024 23:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN2nuqeD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DDD1E499
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 23:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705621717; cv=none; b=UQjsf6JyfDf+IKXNufR7zFN9VWW0TSS6tvCU4bxcCyRtghLC2s/Y9kQEnVoexESILkp0JgXhc7CXVG30h18fo0sGJsIT7/qHwg87jZSD6pIHCwBUU3LrXpVXX8GAJ1EreSLkQGsqNfewO2oy33+76YURwKt9cMh7HbNLxVC5qdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705621717; c=relaxed/simple;
	bh=GBhbCyyTzevO2Raswaby/YSQR0DwljlWQG4yC7Vd3Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rU/DDQ/kaMoFrLRkTBWti/xLCAQ2SQ62445bNQJA3X45bSXFtbuHAovIkAJggVQW912xGGksdHhOPJzEyMU0Uu7042NMgMPc0Y5xV8yvUgpAaKhISDpcnwK2RnYHfT3benvkvZModtjfrQys070Jt319BYLokoNgqkdKAhU4bcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN2nuqeD; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d50d0c98c3so10655085ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 15:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705621715; x=1706226515; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBhbCyyTzevO2Raswaby/YSQR0DwljlWQG4yC7Vd3Wo=;
        b=dN2nuqeDcwzb/eFVf1puTGrfF3EZgv3o7l8szBKmak1NcUbH5msxPx62gH0dxgmnKx
         6lwavYwG7YSFtNpZGu/aY8H9FYyX5GyjZbZXeHiH4zcxOyXpMx1e9JPDuGWVMkkiHROM
         5MmYqGIyxuxO2fundn+oc7wcccu45QeIst01R4hbt7fbf4SD9JELSNqNyHrN+s2xCPKW
         XbUHY0BP1pGbXsQVnZPOrixB3c337kOqKl63L/NKySlREpWaaK4jj3PtKF1NIeEwtBDv
         XiRv22sktXqMWlrvfBLXgzAlvk1jkGOqA0KqNKE8IwV+IuVGO4tortnK2Ymz/Dk28F7+
         ymag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705621715; x=1706226515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBhbCyyTzevO2Raswaby/YSQR0DwljlWQG4yC7Vd3Wo=;
        b=Y3AscqaeMKDqKJrle00juVb+fCM6kPfkOPDoKF4eGPR84GAJmEplHuyzGw0sg9V+rA
         ZyZBTeONU4SKYRZyzYic0S940DKzTP9XHkEJGRNpYO5zsqSwaF1SNWGQCWUyLclUIaa9
         VaMJcG83w6AId1MFm2q1oIPI8DtXtd73tdHn0+eyV2uoRXU0JZctWf28waBo7WMzeRsb
         +KokFKoUfQ9CY0YH36dnpW56Sh/99KuMWTeEMlfLenbXpZwRXYqQ08p4IV5fdsfDzZ4l
         AglyZIKDoHiJ8XaCMkB3ovwIEIZjt0XUNIBhRA3bIBPgKkD+EUKkqTjLbUvtfZ+nh24N
         IxXA==
X-Gm-Message-State: AOJu0Yw8iXbbbaUMQ+/larTzLj/TvmBVJvAx0/QBLtClfHENzCzIzwBH
	gJwP580BMiqZScxhiUXT2uuodGl+SBzAh9IW12A0/bN8r4TnemVRaBCb9QHG
X-Google-Smtp-Source: AGHT+IE7Ky1kBIjXkX1AH58oj6QUO5OCsQVqgCqTRSZ1X3AVmN1eBoXFcP5omxC4LWN+MrpFpt0OXw==
X-Received: by 2002:a17:902:e811:b0:1d0:6ffd:6108 with SMTP id u17-20020a170902e81100b001d06ffd6108mr148399plg.42.1705621715185;
        Thu, 18 Jan 2024 15:48:35 -0800 (PST)
Received: from rigel (194-223-183-150.tpgi.com.au. [194.223.183.150])
        by smtp.gmail.com with ESMTPSA id y2-20020a170902700200b001cf59ad964asm1886868plk.140.2024.01.18.15.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 15:48:34 -0800 (PST)
Date: Fri, 19 Jan 2024 07:48:30 +0800
From: Kent Gibson <warthog618@gmail.com>
To: "Westermann, Oliver" <Oliver.Westermann@cognex.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	"ada@thorsis.com" <ada@thorsis.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Re: Assign line names at runtime
Message-ID: <20240118234830.GA11295@rigel>
References: <PH0PR06MB833416FBBC8543802D72FA4D86682@PH0PR06MB8334.namprd06.prod.outlook.com>
 <20240112003558.GA3310@rigel>
 <CAMRc=MfeZTynTrdQdMqqvsMYsNo5yHgo+LzuRdqYpg-oZC+f6A@mail.gmail.com>
 <20240112123105.GA66782@rigel>
 <PH0PR06MB8334079C458EF28FE056CD75866F2@PH0PR06MB8334.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR06MB8334079C458EF28FE056CD75866F2@PH0PR06MB8334.namprd06.prod.outlook.com>

On Fri, Jan 12, 2024 at 01:16:29PM +0000, Westermann, Oliver wrote:
>
>
> On Fri, Jan 12, 2024 at 1:31 AM Kent Gibson wrote:
> > So I'm at the point that I think we could do it, one way or another, but
> > much less certain if we should.
> > I would not consider it if there was an alternative.
>
> I played around a bit this morning and I have a (probably hacky but) working
> prototype which adds a GPIO_V2_SET_LINEINFO_IOCTL and currently only allows to
> override a line name. I played around a bit and tried to break something, but
> currently, it seems to work. But I'm also open for any alternative, so maybe
> with some extra info, somebody has better ideas:
>
> The hardware variants I'm dealing with could be considered accessories:
> Extension of a base in different kind and revisions. As those, they are mostly
> not boot critical - I can defer probing. That would also allow me to defer
> probing up until manual probing from userspace, eg by a udev rule collecting
> more data and providing that to the driver once all data is present.
>
> Could e.g. an extension of the modprobe params for i2c gpiochip drivers allow to
> provide not only bus and address, but also a list of pin names? Ideally
> implemented on the gpiochip / i2c gpio level so this applies to all gpio drivers?
>
> (new attempt at manual formatting, sorry)
>

Sorry for the belated reply, but just to clarify where I am with this:

This looks like an init-time problem, more so than a runtime, so you
should pursue the init-time solutions and exhaust your options there
before looking to solve it via the GPIO uAPI.

Cheers,
Kent.



