Return-Path: <linux-gpio+bounces-1930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E68FE8203C9
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 07:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED8D4B213C7
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20ADA17D9;
	Sat, 30 Dec 2023 06:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbhF/LVd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765A4257F
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 06:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ccec6edfa9so11744901fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 22:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703917554; x=1704522354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+l0adGisk0naQAvCRnjyXnylW0dfrXdUZbtuy3faTk=;
        b=HbhF/LVdAYYurnjaqFvelbp1qCUwfIBGQqpdr64hr5S6FqtY7X9soYus/SPg8BF5DH
         MWkc7pRmpueGabFL4mDLCXowL2zhX6Sa53tSo/HUWUZebWIS4hpKwqKWu1qz7iNtrUeN
         kXw55l6iBomKNQ1waToHSQwds+diVJ06BCSKiD+w6ZNQRiWN4NqblCO/yayLb49KACMA
         WZbfayVGfnuXWrPwtOxwlgsteKvje7y1p/mRjuyV9OMDLFEvcnuXbN9PxpuauVXyaG4g
         ls/RJqZhNp12OusZpKDoh/Jk+Y1g74OPDd1gjflvNpAGePqn/tBmafeDdLJ5KHZs4ZVT
         WLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703917554; x=1704522354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+l0adGisk0naQAvCRnjyXnylW0dfrXdUZbtuy3faTk=;
        b=YCxr8XGnw/6TZTOemacvu+FMM+98FDhhNb0G/kym3VGPIteaKMxd93P1rMT0qhyGSC
         HaHruRIlN+OZsASOnNFPGI/VJLn7qYS2bi00pR6qg8GqS2ZATYU/hFIMoCWaVszUc5R1
         LLgokKu5Xl3Cxl4ghM1D8vI8FrZhp5NzUHUELF2CXIVXhMxv83wUuQidsxNx9LtZc8Lx
         izus65TRtLMu2T3az+FeYJair/dBdfFPXesq6Z66oeOQMHn0m2v28sUytMrhe1xCxn7A
         5a/l/vq7/biEOQTilmf77oni7oBJYspFKNRxycReH0qTidSkq039ONdohwcIpbtrw3ay
         wi2w==
X-Gm-Message-State: AOJu0Yw14jw+E4aRUjYz9x9W41RbUD4dMpF2Wf32jHPvxOsI9VDbu+B8
	m95NwJILMMiB6dWw98k/movx9XGIpWU2dU9pYpHj0v7l
X-Google-Smtp-Source: AGHT+IE6by/AuymuHpbEjI6Y9vuuPEFZoJFNCA2W3L1gL6Wrz/1YxKC38MTpe+LcZv2+XgRCG6TSgVTx6I4+zPtU+3Y=
X-Received: by 2002:a05:651c:1a0e:b0:2cc:b9aa:8f1f with SMTP id
 by14-20020a05651c1a0e00b002ccb9aa8f1fmr8335874ljb.24.1703917554302; Fri, 29
 Dec 2023 22:25:54 -0800 (PST)
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
 <20231230055330.GA47174@rigel>
In-Reply-To: <20231230055330.GA47174@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Sat, 30 Dec 2023 00:25:17 -0600
Message-ID: <CAJ8C1XMDjS-7E2huUPcQ9peJnwyeuJHYMWOuFEETwPbrwCwe=A@mail.gmail.com>
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 11:53=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> And today after my email you undownvoted it, confirming that you did in
> fact downvote it.
>

I don't want to argue about this. What I did was restored my upvote.
Which I probably shouldn't have done b/c you left your snide remark in
your answer. Anyway - I don't know what to do about it...  does a
2-point downvote mean that much to you?

