Return-Path: <linux-gpio+bounces-4495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4678815D8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 17:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC901C20A1C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 16:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD9C664A5;
	Wed, 20 Mar 2024 16:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rrwEfcDo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2201D65BDC
	for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710952984; cv=none; b=VhSIStP2q0W57gg9EcqD5erp4b5lsnDUnh7mqSSGjAIRFn/Wmf06ehDeTc/firJ23yYeWCNiKHbVfk624tkgCtE/wAo+K9CxMXKFj5t/vep48b3wmYdSYUg1MX9cUjX7OTjWWrwFL4LD0lufHrAERgRsG79bnNzYA1FecllZ5uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710952984; c=relaxed/simple;
	bh=Ro+y7r+bchkhmtpUOdWxBdLNti6gXnC7ydQOTSoB4ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xn6b5KYE43SnSMNpuabXhO+rWKfpGXqMA4cYdkQRSylMuVGPZCunozgkBqPH5pgTuyfPUgnc2Q2VaZ8a06EkDYbpeZE5LA5+ziGg4YosZJo+2lRoAllDRfbrWo9InxJ0YIAgCyLBFQcqV4UA4Qvmr0w7TOiKSFOr3thFRkREIgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rrwEfcDo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d4541bf57eso770311fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710952980; x=1711557780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro+y7r+bchkhmtpUOdWxBdLNti6gXnC7ydQOTSoB4ko=;
        b=rrwEfcDowMuuQhujXdIAi3hPrPtg4bf8S4k/DXFT6OSFY+S1OVyn7UFIQ20uL6UGUm
         V4TzTFCgBspm2UTmUOOnwGPnsmcy25iIYfYeUtTqIlM63GeCaQP3nfi/t8Tysuyggc2W
         4eMtHUdg68T1ELGHhxsGao2KkV+y6vSwe0qUbUmberX5R8RdZ88Mh2OaGUPMREU3yRYg
         ZSAe3LbgRgHwR4oYjIga6m5RFwIm/Wqb1HQAzwBIoBaW5wo6rM6OG7A8qy1EezVj9MBt
         0rl15j0OZUncoLgHpyzQ6bXK91fMoFBHTTWgPmhjX/RKHQeo1Pv8D7oQF1RiX9YwlnJ6
         SIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710952980; x=1711557780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ro+y7r+bchkhmtpUOdWxBdLNti6gXnC7ydQOTSoB4ko=;
        b=L3+ouWdqAuEe2QJV7Al50rRjhqu0ZF3wJPvGqAkE93MUQIJrLhkDj5dSDoJnpS6t7R
         wrZTbiu/tsKqpNSu31AgPv2UtfRaNbAPs8BtnrcdFLrJQ7qql/s0Af2JjKYUNpBQSi8r
         HUrh3FCMPaOGNzdAos1hiVZAzXOH47ihLL4khd5n1Iux/rvGL+lG8R4zl+m9D+cJa3ho
         ZyV5rpYMe8aKIWfhy2ibFg8FnAVWwx9qa5yYSYsOGjxSH6/yPwiqOIY746OYB1j7++2+
         OS6A8+TVgpXeCaIXGrN0n7QGn4zvYV6fpQ8FCrYog3V2wNxoCxQVjGmP0F/KgWA9+opp
         681g==
X-Gm-Message-State: AOJu0YyIhXEZv+m+IidGiS0rpcCD3Lf0PbdBlUfmuFD0XRMbyH0qmJzr
	MCqgNGpoc/lDsnJ9PaMJ1t7m++3Enh+F3Rea7v1cS4J0sdpoQJ/fEyT+dN2jnWiii6x1eKQbyQr
	4Bh40kM4+1ZCwT51bjuBoDs2/0ZNwNpfeUCvNPwbXnohoTxfe
X-Google-Smtp-Source: AGHT+IFuJlot0XoZmiGhvwi1Qmy6r13S6ZA6NOo95wxzsfE83Bu3H+mWdK4Hsp9mTpw1vZ5Mpgpa/BSATaPNCi1PkeI=
X-Received: by 2002:a05:651c:542:b0:2d4:403f:81ab with SMTP id
 q2-20020a05651c054200b002d4403f81abmr14196639ljp.36.1710952980321; Wed, 20
 Mar 2024 09:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320134957.7928-1-orbea@riseup.net> <CAMRc=MezeyGEgVm54HYwPRvdid=r66YEv9dh647jYLuYTAWd9Q@mail.gmail.com>
 <20240320090046.19dc31f5@Akita>
In-Reply-To: <20240320090046.19dc31f5@Akita>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Mar 2024 17:42:49 +0100
Message-ID: <CAMRc=Mfe55-udjouY0Xd3c=TZy4wcY99uESr5FN0K=Dd3y-BaQ@mail.gmail.com>
Subject: Re: [PATCH] bindings: cxx: link using the libtool archives
To: orbea <orbea@riseup.net>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 5:01=E2=80=AFPM orbea <orbea@riseup.net> wrote:
>
> >
> > Thanks,
> >
> > Could you use your real name for the sake of code attribution (if we
> > need a license change later on or whatever)?
> >
> > Bart
>
> If its possible I would really prefer to not, my change is trivial and
> I do not think it is significant enough to claim copyright.
>
> So that I could easily link to it in the Gentoo issue I also made an
> github PR which is gpg signed if that helps?
>
> https://github.com/brgl/libgpiod/pull/65

Whatever, I guess it doesn't touch the code anyway.

Bart

