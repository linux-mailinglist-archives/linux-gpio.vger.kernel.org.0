Return-Path: <linux-gpio+bounces-1409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A008F811CE4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 19:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C9E4B2120C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 18:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4985FEF4;
	Wed, 13 Dec 2023 18:40:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E521F3;
	Wed, 13 Dec 2023 10:40:24 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b9db318839so5191140b6e.3;
        Wed, 13 Dec 2023 10:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702492824; x=1703097624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9q0N5+I2XeAWa13qGmbU24vDxavw3qyT6Mq11LfmaY=;
        b=wCn3bU0rvyRJUa1Z0cOqcEBq/lilfchX69j1CWgpBwFoeZ3f03Iv7RD7Vrm3f7PaFl
         MKfhyqsPeDQIj9/3buU0IvsanRLqP7/euWTul+RyYSzosajPbbU4r/84HWpKVD1QMMXv
         tosnhRr6+UEPG636hTQDV0vgJ8rahVe/kEv23Fz0eh03k1lRuKyqCg9V8BCG/sc+oHt9
         84oMmqkDwlQVBESkqXrO5LfvCwZqxAzkug4daiVbfpgOonJRLomag15SwjO9SRrCivLs
         xn2FHxDzzPUynBPxCL+uAk2v1bCSlU3O5cp1DRYgAMt8E8JA6fBRGcMpfyg4B32vlDXj
         tJ/Q==
X-Gm-Message-State: AOJu0YxD3wyCQ/IB+eJOr6HCi90Nd6K61m/Fj6TBfOOU61I5B2l2hiPN
	dTIBmOtk7ROLlC2lAqUj4w==
X-Google-Smtp-Source: AGHT+IFf1Cdi45kqzXGyoK8dJDdcjhO/uHBOKivm/Xv5cLfIp9q4l0hsbHNuiGZ0drgHp1kW9hHNDA==
X-Received: by 2002:a05:6808:bcf:b0:3b8:ba0a:3460 with SMTP id o15-20020a0568080bcf00b003b8ba0a3460mr9656391oik.17.1702492823823;
        Wed, 13 Dec 2023 10:40:23 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s17-20020a056808209100b003b6caf2accfsm3042792oiw.22.2023.12.13.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 10:40:23 -0800 (PST)
Received: (nullmailer pid 1698952 invoked by uid 1000);
	Wed, 13 Dec 2023 18:40:21 -0000
Date: Wed, 13 Dec 2023 12:40:21 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Martin Botka <martin.botka@somainline.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, Rob Herring <robh+dt@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org, krishna Lanka <quic_vamslank@quicinc.com>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Iskren Chernev <me@iskren.info>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Melody Olvera <quic_molvera@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: pinctrl: qcom,sa8775p-tlmm: restrict
 number of interrupts
Message-ID: <170249282088.1698893.2429891810348063745.robh@kernel.org>
References: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
 <20231208215534.195854-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208215534.195854-3-krzysztof.kozlowski@linaro.org>


On Fri, 08 Dec 2023 22:55:27 +0100, Krzysztof Kozlowski wrote:
> SA8775p TLMM pin controller comes with only one interrupt, so narrow
> the number of interrupts previously defined in common TLMM bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


