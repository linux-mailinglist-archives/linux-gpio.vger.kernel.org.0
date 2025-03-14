Return-Path: <linux-gpio+bounces-17594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34064A60DF0
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8002F3AE56C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 09:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA641F03D7;
	Fri, 14 Mar 2025 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMxkM3Qg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3571EE7A8
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945960; cv=none; b=sY9mrV0xPLuLUz1DqXpMKk/8EzLPtp1KlkAjbbocUbgbK6JdyalbRtMlJ2Uw/FdrdVEl20SvVZAAXQDJt2H323yjvqqIA5/d/Akpv+MGP7VRJRtAYKSCOzmU3xEzZE3nlUsX0saUkZcqOnzHuPZmwAICjPQyiuXDCzT9tbpkLS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945960; c=relaxed/simple;
	bh=K/5asd/53euBM6bC34RrAlVW7qDAdZITZLPvtilAXu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YL12DED4yCStzhS7NSqUZqlD5HJ6c+f9h6jjNlgZlvUxnBiFqzgQ7DxZKYK800oYL7QqikZIMPmzva3fjD1Bs9cUjCDdV3DG2ygfL2dqPRd7Wa0yrVNyciIIMCGzZ/OljT6/FBguMJ5xvwWbWX6pHyjIcOSwI1JTjZIP3MSg3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMxkM3Qg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549644ae382so2153535e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741945956; x=1742550756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/5asd/53euBM6bC34RrAlVW7qDAdZITZLPvtilAXu4=;
        b=pMxkM3QgcstITlmoCwQEx/39fwvFggu+847HtwSSyC4GtmMwypqRwd3wf4VgKjJ1Zl
         nSA9hLzvysEBQ3EW2huyUlYdbnUaF0/6ST6rErSJiOv0DA/xUtqmrauUuvXUGKOrc6d5
         ktgvbaMg/ugTLXuipZ+i/RICM64PZhxIZ79t2VCNJBDjdLsE2no7RHgy5r4VtnZYp5UT
         YYoJXfTiHA8alMleHBadNB6bddJSWs2q0OJiLnpqQtZ4e03khEH44G/gr4eJV/PRCwUa
         vKRK9PKCaon2R/xQWw82ZZNQWUcyLeLjfwZMPEMl0KC4lcZtlGi6IT+SAb4ser/+cqkt
         hBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945956; x=1742550756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/5asd/53euBM6bC34RrAlVW7qDAdZITZLPvtilAXu4=;
        b=G/3SLp0o2nt5eQmNLCe9O8JAbilaW0VkyN89XInzXl6CpDw4B9xtuG4e6hQXkVExHY
         53pOPrifsq9Tj+Y51xYoGFp9gToKnToWbQjrVweV1CzMO2Sn5Jqr2+lvSW+r9Hmc/k50
         jP0wxS3ztiMpVFdnhNoLFfr+scZBTbXlwFqcOiJvnY0kOeATUHa/WOMEmIe6Iuzz1Zuw
         +INmkGi1EmSnCKCrCDo256os3wh5GhppYTRU50W1Vt0B8NoR8XmJ5Va0kU5QKTc++Q3g
         +QBWpK3BjRipbwt2M1CCK2OPc3LNeXrHI30gM0bP481m5HozHANLzMl8yJE8ibgLDEwR
         wfjg==
X-Forwarded-Encrypted: i=1; AJvYcCWjUD1dvGFltDK+HHNcka/Du02EI4bxkE9TOoSlFfSGrF4ivLGvdFkqITvMpkFpAc6ZRPPnp1boEunW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8MP/ZPQAoCUYj7xSDjp20qpanCn5mw4JMR+p7/Hiwv7q/QrLQ
	8ztj0InlC/X7FS1dNI7az1yKip/SYNWZl5568PzfsAPxKbUrNNl0raej6wD2Z05bK6reKxEYM/o
	dJRDBu4wzwT7dc3lB5jnzikfQ2KT9lFlCpaHc1w==
X-Gm-Gg: ASbGncv6A4mp8KpDJ6gigZ/JDTjAbSi/dN4YenCnZru2mKLSp9YXZFDTiz2i9myayOc
	sqzsZ9o5MzG7E/BAPP58BfM3mwz2+xKxM3ESNPDkQwyXDwnQIz2Pvk+XE2xvbUT85Fdc6qN9WxV
	kvpfy02cm8YS19UbWiTgA02v4Tjti/x+RSTw==
X-Google-Smtp-Source: AGHT+IE4lxhMdTrTNBei0n9rc34kAsgDuahn1/eTB9cagoZJUZxd98PK8/buazwt90bkSBJ617Y69C7NrOlBT+UFM+0=
X-Received: by 2002:a05:6512:3ba4:b0:549:b13a:5d7f with SMTP id
 2adb3069b0e04-549c39905d3mr580715e87.41.1741945956413; Fri, 14 Mar 2025
 02:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740823241.git.hns@goldelico.com>
In-Reply-To: <cover.1740823241.git.hns@goldelico.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 10:52:25 +0100
X-Gm-Features: AQ5f1Jpd9Gi4dE97J63cl_3Sj9zWgf9B4pm3B3hxaUcyuam3AtBeRqgiMrcUtRM
Message-ID: <CACRpkdYe5R6aAaeCAW2_cCA2k+m_kpPJGwZvgq_0Num9U04VrA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: ingenic: add support for x1600 SoC and
 MII and I2S for jz4730
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Andreas Kemnade <andreas@kemnade.info>, Paul Boddie <paul@boddie.org.uk>, 
	Tim Bysun <tim.bysun@ingenic.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, letux-kernel@openphoenux.org, 
	kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 1, 2025 at 11:01=E2=80=AFAM H. Nikolaus Schaller <hns@goldelico=
.com> wrote:

> PATCH V3 2025-03-01 11:00:41:
> Fix some nits reported by Conor and Paul during their review and add
> their acked/reviewed-by.

Patches applied, sorry for taking so long!

Yours,
Linus Walleij

