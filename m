Return-Path: <linux-gpio+bounces-1900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BED81FC5C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 02:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD4462856E5
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 01:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333A3ECC;
	Fri, 29 Dec 2023 01:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdEl97R/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8F1FAF
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 01:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28c0565df34so2142116a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 17:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703813573; x=1704418373; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pU4Vi72xUtAjDppVXW7yYmc5BV/IoEC4iGR8DZc5Tc4=;
        b=DdEl97R/cgCpxfN9zoJh3zQsFyJkEfuszAtNdHlfPF2FCovqLRMXR0KLOBwzRVKTcT
         CAVABag/yJEaNbq+EHA7K7GBpDuGgdmvmqUgl2c2Ht+ZSxTzolkZX5rz8b5Jtz8Yuc6P
         HRkSAaZS4wukOiRMat666hHMvzwSaS/PQo8MIfBntj3rgcEvajh3bhJPFQKJvjiuwGSv
         9pIczPHdsmGuwMN7GjamF9+Ns0Ja1pTsOkhDd9ndOJjkiMfmVRsMCfeZ56ispkGiUn9o
         s/FmM83QiB1KgCort0BC4oeUyQhtAaZ9945BlBeMun47Eb4zeOyBgoSumM3WfvXQFwKc
         XnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703813573; x=1704418373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pU4Vi72xUtAjDppVXW7yYmc5BV/IoEC4iGR8DZc5Tc4=;
        b=gux+D4o6OZQazw/caELurQFNZ4t9Gg9VC2K7wJSs12XhmSgC4tRWandjX2iZ5lL7tM
         B7en2zRN4R0VzavqpifBuNcJcowb4QqHQGaFzakWaOiEhUOkptS5d0qmrFsZEww3205N
         m4gdwg1G7hJB3kjfIWRQ994DxQKAh4Q7U6eYl+7XbcffcNMqJeDikQR/khlBirQq4KQk
         lDf5fS+vmf7GhGgmvWVXDFDVz1/JUZdDgwNLBlEl5XzpmNRnaAm4arNc0GVCP5F6/5pM
         0VQBp08pkC8gCqa4zM8STujs8ebuk4iyCqxsb/Id7NIrG42K0bNLqZy3JsdJRQLyvBM+
         KIfA==
X-Gm-Message-State: AOJu0YxAgMhpf1yb52IVQvAs7BYMYp9RvILXGcb1aMn8WYfPRi22CiL8
	Z9VSZLMCIgGTEn6TiXin9xImGC1ZlHg=
X-Google-Smtp-Source: AGHT+IHyR0NDiMth4q4GeXJs9G7T4/qQ3oJvMhYBM0IO6RV+jrgGnVSDG5Mc4wiWQ18Ty2CYobefrw==
X-Received: by 2002:a17:90a:c4f:b0:28c:5a10:f32d with SMTP id u15-20020a17090a0c4f00b0028c5a10f32dmr2735739pje.76.1703813572870;
        Thu, 28 Dec 2023 17:32:52 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id v16-20020a17090a899000b0028c8a4fb12fsm4569772pjn.49.2023.12.28.17.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 17:32:52 -0800 (PST)
Date: Fri, 29 Dec 2023 09:32:48 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver
 2.1
Message-ID: <20231229013248.GA10291@rigel>
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <20231228092915.GA67274@rigel>
 <CAJ8C1XNXSHXpRcsBWJmrGRa2dg2VxBVo1BG6KC8mio7keYy_tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XNXSHXpRcsBWJmrGRa2dg2VxBVo1BG6KC8mio7keYy_tg@mail.gmail.com>

On Thu, Dec 28, 2023 at 07:01:10PM -0600, Seamus de Mora wrote:
> On Thu, Dec 28, 2023 at 3:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Dec 27, 2023 at 07:19:54PM -0600, Seamus de Mora wrote:
> > > Hello,
>
> Thanks for your response, Kent... but really - there's no need for a
> supercilious remark like "hope you feel better soon"; you could
> improve your communications if you'd drop remarks like that.
>

I am well aware but sometimes you need to compromise and work with what
you've got, and given the mail I was responding to your comment is a bit
rich.
Happy to give it but not take it?

> Anyway - I'm still wrestling with the "persistence" thing, but you've
> made some good points.  The view is still a bit hazy, but perhaps I'm
> seeing the "bigger picture" now? And I finally got around to reading
> your post on SE; I made a comment & asked another Q.
>
> One thing I'll comment on now is wrt the 'gpioget' tool, and the '-a'
> option. If you want to create a tool, and call it 'gpioget' my feeling
> is that a **read only** behavior should be the default. I'd recommend
> you consider making that the case, and use the '-a' option to mean
> "adjust"  :)
>

That is your view, and I don't care about your feelings ;-).

If the line is already an input then it is a read-only operation.

Another view though is "I wanted to read the line as an input, so why
do I need to provide an option just to ensure it is configured
as an input?"

That was the default for v1 and there was no feedback requesting to
change it for v2.  And, depending on your views on API stability, that
means it can't be changed until libgpiod v3.

If that doesn't suit you, try an alias?

> I'll follow up on the persistence business later, but just in case you
> can't be bothered reading my comment to your SE post, let me re-state
> the question I posed there:
>

Perhaps improve your communication skills, or can't you be bothered??

> I skimmed through your reference to the [GPIO chardev
> uAPI](https://github.com/raspberrypi/linux/blob/rpi-6.1.y/include/uapi/linux/gpio.h).
> I noted that there are several deprecated 'struct's in that API that
> were part of ABI v1. QUESTION: Are these deprecated 'struct's used by
> the `libgpiod v1.6.2/.3` - i.e. the libgpiod that is now current in
> RPi bullseye (1.6.2) & bookworm (1.6.3)?
>

I've already responded there, but to reiterate, the deprecated v1
structs and uAPI remains until the transisition to v2 is complete.
If you are using the v1 uAPI then you are using those.
You can still use them for the time being, but new developments should
use v2 and existing v1 users should migrate to v2 at their earliest
convenience.

The kernel can be built with support for both in the meantime, though
v1 can also be compiled out if you are building a custom kernel and are
sure you don't need v1.  That will probably change to be the default
sometime next year.

Cheers,
Kent.

