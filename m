Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEFD9C299E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 00:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfI3WdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 18:33:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35799 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbfI3WdE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 18:33:04 -0400
Received: by mail-pg1-f194.google.com with SMTP id a24so8191636pgj.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2019 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=rmkqYB8bmzjDztcgVj4PfkZkIB/7SRqcGvT+pK2NFao=;
        b=l/gXDbiy1YenXqFl2lZbKcRYbMIurpnW+XyMpKesD+2XT8Re0PBMl4FbQU1wWzeX9K
         cTj2dGeT/qveI8TMM+I58Bn0TRXXjen+N4MNZ1ttjkMsewSrez0oAq7W85LiaU9I8Ku3
         quWmCD2WM4+9BrBVoqBw7ZnNyAzgZNpA66jaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=rmkqYB8bmzjDztcgVj4PfkZkIB/7SRqcGvT+pK2NFao=;
        b=ZB0yknHaAia21cXkjv4gupftnEDZ7q9xWG+9+PtLMOSi60UQcDjEHfA4a3gVeNEhA9
         W3de2PoHuTaraN8dDhYLDnDHiXLiT9/pI66Nl+e4mcTJMBne5wGVipLVCaZrIqwRXD28
         ohYN8WnMOCz0V5lU52+mRj4q5VY+ijxUDzzbBMeEGNkPjFLrw8xC21yQMmseTzKrcOhL
         7r05feYftCw6PVk+l0+s8xX7Gg13X3RuddoNux7Xg5jjyKwZKjT6Gxr/Tz3GKItR/f6X
         zx1Ayy42jY4wQA0lkNDRuvaPpSFJsdxzODX5ALmAyI9k9vfAqbiXiNLEv3d1yqNC8Xd/
         E0Mw==
X-Gm-Message-State: APjAAAWh8YsaqaKtuMpEl+hcUvriaXFF1dBs+YVE5Z8hr/fodEXQto57
        kYutC//Avux6qKYvfCTRN3zdUQ==
X-Google-Smtp-Source: APXvYqyqekrGA/zBRXYld7eiG9Tkrnhft+G+K3lR7fTCvCFVRPIFeAsqvf/SQiIwvG8YKnVyqqkeqA==
X-Received: by 2002:a17:90a:fb85:: with SMTP id cp5mr1796727pjb.42.1569882783243;
        Mon, 30 Sep 2019 15:33:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i1sm15310268pfg.2.2019.09.30.15.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 15:33:02 -0700 (PDT)
Message-ID: <5d92829e.1c69fb81.d860a.9096@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, maz@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add SPI config register
User-Agent: alot/0.8.1
Date:   Mon, 30 Sep 2019 15:33:01 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-09-13 14:59:14)
> In addition to configuring the PDC, additional registers that interface
> the GIC have to be configured to match the GPIO type. The registers on
> some QCOM SoCs are access restricted, while on other SoCs are not. They
> SoCs with access restriction to these SPI registers need to be written
> from the firmware using the SCM interface. Add a flag to indicate if the
> register is to be written using SCM interface.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt   | 13 +++++++=
+++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,=
pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.t=
xt
> index 8e0797c..e329f8d 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -24,6 +24,9 @@ Properties:
>         Usage: required
>         Value type: <prop-encoded-array>
>         Definition: Specifies the base physical address for PDC hardware.
> +                   Optionally, specify the PDC's GIC interface registers=
 that
> +                   need to be configured for wakeup capable GPIOs routed=
 to
> +                   the PDC.
> =20
>  - interrupt-cells:
>         Usage: required
> @@ -50,15 +53,23 @@ Properties:
>                     The second element is the GIC hwirq number for the PD=
C port.
>                     The third element is the number of interrupts in sequ=
ence.
> =20
> +- qcom,scm-spi-cfg:
> +       Usage: optional
> +       Value type: <bool>
> +       Definition: Specifies if the SPI configuration registers have to =
be
> +                   written from the firmware. Sometimes the PDC interface
> +                   register to the GIC can only be written from the firm=
ware.
> +
>  Example:
> =20
>         pdc: interrupt-controller@b220000 {
>                 compatible =3D "qcom,sdm845-pdc";
> -               reg =3D <0xb220000 0x30000>;
> +               reg =3D <0 0x0b220000 0 0x30000>, <0 0x179900f0 0 0x60>;
>                 qcom,pdc-ranges =3D <0 512 94>, <94 641 15>, <115 662 7>;
>                 #interrupt-cells =3D <2>;
>                 interrupt-parent =3D <&intc>;
>                 interrupt-controller;
> +               qcom,scm-spi-cfg;
>         };

This overlaps register region with the mailbox node. That node is
actually a pile of random "CPU" registers used to ping remote processors
and apparently control how the PDC interacts with the GIC. Maybe this
can be changed to a phandle and then the driver can interogate the
phandle to determine if it's the SCM firmware or if it's the shared
mailbox register? If it's a shared mailbox then it can write to it at
the offset it knows about (because it's sdm845 compatible specific) and
if it's SCM then it can use the hardcoded address as well?

Basically I'm saying that it just needs a phandle.

	qcom,spi-cfg =3D <&scm>;

or

	qcom,spi-cfg =3D <&mailbox>;

and then driver knows how to use that to write into random registers.
Maybe we can have an API in regmap that finds the regmap for a given
device node? That way we don't have to funnel everything through syscon
for this.

	of_get_regmap(struct device_node *np, const char *name);

Where NULL name means "first available" and then do the devres search
otherwise for a device that has the matching node pointer.

