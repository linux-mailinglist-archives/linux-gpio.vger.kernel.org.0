Return-Path: <linux-gpio+bounces-22765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B22AF82CD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 23:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D194A1BC5F2F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 21:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED91623875D;
	Thu,  3 Jul 2025 21:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtafdVm+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3652BEFFF
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579119; cv=none; b=q+vtYmXUf6nwvH++oE5cS5eXbSBQpnHzPlxf0ussvZjgjnTLApGTOHCFobQBKWrRzQN2vcW5x6ISWnWnzM0OXWUgQbvyLrTR2zkidskUKAhUO/Oc6/SD6ZiQzGIn4XOcrqoUWyZejZSsr/qkQno2BNM2JbPEtsN5MzJO+wpg2Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579119; c=relaxed/simple;
	bh=wnFRRSRn4QeEk5iYoV45tJ39jqpMr6MRa9EtAX8nG9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWm6HFJ/fTP51dRkEnygp1UUGkTrZU7rrKOoQPiUs48UiCRIyE1b+qY9zdFV0KJF2CVIv2vT8SNxWi0jepLvbjJ58wGIZgWi9uUAJ+396msVgpy8TJ7g56ocLdq/lv2Xu2EPew0uFz3foi2N53L7DxkipGzhPG8XZLQX3ErmHdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WtafdVm+; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5562838ce68so359190e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579116; x=1752183916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XRxLaEkudOmQp09BGpQ8QQ/Qoe1pmMzDleZt9KM+6o=;
        b=WtafdVm+M/6VEmlgA1USgaJOheQUpmJIaa/CirH1BLDHhQn/R3Iu1ttRj2fsbBLUJ3
         V8XNtLSl4iMXhjoxyMKSPSeZ+G68iLqRk89NvTuIFF4MoB+RxiU3SNHEo4weaOQztABi
         1vN2jz4MoGnCnnrwrhiRUpIXBoBhSx9sg+ho5Db7FvRruvji0IGUQtvVwSMwLs5PwGUs
         fDtAFbkYYi3qat/tn24VSx82QFZeaAIaeS65PSgQuU4siOM4uodleg5GkkjUBDPxXJVi
         vEMnso27E/yeVc/RlIp27yB5lKLKFLWUKrk1ij6nJOq9gEqw0StfTgWFElwF0Zcw/w89
         R7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579116; x=1752183916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XRxLaEkudOmQp09BGpQ8QQ/Qoe1pmMzDleZt9KM+6o=;
        b=ZT42PPTmkU/+pRr+7+K2HaZG0TVJn4PVj4PSVxMabgvH42Ws9ilJta/wlYHVlTNs+V
         n7kFK2tZ9tGPLWR23pX0wd1rSoXfLtfStibGqKmgEfEj7NySVjm3u4JzYunTP3Wk5Dov
         H2o+l/4P4NlTEr/QUsNGQjVmEmGjI0HrD/pOtIXPwLInnVOHvg7U9sowIrBjRKe+ZARQ
         z6C5gOFe7QcZOM64lA1+pZ3oogvxQDOaIh4glOTgw2GDejgxVxYIHj7xqrwhh3cRtvq1
         aW9c3sSJng4cYUIPfWqSAD16oit95Ufa1M6LwBLnge/fJzupD2KB/JTKL8rtiw1Xr0l1
         ZXZg==
X-Forwarded-Encrypted: i=1; AJvYcCUC+w82znNnsfLkB6Wj5IV2sTuc7RLpuXRW/9jlgTHJYYTTmt4tB62Zbpp1UrpC0fTgPAQA23OqVCgz@vger.kernel.org
X-Gm-Message-State: AOJu0YzJSzcf2sWKzekpS7YoQduzDqHn5lV/jQ5QjpdEnuG1GYH4xPGq
	109FXA/zHfHiLlALlFO7/nV9PfugegnTVosFs69ihcrcd2gfpmxeRLloglo74EnwYBeFIZdiNj5
	kURnxOJTgDHzlX2qgapAAZUO3OeOZVCPpC6t4MDqe37AMnpYkX46pPkg=
X-Gm-Gg: ASbGncsWuW4so6HpaCTZilHZ4Xkasx4R88mrh9c51Lc+TNfcBzOC83WAgT+RE6I1Whk
	yNIHVGLP0PeVFazNHeaZU86Z5cqT7SrX/Grn+Q8VRxWoEYCp/axF3/BBxIogAW7Wb8eL5Z5G9/L
	ggP9XY/1fwLP7ibwWEJK4vNZfQC8IquM5uN+7gJbaD3I0=
X-Google-Smtp-Source: AGHT+IHMcHTI8t0jV1E/1yNFipjDMdG27d1r2tcyNEePv6L85lb9bKTV6sQs49+xKVP1ac6AIJvVTLJqEQGM2vza/qk=
X-Received: by 2002:a05:6512:15a3:b0:553:34c8:f6ca with SMTP id
 2adb3069b0e04-556e89500d0mr4749e87.35.1751579115885; Thu, 03 Jul 2025
 14:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624090600.91063-1-quic_yuanjiey@quicinc.com>
In-Reply-To: <20250624090600.91063-1-quic_yuanjiey@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:45:05 +0200
X-Gm-Features: Ac12FXyncS3NOy4puCpNTctASEAwVXKHDqvY9DdXOqM9ohOAbmxssvJ77Il8LtM
Message-ID: <CACRpkdbh1oikr=2A_ymAupE+j5nc2pfgU3m2DteEUdqY6=Ertw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: add multi TLMM region option parameter
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@oss.qualcomm.com, quic_tingweiz@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 11:06=E2=80=AFAM Yuanjie Yang <quic_yuanjiey@quicin=
c.com> wrote:

> Add support for selecting multiple TLMM regions using the
> tlmm-test tool.
> The current implementation only selects the TLMM Node region
> 0, which can lead to incorrect region selection.
>
> QCS 615 TLMM Node dts reg:
>         tlmm: pinctrl@3100000 {
>                 compatible =3D "qcom,qcs615-tlmm";
>                 reg =3D <0x0 0x03100000 0x0 0x300000>,
>                       <0x0 0x03500000 0x0 0x300000>,
>                       <0x0 0x03d00000 0x0 0x300000>;
>                 reg-names =3D "east",
>                             "west",
>                             "south";
>
> QCS615 gpio57 is in the south region with an offset of 0x39000,
> and its address is 0x3d39000. However, the default region selection
> is region 0 (east region), resulting in a wrong calculated address
> of 0x3139000.
>
> Add a tlmm option parameter named tlmm_reg_name to select the region.
> If the user does not input the parameter, the default region is 0.
>
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>

I don't understand the test tool but it looks reasonable to me
so patch applied!

Yours,
Linus Walleij

