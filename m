Return-Path: <linux-gpio+bounces-11068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B5995201
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 16:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB2CE1C24206
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 14:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553091E0DFF;
	Tue,  8 Oct 2024 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JnA2a081"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119061E0DBF
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398220; cv=none; b=sz50OwKCkXatrTgILrImaI8MSGMvHpHmJyfWAb+ACcLsyxQ0JcmQ5bj9L8mqId8ZF8WMpIEFITgaDPc5873N5djJ7/oKj249HsnPI8m9zfzi8t+5ieTc2v3tepBdqmcOuUv0CKrGcMNy1DY4/X/QQaP12ghM18A0hGiQm7BpZcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398220; c=relaxed/simple;
	bh=Ez1a1h8Ms+1O98dJlfS1HG3cTnUbVG7/3+aSOkVZLW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMbfEdwwzRiAveIyTVaSjMnCJ/p9EDgjk4P/R6u/bVeoxRSTNKyO+3N/Li6QisqXQ1uPTBJktUIWxsNiielMrP39kRAumpTuXhMXZw/XqEZgPLU/b1YVpHyoB4XlOACNmP6Y38WIDZyGj94wOakoMPHQEjAWvjn9LLgTLLV7jac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JnA2a081; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e260754066cso5280153276.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398217; x=1729003017; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0854fPv0lxGwhhEzPUBFcu+X9bL4gK6hC6tSqeFnVo=;
        b=JnA2a081KOkXDdPKkwHp/I0d0SpNvJcVPgNpQuLwmUclzZvYqOWhtocDcLJe5TYZWa
         aQroEBpRZyVCuI88ZzODdleKbuJDArEGz7LjO53mrnSiQ2anpN3TSRUFXTNcPqqjbs7O
         AWxpRFirw5Kyzc4S1tfXVDmbnbPevQdOaRoOvXzO9Om4wSJrnI4BfVR5GrfX9w4O3W+E
         MJ3ultnGwsqTaqP8Xn84k8QUYANxmTGMWV8k8vPBhzJFBk3GlqSeH+XFavHlNRvIJdG4
         IBYOEVzcmHJ0d5XAPQa2lgSa0DG4PkaQ5RJDGG3sKrQofUgPrTyhtMQrJMcx53LjxKLF
         1l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398217; x=1729003017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0854fPv0lxGwhhEzPUBFcu+X9bL4gK6hC6tSqeFnVo=;
        b=pDLSixtXF09DyoxCfnp+PKd6ZO3IP66hP0XABriqmcrNIDXLoEjZTp+b0NDNrnBOlp
         im4ZmBJcBeEGQHuGet888jthEPw5cwC6Tq/dUskWp0+hNwEkxo5CQ0QUYBTLkO6twi9I
         1a/7W7uRX+zMkAxeV8DqscMEtRCA/D/8+hCYRpEDk73J/SOAEKu7KPzjMrwUvYh0Flhh
         prEFm7zJDUJ65AuS4Efzi69FcC677LXz/8CpCAXswdlsFJ/6GpajGqoZS7QjoT+TzrQE
         gS7ZwnKjQZ5fLjMa9x3dRBQeVng+bvy5koKV7rpfC2JVcuYPon0LzdT270hkpmfnfSjx
         49FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRRIcyk69sztmfsqqUoHaDd+MZuEB1QIqzPGf7YWJ3vvZtKKPZIJ8i9Bv2lZdK6gnGvewOC4FmRQ2z@vger.kernel.org
X-Gm-Message-State: AOJu0Ywio6Pq8CGRJiHZfp6x15eK03PfX8qf1DJysnRAUoCCEtJ/+GC8
	PWLT3TCgn12W1D/n4PyibNIgaUGHWjOishj0swwZZM0QXJLwSV1MQ10fXZ4CCgxAw7tkPSeIxtY
	l8aJlOddk0YsT1dQ02V9xzc5ZvzXFnPpf5BHFig==
X-Google-Smtp-Source: AGHT+IEpdZ58qdVQo5cCccRj1bt7ZYLuIPFt7p/LlY0sT9qZJ20yILj6veCoP8QqMxVxSPJujYJBI+RkTcFSBtzbu/I=
X-Received: by 2002:a05:6902:2209:b0:e25:b49f:c8b7 with SMTP id
 3f1490d57ef6-e28939555d3mr10923158276.50.1728398217034; Tue, 08 Oct 2024
 07:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004102342.2414317-1-quic_srichara@quicinc.com> <20241004102342.2414317-4-quic_srichara@quicinc.com>
In-Reply-To: <20241004102342.2414317-4-quic_srichara@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 16:36:15 +0200
Message-ID: <CAPDyKFo-x5RDPwh1XxsCqzofMvspux7qt-mrxWXF7c9Sp3D8ew@mail.gmail.com>
Subject: Re: [PATCH V3 3/7] dt-bindings: mmc: sdhci-msm: add IPQ5424 compatible
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Oct 2024 at 12:24, Sricharan R <quic_srichara@quicinc.com> wrote:
>
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>
> The IPQ5424 supports eMMC with an SDHCI controller. Add the appropriate
> compatible to the documentation.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 11979b026d21..2b66c0f3129e 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -38,6 +38,7 @@ properties:
>            - enum:
>                - qcom,ipq5018-sdhci
>                - qcom,ipq5332-sdhci
> +              - qcom,ipq5424-sdhci
>                - qcom,ipq6018-sdhci
>                - qcom,ipq9574-sdhci
>                - qcom,qcm2290-sdhci
> --
> 2.34.1
>

