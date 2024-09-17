Return-Path: <linux-gpio+bounces-10231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E28B97B43D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 21:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6EA21C21BC3
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 19:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB23F189509;
	Tue, 17 Sep 2024 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHkefUXV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C7E17AE01
	for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726599798; cv=none; b=PlWgiuZd5G6o1HypfDeeLz/HMDG1JdNTSZvGEuH1uhSE66E0kYin1qlSFyfG/+MKwNuN7hdjGTtjrvvemeMJbvUx4rlegXYZx9abFAtoQ5Gv3aOBMeluHEyrZPbFD6mZ8VDASMaeb1OADG7llBVUc11BSjOOJrsoDNSZKjnr7T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726599798; c=relaxed/simple;
	bh=8pZkzNskrNjeoAKHxBhHu1Z7bDXetALxePp0pnNeHys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4xilAWeAC4sQD8/kx7+fZY9EBaydV0C8UvJoF1dkP9OQZUqKpunMtzicSR9LPEGFvs/BaVQ4KlcVgGcFGSa6qBHB8F0PrETl/Rak4I/d3d9xdX28C/00h+dAeQ4F0H4zt+gEMJM9zAJz5Dz1AQ6NWsWLXeLELMDV9uBJiNw+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHkefUXV; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f7502f09fdso273151fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726599795; x=1727204595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEqCG+FqBYAg57QfJT0c2MCNOW4HbNof1G29nb5iuxY=;
        b=CHkefUXVR12M3xsGVKjHUg94rzrgHh4SEU17YifQWOo2Ok0aNuFwD7xl3ZIEqghGs9
         fE2YuPK2r7Lkx2pfD4ImbkbgY4ZedPkYve8XsftpLXwsmddp3QyWwwPFWkSCsC0sXXEN
         HUMwzhc3gDP1r2q8Y5FwV8Qlz5HAnqYCYB3pruUkU7cPNkn1ileEP+8NuUmURpzHQUOh
         J5NR6U7l6AmcXK9QEvF08410GV0b6TrrtI50Jn6+xuc2cFhScOGmUJRR6Hwl2aiV2/fR
         01QSFFNMqjLgx7NR8txmeqJzu1UPOnB/DlTbrb77DPqe/mN4mwoqJAYrSKgas2orhmJr
         rTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726599795; x=1727204595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEqCG+FqBYAg57QfJT0c2MCNOW4HbNof1G29nb5iuxY=;
        b=HJO0eHChEh8DYwtRkoQljoaQjP5VLFqiZz2X7hDqiMGFNgz7E7xW4lE4TWbLlCRF1h
         BIIKfQj/Oj2yv9amtd4htKKZpFQUsKP834IXk/tR6Yr+25Q6IYbdgI4vhyGflj3eujNN
         lzpUl4+izevSMmwcPjqa25hhnn9zpuR9033A+92SotS43yWzmQ+Z7SVEVe8hySwket3K
         dZQemKksTYzwYF1wG+e4KmnrM1vDys+JoapMVQPB+e5qpwVY65jb+wqCMO++ad4McQhM
         KKML+0czhQUL17m6ve4vyOKBYUSUuLfTEMJl3dS40fgUUDMkhvf+3XoC9e0/N3HIEL5N
         3iTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi/cjW4GHQtTursvkCi8UeWOX7Yeof5mnuWa7jrS1wwk8svKvYCjDqlCUGCguEec5OxmzAhqZK8uQV@vger.kernel.org
X-Gm-Message-State: AOJu0YxJbdf3+cGXsiwncRg0ScEpR4Opm4baIthj1aWD8IkZ/n06Ija7
	7PCZHS/oNawbNALqYvgJLkPpxk1uafiODKRxuTUm+QpAV9nmMDYpPH6dbHvpSszIoFZndEDQuM1
	8f0jWJf36kqIwQvou/2MiWjDyEH15+gQsR5rlzw==
X-Google-Smtp-Source: AGHT+IFUhufB65WQdqKZ+m5/26dyTUUT3KCoH+1m29OjdXVjVZFn4m4cUz2Lt7wqEO20PsNbYPhUTXvLUq6KrZavvoQ=
X-Received: by 2002:a05:651c:1a0b:b0:2f7:6371:6c5a with SMTP id
 38308e7fff4ca-2f787d061fbmr63460351fa.16.1726599794801; Tue, 17 Sep 2024
 12:03:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917-bcmbca-gpio-mmio-v1-0-674bae8664cc@linaro.org> <6becd9863d87720dff1a1677c7433af8@mail.gmail.com>
In-Reply-To: <6becd9863d87720dff1a1677c7433af8@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Sep 2024 21:03:03 +0200
Message-ID: <CACRpkdZTarsXp7D08gpXGLQwBppf6wJ8FBYop1wP2Xq-fxMm=A@mail.gmail.com>
Subject: Re: [PATCH 0/2] Enable MMIO GPIO on BCMBCA
To: William Zhang <william.zhang@broadcom.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 8:13=E2=80=AFPM William Zhang
<william.zhang@broadcom.com> wrote:

> If we upstream more elaborated driver later,  it will be a dedicated gpio
> controller driver and not use this basic mmio gpio and we can have
> the new compatible.

Thinking of it, in that case the driver would just use one reg =3D <>
property for the whole I/O range used by the chip and then it need
a new compatible anyway. Let's drop this for now. I'll switch over
to the old compatible.

It seems the approach taken with this SoC is a combination of
simple GPIO and a separate extint (external interrupt) unit, so
it does not need GPIOs to be able to trigger interrupts, which
was my major worry.

Yours,
Linus Walleij

