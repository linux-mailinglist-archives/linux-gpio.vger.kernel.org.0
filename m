Return-Path: <linux-gpio+bounces-3051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E73184C8FB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 11:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9B51F25DAB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 10:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E97171B6;
	Wed,  7 Feb 2024 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUgE4MMp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90E4175A6
	for <linux-gpio@vger.kernel.org>; Wed,  7 Feb 2024 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303079; cv=none; b=rI5kfc5Lnld4suSpN+OG8RC+Q1vybxGivoEx1VWQaD+mZg4fHUaFkU1kxNV+PGvP2L18OqMUyYLMLPOBAf02dZ3BtuHypL4JM5XYysgvaPUExG+xxwksST/M4Pj9QisQuKlo9BDw3gkDtVGGO99oSYSZJrqvIabiKhsQM0324Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303079; c=relaxed/simple;
	bh=B1XlVHojLLasAfoIWAsxe6ObOEeItQD1Hm73mZXbzls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7884kKiXUuqFLUKypT7jzSxN5VJcUdDFuc7p+zH0EEzINT7MuZWiZQdETRkw0C1Yzlo/O2uqjaev88A9GnZTCI62u8qmEVjIJxwRx1lRZxMRpJpWoA/6SGttf01NJmg55aRZ4qncmfEQgmHp2Vk3w9g5sIOSkZuKinIFvbeNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OUgE4MMp; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60406f4e1d0so4539017b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2024 02:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707303077; x=1707907877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsgl1js8sdc7s9A+KRDmi3P2Sf5UWIXz1ucHF4fn3yo=;
        b=OUgE4MMpdifYgsFHfDR9t4lqRRvMBKMKqgii9KQnv39yj11jn6K7EWoof67C1Kqul7
         GiDjd01OyRUwJOeF2GYQE14OvFRNgJe/mmnIMIlcMFvHT3i3oQU/8zQDCnYhIRbMefpU
         R2qWYU/ii1U+npKL37OjhA4txWm29QYcrYM5kbPoBmd4kyXPByPVK1Y4KWFPL57AjoGc
         gy11JusqJeImju2O3DLRWYUKcNlgCMF04i+BlKprKCytRAHB3cdhXXOhvjzDL2YrkQO7
         mmmyDKvaZ9jOEzrSf+DAOqvWWggfq3CyRi87RBiNkWMIEVWUQ8qlF1RhfoGirfEJw3ju
         pd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707303077; x=1707907877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsgl1js8sdc7s9A+KRDmi3P2Sf5UWIXz1ucHF4fn3yo=;
        b=Q9MCFHzkgXo1jScII4pl7svxPcoZW9RqO1MX4VTO4h7AIT1fuCFe78i0aE+qnTyOQJ
         RoH/LeTdo+CDXUC27Ns2XutSfXSFP+3abHZIW2wg8EviJg0Dpcv8rM1J5DqkhSqowpuy
         v6zxXTdFrWr7+FgLLRs4CanUhFPHkzmTq3hrcW5U+DIQ8C9M2ZP9iE/oNC1TF5trnjwx
         meL2kFjGF9WDrxIJ7qhEs+pRUOfZohQvU62+QL7EuIm/Lhr9pb/iLBmlEbripSStFhZu
         vPLaaAiYZfzlFxlIMbTII7IY9qrN0TRIaNW5nmjO8PU2pB0SdYJcRMmqnPFdSF7VjkoA
         5xlQ==
X-Gm-Message-State: AOJu0YwgtpQxIGq+eTLLuWPS/13yGN1S18sBBjUufhY5K1xxdZxfBSmP
	dbaOWMyyrnAp+gcDm+fZVIirbMkOMMEyKx/uqZb7XaFBrhgrNjOmY9iz4jl/+/UkT5VlXcLT1Z/
	sztiLypLz6pZp7NoTVeREB3BgcWa4taixWhzyQA==
X-Google-Smtp-Source: AGHT+IHf4kWxGCgC7QO0GQY35mQOn1MkRO0ngJpqcZ5PyTIrE9gtDbtBPUNd1xmk5zPB94GYf6h2CoHwXv8UHIe13NU=
X-Received: by 2002:a81:99c8:0:b0:602:b697:dc60 with SMTP id
 q191-20020a8199c8000000b00602b697dc60mr3517588ywg.50.1707303076901; Wed, 07
 Feb 2024 02:51:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202105854.26446-1-quic_aiquny@quicinc.com>
In-Reply-To: <20240202105854.26446-1-quic_aiquny@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:51:30 +0100
Message-ID: <CACRpkdZM96tji2OCXHPd9iXE1kU5u1TGsuPhB0YLbHG=LXAiqg@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: Add lock to ensure the state atomization
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: andersson@kernel.org, kernel@quicinc.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 11:59=E2=80=AFAM Maria Yu <quic_aiquny@quicinc.com> =
wrote:

> Currently pinctrl_select_state is an export symbol and don't have
> effective re-entrance protect design. During async probing of devices
> it's possible to end up in pinctrl_select_state() from multiple
> contexts simultaneously, so make it thread safe.
> More over, when the real racy happened, the system frequently have
> printk message like:
>   "not freeing pin xx (xxx) as part of deactivating group xxx - it is
> already used for some other setting".
> Finally the system crashed after the flood log.
> Add per pinctrl lock to ensure the old state and new state transition
> atomization.
> Also move dev error print message outside the region with interrupts
> disabled.
> Use scoped guard to simplify the lock protection needed code.
>
> Fixes: 4198a9b57106 ("pinctrl: avoid reload of p state in list iteration"=
)
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>

Thank you for rebasing!

Patch applied now, so we get some shakeout in linux-next and can
make sure it works for everyone.

Yours,
Linus Walleij

