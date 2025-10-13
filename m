Return-Path: <linux-gpio+bounces-27045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14942BD553F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 19:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61F2581AA0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 16:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5511B2D46B3;
	Mon, 13 Oct 2025 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBG2l7tr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E5427979A
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370673; cv=none; b=RLnTFJNyva1ow8i5jay6JtA8f0Lg0aFxoaJItMDzyc3umeOn/LeEz/RQgVvieIkqKudFg4NCGEvfGX105nWAtqI7Ajh94mbgh7zBkvLYjKU4JxVHqIoacDwgWKQHjtUKqGS4sq1Rlkg7I2tvmFDKk4BrdrEZ9UxOkXfSN+ebbB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370673; c=relaxed/simple;
	bh=NKeqYvLIifww0mj82IUGWogUIo5n0oR13zzEhbq/V0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTeKkNlA1urB9F0e7nBUjcYKdoSbiMKa45CttifpEs28qGm35ZCa69zZOsVBhBPvlzvdVWK/z6dxEu0UI6VbJ9RZV/j6QCDXl6j30ozdtgZUmhBWa92rFi4rBidBOFSChwQUonu3yHaYVk8Yqi3cuh7BhvUjdZVVjbMgd1d0Ug8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBG2l7tr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso26949105e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 08:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760370669; x=1760975469; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vwyKKDWzG4gsyJSsWJd8GHM/HF1gjd2t0aumh3kXjrI=;
        b=ZBG2l7trmrpJTkuaJqX0O0mOmOPPum9n/fck1S5XKoR86y6suhK4D4KQ+eKpRntsrI
         D0tA3MAsV1ByZ1Xs2VDGFZfxQZ6oflfpW3j7KUvJQf3BBJz4l7iKCBjUMbE+iU7+Swvq
         ejdoPat3nbwvReaHlnD6206V4eUf3mxcuop3/RVdxlrk5mzM3WPwxAFB9Jeq4BqRdj5R
         dlX7PNdo9jkc7O6heYhtKzlZdblbqMMpXU9p/LdgS3CtInFJTpdMs2Tdi44rXciQz1wJ
         Mx7APE8ittl/bLSWeFy2gcATKheTpxmaQ5kW8ChWwdP7yGNwDAsLSrTHBcRklbuTWvkj
         4CSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370669; x=1760975469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwyKKDWzG4gsyJSsWJd8GHM/HF1gjd2t0aumh3kXjrI=;
        b=UhuQaRh3Q1rfitKpoAjNrDNtDpBQ4tpBRqOJQbuUDko+wvSpeYRhYXafe9eIB1DUZm
         d5qn+7XlEcBMCtV5jHemysoiXSa3WzKZn4QnxLmPImezzOLtx0cTigeIbYZw4JSak94K
         kuEh4ZL4NIHC8A78DJZ1OBFvUq/kT6xKwMxQoRTy5w3f45CDwfDqAoj7soQUE/sMaWoq
         hrZ4uWQCHCr8HKlaKD3MuxokQMjoE8WjVD7Vy9syP6E6F/bzMyv+RXM9h/aIniOJcPO1
         4SZNgS8z7xiqn5821FLN9Ig+//9s2ojkempWrDO5CA05uokFxV0ZdOWUOtNYCu+2U2+t
         JIWw==
X-Forwarded-Encrypted: i=1; AJvYcCWf15jlXkm0kbnPX8cvf7nzZaLE+gJuTtmxUtoxL+7UvRQIqcnJn1nYyZw1bzS4/eQYx5Vd6Hy/xJ50@vger.kernel.org
X-Gm-Message-State: AOJu0YxNhNtjj4/xAv1MoYhHbevJ1VEXK5n1hMMxkxPgfpZUDRMMgR67
	VbZl/OIDyYuUtVwwAxLjI7yf90uXIQcw8r7TcaIosedfn0vRwItIE+ph
X-Gm-Gg: ASbGncv8tAcZ7I4SDOZFN2ON1f7BBDDpjHNPGUp7o96J5krG06uOA/Ts8WcBBi5qX5q
	ZtMjeQ86B65SMDHFMLZRmaC/SVhOh6fpy5w3vx3alOtCnlaPuL7usKvLoBVNnbtkCKxZS8gu9wc
	gG6gKnRVeR6C46A0xCut+rYds9UDiP9AQ2OD01P6UCzOhtviOOxncup83VX2Ignw8fMql3sOziD
	GsTSEpRA8WCvIx+BuWBMCu9ABanwv588GhjHnDOF+YfaxeMARjzhhy7Z4CRLMcPYxYljIL5jz8f
	YCQziuN3q2bvxgb93fho7/qUqKj7aG/gRtwZipXq47FUGzX8qEnvvQCuSeMvFGyaeNz1WiFUKsW
	NCk+X1NfQrqd9d7K1yEZUMch/yT3XyLB5I/Xft3okly7p
X-Google-Smtp-Source: AGHT+IHf3BqDFUdxdtDr5m2nldUhPx2Md3z5kS1xagTVE8+YxLYmc2AFaMMWKUh9GpwqhsdateVBwg==
X-Received: by 2002:a05:600d:4301:b0:46f:aa8a:d2e7 with SMTP id 5b1f17b1804b1-46faa8ad4bamr106658795e9.4.1760370669270;
        Mon, 13 Oct 2025 08:51:09 -0700 (PDT)
Received: from gmail.com ([51.154.249.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484c71csm198294445e9.8.2025.10.13.08.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:51:08 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:51:07 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <aO0f62-RnVyKRLS-@gmail.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
 <20251011122612.4fa7c97a@barney>
 <aOpAO7j0Uyo6FPcu@gmail.com>
 <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>
 <aOzcasDutRtw6JP9@gmail.com>
 <CAMRc=MeGbFi10f94GmmAMyLqBWWw7VmPcjaXQWDEtFgS=hvWdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeGbFi10f94GmmAMyLqBWWw7VmPcjaXQWDEtFgS=hvWdQ@mail.gmail.com>

On Mon, Oct 13, 2025 at 05:36:17PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 13, 2025 at 1:03 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> > >
> > > While at it: the subject should be: "gpio: bt8xx: ..."
> > >
> > > Bart
> >
> > Done in v4.
> >
> > Vaibhav
> 
> No, it was not.
> 
> Bartosz

Ah I see, I though you just wanted the transformation of "gpio-bt8xx:" to
"gpio: bt8xx:". I've removed "driver:" as well in v5 from the header.

Vaibhav

