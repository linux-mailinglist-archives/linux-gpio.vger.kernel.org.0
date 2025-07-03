Return-Path: <linux-gpio+bounces-22770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F0AF831A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 00:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581B61C86F00
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 22:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB8029CB4A;
	Thu,  3 Jul 2025 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANj8kmoT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2427080E
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 22:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751580283; cv=none; b=ulXODTBR63y1mvIEEG9hCDdpFt4dmETXhy/xjQoc7PWnTowpyV+cYXCUL2fjXRafHLEBlIzpFQMTlHu7478FJR6GbXT6sbjCvaQP3ZU3nsuAXeYY+egLGnSO1G3wN8B7PpKrJ1+OncwzAZEPZEcSrxXt9BjwtrjhITxFOaA8yAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751580283; c=relaxed/simple;
	bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=spvsI4nhJAbqkdQOEaWkODK2ks6E2UB9f/yWdHuvUNj72tY9qbroHqfa3YHsbtGWroIl6UWftJ1PLflQhWhEYOxH9qOtUBf8nMUxr4K1183SciK7rre+yqu7NYp/JmXyZs48JqYTksqL3xGgVByGOVxvIgs6Jyvkix3CmNR7mSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANj8kmoT; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b910593edso2745601fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 15:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751580280; x=1752185080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
        b=ANj8kmoTEkEyXEz+7Zfl8fWKE0C4id12ZxKjRwLDJb0W+dShbDpwEwSbwJJ/yvFWP4
         pHeT1ScfDZpdLswr+j2WQ1gfQHj7nP5hPLhDCpGzEXmZCBq5Qy8MIqoLwLDVr/dMldhi
         M9+8wSF4gPnrm5skus1RY/YErKAS/HbcQAAsRDLVMaQNgF0jc5d050dZzoEV3cMNdtQ+
         dHe9M7xFzP8L7oFJaeTXHSKPLP5elmn4X7MCPQFX0Ioml920VbVwGl+5XGwCU/lyRv/W
         7jsuZULL7eKmGVY2akXbf0wZUEMvqKIc/voHFYDIFaTkFRej47nWPPjBvQl3gskUF+UU
         zsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580280; x=1752185080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
        b=qcHuVrqvrHVC+TAYlio7FSL2M26AdnVAKcBf3jEmNu+uKob/9kW6ZzFXfK3x/kD1lF
         U8oJAUbBevzMpAbi/9J3QB6VkOyRE397OQH6sUCTHvnm3tYDypALR7wERPQQl0AJ2kGJ
         K798lYqtSyxPIZaIsRlsU7LnB3JP4Y4UDef/8t2RXCPdh6yGGYwj0zHCo2swGL6wTqjn
         +cztFst5y5miNAqN1AVexr0ed368OGo/pk5Y4TL2GjDzqfyLLu/ueig9SmZiur6oNjtJ
         H+AU9MyrHZ3loNqVXmqRuzYYCeqMNzieBfwpUBZigY2EBw2vPHR+aThG5wtfqQgfSC5o
         ZaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzWpN0Zr7mAdhqBIYwFuNlCOTztJsIWmULLjba69FJvxQ5w+96EyNLkkE102mOORtC1hvVAvfSW/3N@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNTGgHqb8D1olOetxYM+mNCHyjpXkhC0hXFR6xeG0NyuojozL
	tmCNf5PlH6ZhwGyH1Ad+E0xt9e6W3sW7lYZLfRVUMKYKYEG5TRvD033fFpu12xqQDRKra+FkSdd
	JDCBS/YhNYjuiiIHqrwaHqA+zJ70lzumbj0j7CZy4d5+vu5pAeATlmWU=
X-Gm-Gg: ASbGnctww/H685aGfoSfIhw3taXC9JKUJFkBWAoBfTyehiY1cE/OJE48wVTHH2W4e3j
	WavTmFb4GMBerfWMaxKcPoRTd9Bo2w55XxOPJkeoj601PmeoFj7GTXCe2phCnz2IeaitRI6aOZT
	OHORIcVLYNmc214PPJTR85e7il8FyEQhcTBjrflfiuRSk=
X-Google-Smtp-Source: AGHT+IGImGMP5Fq/y4gpdZAXe/bNUj9t48oLyRIX8c3HTSvwJygjhM/8i/8L71e57dTnyWSS9tDnQTa49ULtKebAmMU=
X-Received: by 2002:a2e:8a8f:0:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-32e5f581285mr443871fa.10.1751580280107; Thu, 03 Jul 2025
 15:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610152309.299438-1-antonio.borneo@foss.st.com> <20250610152309.299438-6-antonio.borneo@foss.st.com>
In-Reply-To: <20250610152309.299438-6-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:04:28 +0200
X-Gm-Features: Ac12FXyERrVVYpDPvl_uPGT_I6xGEjEKe5SU2NHnd5_uoaadOpsZN_FvQyb9INI
Message-ID: <CACRpkdbKNDr00y9-7gL5vixuvtdx7WgkPh5krGKkW9fNizx_HA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 5/5] dt-bindings: pinctrl: stm32: Add missing
 blank lines
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:24=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Separate the properties through a blank line.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

This patch 5/5 applied to the pinctrl tree.

Yours,
Linus Walleij

