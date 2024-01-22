Return-Path: <linux-gpio+bounces-2428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4748372BE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 20:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3444EB265C3
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 19:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8A63E486;
	Mon, 22 Jan 2024 19:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BzZluO4l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C461EEFB
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705951445; cv=none; b=HOMse6jppclEJLjYgw0r5YXlx0NCGUdtMp0hLd+26ItYrQfYXWIkzAuV4HkoQ0w6vCtP9z62k+kFbxwShUCvvkvUtS1Yb33A7BAeor+RS1mPgv7bWzslJVzMg6mTQBaFx5mg/U/0T04WrHYcelSpb+86HlIUWa5DeckXpppzcso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705951445; c=relaxed/simple;
	bh=QZXqizCmEJkLTeschCzNI3xVQ5vAq0NNymE7vlfMk5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1t0On+FHpPIRN+D9mVbRAkGOLJkFesfqgiKcfMICjPB0h+T6mye2Nf5AUEUjEYMxVFVj4qoJzAP0AnTSzrtozS4VSKALuNgpoxhYWLoxZTE77XZXuDaKjLBnn++4rhxYzyKy9gd32dows+pS0BUUj9enBl+rKSPvwTyaChTzYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BzZluO4l; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6001449a2beso7193477b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2024 11:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705951442; x=1706556242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OX9o7XvaEzc93ZP35IE3Ip9GAQ7HE7yiGJfHkZCdg0g=;
        b=BzZluO4lIK/LdcgLgp2/li+1rKdlxkQwugpaFi5ksQAXrGTDiHG4bfsBBf7o875eb/
         3O/bePWF/ndCKqNyEVyP376gv+N5qGFvtbrVk+kPNdKmkTHKn7QcoeJ5bsMvEg56O1c4
         gwlFMfSfC1r+gmiyqIXaaxJVGJTRgKvhdMH+GPQXW0U+CAvsLO3jqbPiZGAoM5IDlq2R
         NlioriDBYJVpjf78a7ohGisORCfvP93ZYGMoOnb98lghjBnu/ErAX3NfaK2qqq0exOLc
         ZDxz2UuEdOc4SFVzuUG+fZzPSFwngkpnqGaQbdH/tMhJklWoTSjrdWbV4mOzBmFujkRp
         9D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705951442; x=1706556242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OX9o7XvaEzc93ZP35IE3Ip9GAQ7HE7yiGJfHkZCdg0g=;
        b=hfBmGdZyb6Ed//lQrSKaJTgUHwljiyG2nC351aBgNVqdzNBPDYiXDnH4RxhGFkjBAI
         OWuk3BvOoPt82KHajGnsCdXon/iSR/tG6/Y4pql1NEOFE+R/2q6uuv+TJUcr63BbKVr8
         ST2GMNlMxYx636YlwB6uL8eluCRuXbFGv7jUsMY8+4O+vCcTXFTxcaQM0vCuuIdBiTU9
         9MNO+nd5AHDncDpSEfQh0x+nt0x3keHlannqgNFLreG41CE3BhV95axuI71yOlYw5bUh
         V4J1XNU9w5pVnnwokSt0996MA9nobZS5IyPUrWOgWVb8kmnuBQ1fEmhBqcH8bslR7q/6
         W14w==
X-Gm-Message-State: AOJu0Yz7NHWQeqHeg48YFuy1V0brt2803cHBLUmQLK9N7IgQfKInMeBf
	/KRy0x3Bn37Zpmmy9Qy2KNpS4U1BWYatOlN9oYNqmGRKfZROxvL8IKHSuLawuyAo1X/l+S2eR80
	uaWr5sC4/NeSC+oPjISwtgXUn2Fd/pGAjcZC1CQ==
X-Google-Smtp-Source: AGHT+IF5SDxexmpKHGEI9dgqfLSo0UyVCMcmVgjFZpXLt1QYEJaISI6Lq/9f0AauIS9Iwv3B1VQ1l+v+6uOJYpFqJW4=
X-Received: by 2002:a0d:e883:0:b0:5ff:8420:ce7f with SMTP id
 r125-20020a0de883000000b005ff8420ce7fmr3961841ywe.49.1705951442419; Mon, 22
 Jan 2024 11:24:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122-topic-qdf_cleanup_pinctrl-v1-0-0c619ea25091@linaro.org>
 <8c9b157b-4698-70a3-57b7-c588998eeda7@quicinc.com> <CAA8EJprDk=HnqWJ_F5zdUKMPFPpx1RD9KN-KQP9yopP6LMh_fw@mail.gmail.com>
 <52479377-ff61-7537-e4aa-064ab4a77c03@quicinc.com>
In-Reply-To: <52479377-ff61-7537-e4aa-064ab4a77c03@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Jan 2024 21:23:51 +0200
Message-ID: <CAA8EJpr2g=b8+M9r20KJoK+VVTabgctvB9eLmwivmi5qgBddFQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Remove QDF2xxx pinctrl drivers
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jan 2024 at 20:44, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 1/22/2024 10:56 AM, Dmitry Baryshkov wrote:
> > On Mon, 22 Jan 2024 at 19:43, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> >>
> >> On 1/22/2024 4:57 AM, Konrad Dybcio wrote:
> >>> The SoC line was never productized, remove the maintenance burden.
> >>>
> >>> Compile-tested only.
> >>>
> >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>> ---
> >>> Konrad Dybcio (2):
> >>>         pinctrl: qcom: Remove QDF2xxx support
> >>>         arm64: defconfig: Remove QDF24XX pinctrl
> >>>
> >>>    arch/arm64/configs/defconfig           |   1 -
> >>>    drivers/pinctrl/qcom/Kconfig.msm       |   7 --
> >>>    drivers/pinctrl/qcom/Makefile          |   1 -
> >>>    drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 164 ---------------------------------
> >>>    4 files changed, 173 deletions(-)
> >>> ---
> >>> base-commit: 319fbd8fc6d339e0a1c7b067eed870c518a13a02
> >>> change-id: 20240122-topic-qdf_cleanup_pinctrl-98e17cdb375b
> >>>
> >>> Best regards,
> >>
> >> NACK.
> >>
> >> This was productized, there are some out in the wild, and the platform
> >> is still in (limited) use.
> >>
> >> I'd like to see support hang around for a few more years yet.
> >
> > The problem is that... its support is pretty strange. I can see
> > pinctrl, ethernet and quirks for the platform in GIC-ITS and PL011
> > drivers. Is this enough to get the platform into the useful state? I
> > can imagine that "QCOM2430" ACPI handle was used for USB hosts on that
> > platform, but I don't remember when we last tested DWC3 with the ACPI.
> >
> > So, all this boils down to the question whether mainline (or something
> > close by, LTS for example) is actually used and tested on these
> > devices?
>
> Its an ACPI system, so you won't see all of the fun DTisms of a MSM chip.
>
> The platform was fully functional upstream, and had an Ubuntu
> certification.  I run Ubuntu on the two that I have in my office.  I
> haven't strictly checked out mainline in a while, but I could.  I still
> have access to the documentation.
>
> There is a small, but active set of users including myself.  From what
> I've seen, they've been happy with things.

Thanks for the information! It looks like it has a small but stable
user base. I think we should keep it, maybe ensuring that we are able
to test the kernel.

-- 
With best wishes
Dmitry

