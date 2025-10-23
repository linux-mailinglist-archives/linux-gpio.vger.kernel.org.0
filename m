Return-Path: <linux-gpio+bounces-27504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D18BFFBFA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8B5E18869F6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 07:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE3F2E040E;
	Thu, 23 Oct 2025 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTvZwyCl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FEF2E040C
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206301; cv=none; b=YcroMdVFKGsP2Kf4nHtEA6Oo51cu2M81OF/btFdUHSk0uygwZG2TwT7rO/qmIA8J2OsDJIiUvCCchCiVQBKJbyOBhXxLGJrTQAvHcMQ9IdneFDiPSL3Q6qZOKXGzNDVDyyKrogmBufLmyrpX8cwTl+XvMAME4SQTZ2FjYdEs2FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206301; c=relaxed/simple;
	bh=V56wDzpr+FK/urAryAZ1emGQhQ+cHHyjui2JOXvsrfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKv1A6FQQFD6QdrPKtv4EauPecU9uHmo8FryX9qg4hfSIq97CnsksQjXoFlJs7QPw7KEMBzCjjRB3ARSYMIFUOnJnRpaaXIDr/R7fCEUIipetwMGssMBCJkoMRtOR6AHC+GAnCJMoz3B5HoFuN4l1xPQVAHel77dAR2iowDTo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTvZwyCl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-471b80b994bso6375445e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761206297; x=1761811097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQ7/jSo7tNBTZd/AumHePa99ISr2zgcjojKglbLQ6TA=;
        b=jTvZwyClULm7JNOQbvohcgc+Ox6/EfQnpbVqjWcw5LgYqakW2Z/vSh3IRmvFnPcZJX
         l/5OzDs1lpDTTqZir/bksuonHsme3i3vXyu8PqpgK3bF+thTKVRlh/EE4cLbYBEQdGee
         9pNs5ValN2XoGlFrWkpKqtJMiRRhBdsuNo+MvwagPwfhttQTv7VdVUJYVylVOm8C4tlk
         CjqENXEfFjyIBlscVldhWV3un2fukIdz7RzR2Q/q26Ncw/XC0aJBVv5u5MHgB2GDBUJX
         0tUTbigcz23BZm+dGfy7OPvkbAsfPiVFVYaTcTZmn6IxG+FjNxsYW0+9f/lu0J3UjNXV
         aLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206297; x=1761811097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQ7/jSo7tNBTZd/AumHePa99ISr2zgcjojKglbLQ6TA=;
        b=buXHV01D94qaFozpgjQm2FGcCQoRwsGYz5wxqhndJau/KXEUQymcf2jP1ytdhY5vMT
         YflWNj7LO26ontxVZw3yAjqvVPsrQoI0EEGQksZQeyjwwwSC3xRtxea8esIoDC14hJWv
         UHe4y5GS4qoLZJ5Fe/9tdn3a6NdDV+0pAHNDYplDjaz8N5os/oDIt1BnWybvMlYBPHvk
         /i4EPbQWFpaROZ3E8ZZLz5V/IcJZh/xD/ArHnTKzsz94/OmefuM45dCTSfiioSfgq1cP
         oPxDW0VJjStjP5tUq90DJ3FM44pFR2LSYOK8aPIO5afPCkLPlNCJBz3JjpsgO9Kuh/Hg
         to9g==
X-Forwarded-Encrypted: i=1; AJvYcCUgeHQ0fLHIeEn75MFxAz/mBTtJhqqWwpDRfBv9xyFDEaYCdcuGTyuMWO32dusRF5cg1qDmgkBVr2uc@vger.kernel.org
X-Gm-Message-State: AOJu0YzcBaEvzeb8AVwr92k5YGsSYq7fgpHia+qWTW3iV4uAIs/kNT+8
	EcnWKmpOiSFs/qp/X/fqmhs7YRgEpS22PnrdfvRuQ6zQHCLW/UpJ1tiF
X-Gm-Gg: ASbGnctixSa85arPR/OiDbcgvvJep2C+0jR9xibFRoxfiIfm8ZtATGOyBH7Nbty36BD
	yBCUgwlXNG9AVkTevESq+Mn4azz5m+4ScCGunQ7nHTcficYh76zImPGZvlzV0DElZOQb9bOLwaN
	FCRRVL7rABdTmheuocQWfb8su5M4ucy28qGs2vI3zyBBi/dJ24xbCWX3AiVc8C8MZC0NADM1L72
	UeBb2zQLXZwyru5o+uYpctK4+blCk4qdEXrbeB/cvpVEs9oHiUhUFoxMns5MSoW1AOaNUIUJ1zC
	ixBh9Ox4UKnuk6hOIrZUJpSBAdt+cZqkb2L52tnJop62ntjv2yfDhjk5Wj+ifd/cGadgajmHSku
	nv/HLilGMIvZtgRr7RYZxT7bqZ5JKbmpWsxE1ymi3VKXca9Oede5gXH7oR3DHnI/mKRpjUZ6nar
	J+1oRfuDJ004gHsD/VSnkVnwKh
X-Google-Smtp-Source: AGHT+IH1MMAfSJxCVNQWeVW46sI3k3nHOhskn/OU83kIm3TVkiWr3RGyFq8Jge1vnvirJ7cC5+EzHw==
X-Received: by 2002:a05:600c:444d:b0:46d:45e:3514 with SMTP id 5b1f17b1804b1-471178b13c6mr160678435e9.17.1761206297352;
        Thu, 23 Oct 2025 00:58:17 -0700 (PDT)
Received: from gmail.com ([51.154.250.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf2f3bbsm22103695e9.16.2025.10.23.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:58:17 -0700 (PDT)
Date: Thu, 23 Oct 2025 07:58:16 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Michael Buesch <m@bues.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] gpio: bt8xx: use generic power management
Message-ID: <aPngGCKnyFheybg_@gmail.com>
References: <CAMRc=Mf4FnBoZfdR3gG47te=X53jASzb6MVnUmNw2q1rtUwxzQ@mail.gmail.com>
 <20251022192901.GA1265216@bhelgaas>
 <aPneCYtkbxWp4Hox@gmail.com>
 <CAMRc=MdbHqMJv4otgG0Cwc1KcK2WbL4JL0Q75PRqv8582yexyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdbHqMJv4otgG0Cwc1KcK2WbL4JL0Q75PRqv8582yexyg@mail.gmail.com>

On Thu, Oct 23, 2025 at 09:55:39AM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 23, 2025 at 9:49 AM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> > Hello Bjorn!
> > Thanks for the review and mentioning the diff between v1 and v6.
> >
> > Hey Randy!
> > Please let me know if the diff mentioned by Bjorn is enough or should I send a
> > new patch-mail describing the v1-v6 diff?
> >
> 
> Yes, it's enough, I could have looked it up myself but I shouldn't
> have to. Please, next time just list changes under each new iteration.
> Preferably just use b4, it helps with version management.
> 
> Bart

Noted. My patches will be more clear from next time. Thanks for the reviews and
comments.

- Vaibhav

