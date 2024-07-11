Return-Path: <linux-gpio+bounces-8174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1327392DE1C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 03:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 448141C213F6
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 01:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F023D66;
	Thu, 11 Jul 2024 01:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHpiUilm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7A23CE
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jul 2024 01:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720662270; cv=none; b=sKZd/zqIsSfr1jAhl3VwF9BMm0eTOZqfDBLGiO39UnqFpVFrI3kiFBVd6WxFxSa2qrEi8jBC73tP3U3CpPZ6Yg1onYCWZgUdN28KFjhE7RU78pV1Quz+cva7Gp4PiPg5mU3kDq6IBSG91LxmUzTIKNv+V9twq5MUkhZKatjTU6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720662270; c=relaxed/simple;
	bh=SzxfgWElvcRoi0K9hSG+XKOdt/whSutT4icUAWbkBcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKA5rm23xvEi7S87QzZqwzSCnfIZqLBu+xhL/JCG5VX7+podSWET0T5bestzIN2S6nax2DDWJ/t/lxn0OFS0v8pEBWeh3fxfomJtyHfjPxC3uBUWK2EeZ7ZiME2KI4AOzo+di5L/0TUWooYhPTsgLP0UVLj6L3VZhd3DVhzsiss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHpiUilm; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fa9ecfb321so2718535ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 18:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720662268; x=1721267068; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ifDs5NPlMXzDSwm2rNGuoTSpI4/oYLlKLLWK5/qSLkg=;
        b=LHpiUilmNltZOA4yEbe9QBG+DBQwvCAjjw568Lmir/EtDJMeMqMiFL12tjy2ry+OCM
         Ca+qsHVf6a9G+KpiRyp4aRk8yiXKM9nYV0+0IBfXhbK8Zj9mUG4TKfeuRORfxIABzSIU
         RtGwOKNLlZx2v3pBc5gV6PWS7rZ8cU0j1g6RxnZfzzkTO869HPDpZmbSw/zRCqZ4+Miy
         5KUgdbp67zlrbHK5cTwDIIUWuRwFaZcyRM5wudxgHAZ285LgolzMnMyx3OGmag//wj6h
         IfwCUURAsRXiG+L80+tA1B5sgxNLa0YJM0NoeKDWZF/y28Y7bvnyxNq0fQBO6LYHxMNr
         pHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720662268; x=1721267068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifDs5NPlMXzDSwm2rNGuoTSpI4/oYLlKLLWK5/qSLkg=;
        b=bg0B/W6QRabhsYkGYPoD/CqwhkMA0ePlzISldg7JjjSkjewKYc7yavgCbA0CAQosJu
         xeTJqPmw0nmdFvwJm/FKwXzSnMf+OSV3D4cIw+BdTMS0km1NNuQamFyoX18YckDH77/V
         aLBgD18FzydY2jgc/RSmDFQqM2mN8b4cjNRTau/7KzmNCLKVi1i1SNr4gVMVDyktARmV
         6Tv+1EQ+9BhylxaSMcdphe4urz/1D7jcany4rNf4wOLzhSBIBS4weIB0XKQrNlYZRJU9
         miBJlIwvEw7f4VxMwqZ/YF47ruBnOZ0HTfmAX4t9xC6U6PfqfSUp3QTckX1/1dt1Hb2w
         EgdA==
X-Gm-Message-State: AOJu0Yyn7aJe3MiT/vo6AVCmMuaVAHT2YOMw36s2rproexMAHXD8lS1O
	x/8XINcAcMijaK3kYMTO9JuU0KPvhr2xhhgafNTpMRrIQACwZmTmRZw1ng==
X-Google-Smtp-Source: AGHT+IHqrQJcbBSe1a72pL5Xb8spfw1kp6Qw2l4Ko98ToumJj0fCFMAJ4aqHy8xqQu0AvGcSwUcVZQ==
X-Received: by 2002:a17:902:8342:b0:1fb:74b3:53df with SMTP id d9443c01a7336-1fbb6d4f44amr40820465ad.36.1720662267885;
        Wed, 10 Jul 2024 18:44:27 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a2bbd2sm40957195ad.90.2024.07.10.18.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 18:44:27 -0700 (PDT)
Date: Thu, 11 Jul 2024 09:44:23 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Akash Borde <Akash.Borde@heilatech.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Seth Drew <Seth.Drew@heilatech.com>
Subject: Re: How to set GPIOs persistently high with libgpiod
Message-ID: <20240711014423.GA7963@rigel>
References: <SA0PR01MB61705F8B19335B41339F2260E6A42@SA0PR01MB6170.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA0PR01MB61705F8B19335B41339F2260E6A42@SA0PR01MB6170.prod.exchangelabs.com>

On Wed, Jul 10, 2024 at 10:36:08PM +0000, Akash Borde wrote:
> Hi!
>
> I wanted to look for a way that we can set output values for gpios using Linux’s libgpiod library such that we can write a value to a (chip,pin) combo and be able to read the value we wrote from that same pin.
>
> For example,
>
> heila@device# gpioset gpiochip4 29=1 ### Sets GPIO Output Pin to 1
> heila@device# gpioget gpiochip4 29 0 ### Reads a 0 at the same Output Pin
>

There is no way to do that with the libgpiod v1 tools that you are using.
It can be done with the library directly, but you need to write some code.

With the libgpiod v2 tools there is a --as-is option on gpioget that
does not switch the line to an input and so can read back the output value.
Note though that the value of an output AFTER gpioset exits depends on
the device driver, so it may get reset to its default value.  YMMV.

And there is a gpio-manager daemon in development that would provide a
solution independent of the driver.

> Happy to provide more details on our hardware/product/application if that’s needed as well.
>

Generally speaking you shouldn't use GPIO outputs as a persistent store.
Have a process manage the line.

> I’m not sure if this email address is monitored, please let me know if there is another one I should reach out to.
> https://manpages.debian.org/testing/gpiod/gpioset.1.en.html I found the email at the bottom of this manpage.
>

That email address is correct, though it would be helpful to prefix the
subject with [libgpiod], as per the CONTRIBUTING section of the README[1],
as the list also serves other purposes.

Cheers,
Kent.
[1] https://github.com/brgl/libgpiod


