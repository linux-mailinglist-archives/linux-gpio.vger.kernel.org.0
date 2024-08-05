Return-Path: <linux-gpio+bounces-8573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10034947619
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90066280FED
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 07:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462CB149C69;
	Mon,  5 Aug 2024 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KNj5FXnp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF4314373B
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 07:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722843242; cv=none; b=jM0s2M43GSXsjNHyCUwfIG+7GvUvga3DtF1dHoiwyQ7t5obOD2pBbs+Nuv4kWk7kpDZY7LxTdjgenrlAc+fyxZfB5uSx48U1flvEC2KfaEnKSGAoBZwhIbe5HinlEmhSXeggYSmifKAA2oUtq2l/ZGy4wadQoxUwi3WnwgEw5wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722843242; c=relaxed/simple;
	bh=MWXSGtBUuIsu9gfT7t1iecOSYsEkGOOPqiqXne1odrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cE7FXcjEqZ9dYjL+Shxdm955w3em2d5675ZDKForb1aN2JY/sPEd77kcvOguJYlFszWxNxQmTdvwLLwWw5Fpo9IOXHbu8NJwripIVICjg9St+t3HFEgH7/hIw7peGfcJE0hXBpXYBGMGIPFtKFdDB/kRVZdGzBoqoF4E6kUUj/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KNj5FXnp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52fcc56c882so3028698e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722843238; x=1723448038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWXSGtBUuIsu9gfT7t1iecOSYsEkGOOPqiqXne1odrw=;
        b=KNj5FXnp0lxLbOy75LqM9XGxexoqH3Wvk9PLMIR5mB1SRzhNEP7UqPUZyq9rWpItyY
         7FWWicJDBAmSiVd3SGbxeKPKiYyJqC7Rb5M35Yu4eJK/Ol//uxjDW9B0UMHhtyP11Rm+
         sukNKPQaaBrAuTjqBrsKtQLs4BoNqkrbV+kLjG4gVwXa/IgKDnTgn5/y+hA3JSMSLsGR
         zzrfqIeTqfW1/wWtun1dyD5kg40bptYZN5ddILo2ioxuT28PYzaJ7xbi00RSyurnltNM
         JJ1+eIBf2G/sYu98lM5ul8U4hJd6pGuR8kFkSGFXT57/Y/o1wgelmeNarPCPQnNdlTfl
         whWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722843238; x=1723448038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWXSGtBUuIsu9gfT7t1iecOSYsEkGOOPqiqXne1odrw=;
        b=rfhvyjd0bMXufXBZvHdZAx+HPQawhyGEZAQ5nn2NKJLJxcakz5PZMK2vKPf3c1QYHt
         eWpOpxKMu7BKxNJiaDT+wvZGsnl/V6tcXgYpNFTH8ocluHDj1mQPNc5X3HnxaBvGSZLy
         J8sW2kr4cW+VSSgcyd8lixw+tguOE2v10hJMLAlldUZEp/LVyvujKl1HHrYs1x6M4MUI
         QHdSCySO7vbWtQYHDFPqFQVOIOOZ9IJFvCPNJlM1EXJXEsN5djfWW8mGTVQ45YuH33WC
         3NA6c1XFWJDsWh+hgIuLwsYnIOEeXUciVYtSMuBvFVy/qkHbhcMK3jVEAgvTSp7Q5wfm
         03BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuQ5l5WyhR+OCINa1OHGU7KaNhhWWvgwjnBHOhoO7nScfWJwhQN8/+1n89FRFtuxgh3NuZA4heF624q0yezp8DBZAgHctRWppC7A==
X-Gm-Message-State: AOJu0YxyNjBeR/Vi2CX2URFPfPTPAEqtuaDsDoObrTWWuBcap2LTtXtI
	2JIP82O7GVvbsFI0Z+LS9RCHEmRN2Hpn7Fy8DRcVxTy9TgogaeyX8B8QMaETft8doTCxpxscU82
	yCjPjzJ946ILvvAEhYKuJei4zdFqgpCX1o+s8tg==
X-Google-Smtp-Source: AGHT+IEdbpiAw4D3jz5wmtP8HUpVreiNVjQLGM1ndm3P5ErzjoCL6e/1KFGffHd3JxxaAbWeOXHrUGQNbY5Y3T1OgE0=
X-Received: by 2002:a05:6512:3502:b0:52f:c281:72de with SMTP id
 2adb3069b0e04-530bb2bcec4mr3199166e87.15.1722843237853; Mon, 05 Aug 2024
 00:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716194008.3502068-1-tmaimon77@gmail.com> <20240716194008.3502068-2-tmaimon77@gmail.com>
In-Reply-To: <20240716194008.3502068-2-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:33:46 +0200
Message-ID: <CACRpkdYKjbMNE_SUh+0rRY+m8XfYLN+VseixuspUgD+YMaNMCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: npcm8xx: remove non-existent
 groups and functions
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 9:40=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> =
wrote:

> Remove non-existent smb4den and lpcclk groups and functions from Nuvoton
> NPCM8XX Pin controller binding documentation.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

All 7 patches applied.

Yours,
Linus Walleij

