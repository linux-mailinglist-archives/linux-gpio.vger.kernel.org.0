Return-Path: <linux-gpio+bounces-1931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA96A8203CA
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 07:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C681F21C93
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C16817FD;
	Sat, 30 Dec 2023 06:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYs7wmCW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327B31843
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d9b51093a0so3699258b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 22:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703917777; x=1704522577; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AoY2cIJRSm+PqRYztFjFPXZY4SuW/bOGtt8UqI5BOF4=;
        b=OYs7wmCWIV4c+paITuDnMwra0WOPnii3KwvFgy/lzDxrI1QxrMtYAuKuPQdwdqQTeu
         G50olzT5B3P9psC1iCtEcsGrnXX+xRsK2CLTxoyZvRbHCrH/RHXcWd+tR4keM8CUyg9a
         GQjjrlD5cWVtMSmWUSJuPlMubgvVe9OIP8QzcZBzY9zcFUY3w4Wo8y8iBVCGTkMkJLFt
         4xjcqYqWnl3G+USJI49TufCe2ON8sp19MGwyCRAbW7vIZQNPZbQAq6MKaXoBSoOlL89l
         ZPYCC2JANwF87Hwr4zXVfwO7JMRVcGGuMIRMThsMgminnHnFxzgKARWFJ0Sh4GltvGQi
         V9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703917777; x=1704522577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AoY2cIJRSm+PqRYztFjFPXZY4SuW/bOGtt8UqI5BOF4=;
        b=rBYmhF02bCXKrOGj/63rSh7TNA2gK1t4Q3tbmWBXyJTa/g1NZmXZqqtEVLypXQIlVb
         qnxWZrrZXi0C8Y46g17UB4hAGe3RFymCIs7kyonqKtSxHn8f0AHAdWU2Mi37NyJR2NRN
         NTaP0FQYlmI3RO1Zc6cKWTek6D9Nf7s1OZ9GkkgsQcSiL1rFhxsg9mNcg6rosvTMqxGa
         pLY2itKaNYnWJ4vvhh3WsnsI2hOcqmayHW/oC0gdn0PaNDjB3+3yOOMIFPwmR9oyctwx
         y9HF+Qp91urejhbZ1LsPpJCZaJcOO8vpqnTjYkcaQsr2D8+AW3z/sJYc/fNMtt+rsmpa
         Rc7Q==
X-Gm-Message-State: AOJu0YwnoIKFqiVOKQLfKMtqoyfy5vYHgE1pjjvSlxx071Llw7rS+2Fx
	0AMrghgfUA58AvP79wFwVq2yvU9JRyU=
X-Google-Smtp-Source: AGHT+IGfHb3tyTtgBGKnXrKHbjt5ffRORRUdqL5qIqyPmdGrBYeBkepMpPgXtpGWj8aEUBA7Ovwgpg==
X-Received: by 2002:a05:6a20:914b:b0:196:a2f4:344 with SMTP id x11-20020a056a20914b00b00196a2f40344mr1217009pzc.73.1703917777458;
        Fri, 29 Dec 2023 22:29:37 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id l18-20020a62be12000000b006ce95e37a40sm16087711pff.111.2023.12.29.22.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 22:29:37 -0800 (PST)
Date: Sat, 30 Dec 2023 14:29:33 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
Message-ID: <20231230062933.GA52702@rigel>
References: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
 <20231229155837.GA103278@rigel>
 <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
 <20231230022136.GA19799@rigel>
 <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
 <20231230050325.GA40096@rigel>
 <CAJ8C1XPNV0Wn0UEFZas43-9LzWkg2=m0RE+cRXVsvPfgANMC4A@mail.gmail.com>
 <20231230055330.GA47174@rigel>
 <CAJ8C1XMDjS-7E2huUPcQ9peJnwyeuJHYMWOuFEETwPbrwCwe=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XMDjS-7E2huUPcQ9peJnwyeuJHYMWOuFEETwPbrwCwe=A@mail.gmail.com>

On Sat, Dec 30, 2023 at 12:25:17AM -0600, Seamus de Mora wrote:
> On Fri, Dec 29, 2023 at 11:53 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > And today after my email you undownvoted it, confirming that you did in
> > fact downvote it.
> >
>
> I don't want to argue about this. What I did was restored my upvote.
> Which I probably shouldn't have done b/c you left your snide remark in
> your answer. Anyway - I don't know what to do about it...  does a
> 2-point downvote mean that much to you?

Oh, so it's snide now, is it.  Unburying that hatchet?

Anyway, I couldn't care less - it was your actions that I found
informative.

Cheers,
Kent.

