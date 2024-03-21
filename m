Return-Path: <linux-gpio+bounces-4510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6408885B4A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 16:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55D1A1F22F5B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 15:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46E585958;
	Thu, 21 Mar 2024 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YrQvzPoR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3C71E522
	for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711033261; cv=none; b=rxZPVYehpc7IIcp2LIkP/UdF1FVT2XINTbypE9/Wt1WQM8quDjwhuYRBGZl0Lui18fKVrlPe9eSpWQx9hq/+/GT6LdMojrvypwTBRLoCFFccXgSlAoLuc3vf39yHxHs101gMqB77BXrqjjqROrqn5iXct7BMY3oQxolWG0uo5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711033261; c=relaxed/simple;
	bh=eFdgMBog55pPacvetVrNtMYWsrYORvl/b2ysPzLPlV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fqo3uGsRIaXUG0qko1LvMA31W1p5IePQstyoD/UiwyW05u5pBryrWAXJ20I+TrEEqtrPPkTvCrmBJGXFnylgAaFJf99+Sbk0wVbHgRMzoO6rv+ILBQzVMcP/zB3AEqy1Sy8eMb/bLlgGTABqzH9gyjVGi4ayQx8AnV5wC84+C3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YrQvzPoR; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so15336901fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711033258; x=1711638058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFdgMBog55pPacvetVrNtMYWsrYORvl/b2ysPzLPlV0=;
        b=YrQvzPoRDFaG3o1zHZ4/FYRULE1qvFf2rS1TRa4osEm8OADXTvq0nzl7Oo5uvx/Q1m
         m11Uk/28nakJZEQF0b31b32iN9OZbyOhFAkZ6DumQ8uu9jCmL2N746S1bDfu3bNFpLdL
         gBze7vMazG1lIBIJLkacgqlrznD0O8XlWzVbyHWWcco8VHj5dEmHNUaQI+MZZEi8F/ig
         C00Kgvaw1Z26fX1whUftFklmpc/ukrVInkr6DUUfqHBeFQgktoieBnC5ej9faLp4/5Un
         flKaRrjb0/5OPu0b4LUIY3XDE+QYfSCaPBvej+EUI2U4dPxBA02MKRarpnkZNledDxIf
         sbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711033258; x=1711638058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFdgMBog55pPacvetVrNtMYWsrYORvl/b2ysPzLPlV0=;
        b=bOHazZe4mwyfqHUe0Q5UezQUhRjBWH3KezfVR40c7sqZtbek5ceOfgNlI+U9I3R8x2
         SrTVtCFtEGxR65pwDn/eoyuX+X8q4Kjl6oroY8m6bdmBVUijFlM/ZXOMDgaTzt4dpNyn
         zNQmuAYu3TyJ1qsJTQBC+tOA03D3Wu4R2JPFazjX5YNt/Lr7CAk7II0Xq3vVk4Wa2JKH
         ll3mNRqmfeZMO2SLJfGsGWwf+TgX1VOZPbJaB+m3/KuNSPOlncvJuG1f0MKjxkJTMaMS
         6kHWV3aWCw1GcK8R7r/dD15K9z9KSY/E008euJX3E5ThVk/Wx9Ji6sq9sEcrJaOg7phb
         BZUg==
X-Gm-Message-State: AOJu0YyzzzNn9CqZ6xe4Y4tHv4JEszBKOAD7aUr7XlcvEzGGCYnF5IpS
	VfPFGKkr4ei0S181e91hQvGPU28rtdVw2Pkjc3m5rJxKwEAeiqejuZQERicRKMf8AZsXAEi5RYP
	bOODJreSp3P1CZMWgtrCZHmRCJ6TrYfK27Mq3Uy3RaiK42pFQ
X-Google-Smtp-Source: AGHT+IGH+xTo4vgJ4hFnHL2r2+q/CE5y0X3891XskinOSEo2YMqlBpeWtmYEU8wpP/BF2wFOgRDa+T3axHohjAitnho=
X-Received: by 2002:a2e:3005:0:b0:2d6:8fe1:5e17 with SMTP id
 w5-20020a2e3005000000b002d68fe15e17mr3675165ljw.25.1711033257605; Thu, 21 Mar
 2024 08:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320134957.7928-1-orbea@riseup.net> <CAMRc=Mc1JOf97jQKPL_k3u=NWJBf2aGGDPTw5kaem3t3SzSxig@mail.gmail.com>
 <20240321063446.0cfd3229@Akita>
In-Reply-To: <20240321063446.0cfd3229@Akita>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Mar 2024 16:00:46 +0100
Message-ID: <CAMRc=Mf+fGwg=dKZEe8zrpVPgm5D+bVzwX+xb=1jsFsZa8F=7Q@mail.gmail.com>
Subject: Re: [PATCH] bindings: cxx: link using the libtool archives
To: orbea <orbea@riseup.net>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 2:34=E2=80=AFPM orbea <orbea@riseup.net> wrote:
>
> Thank you and apologies, I neglected to mention that I was having a
> hard time getting the tests to build because the check2 in Gentoo
> doesn't seem compatible with what you expect. Maybe its too new?
>

I suppose you mean Catch2? What version does Gentoo provide?

Bart

