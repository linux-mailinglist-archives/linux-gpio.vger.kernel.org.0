Return-Path: <linux-gpio+bounces-1932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC18203CF
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 07:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0055A1C20DB6
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC471364;
	Sat, 30 Dec 2023 06:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFz42oK7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146541FA2
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cc3f5e7451so81093301fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 22:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703918234; x=1704523034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOTFLqKjl+kF/UcWryerSp8NiWkwpywMBuTEIl5tZ7s=;
        b=bFz42oK70LSsigDVsD2aOawA9FMipriwTC5YXv/NoBlO22DHmJbKnypkFDY5YGFGOr
         zkrDWbz8TJkhBObWMkE6O1yiW8M5Gnmr3hOwvJH8eewubA/g6GZSNt+entMXXlILob2g
         PC2Mh8/iFLqBUNhV7B1/rGA+/Zshw0LM/q5YdNFpSfUqRggamdSjrj34sp7kps5qHs46
         kYaXLzUxFn10ieDFoyoYzbDuvIJae4etNvMgY92My75cFJymMfKzbcQQM0v9dwxTwglX
         A65jDLOHYWlJzubQJNQAKsAknPA2limDnkeXQlsfaK1RdW/7r80O/cadUzfi9wlRo14d
         rzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703918234; x=1704523034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOTFLqKjl+kF/UcWryerSp8NiWkwpywMBuTEIl5tZ7s=;
        b=mHuJPH+2LVN8g6a0MyBA5DuUh4XejhQjEZbaV+JbA+EKDnGJ8gcE3dWzNoegZgwdPM
         jA7mHCBS4XcqX/tz+ILSnOd9TlFmbEnnEgUqakmrA01Y1Bb9SoGatX9nEBIbFAd4AvlV
         WSd/RGLnJ6tuQkMsvqdI90l9vgthjm5B5J/D2KrfRyRHlW5OncaXyeO7039WWbnC6hFk
         gvgrUFvz0O0dhc1pURwbq4PjZ6t+Uza3FZlPpehOP/cBz0DiN3DmLkXTxkCZptKXA6ZH
         k3F0fAxoFI72O73FpbLua5P1pKqZAvqnvs2K1t9L26C42zYYknlAkPOBlghlxjf29PET
         Q10w==
X-Gm-Message-State: AOJu0YyLUHQJt9kDhc/W/UHjM99HSmt3bLUed6YUFH6GZ8RbWCRZcGqE
	EM6f1KLL0e6W7I17HPgm6Dv0fjKpDGpCQYIcVQ1yIlr8
X-Google-Smtp-Source: AGHT+IGsn+70/a9UVSsAvxh0U7G1yGMzQWnm5TsQcwdOLIedrAjSyNhtT0d2wG8UhhdFFmI/vVaGgbxLVXmL/Uo5aDI=
X-Received: by 2002:a2e:94d0:0:b0:2cc:df3f:9f83 with SMTP id
 r16-20020a2e94d0000000b002ccdf3f9f83mr2010596ljh.64.1703918233866; Fri, 29
 Dec 2023 22:37:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
 <20231229155837.GA103278@rigel> <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
 <20231230022136.GA19799@rigel> <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
 <20231230050325.GA40096@rigel> <CAJ8C1XPNV0Wn0UEFZas43-9LzWkg2=m0RE+cRXVsvPfgANMC4A@mail.gmail.com>
 <20231230055330.GA47174@rigel> <CAJ8C1XMDjS-7E2huUPcQ9peJnwyeuJHYMWOuFEETwPbrwCwe=A@mail.gmail.com>
 <20231230062933.GA52702@rigel>
In-Reply-To: <20231230062933.GA52702@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Sat, 30 Dec 2023 00:36:37 -0600
Message-ID: <CAJ8C1XN71bsBkXgjdq0=2SZuJqs2tONitz0vv_OPzp4na6LofA@mail.gmail.com>
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2023 at 12:29=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Sat, Dec 30, 2023 at 12:25:17AM -0600, Seamus de Mora wrote:
> > On Fri, Dec 29, 2023 at 11:53=E2=80=AFPM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > > And today after my email you undownvoted it, confirming that you did =
in
> > > fact downvote it.
> > >
> >
> > I don't want to argue about this. What I did was restored my upvote.
> > Which I probably shouldn't have done b/c you left your snide remark in
> > your answer. Anyway - I don't know what to do about it...  does a
> > 2-point downvote mean that much to you?
>
> Oh, so it's snide now, is it.  Unburying that hatchet?
>
> Anyway, I couldn't care less - it was your actions that I found
> informative.

:)  Kent, you're wearing me out, man.

But NO - NOT un-burying the hatchet, not un-downvoting what I didn't
downvote in the first place. I clicked a button three times: first was
to up-vote, next was to take the upvote away, 3rd was to restore the
upvote.  That is my total recollection - honest.

