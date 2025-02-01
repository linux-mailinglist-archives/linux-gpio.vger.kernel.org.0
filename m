Return-Path: <linux-gpio+bounces-15158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04313A248F9
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Feb 2025 13:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65F15166792
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Feb 2025 12:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FCF1A0BD7;
	Sat,  1 Feb 2025 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="mKe7F77/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C119D06E
	for <linux-gpio@vger.kernel.org>; Sat,  1 Feb 2025 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738412804; cv=none; b=XQXebdWKSndAl73mlpK4HrJbN+HnWSu2fTiuedohQUPN52apPeGY4RPGVolanQLSA81rMXc0Ax84bKov4UAiYFenxO+J5ovUYHz5830zhiUxffs9o54dt1Q9o8se6FM5PsplMdaLao91k50O8A2IUgfx1Q1UwjNzwA+24twJ50A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738412804; c=relaxed/simple;
	bh=FtzY7Gm8QV7QgYgQ8P5cpXe0tSq3usp7PVPXqniVKyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7Uv4ugrbT2/WWOg9vsjPGzMlgsmjY14jB5Xuy8GzBH7/Jo+gz25dGorRkkCHunVWHJyBr5K5KJ5fa0XUhKCfI0zX0FtdKtrQ4UauUcX5bHZzZVQbLN2sX6gSFIq6CvSIF5P/1MlaPr6871IGjMdUyNCk+r0v5OWFHQ4nwQs7p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=mKe7F77/; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8EEEA3FA50
	for <linux-gpio@vger.kernel.org>; Sat,  1 Feb 2025 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738412792;
	bh=W+PtquVFOjzOYgh5drj3rsCsJ3SImm+T8s94d8MFmrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=mKe7F77/YVF1IujCPV+zwAE33j4P7g/XcbYZBKqyyvq+srYKbm6H/mD2hQbvqyzDb
	 YofY3nWkCWhUanhTwFH06iQemrwjMRPQ7pOLFWT67IMf/ybkIv2piU/qtwLDm8PjD9
	 rsegbjYXjiFw6eshB68llvOkC0yfauQ06AtbKZkX5QxJ9vDdcCuf1TC+zY1RNxJ1tP
	 QdlxmspdJNG/6hM/8CPCMzVG2M23rGMJ8KsBcMr19oFRjune4Td9DVo4SU4mFdymsg
	 SL+GcJFUzYQr1NXdD+pWwX3NpsC/XzxqKI6yvcK+i7lb46AEXj1klqwV0A5Hq1sxcs
	 Dkayo6mhZK5zg==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2162f80040aso57201305ad.1
        for <linux-gpio@vger.kernel.org>; Sat, 01 Feb 2025 04:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738412790; x=1739017590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+PtquVFOjzOYgh5drj3rsCsJ3SImm+T8s94d8MFmrs=;
        b=XmJ1fdccQ6+lVtkRQPPkNKm1V+A93fNhnyvEAulxkUTY7UX3KoL2AjCKWrUWENCg+P
         KG3MW81LQjlSBP8wJ2vlGkmbxnYb10KuZFNgCVJ3wxv1/uX3Nq+1hLgt8nvBUjI3OuKy
         zQXjAs/yDvq5L/j7uHohOizixB+ORVW7gWn+n0yTTwD7p/PgjO6j45FlAbkrKaqIPKxC
         1i05b2T8mI3FGI9EyJcPUezWnYyXcz0WZoHrB8EKhWWJMjEDrRqmtHdhemIfg270IseP
         XJVfTJw4pW/RbNbEBCRYD0Q3tfH07PKIg5n2zdLzkyoKFdJ8GsIzhG0QhbWf20XQ0x61
         EefQ==
X-Gm-Message-State: AOJu0YzhKKgSwOJ844BgPPhmhU3upAQnp+UyBKHgr3AFike+S5B5tUzu
	r8sOKElkZSd9vwXqUXIBdbBSxJIt6jhxgWWkAwm9odqq3iNXw5r2jJP0W+YlRbAhh68tt6TmkFe
	ugYsPqCZgfc/3etJo4r7q5T95T2sgdUU4p9yaWwnA8zlj4ijvunk/2ngTmjyrZ/dquqr0fQVH80
	k=
X-Gm-Gg: ASbGnctxIC/fbjjhAYyIfaaaauG99SuYrTdnJhULSD5ZG2uW3q/p7zWMkol+p71S8ME
	mjmuIJxw41ESDXCjdvsoT1vaiOT01wxmvs+yP+ZDdU9c4FAd5cslCal5yv0l6KJR5jPBJw/wb03
	K32uI54HsCbTReqTSbPcMYKnT9GDJ56ZTgbCBYu8+y/Ldp5opng32JMvrv6qyS4Ks/iNzHTr42J
	zz92cTEd/76DPWc+fxUs6i2POl9T/w645YT0L3LIT9QzVsNZ1krX9XAqyvZhjP1D1y2fsYRb1la
	0DGd+Oo=
X-Received: by 2002:a17:902:e80a:b0:215:af12:b61a with SMTP id d9443c01a7336-21dd7e077d6mr236850155ad.50.1738412790555;
        Sat, 01 Feb 2025 04:26:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF66EUYrSaHn+pVWpXjV4tbU6Bs0a3SBysXdpKPZYEmT0IPQ3ow7PTEfZPH/LwnEMITATDjWA==
