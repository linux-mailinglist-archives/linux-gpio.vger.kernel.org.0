Return-Path: <linux-gpio+bounces-1416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858D4811DD8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 20:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40D8E282BDC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 19:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABA55EE91;
	Wed, 13 Dec 2023 19:01:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881A195;
	Wed, 13 Dec 2023 11:01:12 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-203019328a6so1173544fac.2;
        Wed, 13 Dec 2023 11:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494072; x=1703098872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgYlqP1lS5oACKnGlfkYCQV/6Bt0E45+ypPADdl29Rk=;
        b=Gbx4x/jB9C45b0bh1Dr/EO2OJDWsdco1bV4AU1X3mPx08u1i/QatjlwsKoUoGbqQ2t
         gD0HQ3ByvB/L8AqkFiSenjAjXEMVd/rRXvjFE33+WwmL791lQj2cmeFHfIUXq7UqAlZW
         1A6p5cKjmVnL6RYLIlOnpaROSLgScYppCKJolLHvSzs4AC1qrpKPLzKSw42nk5lhoqZl
         wJJgRExAaRmSoqMGfDv56wOhlw44ox9FuXab6TX1fWnhZ5aR9s2hIatj/f1f4KeMUx7u
         SJy6xghNTCicimB2DMBxluEL8NfjgKW1mgdtSD1oikZkVIucuUoMqw195rKUab+Xq11Z
         sD3A==
X-Gm-Message-State: AOJu0YyuBAHS6/4gCMZYMkjPCH49LyqwILbWOZFl2s8FzxSnJrmN/awZ
	4KppSjUJfi807ntNe8Lk1w==
X-Google-Smtp-Source: AGHT+IHZnGnvgVQVpXGKG5fqp2b0w0QxCZDMe2l/v00+H0c1NvqR/1E8NGOcIF9jyP434RMUtQzkCQ==
X-Received: by 2002:a05:6871:10c:b0:1fa:e625:b4c2 with SMTP id y12-20020a056871010c00b001fae625b4c2mr11432061oab.37.1702494071850;
        Wed, 13 Dec 2023 11:01:11 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id xm7-20020a0568709f8700b001fb2acf9a66sm1070936oab.51.2023.12.13.11.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:01:11 -0800 (PST)
Received: (nullmailer pid 1722424 invoked by uid 1000);
	Wed, 13 Dec 2023 19:01:09 -0000
Date: Wed, 13 Dec 2023 13:01:09 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Richard Acayan <mailingradian@gmail.com>, Rob Herring <robh+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Melody Olvera <quic_molvera@quicinc.com>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Iskren Chernev <me@iskren.info>, linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Martin Botka <martin.botka@somainline.org>, Danila Tikhonov <danila@jiaxyga.com>, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, krishna Lanka <quic_vamslank@quicinc.com>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: qcom,qdu1000-tlmm: restrict
 number of interrupts
Message-ID: <170249406908.1722366.4568269908584190743.robh@kernel.org>
References: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
 <20231208215534.195854-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208215534.195854-2-krzysztof.kozlowski@linaro.org>


On Fri, 08 Dec 2023 22:55:26 +0100, Krzysztof Kozlowski wrote:
> QDU1000 TLMM pin controller comes with only one interrupt, so narrow
> the number of interrupts previously defined in common TLMM bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


