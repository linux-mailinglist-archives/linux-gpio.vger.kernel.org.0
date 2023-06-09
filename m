Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33892729A02
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 14:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjFIMae (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 08:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241119AbjFIMaG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 08:30:06 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D6135BC;
        Fri,  9 Jun 2023 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686313774; x=1717849774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z7IuJjHuXl/egkbs2006NrUCwnMlCwxmo9qpJeLK8I8=;
  b=iIO62FFIc2qMBAhwEHTeAw2GrfPQ5rqM4ZYoHDjCZ838Eo0CpE16PKMp
   4utQtG2O9EG6DqjsIfqd3Yw3hkvDjhzVvHRUvpgS5UbfDfXdWPaxXK+H9
   EwXkeAcGehyvZ5AFDZ1lQZG5mz8Cs7FfWBeYt43tXoJE6a4sLjg47Kkpp
   k+zcGKJX0GorvrkowlR3oYpYW5VVcgKzj1Al/XPXP8hSraygOvQKAj+5Z
   Z2irO3GLmEWO1xR+uxw5/eY92rmhpJV3h52eBYWcKrw/P4A0QfBR3cyI5
   OdMfCh6RaNhHD/L0Vng69cSh88ee5AQAOVb+pO1mnGYbvsU+r3BOwoJkW
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,229,1681164000"; 
   d="scan'208";a="31365317"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 09 Jun 2023 14:27:38 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 09 Jun 2023 14:27:38 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 09 Jun 2023 14:27:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686313658; x=1717849658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z7IuJjHuXl/egkbs2006NrUCwnMlCwxmo9qpJeLK8I8=;
  b=b0fnd2JVjoDX8bJdsZagN4/ybHFSwOOxfWoEqh/zYpmTIdcWvtp1mLYc
   zoxdSx7G///3kvmHjwPbrTANLdsvODZTA3s3V/V7U4VzvE8PSAl5GxAA5
   VBEU/4QqQp+llvf5x56GPoroCQhqF9iVvLkz85sSTZIy309PG9TmhFyJZ
   WaWY9I8g+CD+2Fq4UbVCcBZaa/gBgFOpXe9rFLia7rPH+FPeLaahCXmql
   kcurDyQsN1PC3FxEq0mszuB38nomkSMZur/UtsPtbdtI3vWEWzxvDkerL
   yQoatZlwoHnMrlKE0STTORROCAva50zZQuJQ/7d2O5ps6RiSB32cYGP/9
   A==;
X-IronPort-AV: E=Sophos;i="6.00,229,1681164000"; 
   d="scan'208";a="31365316"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 Jun 2023 14:27:38 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 906FB280087;
        Fri,  9 Jun 2023 14:27:38 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: gpio: gpio-vf610: Add parsing of hogs
Date:   Fri, 09 Jun 2023 14:27:38 +0200
Message-ID: <2442502.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <daeeebcf-d1cc-4dda-3450-8fa137c090bb@linaro.org>
References: <20230609121044.586214-1-alexander.stein@ew.tq-group.com> <daeeebcf-d1cc-4dda-3450-8fa137c090bb@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Freitag, 9. Juni 2023, 14:15:53 CEST schrieb Krzysztof Kozlowski:
> On 09/06/2023 14:10, Alexander Stein wrote:
> > Allow parsing GPIO controller children nodes with GPIO hogs.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > This implements the same as commit dfb49cc231a48 ("dt-bindings: gpio:
> > fsl-imx-gpio: Add parsing of hogs") and reuses the commit message as
> > well.
>=20
> But it was suboptimal. Do it like in commit 6c19974d1e83 ("dt-bindings:
> gpio: Convert STMPE GPIO to YAML schema"), including also narrower patter=
n.

Ah, thanks. I wasn't aware it is part of generic dt-schema.
Regarding the narrower pattern: dt-schema still uses the wider one. Is this=
=20
still correct or something which needs to be fixed?

Best regards,
Alexander

> Best regards,
> Krzysztof


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


