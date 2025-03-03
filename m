Return-Path: <linux-gpio+bounces-16942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC2A4C207
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 651CE1894193
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFFD212B04;
	Mon,  3 Mar 2025 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WN4HsvEL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDDE21148E
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008681; cv=none; b=JrDeolmQlaE+EbgeqbXLnUoj+P4bmyT9YUzJxThenvSvRNrNi1OeOMIAr4PKOy0kobtInnHxJCU3HniY5YxDgFoIhwuW3iQDXj7r7o6LGXS26MM1p3VJgbV+NcRRX8ij6wRk/klfXSm/VvBPy/hweDsC+qolfHakRNiwN8eMuKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008681; c=relaxed/simple;
	bh=R/TM49oZWGdLbpHQHKmc9AX9+Vwi8afVDcJ3MJ+BDeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSN6FBTt+Yf9tZm4bJgsnTtMBsjD5ypXWPKNEYBWLQuy2zzFDJMsCNr/l5UdFLM5cIliSZD44qaxkCiDoq9fjQRDwo5V+mALviIP9xltAVxIm60NnNNktloQPUmwAmqY20t01sGaMkorJwF6jFVdiLUGv/ORHLx5QivYquq1+Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WN4HsvEL; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30b8cbbac91so34549871fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741008677; x=1741613477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/TM49oZWGdLbpHQHKmc9AX9+Vwi8afVDcJ3MJ+BDeU=;
        b=WN4HsvEL91e4KVi0HMbEgYFiHF+eB1nc5SDXyDwPoDYREV4crwghpycnanqqyO9G3A
         VzsvhaCnEjYgFj9ZLe58jjMV+7NGQxB7yVlqUin4Gi6BCxEurQKWyEbTKbn9EC9XhyPk
         QInLZ36EPuSug24XH/G2y/Lx4X6wVgsCLF7QzNZ30AeIp4O52KEkk4ksEsXf7hOPZUZh
         KsoUuERxpePmM6LnlzzNCsOYFV6mt4bvZYbc1YRoAvsxjqCkix7wv2QZAEiMl3A/b947
         1KZaIXe0ChsUj7dJF232JGPJ6IxAVE2eucVnmA/TX8fpoA7E8qax6zmkD+74Jl8FVzou
         q5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008677; x=1741613477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/TM49oZWGdLbpHQHKmc9AX9+Vwi8afVDcJ3MJ+BDeU=;
        b=NwiVvuRcLx6Qm5cE5OLTKuvsXhTw00GLBfg11jbi1IvzYaSRHnAgEjbpqrqh+Qp001
         iHXFVhg1EpQgXN63Tr+FqbsKqqVARRPlkchCci7L3PPzOiKb80v6yDFlbERWmjxPgWKV
         NJYs3+hJb/gEvFVq7lpPmahWa5B6mhF2zTNBjXeIoFq9doEcbOpG5KvbPZP0W7edIQnc
         brFtsDXmNECYzJe8qnK1612PEMQNDsBDRPtFISr+jP7fKDWNpTD6yi5lhJo3nKLcFzaZ
         i9Y6cpyyuO+XE1HH/BAfU5Cd5M7j7zkw1UPnKw/qJkedkeq3CppjHrt53VCSGOcHIkr9
         EYqQ==
X-Gm-Message-State: AOJu0YzHxj397O1R9eqsvDkSjTOQ/+Tbbz8IQQImNFE1DS69tFnWBO7p
	D48mAxXNpxwA6RRphcdzt9yh2Xs8jaIbQwI3ANnXd03YUUmfu9dnKIUiWCFvfhfEofUk5ynujW3
	fiHvC065mveBVArEgZVyq8TMfjl4us5od6317pQ==
X-Gm-Gg: ASbGncvPyd0GeYEbdLZo/45evK7J5070chNegc1kVK0CMc3zI0PPtrlO/CGkDZYtv7H
	5d+ce4ZtFezvaHLs5c58hegicKKfrR0kHludaLrvvYUiqO7Ugpfxxr06kpOrub2x1tagga4kCs1
	xmgIXE2l41y/IIPkduJSXE3/vNRq4JZco3lMEmTZaE1WrWZP6MwhHK8mFneQ==
