Return-Path: <linux-gpio+bounces-16663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F8A46D78
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 22:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFE02188A548
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 21:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FAB25A634;
	Wed, 26 Feb 2025 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ydanzjl1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECB8149C6F
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740605447; cv=none; b=ecFCFFERm2bFmeigR9E1V5QsCceu4YzP9EmLQFyHoQqKWrijfRq4fG6jkx7fVFUqszZHzt61w3ui8w/pvVMX9lJkRoC9dSzjFCtnyGN5uFwqv63l6qZmKc0rXFnNPZnAV/V7ZNYDMxezpvNr9VDf5ddQ/GIyulGVUZ35Is3Baeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740605447; c=relaxed/simple;
	bh=SUGyhrxSVMFnfbeL2igPaj/oiGAxEeL7XtDqz9AUnnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQ5dc2jgkwL2rOdVnpILzZLy/6CoaOqMuN0X/Q+oYQcnf35C4muyzAQ2BqVTMgkxwFHXHoPSAkgVreXVLyU0vSmAM9xqBnu4Ma0mci3vCmLyyiTfF6gHuHMXsjFFYBPFn0zi20z4JrqcZthap6Oer8DdvP5WNGFJehhgp2CnOog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ydanzjl1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54527a7270eso199141e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 13:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740605443; x=1741210243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUGyhrxSVMFnfbeL2igPaj/oiGAxEeL7XtDqz9AUnnk=;
        b=Ydanzjl14hrygn91S8Nko4t/Lu6O+jHrxkLHwEUvVpQLrL27BW1krQWoOXnuIpMhcD
         /SCyOav0DKnLX3+CJqsN+yJkwcWvXzaD3AUkrBVlQo5QLPKSr7MFdSKsD4/M3B15RIrH
         KfxPZhNEI6gnTqPTq8IqmLhfmV5Xlf/WdeG1sr2jZB3qRusSGa/01jV6J74VMuZ4C8DB
         CE2blEc734i/ApojqloxUGTMjH6KtTB/8f4VNtupqKgzPYc56Y/fARkBT6vXoKjr6RTn
         CRYn6WMMxVunHXwNtKEVpa4JluLqxKpNEtrx1E4LVcWGMyG135R0cr2o97Nka2L0wcBe
         RxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740605443; x=1741210243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUGyhrxSVMFnfbeL2igPaj/oiGAxEeL7XtDqz9AUnnk=;
        b=S6GobY9ol5YcPvq+ltyAgqia7v9jkZprBegthm6oCBnuKEpPb8Egn0GrCwsPvJUTY8
         UmZg6LjJOlfJFgcKLYPFIZ/MIQ/kylh7jXJlSayjdA2KFL0ovbw4HzQsIo0MHrA5g4jA
         m53vGpahG3E8muAsH1JqrXtmpsGeU8bezVjNWeajaEam8+S6GJharI0iz8pceWCAJ81r
         ueqyC/pf4wAK44FKALU1VaFwJHY1pXsIjQPn0gmR+cboLH8+9jJgfhWA6wy21YXttzln
         cVPuXNBkzvmGGdAk6C4DNisZswk3hiSLiKhROrBwx/kf3Cf2wXf0vl7e96lVblvDK2H0
         iT0g==
X-Forwarded-Encrypted: i=1; AJvYcCU3joJzEKyg+5NDZsI07RGaSyOPmv/zIPexe19/cFIykr3RnFAhnBzoJj1pdiOojsWXFjRWC5sE32CD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8KMWhKX8g76CyajTnh+SiBv5W0ay1qXW/A+pwpFNKs+qDMfwb
	umEYxDWS1eMlQVOPX19925z6yP85XsCtKXy7PlUopLLfWLeICselwjoqDHIgPfOlfhaTQdFi1Sx
	U4WZJd3feLCDdCgbCrWAbLQnMq8jhWYngXX6SjA==
X-Gm-Gg: ASbGncsCl4TkzDU4bE6n3n/yNAPs92jJaXH9ghe1GQa4CZffcSzVyMFSvJTRyiC14NM
	JbQI31Yb1tB/aduaOcDi+4zSFmb4N41JN88bIL+gWZhGtcJkhl4U7pi1G+8a9eWuJyowanUL4C4
	rc+E87X5U=
X-Google-Smtp-Source: AGHT+IE8+uZvHOPVlO4cJtPSuzroRvBR0aRjVwpJAshWI+BRIHeRYPen8jIF3ZZZVKAcoSrk/otZQzN4xJtaQL33NME=
X-Received: by 2002:a05:6512:2347:b0:545:27f0:7b6f with SMTP id
 2adb3069b0e04-5483912fc82mr10885628e87.11.1740605442695; Wed, 26 Feb 2025
 13:30:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org> <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Feb 2025 22:30:31 +0100
X-Gm-Features: AQ5f1JpA8TYnCxYWLh_Nsj3CaoL2jBGTRtip6jpMFprAlot5Cs6Ct5PvAxVIfSk
Message-ID: <CACRpkdaokrm1wLHGpP6aCTA9uQYAptVqt8J6+BQu1MmJsk9=Cw@mail.gmail.com>
Subject: Re: [PATCH 04/10] pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	iommu@lists.linux.dev, Dang Huynh <danct12@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:38=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> From: Dang Huynh <danct12@riseup.net>
>
> It looks like both 8917 and 8937 are the same except for one pin
> "wsa_reset".
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

This patch 4/10 applied to the pinctrl tree.

Yours,
Linus Walleij

