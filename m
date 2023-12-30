Return-Path: <linux-gpio+bounces-1929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1CF8203BF
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146392835F1
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 05:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0C017E9;
	Sat, 30 Dec 2023 05:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6FSiHKm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29D91FAF
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cd5cdba609so5594161a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 21:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703915614; x=1704520414; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4E78poTdQivoNDvE+Ca+HcOzITgEmF2OJPBwHkB6nMI=;
        b=m6FSiHKmxRSL4z6/lsEGAd2KGcpb+DFioL0uUGoP4gu4/3ksdxpbMXZ6gJri7QCYki
         qt9LYeOv2EsurmENAoNW+eId99aucyJq6v1V5/s6qLk61Qn8d0dRm1i7kCgSVE2n8Sth
         lkyKc7Q3VGwu+XCDmOkSAvphA1x+kyMfBXf7VmnaIEDd1PN20Xk+j40ESI3CXCMKjGPN
         UtPLa6rWsVOJSD8VXifxQXatZlLR93h9fd2L5LDNLg6r0lyQ1jjj3/552VqeeK00amhj
         iy3E5+bP892fA9N/gy49M25iYmdT9YvMm6U2fuyEK4Pq11xlJhdJkL/NdqS3ClUJKqqz
         Ke7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703915614; x=1704520414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4E78poTdQivoNDvE+Ca+HcOzITgEmF2OJPBwHkB6nMI=;
        b=Z/EW0NrUzfYTG8XsuWJetbUHd76BI/mTH7gbffZvd5PDjxuZ4CX5dAtt7rWhc9cNMi
         xevM6H2J5tcpwtPFlA9gaXb0vEwLz0pNFsNqJvs8c7YZ5jPzHKHUPCkT/3ocaQLIhvBR
         sMh+LoH+DlrNV9bU2i4p6YfoVKc9JcbEkBovX3H/9XbCkm/yCW8fWaXWHdM4g3DrDeUX
         VNiMm2/Hlscn9e5wTgSF4cx6YPjgurAvWfC1qI2iAt3INsYAPV8HK3W9NQYs1ZKJd+As
         PB9ze38pvm7nG7iqjHxmNq7yyhsiKKxr1sPHwMqAuAEPwVr2Iuf2gQMYM2bFlz8vFdac
         bLaQ==
X-Gm-Message-State: AOJu0Yxz/5UrgBfsHWK0HyCGAKR9dFx2mw8Au35qinSRCjbSX9Dc4nvc
	LHnbjrTcQYE6sbyoRidRnYI=
X-Google-Smtp-Source: AGHT+IH1RquWa1gyNkBq6Yfgry/9EHmA63vIBqttc7Vf50AraTfX64Vi9zGnjIPmQSpDc0UWZRQIlQ==
X-Received: by 2002:a05:6a20:4c2f:b0:18f:97c:9791 with SMTP id fm47-20020a056a204c2f00b0018f097c9791mr11508827pzb.121.1703915614162;
        Fri, 29 Dec 2023 21:53:34 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id y12-20020aa7854c000000b006d9af59eecesm11128044pfn.20.2023.12.29.21.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 21:53:33 -0800 (PST)
Date: Sat, 30 Dec 2023 13:53:30 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
Message-ID: <20231230055330.GA47174@rigel>
References: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
 <20231229155837.GA103278@rigel>
 <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
 <20231230022136.GA19799@rigel>
 <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
 <20231230050325.GA40096@rigel>
 <CAJ8C1XPNV0Wn0UEFZas43-9LzWkg2=m0RE+cRXVsvPfgANMC4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XPNV0Wn0UEFZas43-9LzWkg2=m0RE+cRXVsvPfgANMC4A@mail.gmail.com>

On Fri, Dec 29, 2023 at 11:45:59PM -0600, Seamus de Mora wrote:
> On Fri, Dec 29, 2023 at 11:03 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> > > > And thank you for the SE un-upvote and downvote!
> > >
> > > Since you brought that up again: I did do an "un-upvote" - but not a
> > > downvote (don't even know if that's possible).
> >
> > It is, and happened at exactly the same time as your un-upvote.
> > Weird that.
>
> How did you determine this was at exactly the same time??
>

Partly eyeballs - I saw it step.
Partly reputation history, though the timing resolution gets more coarse
as time passes.
And today after my email you undownvoted it, confirming that you did in
fact downvote it.

Cheers,
Kent.