X-Google-Smtp-Source: AGHT+IEVWBT1YPXtdlWjE7JR74LN9l06k8yqVsU2GBGmmFdgMB/KpYgiUWm2TOaIJf8TNTNTlJ0TEPrpLB7pycWcOhE=
X-Received: by 2002:a05:651c:2229:b0:308:e587:ca8e with SMTP id
 38308e7fff4ca-30b90a0e97amr47240721fa.11.1741008677532; Mon, 03 Mar 2025
 05:31:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4af4f6c5-d7da-4735-9ef5-ee3c34f7eae6@cyberdanube.com>
 <CAMRc=Mes3EmqfPtMBNZfTPV2cpyfsH13hS4bad5AwgTUbdVCPQ@mail.gmail.com>
 <661c2ee0-013b-4ee1-8c53-51729a172cce@cyberdanube.com> <CAMRc=Mcx4=9u9n2CoX=ErxjEidEHH-+ALz976ir1P0NMnzAQvA@mail.gmail.com>
 <230bae96-2cac-48a8-869f-0e664cd8e049@cyberdanube.com>
In-Reply-To: <230bae96-2cac-48a8-869f-0e664cd8e049@cyberdanube.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Mar 2025 14:31:05 +0100
X-Gm-Features: AQ5f1Jqu3s2adTb2dJ5lEYL1G75vg2g6QPwSS2GNo1lJPXv_oYi2YlgVrY6i44g
Message-ID: <CAMRc=MdV5tvARvjS-6n7n37ekYs6hUAX-X4y736-1t1N-U0zfA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: added configfs option for static base
To: Sebastian Dietz <s.dietz@cyberdanube.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 10:02=E2=80=AFPM Sebastian Dietz
<s.dietz@cyberdanube.com> wrote:
>
> On 28.02.25 16:43, Bartosz Golaszewski wrote:
> > On Fri, Feb 28, 2025 at 2:54=E2=80=AFPM Sebastian Dietz <s.dietz@cyberd=
anube.com> wrote:
> >>
> >> On 28.02.25 14:22, Bartosz Golaszewski wrote:
> >>> On Fri, Feb 28, 2025 at 1:46=E2=80=AFPM Sebastian Dietz <s.dietz@cybe=
rdanube.com> wrote:
> >>>>
> >>>> To replicate gpio mappings of systems it is sometimes needed to have
> >>>> the base at static values.
> >>>>
> >>>
> >>> Can you give me more info on why you'd need that? Static base is
> >>> largely a legacy and deprecated feature, there's ongoing effort to
> >>> remove it from the kernel.
> >>>
> >>>> base is treated as unsigned as there doesn't happen to be a
> >>>> fwnode_property_read_s32().
> >>>>
> >>>
> >>> Ha! That's interesting, I wonder why that is. We do have signed
> >>> variants for OF-specific properties.
> >>>
> >>> Bart
> >>
> >> We are building digital twins for embedded devices for security resear=
ch. The
> >> firmware of these devices often export static gpio pins which we simul=
ate
> >> using gpio-sim. With this patch we are able to satisfy these condition=
s.
> >>
> >> While the feature may be deprecated, i would argue that it makes sense=
 and
> >> fits the nature of a simulator to be able to configure it manually.
> >>
> >> BR,
> >> Sebastian
> >
> > What kind of digital twins? Using qemu? In any case - I really dislike
> > the idea of extending the configfs interface of gpio-sim with an
> > attribute to support an option that we're actively trying to remove
> > from GPIO core. Unless you can give me a really convincing argument, I
> > will allow myself to use my maintainers' right to NAK this one.
> >
> > Bart
>
> Exactly, we are analysing the firmware and re-host it in a qemu instance =
with a
> newer kernel.
>
> First of all thanks for giving me the oppertunity to pitch the option.
>
> Gpio-sim provides a way to create chips for testing purposes. Some embedd=
ed
> device developers still rely on sysfs. While the ABI is certainly obsolet=
e and
> not actively developed, it is still actively maintained - Which means tha=
t in
> real-world testing scenarios, it remains relevant. Our experience has sho=
wn
> that these firmware images are often build with hardcoded sysfs paths in =
mind
> and do not use the character device interface.
>

My experience is that even when using drivers without a hardcoded GPIO
base, people tend to rely on specific sysfs paths just because they
tend to remain the same unless some dynamic GPIO expanders come into
play. This is of course dangerous.

> This feature wouldn't encourage new use of static bases - it would just m=
ake
> testing existing setups less of a headache.
>

This is not what I mean. We want to remove the "base" attribute from
struct gpio_chip. If we expose it in gpio-sim in its supposedly stable
configfs interface, then we'll implicitly agree to keep it around
forever. I don't want to do it.

> Given that gpio-sim is meant for testing, shouldn't it provide the flexib=
ility
> to test in this scenarios?
>

gpio-sim is for testing the GPIO uAPI interface and any user-space
tools. Maybe you should just simulate whatever device you need
directly in qemu?

Bartosz

