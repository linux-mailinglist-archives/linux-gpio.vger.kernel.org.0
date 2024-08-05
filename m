Return-Path: <linux-gpio+bounces-8571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06394760D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB312B20EEE
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 07:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734E0149C69;
	Mon,  5 Aug 2024 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XF73iVkY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABE51E505
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722843047; cv=none; b=epjKIzsA/NdVGd/QgdedMfEnkRj+a/0cwy+Vv0NuoFUzlOHtdTq3dEr8Eu3lyMF0STsemdM5H5UCDuKsGhtsko5m9nCO4ilffv2wILWhhPnDslsQaj2Hip2FUtO0cxw7BTwaNS8V0zxMyFxndElHlpn2AWBmappm2jDCI5XXMt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722843047; c=relaxed/simple;
	bh=L+M74vZQeXrFJ7Zs9DX32hy+TeQGQ8+ygEOks2os48Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tixVFmvc6x8sKMyubQthbCLiDPlRS+rhEgrFQ3eoGrgi7YQxQrrma8f4EqqDw2y1XiLEX/c2L1uFm2hENBZrMje4a40fT/QbM5UOHzwg+xMsoTPqDmuSxH++qmoInrtV8nk6oaS1zUwYXcYkXS84fyMQbW5tCqIqFqPSyB1clkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XF73iVkY; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f149845d81so71932291fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 00:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722843044; x=1723447844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+M74vZQeXrFJ7Zs9DX32hy+TeQGQ8+ygEOks2os48Y=;
        b=XF73iVkYJ4aSevtwzG0icpxYqTrEHr/7hMEdm83hx9XiYNGssfTeI5S56YwrnT0ok+
         PVbmczyH9pME0SJSZ7OZK5/000zafPMwwNLxQ82oasVOotgvnwEg06s6VRdXH1JErnCZ
         YMK5SCo1mO/btqxfwV3iK8c2Y7zBli/N17ri+CYWvbTAJYN1yV0DB03Vdf5g+KoGScmX
         cLRzqw3mRRsKbDJ0E0Ky5xcJtv8Ws4TdX5g2oWKts47pLVadVF+fcrT5K4/U2JSM3usq
         4i4C1zawRFeUU2jxsbNDkdLBkrwNR6/KWI63pMtn+sFCamDsvW0V2qTtIxQ0wDQ9gAoV
         sPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722843044; x=1723447844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+M74vZQeXrFJ7Zs9DX32hy+TeQGQ8+ygEOks2os48Y=;
        b=GZzxv4HQER61zs3/z0izigo+HPryzj6wWlGa1VSjOUHAWbCf4Fd5+Y8eg55QbPGsDc
         aqQP3ZUKaoAVucig/zqww+tqH4l4E05ypx6NQtVpr5/e9oY5LLhXlIxXzKB0NWH8B0ZI
         Y/oIQB2Exg9IQueEfaLrQd3fW6Urgp6I4NT3EAzQWsPmJVVoDDYcfs+BLxdSAPaGI8po
         LSyXqmSgLtgHq+1XkILdrjrF3m8fOZ0rwbYYoB48xe2X8l9SRtbFmxsIfH87ioz1ajS4
         zgXZYDCmbzE9O/0y1Xhb8OCwXT8CImIp1DdXis0f5pgX56CoONyEUd4TtjkMnS4RV6sy
         mJGg==
X-Forwarded-Encrypted: i=1; AJvYcCVHSV97dP09YeZcnEu7WlE/xBvUZjK9aUX1ZKNauvcULln7jX5ft0Kwlhg3T8yTvX0WaUlZz0hf3mRhMOkeQhiVc0eeajcl1YApwQ==
X-Gm-Message-State: AOJu0YzJoadEDQu18BW9hNQ3DA1wB2ZsLlaeLGr3O0oPNjHPjjmfgZIE
	5VsgedtWR9MmcyBPNWgZIysPu0vXnM37nNtUF6XEHuipq9/+qNvabycaO+W2cEBVR5pednNdGjb
	TBppxufA2B2YFp0JRg8U6xeCfb7L/4kzltbsK/A==
X-Google-Smtp-Source: AGHT+IEjQ7ricigROxn0lScb+/voP0agJ/MZ7YuI0SHXP9zdAk1F7JKQWvMDbrukfXWtMUvvy1y/l3/yOr5Dw8g1POA=
X-Received: by 2002:a05:6512:e9c:b0:52c:db22:efbf with SMTP id
 2adb3069b0e04-530bb36f150mr7789093e87.16.1722843043651; Mon, 05 Aug 2024
 00:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711-topic-x1e_pdc_tlmm-v1-1-e278b249d793@linaro.org>
In-Reply-To: <20240711-topic-x1e_pdc_tlmm-v1-1-e278b249d793@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:30:32 +0200
Message-ID: <CACRpkdbNEAjX+HBGMSfzoD3ykwfpMHbXoOfERcEjPbOC5-TbzQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Update PDC hwirq map
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 11:38=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:

> The current map seems to be out of sync (and includes a duplicate entry
> for GPIO193..).
>
> Replace it with the map present in shipping devices' ACPI tables.
>
> This new one seems more complete, as it e.g. contains GPIO145 (PCIE6a
> WAKE#)
>
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Patch applied for fixes. Sorry for delays!

Yours,
Linus Walleij

