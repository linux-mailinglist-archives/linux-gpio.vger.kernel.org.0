Return-Path: <linux-gpio+bounces-2003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D77B82391C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 00:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4470A1C24905
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 23:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCF21EB40;
	Wed,  3 Jan 2024 23:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjAfqkeb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DFA1EB51
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 23:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d4c3393f99so16923265ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 15:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704324319; x=1704929119; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXkjR41/m8TuJbzIzoAQ1gFTg8MI3PCDqp1D7NLCbL0=;
        b=ZjAfqkebNPuKDLAIvL4Wccs1URCy7JwP+JZwFCmdKUsu4nwOBlbfXEG/OoFIVzdA4q
         drA7f++7gbHT20nhqh2mWqk6EOfvpfr6iC7dChbXSCOHZZNuKYMm54pNweDEZcBaIQt3
         eF3mLesI/2PrVBiwBqaT/bC3S9m6KUaoeCsTVJkki+HwS07SnEcKsA8vLvTCE0s3zI43
         0h28TvzBuKjTmEB3L9B7johOEA50PWCXsGdhId5eicPzgItg1nV11x4oPhm2prIG7Yn3
         b4gp133N//3w6iwjO3Fd9O3v7iNK5VyvygdKKHwdLTlocVgeFEEcFO2As/LAuDaDORiB
         kmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704324319; x=1704929119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXkjR41/m8TuJbzIzoAQ1gFTg8MI3PCDqp1D7NLCbL0=;
        b=v26EFZEcMWHIIZi8x16+R0SJ7gufEkQPgBWhukJcVsR+34gHBxbXHBrAw+ac5QnN+2
         lAYag7irl7/EvO3xorB+VQhjrMhLHsmiL/XxwGrvCx+NmvyjRxlbOBq43HBClqr4eJL5
         k8gs6mg3BNfs33M+XlHqOct1zzqZUHsy7DHb8wr9SZlguZYtip94R9cLvg+ISaPqO4Mh
         z9uRFPEOAwCZK7uYpUoaPKm6r6qx+iXchj3q2e7dPFimULztiti6GWvi3yd3QYWc7YZU
         IOIzkjEbitzEYaQBuUL5iFR/iKWcsc3QMt16ESCRL+sPOI27FQagHHyu87ain2qBbXYk
         imag==
X-Gm-Message-State: AOJu0YxyBVw1DtvhQNGCk5FKr+lQQ6ssLpLBNZr+4PGn7OML4xJ7zt/7
	/W2yCv0lw96xNQovNQZOlCQy6cSb0uo=
X-Google-Smtp-Source: AGHT+IG+8vScNBK8WR5Km9PJYXeqhjfL3iqqiZYHmjqMb00PEBO3O95hc/VHlTLWXRd9zD7CGok2Bg==
X-Received: by 2002:a17:903:2449:b0:1d4:bd4f:67c8 with SMTP id l9-20020a170903244900b001d4bd4f67c8mr5499094pls.92.1704324318804;
        Wed, 03 Jan 2024 15:25:18 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902bc4900b001d3aafd228dsm24235117plz.75.2024.01.03.15.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 15:25:18 -0800 (PST)
Date: Thu, 4 Jan 2024 07:25:14 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver
 2.1
Message-ID: <20240103232514.GA3339@rigel>
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <20231228092915.GA67274@rigel>
 <CAJ8C1XOP+h9iptC2gB0-6+Loaxr3Ow2MXYUjAxqr_t2EgBmDew@mail.gmail.com>
 <20240103094931.GA117646@rigel>
 <CAJ8C1XPe5nG30O89AVboZa=iqRu=-4=jNtuWj3v6KY921kfq8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XPe5nG30O89AVboZa=iqRu=-4=jNtuWj3v6KY921kfq8w@mail.gmail.com>

On Wed, Jan 03, 2024 at 01:47:54PM -0600, Seamus de Mora wrote:
> On Wed, Jan 3, 2024 at 3:49 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Jan 03, 2024 at 01:51:53AM -0600, Seamus de Mora wrote:
> > > On Thu, Dec 28, 2023 at 3:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
>
> > But to reiterate; gpioset v1 exited immediately and that caused
> > confusion when the driver would revert the line to its default state.
> > That made it look like gpoioset wasn't doing anything or was generating
> > a glitch.
> > That results in "gpioset doesn't work" bug reports, and we got tired of
> > that.
> > The decision was to make it block by default to make it clearer that you
> > lose control over the line when it exits.
> >
> > In short, we changed it because people complained about it, either
> > explicitly or implicitly.
> >
> > The -t0 option can be used to emulate the v1 behaviour.
>
> But... you've also explained that libgpiod/gpioset's
> default/proper/correct behavior is to delegate the persistence issue
> to the driver (or pinctrl in the RPi case) - right?
>
> So it **sounds like** what you are saying is this:
>
>     gpioset does *not exit* because people complained about lack of
>     persistence. When the persistence issue was fixed in the driver,
>     we also fixed it in gpioset by not allowing it to exit.
>
> Have I got that right??
>
> If so, why not stick by your initial assertion that persistence is a
> driver issue - not a libgpiod issue?
>
> I won't make a recommendation - or tell you what I *think/feel* -
> because I know "you don't care", but if this is the case...
>

The behaviour was changed in A driver, and as noted by Stefan even that
is in the vendor tree, not the mainline tree.

Your perspective is too narrow - we need to deal with the general case.

Cheers,
Kent.

