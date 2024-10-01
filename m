Return-Path: <linux-gpio+bounces-10623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A598BBF2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E37C41F23105
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 12:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BFE1C2422;
	Tue,  1 Oct 2024 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPFPMDCQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554A61BF812
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727785136; cv=none; b=XLxrC6yQuA1xYCzSjv8/WAT+KPzFU1VFVjmCZe0JOLWIOzHyTiLAOorWUFtjKn18Vxb+YeBQ0WAPY7nsab1bCfVZ8kX45Kvt92p9MrdUl3HbRTLpB3qB8iRZ5qEn9bjQaqtAd/iQltX0ZsWsc+i4FYmFnPKp4m4vFIQ/+iAtu54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727785136; c=relaxed/simple;
	bh=lkBDPJFJkho1FBYDgIB5sEyVfdFnZBI+EiZwZtGMIzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmRshqwvTiVCwxKhs70eVJAlsFjBQswVrbAszqUfYprh0ZHJ5hNaJIzrkXqdS7ER905BriKIwcZO19nc3aRUSuhqTPMgW4Zptch3PtRveQDmldz4TUONoJQalonLrgBitacg+7CQFPS5Zspda4pmPcuz1Q1FJcXoCJrphIdA8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPFPMDCQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5399675e14cso2454982e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727785131; x=1728389931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkBDPJFJkho1FBYDgIB5sEyVfdFnZBI+EiZwZtGMIzo=;
        b=HPFPMDCQkYI3qNvZgy1dJNS0JidDb3tFPA3aert86VhoGdLMMTaRel7nmfaKcpLUfF
         WjsY1iL7hS7D7Wjs6Kas0Axr2lyqYiEDdPwiMh6kV5mOmp3GGpqi35+Q6Je7mOIvxInv
         WjpgtdgJv/TFp95aNk+cntrYFVINvmYY/hONBFWKGS28XH2gtB6iNr+kd0qC9kb8LPuJ
         BRhwgGXmFeCF25ev25QXPc5clTWn6CshJ76w+L2FL+lpMtZRWiAg239zOAMwngXarPev
         nSap6+iLAg2HIjtHUJJEuG9aPt2d+c8neaxDDHEeXVJ2Dg6gkhpoWXMzGCNGN3onfDM9
         wEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727785131; x=1728389931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkBDPJFJkho1FBYDgIB5sEyVfdFnZBI+EiZwZtGMIzo=;
        b=uP2KE/PVPdh7gWxA7pk0EYa4LfwTlSGJceKvFVIjOA7Xg3HFuRw9KQJ30YX3bJ/d94
         L/LHr5f2j118tIJM65nHsU5zii/1L3+UTm9Or/9e2/3J7icOPbvSOoqo3Nfpse0J6r4s
         4ubBovrttwRdWhxPU42uf6iN7WKVAYskahTqyizJT9MioTtO0QrfzFyXUWr35LccKn8B
         aVwBy7qhMwXciaDRogYzuyxyUmZUc63NiEJvpvJmFLpYh4cT8XdaMMxzdG/ma6x9CgLF
         xJz1IE1B4sj8EfGQCz36apcfN1zaIOMOOp7DLiSCO6LcSh66dN+F5gvGTu1DzowOxnAG
         CLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUzc/VmcOB7KloGnwfGHjai9Cszav8imaT2Q1717JYibjpOUZevGfUyL4ToT3gEOPmPfnpsbknCRYU@vger.kernel.org
X-Gm-Message-State: AOJu0YziiG6zmEY95AUxpEJLVpwfQrlN+uQUH/Jztiml4rP9J+0+M06+
	eU3LHSQOhi0HjogmxEgaAz/Endn112r6oRlh6AjqzwXw4GOtSiPk9rDYM9Zcra0MnlpBSHKzIKA
	RYQrQPY6AF0jT2YR1uigOwtbBbh+shuQWzpoxdg==
X-Google-Smtp-Source: AGHT+IFpRUvfChvcK0Zoknz0HBqA3HdDr3PNgNW4cdaJXr3HKoPBRRlGzU93KJDaW6ywdlCJIaqqDOXZQOUqvXb/T9Q=
X-Received: by 2002:a05:6512:acd:b0:539:8f68:e03e with SMTP id
 2adb3069b0e04-5398f68e0b1mr4792752e87.56.1727785131410; Tue, 01 Oct 2024
 05:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927065244.3024604-1-quic_srichara@quicinc.com> <20240927065244.3024604-4-quic_srichara@quicinc.com>
In-Reply-To: <20240927065244.3024604-4-quic_srichara@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 14:18:40 +0200
Message-ID: <CACRpkdbV6JHnVU2_z4LaCUf_V-HM8nrXBfAs4ym5w+pQJexRFA@mail.gmail.com>
Subject: Re: [PATCH V2 3/9] dt-bindings: pinctrl: qcom: add IPQ5424 pinctrl
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, ulf.hansson@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:53=E2=80=AFAM Sricharan R <quic_srichara@quicinc.=
com> wrote:

> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>
> Add device tree bindings for IPQ5424 TLMM block.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Patch applied to the pinctrl tree for v6.13.

Yours,
Linus Walleij

