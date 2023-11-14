Return-Path: <linux-gpio+bounces-86-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523167EAB08
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 08:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E23ECB208C7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 07:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3F0125A2;
	Tue, 14 Nov 2023 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIad7yUp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C661311C90
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 07:46:10 +0000 (UTC)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796C81A7
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 23:46:09 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso5318257276.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 23:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699947968; x=1700552768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Mf/xSVIgKoT0Vi/mPJIhzX8ynp76JIll23s2BTYNB0=;
        b=SIad7yUpflxqxpf83VQxSTGPk6Hu6MHX7tRlzqDY8r5wi5TCkmHGEbcnyJzQe7gC7b
         nXWhTJqakofxpcmoIrb6Ufv3YXiR8ArW0XLlYqM8dNCLhQSe4cPA+vYzStxIKufwa69g
         WxGrhUfrxC3L+QG5wT/PIz98EzjcQPITctyvLjLoT7Sa6unQSYn0qhzD9yApsXcQpaVK
         v53JfciT7NANZI25ca/zgsKEzixER5WxKHlz7pRSfLqF/KDFOkbS4/CbK1pqhmkH5gjm
         90aPP1thv40jp0UbighGZBN7bVbNmlvcAjn+aR2tLi53uFTv2rU5Ew27FvbI8YmFASdY
         5GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699947968; x=1700552768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Mf/xSVIgKoT0Vi/mPJIhzX8ynp76JIll23s2BTYNB0=;
        b=rJAu890TMePcaTtXBqf+ESgJUKTJujpTgz+Hl/UP9Cw3LPio4TlFPQrJ2i/CEdZNe5
         z5kFQt1f38+VLMMApUaOftpQ8AtSjwE/GUms6jRM2dMKg00qo2LBuCcAmkgRPSQOllfG
         HEtT9gHYepjEl+DzZKHegpu0SWmBzSfaWDZyEeF+Ro6kwzvaawJqxFvsVucnsQGarHCe
         5d1tfafWQCUKddCi73LOIMSIMzYMR8tkW/oA1S+crhDtHM1RDlq8wD9VP0f4gabdLHms
         NFuL5WC39FzDecuQbMBl9gR/Kewhf43v1UkbGtWgjGBh2SCcftlqaVSNtyz3cwl334FS
         JYtw==
X-Gm-Message-State: AOJu0Ywz+fsll39oMrGm2RkkfGL7XArehgbSe/GYvEbPKiFtgZYkG5b7
	+x2Cxx1TIJgzqrrpU7F7EYKkpyGnlmeBqH9wsGpnug==
X-Google-Smtp-Source: AGHT+IEEljFNVD7ewl/FBBs2hBHC84IGp7EQ3DuxYiXEeUuO4jUVXspB8EmOY9HvHArQbejHw+3p2Th6A9pBuhwJJl4=
X-Received: by 2002:a25:32cf:0:b0:da3:76d3:e4fb with SMTP id
 y198-20020a2532cf000000b00da376d3e4fbmr6843475yby.26.1699947968695; Mon, 13
 Nov 2023 23:46:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231013145935.220945-1-krzysztof.kozlowski@linaro.org> <20231013145935.220945-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231013145935.220945-3-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 08:45:56 +0100
Message-ID: <CACRpkdb14A5z2nhe18VupwPdDvuOXxM68nTrU-drO9nRNhWmzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: lpass-lpi: allow slew rate bit in
 main pin config register
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 4:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Existing Qualcomm SoCs have the LPASS pin controller slew rate control
> in separate register, however this will change with upcoming Qualcomm
> SoCs.  The slew rate will be part of the main register for pin
> configuration, thus second device IO address space is not needed.
>
> Prepare for supporting new SoCs by adding flag customizing the driver
> behavior for slew rate.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patches applied.

Yours,
Linus Walleij

