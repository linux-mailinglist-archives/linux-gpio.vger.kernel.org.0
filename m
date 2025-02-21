Return-Path: <linux-gpio+bounces-16396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D01AA3FB80
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 17:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABCB886591A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 16:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9A2204F79;
	Fri, 21 Feb 2025 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zWJei4df"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EFB1E8850
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740154687; cv=none; b=GJ27CPVdYsKsAhpqh0I/fHJI2eDfoa1YtmXQ//P1VYjeBjg/mb1zpau6o6+UpLplTuj8JunrSI38U6Jzoz0xWo/CV8WA+V0wboFspHH+9auvVSwt2M8NVs2P1aDwqC4GJvhwtaigQuKz7uD/+5iWemfOOS6JCoWGy+1GTFpZ50Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740154687; c=relaxed/simple;
	bh=9LLeFMN5mZ1VmJ9i1HBQPXcvFhI1Vi87LvaAFC0J1Ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNWx7OrrozPHYD5FfFSYrv1Ak84YFsSgK/HY69Lpi5KlVweaVfbok4ZMjkR9ve1Ir4LSbGR7Dq6G3Fw/N7sCURu+Wod0RhG7gtD47vE0YiEliy2SPOdiivuXFcUxacbTmm9dE9soNz+blufCJUB51jLzl/dMCL4Jvhr2RsUmo54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zWJei4df; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-545316f80beso2104965e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740154684; x=1740759484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LLeFMN5mZ1VmJ9i1HBQPXcvFhI1Vi87LvaAFC0J1Ms=;
        b=zWJei4dfmiFJ4yoO2e9yo2T8MjmHnvt8HjVu/Bnjf3CbxPGhk068gzR6somSJD1pWZ
         SW51ahhGxCPRPdsNFVCS+4vR3vi/g/eUMJrsQuspzpRymwZR1FA4BWRbOcsmitBiVyBv
         3zU8A4FjFVZO08HzYvTb+E7ajCBkojKM9Co/89mXpQPbLapdr7xt/007Qq+x6IKmGWoY
         njBdKISCDV+zSRPJbrxiU/jQA1e1ZVuJmwfwULcb2tQ46HGwWHDNllsNOHyZW5raG2O6
         mb34MXSXLpQ6FsIwJ6FeJAR9eAVJ5I30RVdZJ3MRDgrQ/T8EiGNtxY0po5EFmPnp84Gk
         XiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740154684; x=1740759484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LLeFMN5mZ1VmJ9i1HBQPXcvFhI1Vi87LvaAFC0J1Ms=;
        b=cI7Q4ZZiZIvXBJVHN2ZYrF0PEIO2N/9/GlaxriN6/ds4HmXVyOnsBUu4pw+0eyW1d0
         CCRUuhZhjitGxbdE5QLwUT7u/wOwyLwCD0xSvKgzeTo7oJaAZm3BOOumDSr/1PtShS4p
         OZi4AO9VL2rEQ2UMNWlgKbDHsH401SIBAzs3gpUsWi0e83uixOUu1NriDE2UhstIBUa6
         8V26DxRpSlI6R59HEZuJ9au7n+vP8ywIiSKSZSEH6sIj9OnBlqYBROrzItMaoWdhxHM9
         X+hcXL94x30PmKm6VJu1lSkolB+hDkowEWv0LNUWJpv5b1t9NYkTxyNyGDg1j2Wlj9b2
         4GLA==
X-Forwarded-Encrypted: i=1; AJvYcCXLmeBaK4+BJXf3yFAh4yRucICoZHVTW5miwES3PxKRmwVaZnH+XylhOu17xBubasbgp+soIwCq2tX4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5x/Zxl2HmEYOSs9P2EHPLQDWFAyc+AkvqJr1AaHm65NVrjH1E
	8LnGo9q+hcPd9+MJxwj3Kd4vL+RYyA2EN9HRe661+1dO+ZY53axJnCE3aP0Xv/fcDFUkxJYMRLF
	YkL4DPvKVrWUCQX+Fp1lGwMeZ8OvkKDkFASO9aw==
X-Gm-Gg: ASbGncslw/QM5WlTH6c8HsEuYQzNYUCx0bYF7ZoA4ojq1p0JNSvPEfO7nrW/gCT9Pe8
	3/hBIxkl7+1gK8ENbqewhw/mGtfpwpVrvcif1+P7AuL2HfMOaBUu9EaOnsIHKLZUV1k4tdDHmvw
	bC3xvpywlo0V3pH5XWiwVVW+185QANYYWE30y48l0=
X-Google-Smtp-Source: AGHT+IFLNhFui3D25IlFXDLP11bTQe/lCYPUtfLjLPXwZ+lYYDwH+o4Nnj4dgr7/xskIoe1tWYKmPyhLgCkeLGeynBY=
X-Received: by 2002:a05:6512:3dab:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54838ee8c4emr1671895e87.12.1740154683670; Fri, 21 Feb 2025
 08:18:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221123001.95887-1-brgl@bgdev.pl> <Z7ijLu5Z9MiW4IAp@smile.fi.intel.com>
In-Reply-To: <Z7ijLu5Z9MiW4IAp@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 17:17:50 +0100
X-Gm-Features: AWEUYZlPtDKrCfTfdxpUjDvoNhOmHrVWJ8DfAGE2IQrvwkcHH8lEzsEVW2JP-Bc
Message-ID: <CAMRc=MeJn4URkXoCTC_tpTKfQ7OL=BjytcY-k4BB2QUwsVXnBQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: use the required minimum set of headers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 5:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Feb 21, 2025 at 01:30:01PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Thanks for taking my suggestion into account!
>
> > Andy suggested we should keep a fine-grained scheme for includes and
> > only pull in stuff required within individual ifdef sections. Let's
> > revert commit dea69f2d1cc8 ("gpiolib: move all includes to the top of
> > gpio/consumer.h") and make the headers situation even more fine-grained
> > by only including the first level headers containing requireded symbols
> > except for bug.h where checkpatch.pl warns against including asm/bug.h.
>
> I'm not sure we should consider the checkpatch.pl in this case.
>
> ...
>
> This change is definitely an improvement from the current state in your
> gpio/for-next branch, if you are really strong about linux/bug.h, let me =
more
> time to check that header and see if there any potential issues.
>

Sure, take your time. For some reason checkpatch does recommend using
linux/foo.h over asm/foo.h if the former includes the latter but I
don't know the history of this.

Bart

