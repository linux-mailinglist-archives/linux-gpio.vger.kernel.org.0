Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B571C26D4AE
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 09:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgIQH12 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 03:27:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726249AbgIQH11 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Sep 2020 03:27:27 -0400
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2474E21D43;
        Thu, 17 Sep 2020 07:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600327619;
        bh=tpDo9cyPQ/LQTEOy36D/WBL6LetDpyxtlaRmONJd2R8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VGPgNYUpr88iTJVP2b21eVVpz5wo2NehMM7OnVt94+wRYsXdkF4S1yuwo40TtOPlS
         UxotjMgUFhoaJQsgORUskT5fwxsPNoNmdVujTk1Glo/6rsHcLZxvYHJv3FXD88WMLF
         7IV8tesnG+2RjpEE7tqK0mNx2oeYh0RsFxc4a5Oo=
Received: by mail-ej1-f47.google.com with SMTP id nw23so1838520ejb.4;
        Thu, 17 Sep 2020 00:26:59 -0700 (PDT)
X-Gm-Message-State: AOAM532uOnv1QND2YLZd2n/9ky4P9pEjIgM2EbQ8c/Mv7n5AO4SUWyNC
        yNs1czSD22Q4ogYnWe6VwnIo4/eBo1p0+3KMB0Y=
X-Google-Smtp-Source: ABdhPJxQ7MG7PighDXMf2n5pdUG/ATfzcTwgmqOUXydiC0X5Iwa/aHx2yyQcKBjTkjYJaVujJjiTPxJ2wi8w2RfXlKk=
X-Received: by 2002:a17:906:ca4f:: with SMTP id jx15mr29029898ejb.454.1600327617668;
 Thu, 17 Sep 2020 00:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200916162250.16098-1-krzk@kernel.org> <20200916162250.16098-9-krzk@kernel.org>
 <20200917071932.GF3306@latitude>
In-Reply-To: <20200917071932.GF3306@latitude>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 17 Sep 2020 09:26:45 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe_njSOHc-aVGnpbL9ot8vxJsDkhMwXTVmRD1sPsNQR7w@mail.gmail.com>
Message-ID: <CAJKOXPe_njSOHc-aVGnpbL9ot8vxJsDkhMwXTVmRD1sPsNQR7w@mail.gmail.com>
Subject: Re: [PATCH 8/8] ARM: dts: imx: align GPIO hog names with dtschema
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 17 Sep 2020 at 09:20, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> On Wed, Sep 16, 2020 at 06:22:50PM +0200, Krzysztof Kozlowski wrote:
> > dtschema for GPIO controllers expects GPIO hogs to end with 'hog'
> > prefix.
>
> Nit: It's a suffix if it's at the end.

Right, I'll fix the message. Thanks for spotting this.

Best regards,
Krzysztof
