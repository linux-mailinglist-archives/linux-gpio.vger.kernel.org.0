Return-Path: <linux-gpio+bounces-27731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0DC11A0F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93D124E7D93
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C36A32861D;
	Mon, 27 Oct 2025 22:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JtgerWjf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F52F99BE
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603105; cv=none; b=L37H1cOcKhWMxqNRLdy9J7CyWAuJ1pSyFuERaOX2+tsPoIJ6cxTFe0yF6emzZWuR4vAP55K0NT1Ge69PJ3DA3VAVAB6zdp4M9glMC5OpnAzT8szITfori2X7kafe1jR33UKMxGTXjZC7BTRfNUmbcWreiycGcluJ1rjbmiPKAlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603105; c=relaxed/simple;
	bh=/tdW9Tc35Kw3/0Y5blWohgMonE+9zr16T+U6ZKHumPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3aUS0nr5lIhZZfEHc8VXUfOm9cnXFD6yuqqWNVp+/pmz6yy6PCqsnXaHjt53DGwy4TfpfjG1Cmyh8V97Yirc2G0MXOqxQER377cF+e67HNTVmcgkcPwVJqlkFseyvS4RUGZ9sGeKAEkSTcCnCy0HiNI3bjF4k8cmGa5tRzpQ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JtgerWjf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3761e5287c9so61848251fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603102; x=1762207902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tdW9Tc35Kw3/0Y5blWohgMonE+9zr16T+U6ZKHumPk=;
        b=JtgerWjfnNGJGdZJeAneaLeKfq3MYQX1xXHFMiLMj5HLGBgHDbWAgQ4R1Ohs4D1+T1
         CBUT4Ym+w/kAIk/kN4c4UmoN+AXvHSF7FbTRszTrHf00LuS6vWKL716sjcSR6W2IJSVr
         OtF9p2ndJtjkK5ofDnyCxLqt9jY6XRMiWYG9dpFH3MvlZrHwQIkOuDZuWRclU8EnCkjb
         wosn5OsvLXe3S+d8G2rIi6UXYxqTkvb+R/bDCOuC3jRj0Shq0jIMVN0AH6zupNCjhA9b
         BJQQlZ2OKtxwQz4VoVKujIVD4U7z/4lGEFtHIrj4uQcP2ryUEsAC5LAvnR3K+qFBKxzn
         ffCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603102; x=1762207902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tdW9Tc35Kw3/0Y5blWohgMonE+9zr16T+U6ZKHumPk=;
        b=JOVdxn+RkSEkSJVRhScWzcOTJ43cC8hh/DPhOq4uoCRu7u+msgfEKeVvPpVv9L/KNm
         voaN0iCea3yjUvhaNXDt4dcUks9QKWNxILAahVz43G1M8/mv9pW6h//FZLyu7+D0LoDt
         Nq4sJEBJltJ3kPWtyHOxYrKYpbEemMxwNS6O6/juH6rjyyZwg4DUryT58oxoLQeX7MQE
         z/o8ZjpBIq+zjx3wYHhhueIPBXmzrG0YUwHrXZGJV+ORnb3CRY+kNbFDFyWssXaA9I34
         cN7CRuW/RJOGKCZiPV/HpZO7Uk+zKZUDMpb61XXy9XLWCffQuEQGVPVxFFqLPr+a6S/h
         XCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIoBS1Msvm+zv/4g7YUkuKeOKk64Pg1On5vr7dywZepHCHf7GZCUw0TZ04nB12aQgHCklXxz5fDGVR@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpTrDxCQCUnEj9YbXMEez9pD9286GaZiFBTdl58ZeUy5s6Jhv
	jNSwDohMCUNphk6ioSfgoRQQZAIC46ai+T0xKwPWQ/XTX6C411H3ihRXIqjOiLYciKzvKPwVTVa
	2+quwyvd8pN5pvuLch7LI/k1XukIuSclcgWx+U2nUcQ==
X-Gm-Gg: ASbGncu0hG4DGW7UN5FWVriHHQmXNxu/ILzywd/zuhanSRhqMKOsdPGx0p1f88hlmVB
	8q6hCd40kHSGeuqcgoTjbTCarpbPEAoV10Ggjd5Kv8wuY0Zp+EZj1d/lUr7ZW2nZjy0aP+ufuyZ
	kqjiKP7djo+tWLiMEUm4HFxNiT59keYmXuee1tXiPVu/XZ43uJxFoAAYdH6StwTlHACm6WiTOEK
	nPnuJiybrYip+bZyish4sKfo6ZDFWqpkmB7y3JU1+Gzk3Vjihv93a3R9V7s
X-Google-Smtp-Source: AGHT+IFLT1ZdWr/hhEMnm9sTGNuOU2VvPh+C7lrdPQU4P+9e/YVXxLQp3pBZJvB8TttzAJ2Uq4NY4gf67nRQdQ5ZGG8=
X-Received: by 2002:a05:651c:885:b0:372:9505:7256 with SMTP id
 38308e7fff4ca-37907711530mr3518411fa.30.1761603101693; Mon, 27 Oct 2025
 15:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-5-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-5-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:11:29 +0100
X-Gm-Features: AWmQ_bma_Zx4YiWdv5O86TAgEFt04A-92MDE252FFHP4HKRhB_QpFTlP5ImwzJk
Message-ID: <CACRpkdZHYWMezkPq55Xmfj9U+0pALg-DJaR2bKXA95s_ptk8-Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/12] dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put-ps'
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Add the properties 'skew-delay-input-ps' and 'skew-delay-output-ps'
> to specify independent skew delay value for the two pin's directions.
> Make the new properties unavailable when the existing property
> 'skew-delay' is selected.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

