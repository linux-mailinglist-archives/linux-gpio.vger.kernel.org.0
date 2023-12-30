Return-Path: <linux-gpio+bounces-1935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB38203D4
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 07:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF2611C20DD2
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054D117D9;
	Sat, 30 Dec 2023 06:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaE9p0Rq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977611843
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d3ef33e68dso49097355ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 22:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703919090; x=1704523890; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cS8igaMc0fu70FWphwXinsYTPynTsg/fIBY3fBaNIxE=;
        b=WaE9p0Rq0amfQC46MzaqyTq1hS3o3g89yTtUVZHPVRHfBkV/hgUiwUwJ2D1JnpcG2p
         UFythqUm8MDns0QCoNNLCJut8BDb2brWmmutEHQc2bwQeDmnnTl/+7JhX2EJqAwNxfL5
         TmSPg3P73fg1H9Wp4N0tbqndw1hskEvy8H/D7lgCJZ0dKO3ffs5HcSTwb6lVBM0FCs9I
         AigKqgz5EZQKxb8iRpUyZL0qNHiwNhJH7VKdGkAsfOv9RBVM1cHO5jUTMcPCmWrKN8aK
         cj9bKDQ6vHCUUwyVlH5CgeIZshBCuGJ9d3z4Pv5H8cNbbzYDRJ4nIL5jBkrR1ecPWjIW
         7GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703919090; x=1704523890;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cS8igaMc0fu70FWphwXinsYTPynTsg/fIBY3fBaNIxE=;
        b=IHJiS5RtJ78+kE4S+a0DVJVjdOrANFeOTfPHspANxw+Y4Ov0AUV56/cbnnxwU7FhTd
         gkEmNR3hD5jENl1XGE3E20LG2KQZlt0mzlfLwJ3324NmcMQ8KWERZ9XMSfK+hkARtgYU
         GZHwkHE3wVaNHvfij9KTCB6gcry/bCUvkDSCf0W7J3TZxPdI3rlevM8dHzPqPTQH0ZE5
         A1BwJgjZ3F7fqMtcrQb3+y1EDTtjWoX/ja5hK3QP11guF7kTJDIwdIxDGjwEGiX1SSpn
         nxZ6bg1jhJZxnyrraBAgrk/616lK6sT0pBwEqI0jVPAfXDD8YiPV6L+j7ELrBRILQ5jb
         4eNg==
X-Gm-Message-State: AOJu0YyH7VIjQExt7HXPg/OWOcOxDa4KhFa/PeqPMhS6EWMPBlhdVBnm
	aaFlLEMvvFDpCIAXAkeKmm7PmwgHiRI=
X-Google-Smtp-Source: AGHT+IFEEl//Jw3Whwu4ZuYffc8Z2o+SxXafPXtcoF8dP3Ty6mCdB5fTrkzckh0c8Ot/xk+FL+Fsiw==
X-Received: by 2002:a17:903:1249:b0:1d4:9ac9:eab6 with SMTP id u9-20020a170903124900b001d49ac9eab6mr3069217plh.26.1703919089871;
        Fri, 29 Dec 2023 22:51:29 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id b16-20020a170903229000b001cc1dff5b86sm16538909plh.244.2023.12.29.22.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 22:51:29 -0800 (PST)
Date: Sat, 30 Dec 2023 14:51:26 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
Message-ID: <20231230065126.GA55355@rigel>
References: <20231230022136.GA19799@rigel>
 <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
 <20231230050325.GA40096@rigel>
 <CAJ8C1XPNV0Wn0UEFZas43-9LzWkg2=m0RE+cRXVsvPfgANMC4A@mail.gmail.com>
 <20231230055330.GA47174@rigel>
 <CAJ8C1XMDjS-7E2huUPcQ9peJnwyeuJHYMWOuFEETwPbrwCwe=A@mail.gmail.com>
 <20231230062933.GA52702@rigel>
 <CAJ8C1XN71bsBkXgjdq0=2SZuJqs2tONitz0vv_OPzp4na6LofA@mail.gmail.com>
 <20231230064345.GA54180@rigel>
 <CAJ8C1XODp8FKbEOqreAUQwKdXw=QgFQxF=KYXEC_zpeCSALa1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XODp8FKbEOqreAUQwKdXw=QgFQxF=KYXEC_zpeCSALa1A@mail.gmail.com>

On Sat, Dec 30, 2023 at 12:49:48AM -0600, Seamus de Mora wrote:
> On Sat, Dec 30, 2023 at 12:43 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Sat, Dec 30, 2023 at 12:36:37AM -0600, Seamus de Mora wrote:
> > > On Sat, Dec 30, 2023 at 12:29 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> > > But NO - NOT un-burying the hatchet, not un-downvoting what I didn't
> > > downvote in the first place. I clicked a button three times: first was
> > > to up-vote, next was to take the upvote away, 3rd was to restore the
> > > upvote.  That is my total recollection - honest.
> >
> > In which case trying to upvote it again now would do nothing.
> > I'll bet you that isn't the case.
>
> There's only one way we're going to find that out. Edit your post &
> remove "the remark". Afterwards, I'll **try** to upvote it. Warning:
> "The system" doesn't allow dual upvotes, so don't try to hold me
> accountable.

Do keep up - I've already done that.

Cheers,
Kent.

