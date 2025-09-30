Return-Path: <linux-gpio+bounces-26679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C5CBACCE5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 14:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB9D516E2B9
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E062FA0C7;
	Tue, 30 Sep 2025 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VeB6/Iys"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D902F362B
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235021; cv=none; b=W/zmErgWCGL2gAD4DYqtBtzjPmt+TdPMaR7x07PZAp8lJ0O7+1hxdAR6WGdcjEswG0rXdFp2WeDpofDjZDtXzk/gtBuxgqMuIpx020qaVjxkVYnNwFczIOf+j/25OCZj4rQ1YSMVFxdn8Qy4FGP1chSVgoCGysVc80i5d9NyB9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235021; c=relaxed/simple;
	bh=CFblSBEdSaQGPX0Gc4Q+qwyfooSQGZjP6fJV0qhJXws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pk4tv1wD3uWFgss/fBXlKMpZsmo+A/SyoyNqdEqADij2Xmhc+aZcMk1S9i/9S3GwQ8Zt/nt67TjtPewm+W/XBiftGqQcpKS3wf7nhP1yDmygo5h72ZdyPGZsfjKG9Hch0SBF/7uxFz5mEmK3Qtsu4hh2YlNyrFTBozVpRWF/518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VeB6/Iys; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-36a448c8aa2so50415601fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235017; x=1759839817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5mPBHZgztFe+UJNNaee0Rp7S41YshdGbGpEnWAlyw0=;
        b=VeB6/IysHU6UTkhoMmezC0i5vJzBLzgRMh/19vWeF7D8jw5B4rsja9YZjH8aMRw1xw
         CnZvtj8YEFLkBIivPYiE7qkA8wiw3zpREhwRqUpTmJyKNXSBM05vKlRk50IMHcxjvK61
         21g/NhbHx+tQlNcawKDn1+yX+8e5TCgt42WZVwUr37Fpt2nPnf1Vdb5+H5n9GAM7lHQO
         yKw/O0JjBCgSFR9PEGwgdzj0Uf6J3dSFf3ytAkLjdpOcHLhSS+G/lXOM6GkZktOes6Nj
         hSOf2ReqPUGL57uKMz+mxc+yZsO/oIedb/z6PF12QNUw4Bt9iqlfvstfYuJCcorGOB22
         HxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235017; x=1759839817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5mPBHZgztFe+UJNNaee0Rp7S41YshdGbGpEnWAlyw0=;
        b=wWTaRVJJbp4tG0ucS3gncWBkSuaUJItGXv//Y38LlPfpP5VQ6Tc1AzyxEkL/DwXMqx
         9ZlZqM/iNRAil7ZC2ZdUIbpS8syKyHdgTiP05pnRAa+uMEEtfTTOt7RbcBZ0y3fg8rbJ
         nLFTm5KsuhZ+dH8vJqvC56GEWjYXVUlzbSyzXoDhQRTIkqZo4bqe+iA8HnsVGU///mSE
         +C+5rYznXrUlqJa62PlwecpWwZIFidM9Wr+tmf0JSibiCuaJCUtZdxhMa1nRjfBnUMlm
         QaXaEbGojH3k7aYfy1rgEp05+K70x86SQ74n8jJQ+i/1DNc+S4vnVVoMU9FfAyZMXZin
         jqdw==
X-Forwarded-Encrypted: i=1; AJvYcCXZRzHvwHF/ERymJ72ry+uMJ6HCxmiCB0srhkhUjeGbsukI+tNF0X9mNiYhgPbuo/kYRqHu8ryoIvhx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6D0lMT4xgPshW/wk4Mht96ao+NRGI6r2fCg3kzZifq559oSsI
	BYxqCHHo85orpJpq7r2O+ygRfehcHhVZUfKqdSHgt9OV4gHzf1uiKzoHbgtJogXnOwjGECrkrxx
	dcMhMZASDfZUgaupCQJ2YH0OLvtIt02Vfnvymux/Aog==
X-Gm-Gg: ASbGncthICrY9D6WRMdzsXUFFqz3/feRr/JZWT4kloZeUqPo4mISwhVcg87vFUfYO4J
	lrrFnWqSGCQClQP8nWI0AWDQUTU+nJQhbOflBxhR3VdQqAAopFoLtS4QtEdjdST9zGZDlMjdwuB
	tsIM1bqMndqFYsdkoSxo/oM1arbPl4lAkaqMiumEBdPLAFtlFW5K30FEXSPsfZOculqexPIfUjX
	j2SdtICkR6aDE/invUUmgvIqGWppTAvCIu+JQLtCQ==
X-Google-Smtp-Source: AGHT+IGSs2X9ijyFw3JfP/dbcoV1x5reGxsDzHTGImekBQcST65Fp+vF2qwnOoDfoooKD5etndPOpCBR4hOz+YmTkyE=
X-Received: by 2002:a05:651c:1541:b0:363:f65f:ddcb with SMTP id
 38308e7fff4ca-36f7d8c0278mr61009281fa.18.1759235016634; Tue, 30 Sep 2025
 05:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905135547.934729-1-antonio.borneo@foss.st.com> <20250905135547.934729-3-antonio.borneo@foss.st.com>
In-Reply-To: <20250905135547.934729-3-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:23:25 +0200
X-Gm-Features: AS18NWDLuT_uRRtCvqxguuDTeW5zZ6aEk6iy9iHLeu2I6jlVchqTLlkeIzQ-p-Y
Message-ID: <CACRpkdZCKXYEegV1cK6X9A9k8ORLWweBQs40PWYuTof3JgcC2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: pincfg-node: Add property "skew-delay-direction"
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonio,

thanks for your patch!

And sorry that it takes so long for me to review it! :(

On Fri, Sep 5, 2025 at 3:56=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Add the property "skew-delay-direction" to specify on which pin's
> direction (either input, output or both) the value of the generic
> property 'skew-delay' applies.
> For backward compatibility, 'skew-delay' applies on both input and
> output directions when the new property is not present or has
> value '0'.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
(...)
> +  skew-delay-direction:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +    default: 0
> +    description: |
> +      0: skew-delay applies to both input and output directions
> +      1: skew-delay applies only to the output direction
> +      2: skew-delay applies only to the input direction

Unfortunately I don't think this will work, because skew-delay
has a value, and with this scheme we can only specify that we
want this value to affect both in/out, only in or only out.

What happens when someone want to configure different
skew delay for input and output?

I think it is better to add:

skew-delay-input =3D <u32>;
skew-delay-output =3D <u32>;

So the drivers that need this explicitly specified will need
to just define one of these instead.

If you want to be very determined, make the schema
not accept skew-delay if either skew-delay-input
or skew-delay-output is specified.

Yours,
Linus Walleij

