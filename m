Return-Path: <linux-gpio+bounces-27017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F282EBD2914
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CF5D4E1ED0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B042FF65D;
	Mon, 13 Oct 2025 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SsolKaTe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7E72FF141
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351225; cv=none; b=Xd/+QdJpsempLtMfPDhpA5vwmisyiAoSs8bY05nISmt76DCe1adZJaDnr4u35ynXGCFDUKYoEW9BJgf5dE4sc9aDVEHQut9UrN+a4AmeziX7qwz/qv6+YHhukvEKJqsHdTkeF+8OB77FUjIMoYnm49Rqnz/E2OYWd/ZrbP+Fi98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351225; c=relaxed/simple;
	bh=mYP/OQKzVS1m6M+HpUKFSESiFlsi27UhRPn0dyau2kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6j1+bslYH8o8CYNCtSnvR8hrBaijhndjPWXGCzrP+6YADWMPvbYziloEpg3hq6YapUFWHG7/wobK6L/WfHC0jRcRe7rlVIN2j73wQBGC21IqzJ52RprWW62H1Uv0rhBYCrnW9YYer0zNMuJ0ux9DCXNyinODZwaok9swM3Xjl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SsolKaTe; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-373a56498b9so49824261fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760351221; x=1760956021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUycCPtJNwSyf8L3pkwEVzuTkjNQoDRYegjRAHgk7u8=;
        b=SsolKaTel+wOEiH34+tTPJIPAO7a03Br/+cCmXFLjq/daH3rzWQm6FzeftLmlmiNxP
         PbxFFyDH54AJMVAEn5YQZnDTFnZoaAPXiWaIVr2vlv+B5HcmKjb3MpR4bYZugomGzXVV
         95czHWAvbVksRzkqABUVRn0qdj6/iOE7bsrobtNe1ilco2kYIB94GGIDfZ9iCGy2SFAQ
         M01qxUkWogyG7UZ2lCraonpybGL31SUS7PoAnnQ1I/POtnMnE6XVej0txDchL3rv061t
         zE4GUVRWqKnaQIqL/ArlI6yCZha6HC64v+ImMxlr+qSfb9IHlurTspnSkZr4WcedGAm8
         uWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760351221; x=1760956021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUycCPtJNwSyf8L3pkwEVzuTkjNQoDRYegjRAHgk7u8=;
        b=iUUlHv/uE3OU9JOCG1SSN90JBaUzm/SpAklCY0sqIy3SIycg5MtIwbT+NKspXryw9d
         AVKMbfW1hMHlD6/2XKQnhboDahp3TzJVia7VmzrTW2YBIi2nGtnFdnEk1xh2dBj6Dh6J
         xD4tOf692k1RvnQDx2C4kTuy8N4/gDn1FTfceoTCRni+gZF7+TfaLRHiF6Puujzgh6Q/
         37Rf8l09cZk3x+27+2kkGUNTg0Dy/pdkhEngCWaHt7JCyrkacBuTvPnPi6Q4iRzMQQ9V
         SYsRtL3X5pZaIM8KhUx9kEeGNBePjI3z88g/bmztN15ITf7qnBzQ8Nj8/AvtQ5GcHCl6
         Lj1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHHdzpDNIKLozyx2GlO87sQlbQqTEWGuAVI+mJvJzLkmoH91h4amDEeqckh8eBIW84cyODeax3qwFV@vger.kernel.org
X-Gm-Message-State: AOJu0YwbKIwf1/3gmKdzvCe2TRGYsG8hrYZQnIOMzE9wcQRgpYjEH67H
	U4GUvQdypP0xZOLKL4ncYCzSDMjCnWMOd4OSIT5r1ijpo165aDefMmoHtDpeychNEC3hjzvNIWI
	M2eCFHe3vKdHI7ZTuzCVeoKey0l4KW3FKPK5EfirOdg==
X-Gm-Gg: ASbGncv0GOcbURfckGPPRR+eCvnhTM/pSw+mDKSgS8v2BCApV30Zz+IZkneQ2ja7HWa
	lBifa8bXmed3XkXl0xWdiQRgppbaqB1ImcvOx0Jr7YxklxDIJm2iJ41DdaH0G1xhlUvadN3m7Na
	wbZfZT3vwwnzqDYp4yKAE5eDn1H31kdmF4jXXFzz8cNn65O+U1p8ttFkzRdI1gaTF1qdiBBVP+E
	r4zPokue/oHltwGNU4g5r78EkQvqA==
X-Google-Smtp-Source: AGHT+IFAEsHnMAjQz8hxHe77PJ/PCdDOE9sQkCxeRCWPsKIX77lQMxoPbYN5YcgGmocyzXCOJWX9oJCl9IJt3sstsZ8=
X-Received: by 2002:a2e:a54a:0:b0:373:c272:d986 with SMTP id
 38308e7fff4ca-375f526e5b0mr67753781fa.17.1760351220605; Mon, 13 Oct 2025
 03:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:26:49 +0200
X-Gm-Features: AS18NWCGvuxtBzvkEQk1ZaKR73JeD7vVIfCcLysVpFERoAJPL1BMWsaJUOjyAzE
Message-ID: <CACRpkdZOSvEaUU8AGQY19co6maeFwkqEFP+TH-=NnToJuoih9A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jingyi,

thanks for your patches!

On Thu, Sep 25, 2025 at 1:16=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:

> Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
> Kaanapali SoC.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Jingyi Wang (2):
>       dt-bindings: pinctrl: describe Kaanapali TLMM
>       pinctrl: qcom: add the tlmm driver for Kaanapali platforms

I have applied these for v6.19!

Yours,
Linus Walleij

