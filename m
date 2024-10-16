Return-Path: <linux-gpio+bounces-11420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 759C99A05DB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72001C20FC2
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFDB205E35;
	Wed, 16 Oct 2024 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI14WF+a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6896205E11;
	Wed, 16 Oct 2024 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071798; cv=none; b=M8zUUCaLf5VQ2oFjpVGDlWo0pBDQvVJshh7KR48ohQi/nmP9hSjCI8Iq1yLk1xXVG5O7yB0Lj9Gkfb0O0SvNxK/jQdUlr0p3dpUZZSnhzbS0aFicfHRhXIZR0ZViOlWPQH4TQc9oTmpLgQdtGdddZWMewH5Rr1b2vm4J/27z0k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071798; c=relaxed/simple;
	bh=vm6c5zTe3ogCN7P2aIvkVQuXo2ZwDpuNn2J6zMnLtq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pINIPIcupKSQ1d9BNo2a6mb2hnpnbEvCBy7JgfFkL8/N9e/NzUp6+0AN2PqyOxygloyWvEn1OIRm9UEp8+HzLyfXl7tLnpkIlum0AVzlgqLgYJRNWHh61TtcFYHkCmRxvAttQkpmwuZcidBZSXv6gPzVRMtQDP5gvVIQX2dE8Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI14WF+a; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-207115e3056so51441635ad.2;
        Wed, 16 Oct 2024 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729071796; x=1729676596; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4JdPb6dggiDddx2mZKy5AeVivyxS2f7SnBQhHfVM6F0=;
        b=MI14WF+an5m7V57uTUT9Q+yr5LHxb16yWDF3jh6c7n6NGbjrQtciy9h6zA9XQh5d79
         +7I43otP4LkQiPAfezqyshEMlMn9nUJMmqebo7bNUKVs5Odo/Q2V6LU7dvCkNfjNy+Y/
         dxl1CIRksEL4pT89DnnF6QcFARvSUYPXeTAQFafpaF4udyukr0fdmtlmBefQk9Vx3Nrr
         eBNU5DzmnH/x6mnmrzkUfL0AAcBjsQngp59yt87vbE3r+g2ICtodO5IRDe1wyu+vb/UL
         BL7VNNfabuAvwWfUtVanRCY85QHxxmnYOpwRMQ/EozmjiEf7/eOGG2fg481WDuwUFUGq
         +VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729071796; x=1729676596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JdPb6dggiDddx2mZKy5AeVivyxS2f7SnBQhHfVM6F0=;
        b=TnybExtJyvBcObQUcBExINRSR38Dfg+LW/uBLtJXCQUiKy6bVHxQ/ZiK1XYoRrm8y5
         ItbAPGHfIU1mCz3pcUfYpksHX/ogdS3nkrAYZWeAyJE2tQt46kkS/PhGXnwmgSiyljtr
         O7y+aaOARWbGiPWEnFzP+xeKujn+ZU2B3/Pnw0rhDspP8wO0jf/cnmwpBoFiSp679khd
         pMr8ATWeAvOEuy5QJkVGQiDu06t1clm4f8GPlrhWKCdkyo2RBbHYOMgE604ilis68g6Y
         BjuUK/seJ4GK7JrjfObd/ykftXx8oh+C4BGeAxumZLx7pe/izpygKYMyS/BPsuNKpTx7
         it+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWigAnJQ4rhjJPspFqIb8gdmoZ/zI7GpozYwclDMbQHQyX14js6BiuwqmTZQ3Hh5X566sz8Y0A1kM1Uwmhj@vger.kernel.org, AJvYcCXL5rx1J2gnaz91viJjKuUiQIzV/AUaXDHpu1AehK/d7yoiA/vmTbuc3WoL24pnmogTl7R2QZkJGzYO@vger.kernel.org
X-Gm-Message-State: AOJu0YwyzyPJfAQnDV3HFLX2F6B20jephpUoTlRgFFH+6INzs9x7EK1S
	16TH8gmaqKAQogmAgskPMarsR1XQpJgxvBoiTcBz4appRlwf77h+tKUm5A==
X-Google-Smtp-Source: AGHT+IFFFhMerPMQrKtmTWnNhpLODC7igg1EoEmBu86qH1UAkTyoc9u0bHxw6TAfW1VuhYm/oz2Wvw==
X-Received: by 2002:a17:90a:e7d2:b0:2e2:d16e:8769 with SMTP id 98e67ed59e1d1-2e3ab7fb55fmr3546365a91.15.1729071795918;
        Wed, 16 Oct 2024 02:43:15 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392eff82dsm3638770a91.26.2024.10.16.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:43:15 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:43:11 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241016094311.GA210746@rigel>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel>
 <20241016072730.GA120095@rigel>
 <20241016083747.GB120095@rigel>
 <CAMRc=McR_eMizF6r30NqbgK4mE5ErzR=wbkD4O-Czn=+Oj4AXQ@mail.gmail.com>
 <20241016091714.GA207325@rigel>
 <CAMRc=MdoeyXwKuLmrmJ8zRCtVDNzEd34zgZ5Autye0TNv_OLhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdoeyXwKuLmrmJ8zRCtVDNzEd34zgZ5Autye0TNv_OLhg@mail.gmail.com>

On Wed, Oct 16, 2024 at 11:22:07AM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 16, 2024 at 11:17 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > > >
> > >
> > > You mean, you get a CHANGED_CONFIG event but the debounce value is not
> > > in the associated line info?
> > >
> >
> > Correct.
> >
>
> Ok, let me see.
>

When setting from userspace the issue is that linereq_set_config() setting the
direction will emit, quite possibly before the debounce has been set.  The
edge_detector_setup() that does set it can also emit, though only if the
hardware supports debounce.  And then there could be a race between the
notifier being called and the period being set in the supinfo.
(the set will probably win that one)

Debounce set from the kernel side is going to be an issue as cdev
catches and stores the value from userspace to report in the supinfo - that
isn't the case for kernel calls to gpiod_set_config().

Seems moving the debounce value out of the desc and into cdev, which seemed a
good idea at the time, might come back and bite now if it is no longer
restricted to being cdev specific.  Now there is an actual reason to
store it in the desc :(.

Cheers,
Kent.


