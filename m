Return-Path: <linux-gpio+bounces-5403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C608A2957
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 10:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C23011F219B7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 08:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D6850287;
	Fri, 12 Apr 2024 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o7WRa6jJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A142550A63
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712910597; cv=none; b=NpiQCrvMRs7jlUdetZHEbb7jWpTW3JpztnZbSuDKmlUjlLvXZopwQsy+D1tVi+ur9uMCneDZugaXzHefIxEf9OFJFCNxaYKrwErQIEkeMx/kUuweTZF3MhwGjj5H1gdMkYhjRn9HxZvJeJKNVvQyWXwcIcGLMGM0RPtV9192tQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712910597; c=relaxed/simple;
	bh=BfeZ4IL+0uJkrnFhXyulwMZH9YOcEsG7N4UPSxQwrXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jtqf/wZv7fXX68/r1Ninuld71ZMXUQhjRv+cs2a7yBRLb/Q2l1Ax3mZXDJaN9thLfEijPgOnwtl1jk7CZJLCTBpcAuD4APlKYXI2sRJd0PstrwGy96oTOlUzv7vPJqCZlassoqzKpsRbLkcQ9mFB3xVIbipUyLsUrqRlqMDztn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o7WRa6jJ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso634851276.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712910594; x=1713515394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfeZ4IL+0uJkrnFhXyulwMZH9YOcEsG7N4UPSxQwrXw=;
        b=o7WRa6jJQjOSiSk+LM1LMe0eCEDv7pAxXn+9tRG+OHle1hjRfBQS5s4F9tkEkGlWtT
         f7n3wIJFjkHAHvZwljozZ0uKtwjuUKi0eaYYJDDemqW9FU+mGFRDmjLvyesUEIAt3tja
         lnf51I6sIlylsYJ3Ou/TPakkR8Gu9dQTcGrT/289MGzM+MGDyfAhvrwZk6tzeGHEfdn6
         m7aJ/3QPgOvSvdYopJkVKasAeYQ1rSzpt82omMLk48Mszc0FlJQkvsAhL9eKdq9Bu4ko
         MDKGhGFCZuXU0zDg2b3hNghLYlSjkxzb3uvPX6ThfTnh2diP9VhfEMM7p090E0VrH/2W
         17Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712910594; x=1713515394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfeZ4IL+0uJkrnFhXyulwMZH9YOcEsG7N4UPSxQwrXw=;
        b=GRZqj+N/WAzTcHCete0l/pCmb4zzukOmjuigegpVe6tBObPoiajBE71D7rf4ZqWs5V
         XMP+CvDMPnd2YEGZ0KFBR/2WSiLBgZj01xw5Z95lGt80O/qrdWmjNZD+34LebfmA5vD1
         DoN1YtN1ajnBQRZRPSk82nTdBhJlnbIQwAugwfYAEn4D3B3/yrxQilbLE69JtGEcFERC
         I+SG28GjHQnoT75fZ4fCJMMCPLAetLKNGYmFpMZT18YPRrwE+8wEcrdEpwX+5nMzt6JI
         fuHoIU4b/5FGYt4DxDxR26ja6MMxsWOPsjkU/k1rG3zYCLacmzovjIL/XZchrLFJScUT
         +Zzg==
X-Forwarded-Encrypted: i=1; AJvYcCXNJtAMeh49BMZir1WbI0Od4bvOfncZ7G08HZU+qczSEfVVvu+U4KDEpiYbwDvQC9HqWI3v8WAzTo2cDblEiE4iATDd6wztY9vUMA==
X-Gm-Message-State: AOJu0YyPDxNpGXkR1T6TkNVQaXs5q7fHvq/KprN2VAdHjbez/HJU1aul
	ZiTq5KQ0K0v6xy1Qz2SWxsFf3khvKAAulCxF/7RXi/Mcd74IFtbawrsZniNaUwBgcgDaoiddWS6
	hgzotA7VJ5UikSXigTBE1Nc+RyC2qZYMMSH/A9A==
X-Google-Smtp-Source: AGHT+IFFCDn8Tj8KbGC7ulaXoT+mmD8v5dmvH9Q8fuetYWLwrEUEyf1O0q+ueZp7Pg5qNbx8uhruJtp5xKm1GgD2U80=
X-Received: by 2002:a25:29c6:0:b0:dcf:3aa6:7334 with SMTP id
 p189-20020a2529c6000000b00dcf3aa67334mr1854728ybp.7.1712910594707; Fri, 12
 Apr 2024 01:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-qcom-pmic-gpio-hog-v2-0-5ff812d2baed@z3ntu.xyz> <20240409-qcom-pmic-gpio-hog-v2-1-5ff812d2baed@z3ntu.xyz>
In-Reply-To: <20240409-qcom-pmic-gpio-hog-v2-1-5ff812d2baed@z3ntu.xyz>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 10:29:43 +0200
Message-ID: <CACRpkdbRxhKYNHgssFZ0Pf5_0_Gt7+Ga0OhWdhxG5eKCrZ7Wkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Allow
 gpio-hog nodes
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 8:36=E2=80=AFPM Luca Weiss <luca@z3ntu.xyz> wrote:

> Allow specifying a GPIO hog, as already used on
> qcom-msm8974-lge-nexus5-hammerhead.dts.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

This patch applied to the pinctrl tree!

Yours,
Linus Walleij

