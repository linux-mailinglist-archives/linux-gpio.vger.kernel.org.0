Return-Path: <linux-gpio+bounces-4135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2825871A5C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 11:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FBF51C212FD
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 10:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F6C548E2;
	Tue,  5 Mar 2024 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kOYckQzU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F1C54772
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709633702; cv=none; b=EFt7WlSi9Vjz8voN1mYrTpr4/Nc0Y8InlvUzbPh4qmd1hzodoiidS3gWL5t42rSntQ/bvCDaiotTnELoayrKBm6xyb6SDQtBlc6/BpxhDebiRuoXwsSSFYX0nkhzDvCPD4ODMceKrEvc3HTy2E3HuxlYL2sVemqiIop+7H5WEjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709633702; c=relaxed/simple;
	bh=OZ+xlqsi0kavt6ipeJ/ZTIfxt69j1N6KAXvxGYV1EEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7labOons2tIyrOP/IANIhvYIBiJsZ59VVjBBDMR6jjP+FywbPxUu60g1H1QMrLatJz7O8L4V5hnvnbNQd24cINBeXvolsXfMjw5ZAOQzp1Nn8+3er6xlvCnBmxL5Ims241rLKv9dKBkS8S0GEtJDBWfLAbRsclyL/jiGWYg5kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kOYckQzU; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc74435c428so6032711276.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 02:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709633700; x=1710238500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ+xlqsi0kavt6ipeJ/ZTIfxt69j1N6KAXvxGYV1EEU=;
        b=kOYckQzUu3l/kgKE8E/z+T1mWEM6e1dxzm9ThiRt8VnhvPLUMXTfq+Lqzl612o6VyC
         AhlTMgAmNWxynfzb8Ihp+Sx/rzEfdCsKg9Bx83I1sBeqWzjDK6VRlrkvaoXjdjpPxtcT
         9nYjhL9c1zrS9jRPd1nz7iLpz1tldKiQXg8Ql8dhipJUy4OEIhM+pl9Jh+ITzLSGKuyf
         Kiz2CAmV0CF3AMf6I/4j+Y6qo8j+ApzJ+uZ0QXBqGHWo3PkhAirT+J0nZW7cPu7Qh8H3
         1eybimyvOrnc3Lr1h30QpzMf5UXjMm2ZNMsE/6ek3CnRYj2soWCTEavnSbbKgTL8w1pB
         xpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709633700; x=1710238500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZ+xlqsi0kavt6ipeJ/ZTIfxt69j1N6KAXvxGYV1EEU=;
        b=nru0AcM8Kw5PxD3Tdthtv4iAKIj1GXNh3mQLDAHdVFsGgEivxInILpWONnkyvDFwR7
         sqh2MfR9lbR2YDVecgT6EDLAr8EqoqqXLscJ05sAUuT7cCqLe0bWRAqJpRZUvloypAex
         0h6BWeOW3mAAEJG7uC5rYFAX+xb3NH2PPbfwuo2UbfpTv8HwuItZuQEmwrLFZrfaYl8z
         UCxz3LIYCnX3l84YYYWzww7kqx3EZUMAWX9Rck41/3aHout53OJfbiW0SI6pVnKQf6to
         /LJ6ultK8kHLTrFf4ktXawyTLFVp2E7+iZW04w8hc87bxvRCCjicbhsDMHjnQ1AC8WLy
         9Tkg==
X-Forwarded-Encrypted: i=1; AJvYcCUbBNcJiIMF1ZBlpasAiSZMScVBoLEl01sCRgCzD315VodhCyahlr2iFlIk3vzuJc5PP2w+JUycPBkcrwavSdfdhCfq3q+DfR8a9w==
X-Gm-Message-State: AOJu0Yx74JZH9tTLWt0w4eqQ8iG5gHizpoOcZD85MDAs/OQed4B55Npn
	yadSfDXB2ZtvXF6YCyRg4UIjVXw3fi4AxgLKycyulLuGkbKgtxhg4Rk+hchUJeDCThrhFRHlhil
	7EXvCPoLZewocz190sgxI8q+NPC+Zk/ttxDQrUw==
X-Google-Smtp-Source: AGHT+IEAP0PcEIaFVgRLGytTyFGRUBwqv5YLmN8nOaEJIX0Tf7+0r8alZzuRKHvttIF5QsuwNFd09eREPZLBcsrge1Q=
X-Received: by 2002:a25:20d:0:b0:dc6:c32f:6126 with SMTP id
 13-20020a25020d000000b00dc6c32f6126mr8531126ybc.22.1709633699821; Tue, 05 Mar
 2024 02:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301-awinic-aw9523-v8-1-7ec572f5dfb4@linaro.org>
 <CAMuHMdU3yUAxMgN-xo5BU2O8x0sn92myz6ZH68DB6JnMfgh7rg@mail.gmail.com>
 <CACRpkdY+6__RoDrMT5tsxSAUBOxzjOFzH56Z=07SSG=2PXwcxA@mail.gmail.com> <CAMuHMdWumc5d2=otMjwhcT7xtyKCoJk1EXRDsPHtTwt_02g18A@mail.gmail.com>
In-Reply-To: <CAMuHMdWumc5d2=otMjwhcT7xtyKCoJk1EXRDsPHtTwt_02g18A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Mar 2024 11:15:23 +0100
Message-ID: <CACRpkdbFC-gZc=8Vbo3-VRRENK_XbxHrXa39ny8z==VLs-Fziw@mail.gmail.com>
Subject: Re: [PATCH v8] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Bauer <mail@david-bauer.net>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 10:09=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> CONFIG_PINCTRL_AW9523=3Dy (bool)
> CONFIG_I2C=3Dm (tristate)

Ah a depends on I2C=3Dy should fix it, I'm onto it!

Yours,
Linus Walleij

