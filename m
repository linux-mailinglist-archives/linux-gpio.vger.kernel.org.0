Return-Path: <linux-gpio+bounces-29072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28315C86E67
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 21:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB8533AA924
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 20:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3636A33B6C7;
	Tue, 25 Nov 2025 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkqGEUI3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E333ADA3
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 20:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764100803; cv=none; b=Y2e3mxj6NgxY+L0ABZI4EpXUZfb+B2ccotdHrcI3MelXOzzPyNCXYNWSF5ugHrzyC+aYjdKz4aApZmY+8x8CaRwTaIVL8/HB0Wu/Q5z21ezyQ1E5QcTodCWVNtfAUkYCcl1e/MyIgqhDh9RrdJlmGrMWjuyH0f3+OPRCmVd45oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764100803; c=relaxed/simple;
	bh=DVasmrSeAPh8BUBWnj6uXqD70+XuT+Cm+lWITGpSJvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtujiagYQhVaWis3qAwnNdNyuxw1ydYTOY0Z1ARLAtcIJWDY/1YrdbUkc0CTOv7hhlRcbC0d+UoRMMmnXg66ujJ0+OPxODsosOUcQkh0VB3Ucu/bag4wZvYzcaCJNEcO2Yc+llnbk0en6P+TskJE6NDJlMjlFIKXQnFGh9ECdoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkqGEUI3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00E9C19424
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 20:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764100802;
	bh=DVasmrSeAPh8BUBWnj6uXqD70+XuT+Cm+lWITGpSJvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QkqGEUI3PzKIx2WxgLh+hkefYxT/E5LJdO2Vzxj+/I8LUGtAU+tD+OZB8n26Wthzy
	 bUXQwy1p95+TDi58n/jj+nWRvlufBxwxuFDwJfpaI6HsAggdmLR59b9v5VPEdjStfq
	 TkOrNhB7XRvGGZWVNdQbcRZB4Jb4bHpVTAPO0rmz9N8WfMguE17t73C6Xcu/INjv8Q
	 vkI47GQ9MvNroDLA6cbU3cGGinfSbYysdlbZh6+3dIIQgU/n6R9M9Hgd+KiE/r48fQ
	 g+Nb/9vsWAClKSB1KapeCyb1hElhKXSnM6IVE+3xnw/Q2iQeeaQPVgUeOg9ALCYkdx
	 o2JjhvfD1orOw==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-640d0895d7cso305322d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 12:00:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXe2b1ywzehDjl4EX0hyhTbitRs4Gne+9I6JeqTc/rX0L8WYmCkHzB1Yv/DDpMYjh4Y8KdfgJGDHwcK@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4QR/8GNVv30/+U+W0oMx12o9GEakTIl4j5FVF6SW5x7qlWf3
	PE3bnfkDsCvX7lqTINh+KkXOXnqj5we5/aHNzV5fkCB3KfAsOKKfyR8kDHSlnzIazL+TL+J46pE
	p9rzPRVz/dByj5dP/FsiRoD5Q7tam3P8=
X-Google-Smtp-Source: AGHT+IEKCwdUK069c55glOB5klmLSXwxDzlEkUhgMQ9zDLu4PV2YqhEE1QQUYXOJdEEP3pCHpxXX2EXrm7kkzmJhpHY=
X-Received: by 2002:a05:690e:134f:b0:63f:b988:4a91 with SMTP id
 956f58d0204a3-642f8e2e37emr14337844d50.24.1764100801021; Tue, 25 Nov 2025
 12:00:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud> <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251124-crayfish-lard-cc7519e1119e@spud> <CAD++jLkehJNGxxQJV6vOA9xurBjwpYcL1ufYBQEOqRjNG-h-fg@mail.gmail.com>
 <20251125-kindness-quicken-a70e3fdd0b8c@spud> <CAD++jLmO33B58WUxJiM7c6VCrkQ4nxOmodbOozNmS9LD1VDt1g@mail.gmail.com>
 <20251125-sauciness-those-49593f401322@spud>
In-Reply-To: <20251125-sauciness-those-49593f401322@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Nov 2025 20:59:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLnDA69jZ=6a3QexWn_V+NBymMwTBuJ29RM+R8m51eWOQQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmQ_cxMgttA8R5T2mQtOUZfU9e0jvp5N_PxSsIJsFJ6E1j35aW5fP3Tagk
Message-ID: <CAD++jLnDA69jZ=6a3QexWn_V+NBymMwTBuJ29RM+R8m51eWOQQ@mail.gmail.com>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 8:55=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> Probably too vague, since it's gonna be pins + functions specific, but
> I'll do something along these lines. Where should I put it? Leave it in
> pinconf-generic, but do some gating of it to only be exposed for configs
> with GENERIC_PINMUX_FUNCTIONS enabled?

Yeah just add something new and a whole new file like that, we will
probably add more stuff there as time goes.

Yours,
Linus Walleij

