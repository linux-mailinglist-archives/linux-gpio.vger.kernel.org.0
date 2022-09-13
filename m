Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464ED5B6ADA
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 11:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbiIMJiS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 05:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiIMJiQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 05:38:16 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE760371A6
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 02:38:14 -0700 (PDT)
Received: from [IPv6:2a00:23c6:c311:3401:3457:2607:a1fe:e127] (unknown [IPv6:2a00:23c6:c311:3401:3457:2607:a1fe:e127])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: martyn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1EC106602004;
        Tue, 13 Sep 2022 10:38:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1663061893;
        bh=AFokgaXLHdGtGpiU/FL48ZKkAp+UyEPOCfFkWc3V6F8=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=bLkCWamXxtRaf8UrumVedy+J5Gnm8l3sZLqmnZsZsWp+wIIn/vmpmzesF0bjWsBiW
         VW/z/ZXWj0L/CHokD2lT3DSA18yyjxjXEKKEVeWm+bRdvIySYtplT5PsmDBw24YzHB
         8YWVvm+6KDrxdVZ7QjPA+TUVewHEKenGRbZqVnsgAO4WdY8UM3rT+pxdAhZ8uUS1lX
         iR0ABa9bhNI4CI0XVUNu7Ewx0P+TyapcZlBZrzfOLnIUlh8bokBaLGXLs3b8gHE6A5
         P/PRO8axM8wUNeJGTZ/Emv6iVSD2B405mpvkM3xLY29p3N8rz/o9fTumQujeplyK9Z
         6y4TCf2zITBNg==
Message-ID: <65b704e27705407dff96c2376255459b196c2fd5.camel@collabora.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: gpio: pca95xx: add entry for
 pcal6534 and PI4IOE5V6534Q
From:   Martyn Welch <martyn.welch@collabora.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Sep 2022 10:38:11 +0100
In-Reply-To: <1662997095.488928.1345587.nullmailer@robh.at.kernel.org>
References: <20220912102223.1050418-1-martyn.welch@collabora.co.uk>
         <20220912102223.1050418-2-martyn.welch@collabora.co.uk>
         <1662997095.488928.1345587.nullmailer@robh.at.kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-1+b1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2022-09-12 at 10:38 -0500, Rob Herring wrote:
> On Mon, 12 Sep 2022 11:22:19 +0100, Martyn Welch wrote:
> > From: Martyn Welch <martyn.welch@collabora.com>
> >=20
> > The NXP PCAL6534 is a 34-bit I2C I/O expander similar to the
> > PCAL6524. The
> > Diodes PI4IOE5V6534Q is a functionally identical chip provided by
> > Diodes
> > Inc.
> >=20
> > Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >=20
> > Changes in v2:
> > =C2=A0- Enumerate pi4ioe5v6534q as requiring pcal6534 fallback
> >=20
> > Changes in v3:
> > =C2=A0- Corrected indentation
> >=20
> > =C2=A0.../bindings/gpio/gpio-pca95xx.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 98 ++++++++++-----
> > ----
> > =C2=A01 file changed, 52 insertions(+), 46 deletions(-)
> >=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml:24:13:
> [warning] wrong indentation: expected 14 but found 12 (indentation)
>=20

Not sure why this didn't show up running the above command, but after
updating dtschema, it seems to be showing up now. Working on v4...

Martyn

> dtschema/dtc warnings/errors:
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/patch/
>=20
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit.
>=20
