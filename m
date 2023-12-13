Return-Path: <linux-gpio+bounces-1411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6E811CEB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 19:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 963681F21AB3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 18:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4755FEE1;
	Wed, 13 Dec 2023 18:40:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52FE5115;
	Wed, 13 Dec 2023 10:40:39 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3b9e6262fccso4483084b6e.3;
        Wed, 13 Dec 2023 10:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702492838; x=1703097638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZqgf+NEHlDMkFq7LELFGKj9ja6j83ZZDIMHua0p/B0=;
        b=qlLjtYHhnM0Txdsla4MPj3eL0rPRY20LjwddVj7d1BORGiPxnYYPgSx0Z+z1sHFpcy
         EbuE998Vtk2NcWDSBVXJEsm7m+y4SUpErnQr2XHFNFVShR3K+5Z8Tze1ANAMsvmwDFWp
         YftKI933lJal0OZgNLKwGzDIb35ipTJ9Y9q2Fc5/gthETWXj0ygLmM4ZdtQz7OCyeO2U
         jn1SGFt3phnsSmmJd/PIKXiXys4JwIrrIM3JWOMu3ZllzfB6uaCrD/PEDK5Y2pokvyfC
         NhxGpIxlF1AZgw5zFWbkmMTEFdKuv0XZluSiWBd9bX4J54Lka3eLeZUye0kKc7kHmvQs
         B2hQ==
X-Gm-Message-State: AOJu0Yzs+xEKWaZk2a2rgCjSD+t/GFVX93P20d66BWyR6ztD2+4yE/4l
	yCJIEtB8euivItAv+JDNYQ==
X-Google-Smtp-Source: AGHT+IHtDotQAiV0YdzAJz3QxciCuKH8qD00YpcKsOvdg7C0hMME/WleZlH6/RTbjinwJZngn0GRIg==
X-Received: by 2002:a05:6808:1312:b0:3b8:b2c0:e30e with SMTP id y18-20020a056808131200b003b8b2c0e30emr11800606oiv.40.1702492838564;
        Wed, 13 Dec 2023 10:40:38 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 6-20020aca0f06000000b003b8b28a3ef6sm3034972oip.14.2023.12.13.10.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 10:40:37 -0800 (PST)
Received: (nullmailer pid 1699435 invoked by uid 1000);
	Wed, 13 Dec 2023 18:40:36 -0000
Date: Wed, 13 Dec 2023 12:40:36 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Rajendra Nayak <quic_rjendra@quicinc.com>, Danila Tikhonov <danila@jiaxyga.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard Acayan <mailingradian@gmail.com>, Rohit Agarwal <quic_rohiagar@quicinc.com>, linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Iskren Chernev <me@iskren.info>, Melody Olvera <quic_molvera@quicinc.com>, Martin Botka <martin.botka@somainline.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, krishna Lanka <quic_vamslank@quicinc.com>, Vinod Koul <vkoul@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/10] dt-bindings: pinctrl: qcom,sm8550-tlmm: restrict
 number of interrupts
Message-ID: <170249283593.1699383.3944942647536894581.robh@kernel.org>
References: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
 <20231208215534.195854-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208215534.195854-5-krzysztof.kozlowski@linaro.org>


On Fri, 08 Dec 2023 22:55:29 +0100, Krzysztof Kozlowski wrote:
> SM8550 TLMM pin controller comes with only one interrupt, so narrow
> the number of interrupts previously defined in common TLMM bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


