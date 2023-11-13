Return-Path: <linux-gpio+bounces-67-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B99E7E9DF4
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05285280D8C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB5D20B22;
	Mon, 13 Nov 2023 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilmlLb13"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C676208CC
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 13:58:42 +0000 (UTC)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E679ED5F
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 05:58:40 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-59b5484fbe6so51208587b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 05:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699883920; x=1700488720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZgE4RyaZYwPpDpDmOy4ALqEOGv9gIKIVZc2rBCan1U=;
        b=ilmlLb13j+wiuAfTgXWQj8IzVwYmrCiZa5VYqZcOOVeGmbRkzLpx9PmeUHU28seZ7+
         kBvAdsG8On5pAqEmZb/8QB/K3g23xJemuQ2GwO2f8ExJllJcMrJFPJHZtR9ILQTP0Zwo
         v367n21Im6a5N472QdhmrYEpPRCXD6U5OB1EUiVVl18YCE76FRaYw18Z2vLfPY8lmaRu
         fxol6/RnIfx2I7gm/S4EW5bV9zElaOMkD24w5x6cv2ykBXpzz14Q43u2LXOVktZhIJM5
         pZoKFf5ogtwRnNBsVP0u4OPXSXehLFg2p8ijG6JxixUgI3jJyoXWxU4rX+8Yy2EF/Yis
         YFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699883920; x=1700488720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZgE4RyaZYwPpDpDmOy4ALqEOGv9gIKIVZc2rBCan1U=;
        b=C0SDZdNWXJqYuxrzCgRGb4PEezHrg9Xli0lIqU7djbXNen2mI+TS+kKgOaitG/0Hfe
         a4uvnMEmWx8iUYRG30FBzcUfpZk2xz9K6me6/M3hxSeRZpE6Nbri0xvM4FcDx0MFszin
         OXwV6HhG5LZSY4hIVJUoovDb6SIsTA1dvoo2VpiL3McTEdlvW7+d4dlFAZjBfvlmFCd7
         pIGvcgKcVMv5YZ51AFeLD1XYw7ei4HCcjK21v3gmU79WGRNylkILm+aSxdYZPDvYdPPu
         mkeA0zYfaCYblKsUO2RZWmDcHkOBmOUv84hw+eqXj8nQ9FS1ktuomac5WOOCE1cxHWLE
         gzsA==
X-Gm-Message-State: AOJu0YxcaiBhcsR6YEK73ghIhGwtseVXzlH7TNfUP2WjH0zCTuZ+KZ8x
	cSEWjKkP5/RcPZ9cjCLK9Fs4FMh68iy/9v89fvLDYg==
X-Google-Smtp-Source: AGHT+IG5c3s+o9BrWyZQxJS5cVO8U/DkjOW+r6e+D50agoGCB9Gj+0P+5CyAq0JBqKdwRUbTr85e+HJ5+N/ikQE8cJM=
X-Received: by 2002:a81:7c45:0:b0:5ae:fd4b:f06a with SMTP id
 x66-20020a817c45000000b005aefd4bf06amr7443270ywc.30.1699883920153; Mon, 13
 Nov 2023 05:58:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231027093615.140656-1-krzysztof.kozlowski@linaro.org> <20231027093615.140656-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231027093615.140656-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 14:58:29 +0100
Message-ID: <CACRpkdYtzAi-jPsPExvgXvj8i0m9QACzvd20cOLy7nrfAq=Dyw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl:
 add SM8650 LPASS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 11:37=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
> of Qualcomm SM8650 SoC.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

Yours,
Linus Walleij

