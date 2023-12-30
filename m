Return-Path: <linux-gpio+bounces-1926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D19820395
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 05:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100F01F22085
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 04:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B0F138C;
	Sat, 30 Dec 2023 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="As5hBVT8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33C15AE
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ccc5fca3f6so45806281fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 20:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703911433; x=1704516233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eu1ewhu+CnH0h4yPUWII8fPOhAH7vUQNaYqTzkt1sHk=;
        b=As5hBVT8mSUwd5SVaSVA0R3gHMFtxnNp8++/VAzKdt59nYaQsDttg3zLmf6wzNtPM4
         M0HhU3XMkhtAsAz2JSTrVp5rZPDfddpu/o0YS62+EX3ipB0gFQFd+ZDW5qo7X/hyk+9s
         GKgwaLM/cMytuWLPkCoV/HLXFfmFDcQlvaubG52Vrg95d81TsIYUUkvyItaZ+cBBX1kn
         6SLZ0DlDwEEXULzv6rSilipRQdVaazghZ4XvUGq1XJRIY14ee/ova4z9sZcFZ2+JiBLN
         UAUnFrCiNmZPkU8MyKbWJ4RtYF/0K5ySNZ4ldNSnOBOp86clUh7Rritz0YjupAx0ADAh
         xZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703911433; x=1704516233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eu1ewhu+CnH0h4yPUWII8fPOhAH7vUQNaYqTzkt1sHk=;
        b=LcK1rZj9U41Nc3isNCsNCtm23lwKoYAdWUiirukPw9kP8OlJ1ipiPbwIdx30YoUoK7
         df4A4e2qxeSbofgxUxS6YF4UhNndHBuPNVPy4YQ82uLqRkJQ6yeaBKVvvXsk/C1x3gHV
         5+WPt2udI4kTL48zK5Dl4UOs+X5W674Y27cYOhg9hYO6muoP4Rh5mJvUJQ2FfwsiUQRx
         HXs/arf0kSjTGuTTEEdo6BlV8wnkvaioRrYib28fADFNKRPho2Rdbir4TCYxnTJCei5i
         TlSnJSKiuCtJ+TBlw55fian9fpHGHh40KtsNLtpxl7ePuDzHNSTglEiHFN0usPFKg0m4
         G80w==
X-Gm-Message-State: AOJu0YxahjEnp4XM7cD59Wqm21lIhsRlGp9oBjblqKC+6jeDoudn8Fjx
	GRzg0rV/6ePLF1FD+5APhebJ/bV7xtOYOecaE9IcaQ4W
X-Google-Smtp-Source: AGHT+IFxhMERB2AjzHQ0cA5MdM2st0Fr7d7QcG7Cbbv+XRmKnBUVZBFkl/d2w0Y0U0BkWMiErcm/VkwEEWPrE9jC+rw=
X-Received: by 2002:a2e:b014:0:b0:2cc:d4f3:a9f4 with SMTP id
 y20-20020a2eb014000000b002ccd4f3a9f4mr2881666ljk.19.1703911433082; Fri, 29
 Dec 2023 20:43:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
 <20231229155837.GA103278@rigel> <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
 <20231230022136.GA19799@rigel>
In-Reply-To: <20231230022136.GA19799@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Fri, 29 Dec 2023 22:43:16 -0600
Message-ID: <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 8:21=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> > That option ('--enable-gpioset-interactive') seems to have gotten the
> > job done. I had to back out of 'libgpiod-2.1/tools' to
> > '~/libgpiod-2.1', and let './autogen.sh' take care of the '#define'...
> > instead of me trying to add it manually to 'gpioset.c' via '#define
> > GPIOSET_INTERACTIVE'.  I do have **all** the packages you listed below
> > installed, so why my manual addition didn't work is still a mystery to
> > me - but not one worth fretting over.
>
> If you want to change build options then you need to re-run autogen.sh to
> regenerate the Makefiles.
>
> The option is mentioned in both TOOLS section of the README (but I note
> has a typo that needs to be fixed) adjacent to the interactive example,
> and the configure help, which is itself mentioned in the README:
>
> $ ./configure --help
>

>   --enable-gpioset-interactive
>                           enable gpioset interactive mode [default=3Dno]

>
> That is not enabled by default as some platforms lack, or want to avoid
> including, libedit.
>
> > Thanks for your help!   :)
>
> And thank you for the SE un-upvote and downvote!

Since you brought that up again: I did do an "un-upvote" - but not a
downvote (don't even know if that's possible). And I think you know
the reason I did: your haughty replies to my attempts at
communication. I really like to try to get along with everyone, but I
will admit I do not suffer arrogance well. After reviewing things, I
will say that I may have "crossed a line" with my use of the term
"can't be bothered"... I've used this term for much of my life, but
never realized it implied laziness until I looked it up yesterday. And
so for that - I apologize. If you'd like to now "bury the hatchet",
I'm good with that. If not - that's OK too.

~S

