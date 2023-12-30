Return-Path: <linux-gpio+bounces-1933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0E8203D0
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 07:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75F331F21CFD
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750D517D9;
	Sat, 30 Dec 2023 06:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/jH+cWD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF1123A5
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d426ad4433so25921685ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 22:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703918629; x=1704523429; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PKyJkvWfyB9gFWvqVcyA6eRgjBZI+oSvrJAT3OSS80Q=;
        b=k/jH+cWDcLRMC6rkNR1gYj/6uKyrKhiL4+N3E2Yd8euxYvbypzsaA2Ak11jMTICbEQ
         fzoY+PvoxLORIh5ivKNjas3fA6j1eoESWRSSn3Jntgdb5a8/4O9bqJ/qrD7W0MiXUXTw
         taB+Vsju6en+Va+5mDiY27+iJYQ5lfHbXytzkImGT1NNiQT3Gy6fjG2cu1Ny6UlCkx/O
         yWQ6PT1SLHgJCHC7evE5o0GRfPIct5v6A9J0nCgNxuJNY+lS+4QHYQd9x2GN88wkjrHH
         22Ufp8UB8ElYjooyS6zOJGLSvkeVQEnA7LWNIGjmbFjfHZI/5ZC5OfxTiQXVchgnO3qk
         M82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703918629; x=1704523429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKyJkvWfyB9gFWvqVcyA6eRgjBZI+oSvrJAT3OSS80Q=;
        b=mvlf3Y+8gTIlbYS6WbS5fIJ6MhGcqaMbjFNqfoQKC+zrRnAJE9qdDsvnJuRPnh80nS
         Jlqlwsrfg6Leg+40ma6havsOjIQLueHTy9y78gkhJn4CH5DgsP1Pc2IldkJPjEPesFe/
         oMvbsY2LMI4HuLzWPKp7Gz4bsVz5+tAEsHAUlrcSwWTkappLR5NBhNi681llp7BPgzQE
         ffu7zKQ9aqi3d3oqqKr+pBWXBGswcIZlAAJEl/jpJ1ADS3I0Vq1/owXphxlEOuY3eqYI
         /nqxSmEKNgkTNIaZhB06kkLjrNmKf4NOWxTfpfsE3/xjWbWwioxrpsTyvr63eYTu73WK
         BNNA==
X-Gm-Message-State: AOJu0YwUsXt/IY1fZqP0udIO4YZCdaJx+0/7isa5ETXSpK3Sn4O8zHqB
	EXfjzfz6dAzfFlzYYMRVLABYs1Wx97s=
X-Google-Smtp-Source: AGHT+IG9P5OdTD5zmd05vyT5nBAgd0Wy4wpkoZrlmBy2Gcv7rbFnNojYD9C50d3DHq5OkFhm+Z3h7Q==
X-Received: by 2002:a17:90b:4b11:b0:28c:b0d5:e021 with SMTP id lx17-20020a17090b4b1100b0028cb0d5e021mr710256pjb.49.1703918629098;
        Fri, 29 Dec 2023 22:43:49 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090ad98e00b0028ac1112124sm17115735pjv.30.2023.12.29.22.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 22:43:48 -0800 (PST)
Date: Sat, 30 Dec 2023 14:43:45 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
Message-ID: <20231230064345.GA54180@rigel>
References: <20231229155837.GA103278@rigel>
 <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
 <20231230022136.GA19799@rigel>
 <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
 <20231230050325.GA40096@rigel>
 <CAJ8C1XPNV0Wn0UEFZas43-9LzWkg2=m0RE+cRXVsvPfgANMC4A@mail.gmail.com>
 <20231230055330.GA47174@rigel>
 <CAJ8C1XMDjS-7E2huUPcQ9peJnwyeuJHYMWOuFEETwPbrwCwe=A@mail.gmail.com>
 <20231230062933.GA52702@rigel>
 <CAJ8C1XN71bsBkXgjdq0=2SZuJqs2tONitz0vv_OPzp4na6LofA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XN71bsBkXgjdq0=2SZuJqs2tONitz0vv_OPzp4na6LofA@mail.gmail.com>

On Sat, Dec 30, 2023 at 12:36:37AM -0600, Seamus de Mora wrote:
> On Sat, Dec 30, 2023 at 12:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Sat, Dec 30, 2023 at 12:25:17AM -0600, Seamus de Mora wrote:
> > > On Fri, Dec 29, 2023 at 11:53 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > And today after my email you undownvoted it, confirming that you did in
> > > > fact downvote it.
> > > >
> > >
> > > I don't want to argue about this. What I did was restored my upvote.
> > > Which I probably shouldn't have done b/c you left your snide remark in
> > > your answer. Anyway - I don't know what to do about it...  does a
> > > 2-point downvote mean that much to you?
> >
> > Oh, so it's snide now, is it.  Unburying that hatchet?
> >
> > Anyway, I couldn't care less - it was your actions that I found
> > informative.
>
> :)  Kent, you're wearing me out, man.
>

Lightweight! ;-)

> But NO - NOT un-burying the hatchet, not un-downvoting what I didn't
> downvote in the first place. I clicked a button three times: first was
> to up-vote, next was to take the upvote away, 3rd was to restore the
> upvote.  That is my total recollection - honest.

In which case trying to upvote it again now would do nothing.
I'll bet you that isn't the case.

Cheers,
Kent.

