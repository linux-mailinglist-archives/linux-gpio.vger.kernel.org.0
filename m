Return-Path: <linux-gpio+bounces-17858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD50A6BB52
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 13:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C54F1895228
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597CC227EB6;
	Fri, 21 Mar 2025 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kMeDgQ38"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A411C2DB2
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742561945; cv=none; b=bEOWZC89TQcAKQl5qoz9cDtPic2kC3JgAozqD9I7Ta3iePHutgnn5+gzsAC8nqCBZrAAgyUjAa1aKMBRRU81WHbNzKLKBMNwXw+AKEot0nhguPt+rt8Xro5J/UWgU+ePLZ3ifOuPGmOeueVbSiTxcuSwf9W72lFt+hVXiBkIEsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742561945; c=relaxed/simple;
	bh=2AypnsfEZK0HQE0xayGd1WKAB0ro1U2cwGWl6BbqFRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xs7n7u4NrIoCKjxyfDK9TXCVGW2awwK2iFjJQ1DEikX6XT5MrR4eYHm2XN2aRBettjF/3EFzyArwGc9+tqTAwT6I4NDxaNStD8MaQe93JKzhiRm4dyR8BHAtyutrbQeeCyL4yDaxWblYs+eVm2wPjwKxDsOfDgBHA9YzVuXCUIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kMeDgQ38; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2D4F13F322
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742561941;
	bh=Ur9GZcKoz9oFVWJP3Qo6Cr98Nr93p5FvgDanizSXDfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=kMeDgQ38tOBJae8HajjVQQoM7zCGEt6Z1j2fYTHu8PY1TEguiiTjr9ZbI0EmjHR+C
	 X+EM2IFDWs1uSWusx/JPf8zZuBvb+ukZsuy/nN47hd1/uGK+IuMY4rKIwY76U0Kpp2
	 B2Vdf3EaWV8PVQgYINyTCKvoq1cjkzMYZ6rdnIGwT//Wo8/iTKTICFiUVmsCDzxHbL
	 Q6oIIJoySbTh0azwY/D7H13euW9o7+1blQ4ZdyKer8BivzAREvX09oWs1/J1fCEFcS
	 gHtDWTtbX1IaHxcJD/dNhNv9E0SDNBFrXZUjzR8k4ccQpkP6r64ZqpWOc0me7NqzhG
	 oa0ZhFI8tDbSA==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224364f2492so28452785ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 05:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742561938; x=1743166738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur9GZcKoz9oFVWJP3Qo6Cr98Nr93p5FvgDanizSXDfw=;
        b=huUwSBCq3iORtmBRzqIt6AnJTZyBVklNivFxgZvlQwQEa4lgK2Iyy/u9S6gwRrri0b
         bxDHSBNk8PyobRbkQrkNClt0+qqF375nwbevMvC7AIQ7pDGgTgFatZBn62vCOTqKAwWW
         gV0Def9MBfv7omf0slEPvBPKifWRUcvXIP1OIBqGMAhXwmczy0w+OqxtObSaNv7MN7ym
         +B7zwmoQmIoRd5IOQ2eej1rw+ARK/jnimFOu4WF8PN8UYqVmjqFps1YF2tXXAMF2tVnm
         dkngGa6mLcMRqG/CFTwV/yCLG9NQ6hYE41kexrF8e6JWlk29Rn755ezrfyjhuGMUgSDV
         yUUA==
X-Gm-Message-State: AOJu0YzQISCK3Fs7w6jqv/RH7GxZdPLilNcRBwgiKwDTyF0BA6y5ITqP
	IxFfvS8ZZtc/GA6gcgSVfbyup+zEDyVDo8shhaf4lotal0DCy0Agf6Ykmw82oggccTqJP8nfFzM
	iuWiHvRFhYCHZvDOM8EHV064S9IzF32nSfVzOkPKqSrizeVuvDrc7APE34SWAnryr5UjSUNZlN/
	c=
