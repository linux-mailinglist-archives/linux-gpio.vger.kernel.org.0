Return-Path: <linux-gpio+bounces-14840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA8A12286
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 12:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BB083A428C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 11:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB54E1EEA37;
	Wed, 15 Jan 2025 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RicnDd/A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54011EEA54
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 11:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940361; cv=none; b=GsnCcSkUYj4Joowa+7DQh+gh8MAecec+Dg769VRLpjv28J+JLBeEd4idF3qljh+C5sCmoKm234pTMICtwTqrQ8w3Xgk4HwLadWf3Z4NNsHb+zHB/vwQr5RKHCmUFHTYvIV/gMm0YG8ps3UL3o75/FxJOClDYFQyx34RntAO6eaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940361; c=relaxed/simple;
	bh=U0bCavTbQCiU0eF9+cqSsugGok+cIP0LTPPMqMnhT84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXFMB6+DlhEwWuiTMdaCDDlD1IKjkiCIiNMnuF+b9w8yRNKq8yEzalm2wsmQKgdYKeHE6vhm7kW7VW5Z7hox/AXOVQ8Bnx84TeK2AOxxenDBH4CVJzhYhryg94NlzwV4KeHHqI/r0M8zPxMsyKmEjFhe0joh1MRkXtnfcB5lMu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RicnDd/A; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a6bso42716981fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 03:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736940358; x=1737545158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96wZhpnuhHceBLWU2FLoCx2J627kPxHZd6wLIqe28U8=;
        b=RicnDd/AYzeOOoakENKAT2k2k06H+qC/dor9NoFNPWbC9Fkv9h0EGkCQxqXBCK5WNC
         z/UKZ/E9Z7L+SA3v8vDhpS8cH3qcC5RBb/MTj6aig3X/eK/eJPjgihE03gU4v9I+6Gb9
         mwFfP/T4SNSrithKAShZesA/cCDFZoBHE8gSCBQznfwHhG121v27UCknQHJxQd/OOVFa
         PFITysPxKIlJeQWzeXycvNx+IJ/Sohg3QQxvBykW5etImq1TLLWZ85tHh5GG4JSHQvZO
         /kJB1hOTev874ormjPkYVcAQTB1AKzCXRfvFdUIMK7HAhRogNnc6xtvuwfC5Dx1JmSr7
         pI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940358; x=1737545158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96wZhpnuhHceBLWU2FLoCx2J627kPxHZd6wLIqe28U8=;
        b=wdEqne6HTzVU/6ZThdUNHI5rPodYpukzhJtwTMwmzRBu5KzQAgWfrIspukdhF3ooA4
         mvq3aSgaJD6o6uf2v760t59bFTak7OjtLowalPUumjv4gMpLTmJsktJM2clrqLSnusMm
         wzbn+EGfecNxyl4xlw3D0nsQrTAcgkhB+0mIso4XQ+O32rHQaT4SrNKwCYxVYHYmyNz4
         F2S9ahUueXzAsnG2hYi5JLgiCye39XwrjPjMxbIJc4KSOkwJTp3d/fPUYUYE08ddN5rP
         Tm+Wq7wLXuJRq8M/0Mn5fX8pxJfKWq7kva749WAkX5IYXJD1aX/bNL57reI9gKmpYJtz
         OFFA==
X-Gm-Message-State: AOJu0Yx88UZ0DL0nnd5ZpMDQGxMMyCbQlYJbLEsyj8RR4Vo4tVffuaJs
	GeLAJh7lNwpOYMqaLrzIhuiuYVjlXlyXULUIxblZsS1gRopbLAOJu52S+MzmCybT6pZj8BYpY/G
	GuePR+/Q+8RD/GgOzBcmP7idFgP0/WNVQcqZrow==
X-Gm-Gg: ASbGncuc7otFoYXcsCJcYlaAo9XyesS+0QPC/EbdjOd/LtStMIFTEssvcfxXCpOI8H2
	SvS0ml5qC7ZMehdrV4JEpEHe4jkvVQAkFxcrQMQ==
X-Google-Smtp-Source: AGHT+IH1q7rQCmFhcQ9wk6N0Dd3lxGGF0yjVVlUTltqFfwwHog08yvQaYobgaq3O7fock7fZSacmulEcDhBXdPR1uZk=
X-Received: by 2002:a05:651c:1a0c:b0:2ff:e5fa:1ae7 with SMTP id
 38308e7fff4ca-305f45a7d8emr95333001fa.21.1736940357672; Wed, 15 Jan 2025
 03:25:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1736928826.git.geert+renesas@glider.be>
In-Reply-To: <cover.1736928826.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:25:46 +0100
X-Gm-Features: AbW1kvaenP5--Baj4jbVSbQjyZJLNdzBQopL2nQcAt6ewfhqYbPyvvWVmWXSnis
Message-ID: <CACRpkda-0=qZMXXuxe0k2cPPoJLucecWiWUuxbW22GVi6Dt1rw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.14 (take three)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 9:22=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 829356da700bbe07e13b4403997bf8c5aac646=
60:
>
>   pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC (2025-01-03 21:09:1=
9 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.14-tag3
>
> for you to fetch changes up to accabfaae0940f9427c782bfee7340ce4c15151c:
>
>   pinctrl: renesas: rzg2l: Fix PFC_MASK for RZ/V2H and RZ/G3E (2025-01-14=
 09:22:48 +0100)

Thanks Geert,

pulled in!

Yours,
Linus Walleij

