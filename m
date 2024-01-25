Return-Path: <linux-gpio+bounces-2542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EB83B680
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 02:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE458B22FDE
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 01:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3ED1388;
	Thu, 25 Jan 2024 01:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bPbIqIag"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B3510E6
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 01:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706145657; cv=none; b=JaIwrlWP4UM/GHTWQ/JwDxeDaa/nMgWl5mXime3dz1QJ0eSAjeY/YIhu/EILFWaYWA5gNEKbcUXp/4pvXS6DFxX944g24fGHnTEZQilCIfZJIpE+rc9J2XyRnurcaGnRz/5Qmcj1K4aNVgC/MdyXue3QNMxQNG5mAmzcWvXz2Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706145657; c=relaxed/simple;
	bh=cGJvsaoSUQZ5WTpqb/0O/AhaueeoXzmFChGSznVF3u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0Vcvi26ND9LCiptc11GcxSJJg5THadDYlY9EPO9X8rLi/gCAXeKtTxDlNOxN2UxJeIvDreaVG3cOyKRAdVmc77TTB9Q8j+0X6OLxjk9KdCfwnv43q2FImJ1iQwNECSQV113eFc3tPgSIqggIjHKsVGeeRbJSSy8cfLsz3YDido=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bPbIqIag; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so241861276.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 17:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706145655; x=1706750455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yp/u4ZkB8Af4szS3l2foiHqZqhU3S0mGGqsAIIfocPI=;
        b=bPbIqIag7tpBla7ejmHO9SahIoRCuz/mGXXu8ptG2u1t0v0dUskq/yVQVHVInIycrc
         Er3bITXnGar2oiYSjUH16U0EyMjk9MZu8E1J+PReyKFA/xtl1xhc7ueytNm9FMarGowy
         QAOdJfSJNJ3Fpo2UR+dcaGs8imxhGw1MhDFimlVizDnoYHqQdoEBxN0iUjZXGZV0g+5t
         ALSLSs6uAyOjW1xTMWuRdzMIfIyBs7qPnzIgCAqcvq8AvSxoHdSHlrdb4qksx9nh0TRv
         tbDVgLhhiFTaWW4CK3be+8czNrYeUxbMHHn0rEkZUB734wf1ClM+2Tj3PWSC4HP7Xcgi
         xFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706145655; x=1706750455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yp/u4ZkB8Af4szS3l2foiHqZqhU3S0mGGqsAIIfocPI=;
        b=c5QEdu/uknnaIepuTKtXS5mo3NZ1d8ylXgY4O1GlDNOd8JQ57/jHNUpdYF9aMFaUBa
         zLMUxx4G5PFZalnyCjibM7PflYaSXXc/E3vH6qb8YXk/pcZiUx8r6Q/CGzreoschHdCa
         7dR9dTYu8DvjAYBZw6IB10LljEJiwXd/QDgv666AeRMC0JFefD+bvN0bD/+bb7YSgMmY
         cJRFqdfDat8+qPV1whkjwi/YFC9m5Oh8bdgtnGoR9vBFG7IySGJTJCO+PdKcWnP2mYXx
         9J1jTfkFS10zxJtUDSmMq0zbg0QbrfuAuGWsQsPNGK5t/zF9mIbe2SnP0yiHEIzpS0fp
         8/lw==
X-Gm-Message-State: AOJu0YzIrNOx6weEEp1GV5Jo+r44Ud944FAiBVJMjLrF47DVlq/ouPLv
	FEWhii2eSHnAdZOv6NaJBdgCRcDHaCfs6oLa+Us28kWdvXFTQFsXxE/nn6VqVeYSiRj6bJUDDj8
	iTB+WYsyj9WVnpaIYOjg8cMHNR/0ExbInODT/uw==
X-Google-Smtp-Source: AGHT+IFjy1IC5cedo/SGehuisVpOzmu1frADhfkczh2hxma6eXeRFbpJhuMKkUFCZxNxsx6QLtk8D8c+dJAz1FfRVlI=
X-Received: by 2002:a25:d505:0:b0:dbc:e22e:d8eb with SMTP id
 r5-20020a25d505000000b00dbce22ed8ebmr40834ybe.63.1706145655320; Wed, 24 Jan
 2024 17:20:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124023305.15755-1-quic_tengfan@quicinc.com>
 <20240124023305.15755-2-quic_tengfan@quicinc.com> <CAA8EJpqkDcqjn-8HrK7=rRe49ycDY6fbNDCKKQOeUpa_EDjFtw@mail.gmail.com>
 <67e17efa-df15-45f0-9a13-873cbd8f7507@quicinc.com>
In-Reply-To: <67e17efa-df15-45f0-9a13-873cbd8f7507@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jan 2024 03:20:43 +0200
Message-ID: <CAA8EJprqPg_TJAwm4CyoJH9_uspueVJTgpwYZ-mPykPcrU8BBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: modify the wrong
 compatible name
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, linus.walleij@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 03:18, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>
>
>
> On 1/24/2024 11:33 AM, Dmitry Baryshkov wrote:
> > On Wed, 24 Jan 2024 at 04:33, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
> >>
> >> Use right compatible name "qcom,sm4450-tlmm" instead of
> >> "qcom,sm4450-pinctrl".
> >>
> >> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> >> ---
> >>   Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> >> index bb08ca5a1509..bb675c8ec220 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> >> @@ -17,7 +17,7 @@ allOf:
> >>
> >>   properties:
> >>     compatible:
> >> -    const: qcom,sm4450-pinctrl
> >> +    const: qcom,sm4450-tlmm
> >
> > Fixes: 7bf8b78f86db ("dt-bindings: pinctrl: qcom: Add SM4450 pinctrl")
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Thanks Dmitry. I will inside this "Fixes" tage into commit message in
> the next patch series.

No need to, unless there are other changes to the patches. Such
trailers are picked up automatically.

>
> >
> >
> >>
> >>     reg:
> >>       maxItems: 1
> >> --
> >> 2.17.1
> >>
> >>
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> --
> Thx and BRs,
> Tengfei Fan



-- 
With best wishes
Dmitry