X-Gm-Gg: ASbGnct0iKrrXQOERjg0t8MRD17sdcxHPos305IJELgkpXmadfRfqNMSbGBFLDKpScI
	gZri1FJulfbpWqEBz/F6FXIrtjCVSy1CkDyQB90EBA9p1Je4FwdyuMtTNkUgzrUki1a9VmY+1GP
	pJ5XmuMJ0DJYlHBnc5eOiOtUIW2z7gPyWKZrzBD79ZPPoVYvGjcG1SJoskVqyvzMH1WVNfGciaQ
	36fmwAq+SSzu8IopxoC6P4IhuiSoAMBdzWD8PZows4fa34OGUb0Ad+F/R5fShmnOSMDsvKV+Z/J
	S6AvJORKioCDx65y6A==
X-Received: by 2002:a17:902:e846:b0:21f:6546:9af0 with SMTP id d9443c01a7336-22780e5fee3mr50369015ad.44.1742561938503;
        Fri, 21 Mar 2025 05:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj/3qxzpE7Sgmb4xcUIB8XVrV4316tAaPXM0uLVUpdJEWI450/xgrnX3VW3Bzmy83Kdd+Hrg==
X-Received: by 2002:a17:902:e846:b0:21f:6546:9af0 with SMTP id d9443c01a7336-22780e5fee3mr50368745ad.44.1742561938229;
        Fri, 21 Mar 2025 05:58:58 -0700 (PDT)
Received: from localhost ([240f:74:7be:1:2dba:1af7:27b6:24fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f6549sm15521175ad.208.2025.03.21.05.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:58:57 -0700 (PDT)
Date: Fri, 21 Mar 2025 21:58:55 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/9] gpio: aggregator: add aggr_alloc()/aggr_free()
Message-ID: <zyao5vbhjt6o5duickgtgknou7j5nalyfa3nezgga7qzmmzkva@v7cbkag6yxm3>
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
 <20250315164123.1855142-4-koichiro.den@canonical.com>
 <CAMRc=Md8nB1U--qcZxpcKVzxTcON2hi-pmsUKFn+aBEqHuBzcQ@mail.gmail.com>
 <llbybv6dpkfrtir75dveqnphrj6nuephvkoyywy6tx6vfbunl2@ft5io3thby6v>
 <CAMRc=Mcng+jW2WrAREOf-GC1mCbGEyAiMP_Ms9B3BzXnCoFGFQ@mail.gmail.com>
 <t4lng24vhim7pid6c5gafdk3mawnvcit36hqsa64qoe2gozdz3@jcjsh5b7c3bx>
 <CAMRc=MeLkqM_Fhfdvi_aQp411WEJagP8GSwpFaKNa-s9BJbrCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeLkqM_Fhfdvi_aQp411WEJagP8GSwpFaKNa-s9BJbrCg@mail.gmail.com>

On Fri, Mar 21, 2025 at 01:45:45PM GMT, Bartosz Golaszewski wrote:
> On Fri, Mar 21, 2025 at 1:41 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > > >
> > > > Thanks for the review. Should I send v7 for this change?
> > > >
> > >
> > > You should send one anyway once v6.15-rc1 is tagged.
> >
> > Alright. Please let me confirm:
> > - After gpio-updates-for-v6.15-rc1, will something like
> >   gpio-updates-for-v6.15-rc2 follow?
> 
> No. I'm not sure if I made myself clear. This series *will not* make
> v6.15. The merge window for v6.15 starts next week. I'll send my PR
> tagged as gpio-updates-for-v6.15-rc1 during the merge window. Once
> it's closed, Linus will tag v6.15-rc1 and we'll start a new
> development cycle gathering patches for v6.16 in my gpio/for-next
> branch. This is where your series will go and I'll send it upstream
> for v6.16.

Alright, that makes sense.

> 
> Only send v7 in three weeks, after Linus tags RC1.
> 
> > - If yes, after v6.15-rc1 is tagged, I'll _quickly_ send v7 rebased onto
> >   gpio-updates-for-v6.15-rc1, right?
> >
> 
> No, you'll send your series rebases on top of v6.15-rc1 tag from
> Torvalds' master branch.

Alright, thank you!

Koichiro

> 
> Bart

