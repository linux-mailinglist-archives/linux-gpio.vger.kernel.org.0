Return-Path: <linux-gpio+bounces-1414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A19811CFA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 19:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 962391C210C3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 18:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241875FEFF;
	Wed, 13 Dec 2023 18:41:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835E8132;
	Wed, 13 Dec 2023 10:41:04 -0800 (PST)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58d18c224c7so4223462eaf.2;
        Wed, 13 Dec 2023 10:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702492864; x=1703097664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GApytf5zd3HedE4YtyMQvyink5D7WZ+JVppacCKW0bE=;
        b=iy8McC766skF55l3xY7RjQNZShxRJVxKLTbDob3FckkczMsMWpd0xOaLKravE3ztd4
         g+rlrgX2KWI4Y6zG8PgHnTg3PTeUe7xIr6k3e6eSsbsZ8LJjPIKG54tS9Qw4Gg+Goj+w
         z6m3km1My57QEbYHgzP5uUs5H7LZBrqHqrw8FCeCUW1dT0pfb/wOYpd5ykOvHEdVErP7
         hXU9wH6VCqmZxr2joOxREIF5JNC4FkJTskcwrGd8gxyu2YMBO74rkwf9wGjbLs9PKl92
         EAlQ5WOXS4swVm9QTlh+R2HL2TvNhXHdF2l/b2ZFQFVeVSs8gexR1axvUbKEI+e+/ECP
         OgvA==
X-Gm-Message-State: AOJu0Yy/2/Oi0cyBKsvtS3Z11/u8aOGzTImZTeo8b74O5hxJhMgiqxXA
	XysVuOgt3m6O9Cmzuzzl2g==
X-Google-Smtp-Source: AGHT+IEpsqMnI2RuTPR1npBFERSHk/mbjBZB9C+yhEVK2+merF2cVHSj5MBVOzcGye5qDwiPet6tcg==
X-Received: by 2002:a05:6871:4592:b0:203:4116:7c6a with SMTP id nl18-20020a056871459200b0020341167c6amr41788oab.9.1702492863843;
        Wed, 13 Dec 2023 10:41:03 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id er5-20020a0568303c0500b006d9d144786fsm459597otb.79.2023.12.13.10.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 10:41:03 -0800 (PST)
Received: (nullmailer pid 1700223 invoked by uid 1000);
	Wed, 13 Dec 2023 18:41:01 -0000
Date: Wed, 13 Dec 2023 12:41:01 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <agross@kernel.org>, krishna Lanka <quic_vamslank@quicinc.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Melody Olvera <quic_molvera@quicinc.com>, Rohit Agarwal <quic_rohiagar@quicinc.com>, Shawn Guo <shawn.guo@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Martin Botka <martin.botka@somainline.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Iskren Chernev <me@iskren.info>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/10] dt-bindings: pinctrl: qcom,ipq5018-tlmm: use
 common TLMM bindings
Message-ID: <170249286116.1700175.10412340857459190095.robh@kernel.org>
References: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
 <20231208215534.195854-8-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208215534.195854-8-krzysztof.kozlowski@linaro.org>


On Fri, 08 Dec 2023 22:55:32 +0100, Krzysztof Kozlowski wrote:
> Reference common Qualcomm SoC TLMM bindings to drop commonly used
> properties and also bring other schemas for common definitions.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,ipq5018-tlmm.yaml          | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


