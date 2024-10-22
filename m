Return-Path: <linux-gpio+bounces-11752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2FC9AA258
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 14:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B99AF1F233BF
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 12:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838A019DF4B;
	Tue, 22 Oct 2024 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BHEBE9hE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889E19D88F
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729600980; cv=none; b=AfTFvSPKxYVVtghA8Uws6S/4hNaYLZ/0hGXmGMjitGj0MEuEtamii3VttYI8SUpg9L93caGX8sq0+bDYTTvICoEAdDy5CNBWTZrY5Ub6vpQygxYdQq5gGNrEQJr0iYQpo+cG0YZJpXubU03qy2RIyZ69IWkPHHUnc9b0odIwCUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729600980; c=relaxed/simple;
	bh=ARtJ6kvqIGcFruTXV6okIoHVDlTbGuGMZPlyUCFrYwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blex8Y4zYw+RwIXkmNUPtBYGw0K/JSLgoGHrHTYj/As6Z8er/GO4GFx9I63KP+FDUTEfrd5Gy2WO/fJz/S9N1bRhpdMyX/KVSjW1drxtdGsr4Eom4U4jscCJTP/MTnAoFFUk/Q1GJUI2QpzLKBVVKq0IBP/faNX7iHwFXiBnV2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BHEBE9hE; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb443746b8so58474191fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 05:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729600976; x=1730205776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARtJ6kvqIGcFruTXV6okIoHVDlTbGuGMZPlyUCFrYwk=;
        b=BHEBE9hEaqC6baMwuNBt5nYatLvADUvDXL9ZHcL3GcqprjCwLoe0MFvdQcYnOaIuf8
         bfg6q4TtTS+CyqfLkgH48tpq2TIs/7MzjtrgbqH3rRpDWDKEmBU84+eBgEFJ/J4HZxoP
         GolojXA9o5l91ZNCM3vBKGu0ktjcuJR/YZhFuypxwSfxzTn11jqmhmJffniOx6kxDQFt
         wC5JSF7zpKfIBJC6REu9MoPfu6Z7br0oVn3MU4yaKitIUTVQXY/iaq1bpQg08t+oFqVP
         pggl4lPEXz9hwyY4qgEQFinI6Bhf57bYwkGT8U8UcXJUO/oghEyMrbRphcd3xA0mjp/8
         6/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729600976; x=1730205776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARtJ6kvqIGcFruTXV6okIoHVDlTbGuGMZPlyUCFrYwk=;
        b=OxvBCcB3LGF2g51Re63CSjjUNS7UJSuqPHu0lYRnV4h4teNbQxMrrvOa8YgdbUEl4m
         EhKpJcaVt/21SJxb9waT9iX0IifuucSEJhECTr1c9YtnjvaNDuL9IkZ3awlgDvGBF0FL
         gFUHfT2LuMFvZUS+QgnzTskfVcPr1Y2wlqwwVxGqw2D2gbHGgCAvyADpuPq5OEQUFoiK
         yN5ys6/C6g7t8ZAEDi4pFHvBXDJeZvkOdYNb7caiuZWwHddl2A6C8JF486xpRICjJeEw
         FAWvHX5mIcLYXOHr272KXyQ++/gYteSS9ArQU7pBz6ErwS5Hzsc3qQw/bG0jQSvmX6uk
         jzzw==
X-Forwarded-Encrypted: i=1; AJvYcCUmdod7vPqQJz4Qoc5NhlTtDnCPFm6dw/GXkRnL239t3MG5vfpOTkFp1PDE48qk3GbcEKOtPKF3zdUH@vger.kernel.org
X-Gm-Message-State: AOJu0YwceZWSBQfamAJz+Blv/vPh4NdUOz2ImgRBWA+CvcXMKAPCcZKT
	kxLlAh5RGPOcH6bVYnl0aB/O6ev4VUf0r3B2NPhSviQBh6aAiNy75Z3gvaQJ7PJT5/ImCBM05Su
	sC8tCMl1WxE+M3V2SrZ/jSLSz8wYHij7Uj+vzIA==
X-Google-Smtp-Source: AGHT+IEBcVfZ3JWaOM04XJNSL54UsLyONVoNwTnqh64hkWL8NFdGQD13XXBI25QnSA6vmIj5FcVBmPLEvaztSgYOWOI=
X-Received: by 2002:a05:6512:2393:b0:539:f65b:401 with SMTP id
 2adb3069b0e04-53a154a2413mr6984977e87.57.1729600975700; Tue, 22 Oct 2024
 05:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-qcs8300_tlmm-v3-0-8b8d3957cf1a@quicinc.com>
In-Reply-To: <20241018-qcs8300_tlmm-v3-0-8b8d3957cf1a@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Oct 2024 14:42:43 +0200
Message-ID: <CACRpkdYY=qLocvD_c-1TkJep3QMAOOWkmAYanvDzhyBgsC0RYQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for QCS8300
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 5:20=E2=80=AFAM Jingyi Wang <quic_jingyw@quicinc.co=
m> wrote:

> Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
> QCS8300 SoC.
>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>

ACKs on bindings, up to v3 and no maintainer comments, driver
looks fairly standard. Patches applied!

Yours,
Linus Walleij

