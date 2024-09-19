Return-Path: <linux-gpio+bounces-10299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7C97CC8F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A65D01C22465
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B196F19DF86;
	Thu, 19 Sep 2024 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allocor.tech header.i=@allocor.tech header.b="crKiECwa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580763B1B5
	for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2024 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726763922; cv=none; b=Hlal4H8Gs3ZBvKRRKmRaMnJnQddSVX291mSj3X5ZASzapaiRfqqX0d1OxwUtc0LQqaHomBKPLWCRsQfkCW/s2587m79deMFUPNa2FDbDHiAhDA2/SlczHkLkYBy/+DqmTtng9i0Sut9rYHlQMCuIGOOiOD5X/FJmucNRALuxkBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726763922; c=relaxed/simple;
	bh=pbHUmVyNtLbimUW3w+nE3o9Tsy+AfPtMz52qIX8Hyw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oc7oxNSEXEmgsatPqJ33rNiXEEApxEVfA5vEt8WBO0qhZ+DchSSF23gMvdhYaaeln24aNx/75rfNWPyaL3cNL/sORB5/H2y5XAM3FrENw1b5OMQ8aMBhZjgCXe1gQ2pEPuGElKUvxoF+rXS2s2fI7uJALPla0o9JUAiPg40VzYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allocor.tech; spf=pass smtp.mailfrom=allocor.tech; dkim=pass (2048-bit key) header.d=allocor.tech header.i=@allocor.tech header.b=crKiECwa; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allocor.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allocor.tech
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2da4ea973bdso952706a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2024 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=allocor.tech; s=google; t=1726763919; x=1727368719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnjIEv/JEpNQWu7WVpikH+c6mTy7FpixfJIKdlvVsuI=;
        b=crKiECwayxd7RGO9RXYgJjDaeGYIqvZXU5M/bR+aXHi5a3lQGTkWU6gly4YpYd7AGk
         lWaBEvZ9/8KbW7NxMCCE2jG+98Oi7dRqGs/RFsFUZC4eDRwYOcp7gEo/ApKUODNHVmFI
         8nvxD7P2xabMQHJ5eXlQvGwhC/FRVgJoW3M9WpCNeSQSxhznRaMqSTId5eYO4f46B5kT
         Um2QBGk5SuYwqiTJx03tH59SdcnxSZgfcbw3wA8ZTC4YhjKILbhg72NAZh3pjJMEwknK
         zEO/YaxYCAvPJVIgQlBQ8Ho09XG8/zZZMFAf0huTDrRXdaU4r8FDO+ewiI/Hrus4aTTh
         r8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726763919; x=1727368719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnjIEv/JEpNQWu7WVpikH+c6mTy7FpixfJIKdlvVsuI=;
        b=VkMG+cl08Ab9P+whIs/8CpvhWX2Jn6Q+htSq4X3ilHShy2Bjyl91WI6bDPcoqLorbO
         Cze4iZXRf8jhgJFvZjI1fpRJgVQTbAIZU9SYGmEVaoilaLhUxvdzwD9STVo0XRGJg6WZ
         RgjIl09v/N9uSll61u+YlTVhnNil7+uj0mqD4xia9lkGev2f1sbI5Onud805zsdUXWFV
         eTuEIWEL87Z9qbHn8ieXM1nR7ySbdDRJx1vf4IJyxtfDjunLahodo0I0Gemv4KZ83o4f
         oPybLLRh4OUgLSZd0Hb6rBq3qC73dPjhlW3Wwf0Z3oszFQMf0O6B/dreuAXvSsSUeq2E
         RqTQ==
X-Gm-Message-State: AOJu0Ywdki8muqbCyMvQ7Gmp9ipAKE1lWRwdBXkyyjybR40NistKewVn
	cREm+KboQ5IN+OfIzPksFVwnBRpsFU66EQmzCSkfE9lzgqPDrhdsLWxhCZbd+uThcMRmkKRkGJQ
	CrksFDdzrIGtYhUlp2Pq+/uSysGWz4yLqSuMWY3EG4OlXSWhn99g=
X-Google-Smtp-Source: AGHT+IGiQkxpYGHFYeM065XEwW2pbsbOPyUsYBQgQh6gQnEdLh6bBrEzA6jzXd2yNYWGnvi8WuFDLTZr5v4nAISTaKk=
X-Received: by 2002:a17:90b:111:b0:2da:d2a2:4a71 with SMTP id
 98e67ed59e1d1-2dba0082efamr27328468a91.40.1726763919498; Thu, 19 Sep 2024
 09:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACjtZiReNNqzonwri51fCPArKR-D9nzQ4HgZAM_EFdzUW0LGOg@mail.gmail.com>
 <20240919041134.GA54544@rigel>
In-Reply-To: <20240919041134.GA54544@rigel>
From: Matt Walker <m@allocor.tech>
Date: Thu, 19 Sep 2024 12:38:27 -0400
Message-ID: <CACjtZiTEVcKRzwSgxsokfTH_-MvNJGqFbyG=WMvLpZXP9MUPnQ@mail.gmail.com>
Subject: Re: MCP23S08 Pincontroller Bias Configuration and GpioLib
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 12:11=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
> On Wed, Sep 18, 2024 at 09:21:11PM -0400, Matt Walker wrote:
> > ... I thought the pin controller was solely responsible for
> > configuration of bias and that the gpiolib would magically know that
> > it needs to call pinconf_ops.pin_config_set. Since it seems like an
> > unnecessary duplication of effort to set bias config in both pinctrl
> > and gpiochip, I figure I'm missing something. I thought it might be
> > that the MCP driver does not have an explicit call to
> > gpiochip_add_pin_range, but that wasn't it.
>
> Not my bailiwick, but looking through the code (both gpiolib and drivers)
> it seems to me you should set
>
>         mcp->chip.set_config =3D gpiochip_generic_config;
>
> to hook into the magic that you are expecting.

Thanks Kent! I think that is the magic, it's even listed plainly in
the documentation that my eyes managed to glaze over. It's not working
as a drop in, but it definitely gives me a string to pull for the
correct way of doing this.

