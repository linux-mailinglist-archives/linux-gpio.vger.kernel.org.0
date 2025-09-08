Return-Path: <linux-gpio+bounces-25736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23132B48D3B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1CBE3BC28B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10462FE05C;
	Mon,  8 Sep 2025 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRj0wY5v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D62F2FB0B7
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333929; cv=none; b=RXlxDzPOzRaPb3Lf5iv0+PJgEf2GQUyxTMHxBP037IFaZfxPN+qYT4RRzrE+MdmtDaV41yuvgHOxErLaozjMSgH6a6Zuh/f1UQHnMnMYOTEg8cMNmM4IxKdgfHsice6ky/B4QeQVotNPqWQJByFnAyhMerG5UvJ3xByCvZQQ8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333929; c=relaxed/simple;
	bh=D03VLSx8qWcHMylhQkNfYVr1yuDfARwAcjhSzmKUp4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vC9NT9lFRj6WzEX451P/2WIZ182RnXxfT7ukOJP94lfgGrA7ko+TkGe/7VGW/7uE0dcwez/ilxuybx+4InUvpcGOylnHwNrLliPJ/2HFDW77YKAvRxlwYxVGBS3Al3r8oOOB0UJAutANT1BicydxfpL3FBNvkzPOiXGRy0Fqb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bRj0wY5v; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-336dc57f3f2so40659631fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 05:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757333926; x=1757938726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D03VLSx8qWcHMylhQkNfYVr1yuDfARwAcjhSzmKUp4o=;
        b=bRj0wY5vx42hNu/oUuC5Cm/9lcsT9/hRuPE9Oje20Z1pFGQkuaDKH+5HV2HRwmiw7T
         d4Mg6aqxBZv12/y0DQgz1/VdVODPH0Y6aRqiBtYtTIRswO+4rV88Ur4BY4B0G8j90i8Z
         U9omj4Unq5PQEoqFPMkDEfm/V5lqIV5e40nVgUeMPOkCAYF8/q3AwtIJ82pFlsojBeoO
         mgQ3f8sQifmQBTVHT+InmiABGE3jSjHwqASAei1EJdgXqpJ91hctA2wqUncnVTLPfAZb
         c2Dio9MRHOq3Kans/ajYODY0Uqg1zhjeRQa44EGSPFSv1bnPqhCzrilYn+WhYW/yop0J
         ++xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333926; x=1757938726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D03VLSx8qWcHMylhQkNfYVr1yuDfARwAcjhSzmKUp4o=;
        b=wzpu8JHu7zu0K36gDHxMAScFcyv5AgL+lTBJlwPYhqb6grbiXgQzgu04OhZH4oeA6Y
         LMB3ePUDwlgckzzy2Lid9xRMTasjrp9aEoEVgBHfprp7EcVEKtprp0K4KSMvadodxQHs
         JU9SsstM2Skv+qkT5eSZyLhUpTKOVe+CWOxda2WScWCaEZl7UdOt2ImcXw2/LU/s3KHN
         iXobAWydxr1CxWP5/YcIxGF0txrge5GS5HkWeiSz1oK/Kj7JN5LGGlYee8bNwYz/Jh35
         n5ih52eD2kAEonH6sbxJX3qS5TmEIY/hghaSrOpLGGFxX4Q7V/d5BRzzyUbzNxSyqY6z
         nTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXNXPvxJzW0CRMGxKoj5T5dF3MjVeaeGosvZNKsNEO2iIuxdbZlhIPZbN7nc0OMn00LhY/s+LJpW3X@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2S4E+CCPPK8zb4mabrl3O0bK8cyVqg7vTcWowKUK1QYKdjpdG
	W4lplW76CepEVakQA4HzY6a6oKlFApdW5ttDcxovWKKobIpVHcTyG3kqG7dAhWKA1OxeLtCRh+6
	oCfxj9Ks7SlCKOI3swleN2oAzXDJYdHJMJ3Wxie2wQA==
X-Gm-Gg: ASbGncuzMPdb65eTfgAz1vmgifDGXtrYW2ejD4E2f4aBp0VwDyiT93CJNaja0apNcTD
	+AH3seUO78Ru3a4VTQcXc+No6keuuG0x6OzH5yxY8ZVXDBMGBzYnQUjZVuTkXYiZ6JYwfgqnrmT
	TcHkHTgmObsWGa1Wpm1aG4+8Uzn9I7F3NQAL5v4D56MYEUhFNIUKGZ+2j92BxnId8FYiCqUCMnv
	u1jScwnXU6G0KL32w==
X-Google-Smtp-Source: AGHT+IHM/asPiTx9epOD6oTfJGUKN67uaWlwZQ78ImQd67LcYMxVaHUE3T7Mz8CkVcX10agc5tRhs6MCp4IvPGbhEmU=
X-Received: by 2002:a05:651c:20ce:10b0:336:80e3:b1aa with SMTP id
 38308e7fff4ca-33b57396e4emr16467561fa.40.1757333926321; Mon, 08 Sep 2025
 05:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
In-Reply-To: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 14:18:35 +0200
X-Gm-Features: Ac12FXw45K3T8l4lkY0i6QN88olXVHwaoVRfqMYPmh8yFo1l5iil-Ht1oK5lLbQ
Message-ID: <CACRpkdY2o7PB-1t5kwGFpWjDu4QfKG_gf0_pGA=V1=_KFCqqiA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add SDM660 LPASS LPI TLMM
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	linux@mainlining.org, Nickolay Goppen <setotau@yandex.ru>, 
	Richard Acayan <mailingradian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 3:43=E2=80=AFPM Nickolay Goppen <setotau@mainlining.=
org> wrote:

> This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
> introduces pin_offset field for LPI pinctrl drivers to support
> SDM660's quirky pin_offsets taken from an array with
> predefined offsets from downstream [1].
>
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27=
-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>

This seems ready for merge if you fix the last few comments
and collect the ACKs/Reviewed-by, can you send a v6
addressing this?

Yours,
Linus Walleij

