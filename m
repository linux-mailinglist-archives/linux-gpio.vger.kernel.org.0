Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A24A154CDA5
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 17:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245605AbiFOP4N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 11:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244556AbiFOP4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 11:56:12 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BB236331
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 08:56:11 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id v1so24064342ejg.13
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hN3xPtShaAT5LsLypWQrcKTpTb7xDIkqAjeHts1S6PM=;
        b=kmoAz0fQDs2QEYmrIur1GlFf9LhHAbB6C8QoBQV8s21X/LPDUxtL8dZqRMUK8P0Iqr
         UtFBKLN4xMz1SCFszuJnCnJ9SJ5xSLE1X7vF9DxwNfQQTgJ5hMdXR+x4W3Y10S//MJa/
         Kg/KFtZuF93cLTSzHqfOeYKODoqO88P87pRVtjUI7zsqQ5svtZlbhJWNc1p+1RUW2jns
         q72Vda7GWUUfHaFy44raLeMva+m1hIJTH8VTNqPahC5Ou6eYWBW4ci8u8s5dAmvsOA8K
         K752d8XC8yj586BKAmcp6ZPR38L5fIOge078dCy4HcL+KbLSxuzTAWsjxws6sVevNNVk
         mZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hN3xPtShaAT5LsLypWQrcKTpTb7xDIkqAjeHts1S6PM=;
        b=MdzASgVd/RHZn94WgL94YDcQQMZwP9EAFqNdvKuZni7F9yMusy+j07wkXjmXJjiEQ2
         I60XIA0MwiwnKDP2g1mLJYsvSOo8H9Ph7EG7jc3Uhl3BPDXfbn8aBGEr4iK1dw+Q4Ydr
         YxtFr4ZiQ0QRDNA79rO/XCp7ADsj7j26L9gy1EU55gRq9Fe7tu0UzffbtGVeF39HwX/0
         W9J0T4Ujao2FfnMt9HtCVtvhJMWUOI5HKomRg6zzK8f3te54EpcMAzPAzahxeK4qibqe
         4Sbz7dLhfYeRcbzK7YKEMLKx4G4lUhO42K13iPpsZUqvdVbWSCt2XmXhdlrDqKnuTDC/
         gC6A==
X-Gm-Message-State: AJIora+0dnN65QlIC2pFFg4gTpBzhIzu0kQDgMpTOvGd6V7qqPolOGPr
        h+1Dt832W6fSi5eer92GM94=
X-Google-Smtp-Source: AGRyM1vo6g91ZXfiM6FogSSdc2C7LuzLyjUwdPRKKHlt0PaKC7aMQD77Divd6crIj70WqJhZd3SzOQ==
X-Received: by 2002:a17:907:7b85:b0:711:e42d:4955 with SMTP id ne5-20020a1709077b8500b00711e42d4955mr452005ejc.482.1655308569982;
        Wed, 15 Jun 2022 08:56:09 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id kb17-20020a170907925100b006f3ef214e63sm6455194ejb.201.2022.06.15.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:56:09 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Andrei Lalaev <andrey.lalaev@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Yangtao Li <frank@allwinnertech.com>,
        Maxime Ripard <mripard@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     wens@csie.org, samuel@sholland.org, linux-gpio@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
Date:   Wed, 15 Jun 2022 17:56:08 +0200
Message-ID: <3106779.5fSG56mABF@kista>
In-Reply-To: <CACRpkdbfJhwee-dnkhE3=ijiLcSx8seVxoKPzyZ_n7bz=TkU7w@mail.gmail.com>
References: <20220525190423.410609-1-andrey.lalaev@gmail.com> <CACRpkdbfJhwee-dnkhE3=ijiLcSx8seVxoKPzyZ_n7bz=TkU7w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dne sreda, 15. junij 2022 ob 15:17:55 CEST je Linus Walleij napisal(a):
> On Wed, May 25, 2022 at 9:08 PM Andrei Lalaev <andrey.lalaev@gmail.com> 
wrote:
> 
> > Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
> > Previous implementation used absolute pin numbering and it was incorrect
> > for R_PIO pinctrl.
> > It's necessary to take into account the base pin number.
> >
> > Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
> > Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> 
> It fixes a patch by Maxime so want Maxime to ACK this if it should be
> applied. Paging Andre and Yangtao too, would be sad if we don't apply it
> if it is a necessary fix.

From what I can see, this fixes makes code consistent with pattern in other 
functions, so I think it's good.

Best regards,
Jernej


