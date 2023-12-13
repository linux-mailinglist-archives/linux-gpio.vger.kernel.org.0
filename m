Return-Path: <linux-gpio+bounces-1413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DB4811CF3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 19:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23ADD1F21683
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 18:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9C16168F;
	Wed, 13 Dec 2023 18:40:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C8411D;
	Wed, 13 Dec 2023 10:40:55 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3ba1be5ad0aso1621479b6e.0;
        Wed, 13 Dec 2023 10:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702492855; x=1703097655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6QChL3UFwengUkFQ589Gbhv55ese1QQ3B9A2PboGzU=;
        b=n18J8HsuKj+FNA87YZYIgu/hdKDtCTkav6ZGLa2CmVc7VAFPeS2dQ5VxhPQi9r0hmC
         vUYh2dMnPhyqgUt3I2KvpvUW11O8IyB54SW9SZXStEVLbHkyU6rQAD7AwnK7ZQsSPBRM
         WCVyfRXMUcA3ViaeedCNmI7Nq48YiviCaYWGdzdc3rDjA1ER6E6qGADYMvJO79Ymfq2+
         pS9jLeWpCBz+bMc4pY2USEjLTXxutuhIpVJRnJGUeJJD/KaD//L0e1RgL0DmvAVRGOD+
         Yj11bhTzdiJrNCCp+YZpsJjFHBlIX9M3pgN1xjUTp/rQnPMDp/9pNH40S6dA/OrxZqpg
         Nobg==
X-Gm-Message-State: AOJu0YxYCxFqMy8Ddkfx5wdXIJGj1X8wjIvZnu3Hcvq2oJn2ArDp3Gzq
	K9RtL7ZKs1xiY054xVVyrA==
X-Google-Smtp-Source: AGHT+IF1/EHzltMGERiH/L5f43NfOspJ45HQqmi+bmGVwSNHWW9thVXvR+THDQl0GwhU16/ZaLTNWQ==
X-Received: by 2002:a05:6870:9e83:b0:203:382c:392c with SMTP id pu3-20020a0568709e8300b00203382c392cmr561942oab.72.1702492855044;
        Wed, 13 Dec 2023 10:40:55 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id mm3-20020a056871728300b001fb05cf9dfdsm4065102oac.19.2023.12.13.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 10:40:54 -0800 (PST)
Received: (nullmailer pid 1699960 invoked by uid 1000);
	Wed, 13 Dec 2023 18:40:53 -0000
Date: Wed, 13 Dec 2023 12:40:53 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, Andy Gross <agross@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Martin Botka <martin.botka@somainline.org>, Vinod Koul <vkoul@kernel.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org, Danila Tikhonov <danila@jiaxyga.com>, Abel Vesa <abel.vesa@linaro.org>, Melody Olvera <quic_molvera@quicinc.com>, Stephan Gerhold <stephan@gerhold.net>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, krishna Lanka <quic_vamslank@quicinc.com>, Iskren Chernev <me@iskren.info>, Richard Acayan <mailingradian@gmail.com>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 07/10] dt-bindings: pinctrl: qcom,x1e80100-tlmm: restrict
 number of interrupts
Message-ID: <170249285252.1699898.2447894163438031564.robh@kernel.org>
References: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
 <20231208215534.195854-7-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208215534.195854-7-krzysztof.kozlowski@linaro.org>


On Fri, 08 Dec 2023 22:55:31 +0100, Krzysztof Kozlowski wrote:
> X1E80100 TLMM pin controller comes with only one interrupt, so narrow
> the number of interrupts previously defined in common TLMM bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,x1e80100-tlmm.yaml       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


