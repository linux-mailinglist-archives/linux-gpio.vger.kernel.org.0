Return-Path: <linux-gpio+bounces-28767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB589C6F441
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id D30A52ED81
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45647355030;
	Wed, 19 Nov 2025 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SbJNpwjt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC1434E749
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562161; cv=none; b=hmM6h4mncwMjHfULfGHeXAiO7fxcsHxZAqJ6TUx9SRFpaRrwQ8lC4D70lR6fSRQwRxu5BGMg0vzVaSg86tSb8gm7Y72QDWWIAE2HRY6cOWIXqsjwrxDP3ibTUz5c1ROiEnzwA/CCcpGtAnF4DsqUmVF2Z15GxhzQfj5Su16DTBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562161; c=relaxed/simple;
	bh=MhrsZIbWzRhCkp8ZCo9BwzqVTC7yndSnE/Tw3//4s9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg49hTYEsOX1GhI0BeymjZNfNBlT9ZZh99MECOTQiY6atiB8XQVeDLKIYNtTdCfaQ5HjcTIlTQivy9CzaHmLsK41XUm/MOQTjxq4fZSksTc2oo3pWT2+uc3EzD1xXcgJg67CEHmhQApueEP/z56AcALM2Bv7WdY3uX2OGKC/TJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SbJNpwjt; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-641e4744e59so5350106d50.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 06:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763562158; x=1764166958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhrsZIbWzRhCkp8ZCo9BwzqVTC7yndSnE/Tw3//4s9I=;
        b=SbJNpwjthtm/8W8rajTN3TBOYNG0IZZOcGjIhztrWsBJAOARwr49/KvjH0bBND+vX5
         q97U6xkYvMPOqHIcmJUsMjqU8iNdKrY0HoaM/cLoP+pWBuKyxnnNBsx0onVd3ZGg/jwt
         hvBhe0c8po6aFWGjffuLncll0F/nLWLKtxyG7o4fVJ5mUmjH7epP2XH5veOt/+ikPwR9
         H3l4MEPZyxrAEpZuDXdXPt+t0Z8d+ngLsNUbAC7m8MsCAxKdfNMiR13d06Y+z9p8KU9A
         4sYugiEf94/DjGh/AM9HIRPvTRi6APVUJvoD65TL/QwKhcYC8UJSWGgeHH883E9voBDg
         a1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562158; x=1764166958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhrsZIbWzRhCkp8ZCo9BwzqVTC7yndSnE/Tw3//4s9I=;
        b=lDK7wWGps5a8TyZxg8sWMYSZvkLvtgFc2BwrzaC3OMW70aXNmMa47m1CDVDbo3TwgJ
         39+z/ghossDoT7wKthgH/y1c9PWOW6LH1Ol7gwq4/Y6NL7AZhKmmhYoW+kCo5GYK+hbf
         MH4h3zamrLykYmXEbZqe14I433MHnXuvus+pzHis3Rb4cCKhTEOTyDajpVOTFxv1yR7C
         TF3GlfmlsouIQMTx6GYmgqsKUl9fz8K+y+gjOPksrLb0MHLRLwVohmDR4sy+GStjYWYD
         Ue8vrQmAtlricaRR6yqcDMghHOGF7eOrKARrLg/w5yuMRh8DujfzCsEwKqZNAS+EEGGH
         h1pw==
X-Forwarded-Encrypted: i=1; AJvYcCWKDfMbRuFquysUEcz7QQWTBLraxR0hPZp+m2Nsq7Lqr3bAlwH2TcNiAETiwfPh41VhRJ+Gdqu3741n@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/btXgqcyJHu9zdMVj+6R9Ot1HfB6m+RyT+gfnDT774AYkblP
	0MdKHcCyWSWR1KBl7JMAJOQJ8CreHf3kX2QthYdg7OLJ0J2/SJa0zIAJMSfTReOhpIUJVXvdYdM
	1mIgXIX7rEEvsRqfS4GcW0N1/5sgtpo8qsDuvL+TdPQ==
X-Gm-Gg: ASbGncsJzET9FBVD0JIbEySmShzR/dvhHgKXfT9/oRrLpRHdbVbPOyBrBtHaaHBdLjP
	g0n1GJTXistJcW57C3akxoE0hFMepNXiYycw2SzVS8/jmNA8ti8dke9xYkCPxxBYyB0sBsrkAaI
	WV2SmTQpoEaFeZfTEZ+ax6udkOA8pQ7OfijgLaTxikPlvBPp8xY9VCrZ1uurXMdD6wOdcsJPQQU
	wvauCRA9YrI7zDh0w0G2bEt+4XWjzJz20ahb4dMNg3j84ZRVyPMtkE4tBstnwiQL/QfXKKCwW1+
	3FApCw==
X-Google-Smtp-Source: AGHT+IEK96oDDGhtSMOrFEinT1tokH4hnf8wTVBS3BSk/cku7ibmRWyEcIG9r+y6XUg52Cr/+RO7BwnZ8CPpg1m6izg=
X-Received: by 2002:a53:d00b:0:b0:63f:a89c:46f9 with SMTP id
 956f58d0204a3-641e76a391dmr13332400d50.40.1763562158314; Wed, 19 Nov 2025
 06:22:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118213428.36700-1-robh@kernel.org>
In-Reply-To: <20251118213428.36700-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:22:05 +0100
X-Gm-Features: AWmQ_bkPvGHNxXPgik4goguOsOD08uL9PsXetzBiLxVbcWWbISsz0NGOhdm9JVY
Message-ID: <CACRpkdZ3bz2_-vh-RwVwicLyBOyfROE5EGtBqCgPYcy7srKNSA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: xlnx,versal-pinctrl: Add missing
 unevaluatedProperties on '^conf' nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 10:34=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Add the missing unevaluatedProperties to disallow extra properties on
> the '^conf' nodes.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied for fixes.

Yours,
Linus Walleij

