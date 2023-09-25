Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4430E7AD8B5
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Sep 2023 15:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjIYNPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Sep 2023 09:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjIYNPl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2023 09:15:41 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD3A107
        for <linux-gpio@vger.kernel.org>; Mon, 25 Sep 2023 06:15:35 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-579de633419so76631857b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Sep 2023 06:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695647734; x=1696252534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcC37wQSlviDQDGelF47pyhsR+4+hM7dLjLOaaG5IJ4=;
        b=EUhE/s81IoIPg2TR2lWYyyI5w8Ojtk1otKRoqmEkBz4PqL0qzpndxZjBd2ogi18+vX
         GBgTpUIzej92wvYhWx5abPeSSzbZwsOWwSnCWD4KPGvL/NI2cqSxK34tZbhWMLUGvZQn
         bZhQEOgS7jKpVzqHJpKF5bV9hOFIhwiSoeDFMJmiEAzGEgNTBmwffBIhXMYbumT2SGqa
         RILjM2JNPpmTTayHs/5zKCgh2T1JXegnbp0TpMEUqy74GbBrYyqy5MbO5hTrUnnOwvD9
         U0YXBuU4rYwf7jp6U86p+1vAaeHOdaLUEcfEiWcyJ0Zy9GnWyK3veyyfTSqR/RpTct/2
         6faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695647734; x=1696252534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcC37wQSlviDQDGelF47pyhsR+4+hM7dLjLOaaG5IJ4=;
        b=eunH0TIwbnhOnSrtY/MMA0d5hfrWVm9AhWEmSMQAaOKJ1UpMI+J+eeGyu3ZymQj1Zj
         d6od3mspzHQaLIx5ZUNHOJxYt7kdHNDXFivDJpxiiI8Yl3UYmSq7k9QUtW5gEazdrFaP
         845Cbp9mxVLB3c8jC41lsEZhgComIh3QkEIlNaqCjmkk1qSZ4zV4EhSV6GrOSkye3v3q
         e1FhT2qt9qwN7Xjck2f1gTRfQU8+563y7EN135JFPR3zt8mfi2oEU4PLl7aI1iJVSXKl
         rL+eadOI6ix+BjAM1jZLlJ1dXuWCXphr0DlVXBMD/bRIRc63NS8pOWrmYYe/P4cc55w9
         SwDg==
X-Gm-Message-State: AOJu0YyKnrnbQW1gkDWEc7f2j6vbAQZZHBKp90B0ZhVIAzW+oVOPzpyj
        e3SLRGwJAxsxlzfxbKxbSY4OX2MePFVXf9yGHcumN3tt7fIDgPHR
X-Google-Smtp-Source: AGHT+IGItYvswC2u29u8Avn3i2K5RB+tU2XzlzVbCIQUyAgfXNs59SBMHMovhmBPOhzKl7FIGgTIlg3vauP/2uAKAhU=
X-Received: by 2002:a05:690c:23c1:b0:59f:4c75:1314 with SMTP id
 do1-20020a05690c23c100b0059f4c751314mr5692718ywb.4.1695647734133; Mon, 25 Sep
 2023 06:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230920103332.274151-1-joe_wang@aspeedtech.com>
In-Reply-To: <20230920103332.274151-1-joe_wang@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Sep 2023 15:15:22 +0200
Message-ID: <CACRpkdaZb+V-Zx_Uw9MCqRqE+N-0gd__xEFV3BTpkG7icU9W+A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-aspeed-g6: Add more settings for USB2AHP function
To:     Joe Wang <joe_wang@aspeedtech.com>
Cc:     andrew@aj.id.au, joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 20, 2023 at 12:33=E2=80=AFPM Joe Wang <joe_wang@aspeedtech.com>=
 wrote:

> AST2600 USB2AHP (USB PortA: PCIe EHCI to PHY) function needs to set the
> register SCUC20[16]. Set it to enable the PCIe EHCI device on PCIe bus.
> Besides, also add USB2AHP signal expressions into pin declarations.
>
> Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>

Patch applied!

Yours,
Linus Walleij
