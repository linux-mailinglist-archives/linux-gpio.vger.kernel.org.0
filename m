Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5462679B772
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240088AbjIKU4F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238164AbjIKNor (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 09:44:47 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBA3CD7
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:44:42 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6c09f1f4610so2929380a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694439882; x=1695044682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lR+yotPL2JhFpXqTuMpqA2jqZRBoBG3MioUG07FwcZI=;
        b=CmwRBCepjECn2eQKwQodlX2OylwQAld0Hb6CWZnEiKP7Bv3EzpfmbJzTaFjyH1nwLe
         Xupf46RybbrWX9ZBz793o8GOQSuzwJ1PesPHGkyQ6V8Lyma7yfuggOCsDWUbDOV4YDUi
         Sx5R8zWPAg4wadWT9zpQTY3dB3b6EDV0BOzk7zeFShkIMbLS2rQD1YuIFinHwrhMEG17
         85xDzbvSJQQEWSQWctVsLQE39WrIMfGwlF94JRBDNVwNSm4gAwlK9X9wIP2mDIDeTT9q
         +rbL8ofPrDaBdoCv5iRNPBdLqGvXE+JY1aN8qiPkq6sRlzp15R2QymkiOznDQpgq1HWM
         0s+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694439882; x=1695044682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR+yotPL2JhFpXqTuMpqA2jqZRBoBG3MioUG07FwcZI=;
        b=Ra0CZHl9vb2T6/3pODZgip+I+v/Johla0sXV9oNz6xT0GRDVQrqhtv6Ux3OffUyz+a
         C2e2ereJ0hLuLdq2c5wXyFEe5S4PG1BE6r+yECb3NBVF3aJzsgvhUTV27j2MMSt1a8fn
         2SlWwyf/kZwmTxPkED0mXSTYaMu3hl9YfcfrXOwOkZzWLQypaRRnxXJLK4hw4X1bDhbi
         X1aqcelIlEBVQGeuRMh6HeQipnZ7gdhvjZMQoTG/PudG8Wo8Oy+KPpuAREHtaZlcQcNS
         IhgRy/Ezwnfb63G34sezQQjzWGfV+cKOzlqqmJZfVMbmOhwCb9mwb07NVpQzArrt2SHu
         dfuQ==
X-Gm-Message-State: AOJu0YwObn6EssBViQyq8HZWbUJQFllvwWdmCeaUdCA7V9Ysb3h1GJJh
        dM3dTDVltgRpFvVHhDj2lrCZTbZdej/EYcffQ0JtOrz3loPQQoLh
X-Google-Smtp-Source: AGHT+IEYfLWIjZooHKmo4/urW6qtpQKHB2aG2wO78WtU7f8Rs4H4GXzdDaRKYxYBxo9eS+FIgiRJub17e48PFxbtaHg=
X-Received: by 2002:a05:6830:2048:b0:6b9:c41f:ede9 with SMTP id
 f8-20020a056830204800b006b9c41fede9mr8513487otp.16.1694439882074; Mon, 11 Sep
 2023 06:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <11db447f257231e08065989100311df57b7f1f1c.1693082594.git.daniel@makrotopia.org>
In-Reply-To: <11db447f257231e08065989100311df57b7f1f1c.1693082594.git.daniel@makrotopia.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 15:44:31 +0200
Message-ID: <CACRpkdYd-yo5+aHnD1H3HxmW6wO55NzfxeUq8Tq=ws1WMa4Euw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt7981: add additional uart groups
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 26, 2023 at 10:44=E2=80=AFPM Daniel Golle <daniel@makrotopia.or=
g> wrote:

> Add uart2_0_tx_rx (pin 4, 5) and uart1_2 (pins 9, 10) groups to the
> pinctrl driver for the MediaTek MT7981 SoC.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

No comment for over two weeks so patch applied.

Yours,
Linus Walleij
