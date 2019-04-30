Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2CF101D2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2019 23:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfD3VcX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Apr 2019 17:32:23 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55390 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfD3VcX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Apr 2019 17:32:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id o25so5355492wmf.5;
        Tue, 30 Apr 2019 14:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qGEDZIrjz+mZmi3TRXtVhlxe6rs7vi4QvUIAjTZkRLQ=;
        b=oUEPYUjqIjo/FZz6WHyKmra5hz4bPQkSPi5JdIakP3dbnIg2D2UEnuIeO1iLg0jPJj
         k2sW3NA0LkNCvoHFugZpvbbDOX+i/8Wv2jtLIMOItgI/OZ/A6qUhCcG85cUTqurEztHy
         dZAfcC2TuCz5h60C6oWp8BTY43IGEqlcZgC58nTuMnd8hRX/0NQnMfzxvOpxYyhc3o8z
         OtV8teIu5mptdYUHUzv716US8zx1P8YOgpkI1CnFJTL6CmyMcbcMcBYpTC9xbMvhB0KT
         wcpL4me7A4me+CEOlfLQ+jCfj9/NoX9bQrPXdDTv9e+aNJ+eQPOMloiBOLV3iNex0Eii
         JwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qGEDZIrjz+mZmi3TRXtVhlxe6rs7vi4QvUIAjTZkRLQ=;
        b=dwkdKR6iWR2jF/k6zDtxvTT4QrX+5eulOTrQ+ZzjNm77rd7f+YTVIuFB4pbFIrG+Fy
         PhYpT+pTJtk2tD8tezjJtvftcp4Oc1GrAx1h2GQ0L1hKj1DQbkdGSX3QcGgpArhy0riW
         +WK1UO7byQUwBpdGGtArSZhnikhIJYk2trZoaJHxPCZKnErj+5x29X2cqMZ5rocCxYPX
         ZcywJJu5BFK6NB+FMuZj5G/8o2+Mi0xCq5B9+l751bWI5vvV6p4AH7isaSeTB3/qwS9g
         FnbeZ46FzAZrVM2IAt0F1iPIZTeaPyx+f6gGVYSgkuEdYtUZJMYLUaZIRkqR+TXMhoEH
         5Pmw==
X-Gm-Message-State: APjAAAWm0G3yuPEpW7YX93D5EiI1NBIrkGgK0avMyLlXLf7/MbtgWl2d
        GrBVLGRJjOSjV1lmw0Ke+nU=
X-Google-Smtp-Source: APXvYqxKKbif0nHIaHfQBzuoLjB4rzTfApWlFrmWlpG76VJITPiopj1mzxN0Aa/zB5DNjkC1/wHcsQ==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr399063wmj.136.1556659940431;
        Tue, 30 Apr 2019 14:32:20 -0700 (PDT)
Received: from debian64.daheim (p4FD09424.dip0.t-ipconnect.de. [79.208.148.36])
        by smtp.gmail.com with ESMTPSA id c63sm5263700wma.29.2019.04.30.14.32.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 14:32:18 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hLaMM-0006lQ-3O; Tue, 30 Apr 2019 23:32:18 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Fix spelling of bias-pull-up
Date:   Tue, 30 Apr 2019 23:32:17 +0200
Message-ID: <2683948.V7X3pFLLSZ@debian64>
In-Reply-To: <20190428150822.13935-1-j.neuschaefer@gmx.net>
References: <20190428150822.13935-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sunday, April 28, 2019 5:08:22 PM CEST Jonathan Neusch=E4fer wrote:
> The property is spelled 'bias-pull-up', as documented in
> pinctrl-bindings.txt.
>=20

I also sent out a patch for that... back in 2017:

https://patchwork.ozlabs.org/patch/763151/

It's marked Accepted and Archived.

@rob ?

> Signed-off-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>
> ---
>  .../devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt        | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt        | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt        | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt        | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt        | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
> index c2dbb3e8d840..4e90ddd77784 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
> @@ -42,7 +42,7 @@ information about e.g. the mux function.
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
>=20
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth,
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth,
>   output-low, output-high.
>=20
>  Non-empty subnodes must specify the 'pins' property.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> index 991be0cd0948..84be0f2c6f3b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
> @@ -44,7 +44,7 @@ information about e.g. the mux function.
>=20
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth.
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth.
>=20
>  Non-empty subnodes must specify the 'pins' property.
>  Note that not all properties are valid for all pins.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
> index 7ed56a1b70fc..a7aaaa7db83b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
> @@ -42,7 +42,7 @@ information about e.g. the mux function.
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
>=20
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth,
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth,
>   output-low, output-high.
>=20
>  Non-empty subnodes must specify the 'pins' property.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> index cdc4787e59d2..f095209848c8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
> @@ -42,7 +42,7 @@ information about e.g. the mux function.
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
>=20
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth,
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth,
>   output-low, output-high.
>=20
>  Non-empty subnodes must specify the 'pins' property.
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
> index c22e6c425d0b..004056506679 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
> @@ -41,7 +41,7 @@ information about e.g. the mux function.
>=20
>  The following generic properties as defined in pinctrl-bindings.txt are =
valid
>  to specify in a pin configuration subnode:
> - pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-stren=
gth.
> + pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-stren=
gth.
>=20
>  Non-empty subnodes must specify the 'pins' property.
>  Note that not all properties are valid for all pins.
> --
> 2.20.1
>=20