X-Received: by 2002:a17:902:e80a:b0:215:af12:b61a with SMTP id d9443c01a7336-21dd7e077d6mr236849855ad.50.1738412790154;
        Sat, 01 Feb 2025 04:26:30 -0800 (PST)
Received: from localhost ([240f:74:7be:1:543e:97bf:2a6e:c9c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee73asm44817965ad.36.2025.02.01.04.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 04:26:29 -0800 (PST)
Date: Sat, 1 Feb 2025 21:26:27 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <xrllvn5tmshdbb2mjlxvoc4rpalnefy52wwd5p6s55ehhysl4l@k4w42cd7hxkn>
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
 <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
 <CAMRc=MeRBABW6JCScGvsRR_4+W6u5QMWJwA7yMB9gj7=uOeD0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeRBABW6JCScGvsRR_4+W6u5QMWJwA7yMB9gj7=uOeD0g@mail.gmail.com>

On Fri, Jan 31, 2025 at 06:22:50PM GMT, Bartosz Golaszewski wrote:
> On Fri, Jan 31, 2025 at 3:36 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > On Thu, Jan 30, 2025 at 09:47:47PM GMT, Bartosz Golaszewski wrote:
> > > On Thu, Jan 30, 2025 at 7:40 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> >
> > (Small reply to the previous comment:)
> > Yes, I understand your point about why you think 'num_lines' is
> > unnecessary. What I meant was more of a UX (User eXperience) consideration.
> >
> 
> If anything this sounds like worse user experience - having to provide
> duplicate information.
> 
> > > > While at it: there's no reason to impose a
> > > > naming convention of lineX, lineY etc., the names don't matter for the
> > > > aggregator setup (unlike gpio-sim where they indicate the offset of
> > > > the line they concern).
> > > >
> > >
> > > Scratch that part. There's a good reason for that - the ordering of
> > > lines within the aggregator. [...]
> >
> > You're right, that's exactly the intention of the strict naming, 'line0',
> > 'line1', ..., 'line<Y>'.
> >
> > > [...] I'm just not sure whether we should
> > > impose a strict naming where - for an aggregator of 3 lines total - we
> > > expect there to exist groups named line0, line1 and line2 or if we
> > > should be more lenient and possibly sort whatever names the user
> > > provides alphabetically?
> >
> > As Maciej pointed out:
> >
> >   (https://lore.kernel.org/all/CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com/#t)
> >   > [...] if free form names were for e.g. [1, 02, 10].
> >
> > we would need a well-defined rule to avoid ambiguity, which could
> > potentially unnecessarily impose burden on users to understand how to
> > properly use the interface.
> >
> >
> > Regardless, the point is that we need to make it clear to users which GPIO
> > line a specific line<Y> of an aggregator forwards operations to. Since
> > requiring users to explicitly set the offset within the aggregator for each
> > virtual line (e.g. besides 'key'/'offset'/'name' attributes, by adding
> > 'idx' attribute, which users would need to set explicitly) would be
> > cumbersome, this RFC implementation instead just makes use of directory
> > naming. I believe we agree on this approach (i.e., using directory naming
> > to establish ordering). Correct me if I'm wrong.
> >
> > So, to move forward, let me outline the possible approaches we can take:
> >
> > Option (a). Drop 'num_lines' attribute and:
> >
> >   (a-1). Impose strict naming rule for line directories
> >
> >          Users can only create directories with a predefined naming
> >          convention. This could be 'line0', 'line1', ... 'line<Y>' (as in
> >          the RFC implementation), or simply '0', '1', ..., '<Y>'.
> >
> >   (a-2). Allow arbitrary naming for line directories
> >
> >          This would require a well-defined rule to avoid ambiguity. As
> >          Maciej pointed out:
> >
> >          (from https://lore.kernel.org/all/CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com/#t)
> >          > if free form names were for e.g. [1, 02, 10]
> >
> >          Users would need to understand these rules, which might impose
> >          unnecessary burden on users.
> >
> > Option (b). Keep 'num_lines' attribute but:
> >
> >     (b-1). Prohibit manual creation of line directories
> >
> >            Users would no longer run 'mkdir line0', etc. Instead, writing
> >            <Y+1> (Y >= 0) to 'num_lines' would automatically set up the
> >            required directories.  convention. This could be 'line0',
> >            'line1', ... 'line<Y>' (as in this RFC implementation), or
> >            simply '0', '1', ..., '<Y>'.
> >
> >     (b-2). Keep manual 'mkdir' for each line, in the same manner as (a-1)
> >            (as in the RFC implementation) or (a-2). Seems that no-one is
> >            favor of this option.
> >
> >
> >     Note: (b-1) is a new idea. Considering what really needs to be
> >     configured by users, this could be the least burdensome and simplest,
> >     especially when configuring many lines. I'm including it here for
> >     broader discussion.
> >
> > Personally, now I'm inclined towards (a-1) with the simplest naming scheme:
> > non-zero-padded integers ('./0', './1', './2', ..., './<Y>'). Or even (b-1).
> >
> 
> I too think a-1 is the best option. However, I'd go for line0, line1
> etc. convention as for computers it doesn't make any difference while
> for humans it's more readable.

Thank you for the comments. I’ll address your feedbacks and send "v2"
later, Since we seem to agree on the overall approach, I’ll send it as
[PATCH v1] (i.e., without the "RFC").

-Koichiro

> 
> Bartosz
> 
> > Let me know your thoughts.
> >
> > Thanks.
> >
> > -Koichiro
> >
> > >
> > > Bart

