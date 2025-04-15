Return-Path: <linux-gpio+bounces-18814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E6A895B8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 825D6189B5CB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7811E27A129;
	Tue, 15 Apr 2025 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dChm3LZt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512D241CB6
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703627; cv=none; b=ZNyZz6XweXo+XIdKs3dhL50Up5zwUZU7TezRD+Up8O0+k3uR5qCEQYd58lxyJEyXF/IYyzP7FIHOYJmVQhJBH/4aEvq3aEveGh0hHyQkiyRnw6ksAbP2sMDh82KO3aVWlNZTHuhy0WqznrzZnrhTHKMLgBz07FJUjyPhDW86CbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703627; c=relaxed/simple;
	bh=D8NpYL/6xc4mr7rrNU+oPdbCsWAv+ESU6uE3kXfaDzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7KAUHqjRVhy9xiwHTnrENAoLDaHvGFoD+3itqRXKlo1HQwWBSSf7wH98PUSuwBJjLiv0CO24D4DZzEMOEoiEfzGsFIoyN841abHIcnJFyEZFqhXXXcP9Ljs2k/Vy2FtJ7x/YIBPOg/fSGkE3EJzVzQe+GubMTUYxN8ESKtnEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dChm3LZt; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso49832481fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703623; x=1745308423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STeju+4F1b95dfzySAiJo7cZAG36EwjiVO/ehg7xZ2s=;
        b=dChm3LZtMY/5rCSraiXcD52sLsrjf6PMWauL0YKQIz7B91TLRzWYg9rOUl1iN8scxy
         j0mNrOWInzR6IvGGxTIls5S/0jYFwihPAi7y6/FssajqdyaBl4C02nCddg6efR4JG/7O
         pyUwXBi95e9LR6xPryrePCaahxIRGFFGBupfQ0d8e9VNZX2szxAG5ephPs10dAHnUQP9
         FOR1/fJD7BwpLDJjEgHsJ5KVT83qRA6h2bHgr4JRkoE6ck/NSF/01TTOuIpAHg/UBO6N
         PW875WwUG89gSNQXV/uXI0RlGxQXYCXFGGT9Nf2ds0688HYulpD1LFH7iD41rOzlKn3A
         PcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703623; x=1745308423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STeju+4F1b95dfzySAiJo7cZAG36EwjiVO/ehg7xZ2s=;
        b=fTxMxpbSSC6lXIWxD4h4jSvUbcTIYrLZoCcHZgglWPw+KgMAaEG4hMcDBRewVxk/vQ
         y7mnZChHLFXfq2WvT3tqYFNlMeOTycUeFKWK2VfeknbOhDU6agyJe8hFp/t8wC6BZk9O
         pGOT+TeYd1ufBXh6/rD9yblrniWQn0KFIC0jSA7kRDeNMMZ/ZDAea3XPBaYwISY8doG2
         VAW9/I+gGcoCPpvEbazwcxSbk02AWdkyYWMqrIDZpciQ4zJC3ndefXLMC0yP8u8QMtOn
         rRtSEN9n0Q5IRGkfnro5dgKDzqNw3uXcIkfTf4aUT6Tet9rW/OyzD6s1HQ/9PYHbNk7d
         z9Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUG+smYI8l6l/JCYEDjIC19wASFyr4EICn66SJLbMA0Myfk8PQYxuRMFWGnraCDZnmg+/TGyTiO3roa@vger.kernel.org
X-Gm-Message-State: AOJu0YxDD5BOgzIT/BjffFIio6zlpvxGyq3KtCoTwR59X2RZwJYDTx5U
	+kw3hPMQEzM/BNGRZB5CUb7o5JfirX5KaRI4/n52gXm6BF18OyW3DFqIJfIPTxi8m0XnzENYw6u
	92UR6wxcP8rCj+Am3tKJ+ZJrpM2776IIi969eNQ==
X-Gm-Gg: ASbGnctjnXf/qBilBPJ0ywOEZGFlT/GCIVo7VxvMgBA0eulZLpOrJenUZUGr0jFgjOo
	YBMAE+qX63YM8Zwol/8Ha+DPMoLNY8jJv5+FUSS7gvAHL/y0EBWEv6L24UkN5bGQhTOmUTEN+xr
	SbRGaAbFAUsdIxUPJVd+6jwA==
X-Google-Smtp-Source: AGHT+IFJ5QnEuy843kC3TQMpuk9QiZ+X6rbvXcL4GPOFqhedgkU8pg1nIDK1g44GiFTp9uNBiCz3X/eFYBa7DllDIzw=
X-Received: by 2002:a2e:bccc:0:b0:308:e54d:61b1 with SMTP id
 38308e7fff4ca-31049aadff2mr53751861fa.34.1744703623274; Tue, 15 Apr 2025
 00:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401072725.1141083-1-ping.bai@nxp.com>
In-Reply-To: <20250401072725.1141083-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:53:31 +0200
X-Gm-Features: ATxdqUF6WJDaLjHdYSkCvv_YDIUzSOmPWDnDqBmf7i0pLM0MKIXzIz4bzkS8nS4
Message-ID: <CACRpkdY5XdzVxbNhw-nv5EL00NNqrJLiwc0B4O6somUo1gjNxA@mail.gmail.com>
Subject: Re: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacky,

On Tue, Apr 1, 2025 at 9:25=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:

> Add support for i.MX943 pinctrl.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
(...)
>  static const char * const scmi_pinctrl_imx_allowlist[] =3D {
>         "fsl,imx95",
> +       "fsl,imx94",

This binding is missing upstream, can you send a patch to
add this compatible to the right yaml file as well?

Yours,
Linus Walleij

