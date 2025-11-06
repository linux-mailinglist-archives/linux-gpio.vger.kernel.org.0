Return-Path: <linux-gpio+bounces-28190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 998BBC3B8AE
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 15:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE0661A400E0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 14:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0DE339B4F;
	Thu,  6 Nov 2025 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7Y9qOI4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E89E303CB4
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 14:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437713; cv=none; b=UcO9VJLwbbenTIDVbweqIvnB9GFW1+eYdmLcVgB6GlnBuFReJKtTADUs2aPtq9H99xFPIoU9/+EwGbrkI7QHlqJAxe8FLANqpLuDu8mOLsOy0IaAh07ClqroaHU56riDaRtswNQ2pVxU0En2Uv1m8H/QW8n5ctSSm1Xs8NqZdZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437713; c=relaxed/simple;
	bh=7exbD5V2wfJPkABtQdCoQUL9FjBVFOYiegq3gRa6D4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gM8UINPI1HG7dBCYlfnqVIOqMN2hzhpqjBSvDRlQe8hxRL9B1odBh55lNg4y1/1RlUd6T17PV77CaBFxIOaQWV09z3zZ0YuDcDxTPF8t1jqF59TmnrH5dPlF+8EBPQUB2R3Ljv3b996iVviXG01vyVs+papggB147PKB1Lhu6eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7Y9qOI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B018C16AAE
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 14:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437712;
	bh=7exbD5V2wfJPkABtQdCoQUL9FjBVFOYiegq3gRa6D4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B7Y9qOI4r3ekfTw4ug6uiMcuXv6FoRw/2kgeqK6XF0EW/axd5jeeHCI2jfaK3tuxO
	 YkZ1OTOzbGMsmlY5vDXaAC2ikkDaYT5gAykByfUCYzdUYFVeniCuyQl8BSSn0lHIIX
	 fmrYHdm1Ym5hcHrxpl7xrtGGNH/7vV6mPbow4j5ZUhPNdk6LyguDbItSY75XzxJgZ2
	 hmYDtw+zOFZFumEAv6Q+maNXCimeZv3W3DFlTn2xloJWQkKS7OoGlh3mrL/7ikzwe9
	 9j5vBdF8mCPp0yFPFIB1QQlVXWcJTFtPRypFc1/WswP9XtXbVBHuIXyiSaw8EOXc3O
	 wAGzBDAcvfWeA==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63fd493ea10so1474395d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 06:01:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcZaQ3SIgVnXfDkAQwuLTvzMrbV+wPuit8yBgzcvEq26KjB2nZ4PV/FpCk3cHNyQqR2J8tirwsoRsO@vger.kernel.org
X-Gm-Message-State: AOJu0YzOThXKQSmzuMUhnYZDjhQd/yojIInigjPtqOzeXAH3gITgajII
	Lgn+o8195gJfdWiaSuasYn58DbK2i7+5WZrmt5vvdHXzvJn6Jskeq9P0PO6KwgC/VrklFQtdwKq
	+NLtbrPZ/68xv1JcOacvE91RK72sJIs8=
X-Google-Smtp-Source: AGHT+IE+aZe4lQ2wYRHJVpoXUdEaqeyu6fphQw/8nRmisBw14jwkqPSx4lb54V8wj0kJJwXu8wPfymEdKa0ililC6Pg=
X-Received: by 2002:a05:690e:1401:b0:63f:b5ea:935a with SMTP id
 956f58d0204a3-640b54ac87bmr2453690d50.29.1762437711526; Thu, 06 Nov 2025
 06:01:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104-cix-dummies-v1-1-331fc0c71115@linaro.org>
In-Reply-To: <20251104-cix-dummies-v1-1-331fc0c71115@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Nov 2025 15:01:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLkxSR9r4a-u_mnTgMAnPi4fnGk8pfEFe149fNqCmPv5VQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmLVa6S1EkdnmzVN4OM7LmNfhRg3mW6XeaW9_Vp-sHealJYsRGOKxdsxgw
Message-ID: <CAD++jLkxSR9r4a-u_mnTgMAnPi4fnGk8pfEFe149fNqCmPv5VQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cix: sky1: Provide pin control dummy states
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gary Yang <gary.yang@cixtech.com>, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 2:01=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:

> This exports and calls the pinctrl_provide_dummies() function from
> the CIX SKY1 driver.
>
> The reasons are explained in a comment in the commit, in essence the
> two pin controllers need to go through explicit state transitions
> default->sleep->default despite they only handle one single state
> each.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I've applied this patch, now looking forward to the
GPIO patches :)

Yours,
Linus Walleij

