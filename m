Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F0027CCAD
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733243AbgI2MiQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:38:16 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:34773 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733222AbgI2MiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:38:15 -0400
Received: by mail-ej1-f68.google.com with SMTP id gr14so14825264ejb.1;
        Tue, 29 Sep 2020 05:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8cBo88Rf0XB3Amo8WHaoA3mvFSPQ6LbFDMO+GstCOgU=;
        b=Mj+tyuiiZTC+4Uydo/wKMVjw2kpPqgFowW9aufPtw6EVKHXP1T6g398Wsueuyr2o7E
         1m2wPQR0R/HyDeroDS8x8G3ElyKPf1Pywtr7PqPD3hPmV61drXl/mv2tp/S6D/z8lVP9
         M6oCYXFL5poOJz17K9ZOW080P0uFVJqcU3pqduVYCZifWqLlEOEeMFOyr+R8zVFX0Evf
         UrmgH2n0xEg32P80swtoeULkg/tf+/LRVovB+d/B8NKOr6ICiSfl98De9kiK8j4v1LR/
         fGEJV7irR+H/8wVojbqVcqyd9PpGkGWzy2rUIm2b4Zr5OMwx5Vw3U+LQOtEl81pMJO/T
         EfXQ==
X-Gm-Message-State: AOAM533kOsAosbq3QGYhB+AIpDvP2JLO9JWQwFg1D3l4kGuqwwCepGdK
        KMNYumz5MaOcR/jz91e3P4w=
X-Google-Smtp-Source: ABdhPJywdVpCr+WJQxL/CB+8FU0Ise/EiUvtP1NqlRdfdlKrgf438XWp3aGFvYREkH3IV2E+mX7okA==
X-Received: by 2002:a17:906:b28d:: with SMTP id q13mr3590683ejz.378.1601383092996;
        Tue, 29 Sep 2020 05:38:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id c5sm5704977edt.24.2020.09.29.05.38.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 05:38:11 -0700 (PDT)
Date:   Tue, 29 Sep 2020 14:38:08 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
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
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-unisoc@lists.infradead.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/8] gpio: add common dtschema
Message-ID: <20200929123808.GA21809@kozik-lap>
References: <20200916162250.16098-1-krzk@kernel.org>
 <CACRpkdacWQKgCY1E=ONegPRE001UA-DmvRKB+Yz1maapYQ5rVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdacWQKgCY1E=ONegPRE001UA-DmvRKB+Yz1maapYQ5rVQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 01:56:42PM +0200, Linus Walleij wrote:
> On Wed, Sep 16, 2020 at 6:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > This is independent work of pca953x bindings:
> > https://lore.kernel.org/lkml/20200916155715.21009-1-krzk@kernel.org/T/#u
> >
> > The DTS patches can be also applied independently.
> 
> I'm a big fan of this patch series and hope for a v2 soon
> so I can apply them.

I sent the dt-bindings part of it already to dtschema and it was
applied.  It's missing the description of properties due to licensing
but at least it brings the hog nodes validation.

> 
> If you do not foresee any conflicts in the DTS files I can
> apply also these, else you can apply them in the i.MX DTS
> tree (wherever that is) or I can provide an immutable
> branch, whichever you like!

Thanks! I resent already the DTS in separate patchset and most of them
went in.

Best regards,
Krzysztof

