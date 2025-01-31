Return-Path: <linux-gpio+bounces-15117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C537A23A17
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 08:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED4D188A57C
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 07:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A1F153BC1;
	Fri, 31 Jan 2025 07:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="V2LS5b0Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ECA14F9F4
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738308368; cv=none; b=cXUxqUz68EtdrZLr65QzsZaHKJbYw7z9TO+oAi7F5an5VbV4iy88QnnodKiow2BKnUM/pTtOrbEzz8WdL2ifqPrfOWVdR+gW/e0N2A0QzFHAcW46znBMwkGBOmu5WjtLea9MUmkanVR6drZN4OASaxYmyCecmhYtP7QCLot9Qts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738308368; c=relaxed/simple;
	bh=Tr3ksmV2pNqejIWqja5XZ8mPSPBwaqrs3w/kzLOqLi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l398C0BBwH6tTB38iobm6VuW6n+y8+6hhVE271SRCx5TFlYQ6uZ3jwAVnOjhzDYE1/OOrpC1SV0RRH+VgfPnM0xCTA5xghw+412VEHOe4AtTPUIkaj86pN4j4KT3lQ9LetSxkPo6pPl0ftSI78O7P5dOFz7P6aJLAASzQQ0u1dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=V2LS5b0Z; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 259C93F475
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738308364;
	bh=Tr3ksmV2pNqejIWqja5XZ8mPSPBwaqrs3w/kzLOqLi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=V2LS5b0ZOru10wBsoh0CMSfBXa6C1E6rPgJUbHUPTZOashpsMSs/gqEPmTxZpYHcV
	 Dc+OT69juZEZ1lCVLTAyD1MkjcpyxGS+Rtwu5nxf/DnalQbI2LCccwXmNDTmIQRT8C
	 NpPP9HA/HNCBcBoen1ImNMus9WdcFWO75olGBMrt1CiPSyKzWkfbgvr2MLQqCVoxe5
	 +4PrKbcp/A3AArUKVoREI8jnnDBlPaxkganicilcAKkNUYl5jQaiBsrwuM5FWXhBXs
	 WvxF2PnA0qK+1oP00BEiMSCCWvV+2sNZdhCgnXB0AO9lczw3GTwCzjYTngcw73muN8
	 fIN//vQZrz/NA==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5dbe8a4165eso1861569a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 23:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738308363; x=1738913163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tr3ksmV2pNqejIWqja5XZ8mPSPBwaqrs3w/kzLOqLi8=;
        b=AvipOrlqRRSuUxV7Ct3lzSSj5uVlvfwzLidpgPKURTipU9ozyGrzBV3gLIw8ziQ5Hr
         4xCjWEQM8kG+Lk0gpbSDaLek+zR+aSzFYygseugdG+/IuSsmRLbyEI0kSgXW2v7dasjd
         oDdxoVcjF2Xdc/V+uPFP/v3Uwmhrq7kcu9OPnUm9VImafbTV9bU1pTq0caw+Lipw+clk
         X27/F5mdpN2xpQM2o3IL8G+Lntiat95WGwmvT5awzkfUO8FWzzakNz8TzIZLD49NhbnO
         PZ6CeL3F6NoIe7xKdutI4clAk4CDD0FERF8qu6Yd+M2lyWkv8138lqj+PNYmus9n8vda
         GVvg==
X-Forwarded-Encrypted: i=1; AJvYcCVpRCQ2O3Jp5vw9BdMOdAI9AAMI+1fXIIzEUDKutSveO4ZbBIWvTLLHkSDGDp1k3DSTpaAnD5PgUGuy@vger.kernel.org
X-Gm-Message-State: AOJu0YxE2yj+6WiOCqYQsVPGcw8vQyS6JWYcvWf/39nPT5evBrtVJZEB
	YQVChueQbx027Q4uRefXqxbihxPvof3s+YnPgfLrb+i4I+AEc/G30mY/ZDSgspvs5FgeKg5IxXH
	o3ggDjvJESavw8RCrGaYoR0Goun/f+toT1f2GTCjbDEp7ovK1DQLRguapc5gy4izmzyjWSexAYB
	0s+0gdYAR7RYBMsKyXBhZuCapYPC9/xn18jDi9sgA+ci0n7HWCJg==
X-Gm-Gg: ASbGnctj+alXoCIJfZAhnK/Jrf7pEJ8tERMMLzdt8OJ6r00uunQ07TFTPKjYEYfsx71
	nKmfs8K1HUotH6IrQHVTQTIE0svuEzT5uBwgZ/fGCmZQOckML/tuqvtOtKtN7Xw==
X-Received: by 2002:a05:6402:5215:b0:5d0:e9a8:4c96 with SMTP id 4fb4d7f45d1cf-5dc6f5d1319mr5750217a12.9.1738308362877;
        Thu, 30 Jan 2025 23:26:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo4YZqyV5ZOEg9+j+noeoGbHn2LUCzKjoiwvK9ssgYbSRCXOD0oMtLMDCHvPeCMnQfqRAl5WKzXsjCA7hTx6c=
X-Received: by 2002:a05:6402:5215:b0:5d0:e9a8:4c96 with SMTP id
 4fb4d7f45d1cf-5dc6f5d1319mr5750191a12.9.1738308362546; Thu, 30 Jan 2025
 23:26:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com> <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
In-Reply-To: <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@canonical.com>
Date: Fri, 31 Jan 2025 08:25:51 +0100
X-Gm-Features: AWEUYZnqd6nFifeeXMsgHpAgXINp0XindBDZvZmEHwOqyGGNlqREVOFH2WdDmfE
Message-ID: <CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	geert+renesas@glider.be, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Jan 2025 at 21:48, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Jan 30, 2025 at 7:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > While at it: there's no reason to impose a
> > naming convention of lineX, lineY etc., the names don't matter for the
> > aggregator setup (unlike gpio-sim where they indicate the offset of
> > the line they concern).
> >
>
> Scratch that part. There's a good reason for that - the ordering of
> lines within the aggregator. I'm just not sure whether we should
> impose a strict naming where - for an aggregator of 3 lines total - we
> expect there to exist groups named line0, line1 and line2 or if we
> should be more lenient and possibly sort whatever names the user
> provides alphabetically?

If I may jump in quickly (I provided some initial feedback on the
configfs interfaces
for the first internal patches). I think it's preferable to have
strict and explicit, even
If more verbose, line ordering in the aggregator.The motivator for
this is that whoever
sets up a new device through the aggregator does not have to second guess w=
hat
the driver will do. Implicit ordering could perhaps be fine if the
consumers were to
impose some set of rules themselves, but I fear there would still be
some ambiguity
left if free form names were for e.g. [1, 02, 10]. In the end they
would probably settle
on some mechanism which would mimic what we could already do in the
driver itself
and avoid any further confusion for the user.

Cheers,
Maciej

