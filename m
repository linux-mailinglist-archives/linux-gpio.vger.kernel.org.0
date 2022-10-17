Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3924F600BA9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 11:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiJQJ5F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 05:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiJQJ5E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 05:57:04 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7AB3ED77
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:57:02 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id b4so17675546wrs.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=98IO7v4xe6xTRSMVmEU9y8rCEMPnvS4WCx1Z1aI89l0=;
        b=X8rGc/bfS17IEWrbeqU6BDUWLSP0QJsGnetoIaACMKO3KrZZeIH14r+vk0yvwUux1w
         XxI0FwnhDHZlc7P2mU1QHOY7J7ixf1I6vMdVZTXFk1Pjq0kxpeH4GH6o+6B9vxzBrKCI
         IcKNX26a15LhYiZTL2jwLp+3chgnQp/GyZCC5IddBhNM9zihPopt+9PJLsQihaQpzKQ8
         Q1iSz7Tsp/IGeCf4oOnDm1yeYi/1fU3w6nU2rbTC0j0PMrdQ6P3amUgISMr/hrXKfJR9
         abbqrOO1GRLVvnLXeRFANZz+ENUz9ArzKH0Yqq0N5bXddsCYcpkDEvk9BAK6u1HKCS/K
         BpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98IO7v4xe6xTRSMVmEU9y8rCEMPnvS4WCx1Z1aI89l0=;
        b=sD5w+qJ+gFUplcIQilhoiT8w/ZGI5n2Kq3H49bmyUV93YnoCdRrv0q9TXlm66cpFjs
         BDLjxJ3iL7o6OvsRWo5XsbiEkjIBE0Wl+CMZBweRNLv6ET+eATOw2oxEaBf6P0E9BcVZ
         D95EPSg9DMF4wLJ0U16IUAHoBjVvVFsw2iGxmExbi6UxykiQw3OR9POI4w8iJ3TGAUMc
         Fbnj0JExOWp6nUioLsjb3mwp6Mi2luAeCZMxVUi6npYZ2uu4eh459KEanVmYy2UhPKoR
         LV4QJnxjivWqfldHJc+dkB/87prrxTREzn5e6ZQrOazA/NLXVZAb9gLB+U6r/sIFhSiL
         IJRg==
X-Gm-Message-State: ACrzQf3sm0vwMcuYiT5HZYkVT81QzGV2mZ/1C70GS8Pc5eHj8uZ8smf3
        Tmb1S6T2yD96mJ5tF6T+lmDpipl8VOyLxoKNb0iQ7jY5PtM=
X-Google-Smtp-Source: AMsMyM4bkoes3awa7pSmHgcDYadIFtXhLIf56hwmM6LoX2tPsA/sqRrULDZ+14SgjJXNDSgjr89adq5Wa0Jkh5+XvbQ=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr8065569ejt.526.1666000610608; Mon, 17
 Oct 2022 02:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221008164807.113590-1-linux@fw-web.de> <CACRpkdYNZGJaVN0eRZPmkmWr=it7xZtAPM=qV0EyQWUZgZ68hQ@mail.gmail.com>
 <CAGXv+5FNQmx4Mxm2fTkWBazX7B_LzGuTY3cQK5f_yO4cE5c8mA@mail.gmail.com>
In-Reply-To: <CAGXv+5FNQmx4Mxm2fTkWBazX7B_LzGuTY3cQK5f_yO4cE5c8mA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:56:39 +0200
Message-ID: <CACRpkdYk4HPUTg3UxAZPkydUHeYtMkOVRGR-Zozrh5=VxfFcZQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: allow configuring uart rx/tx and
 rts/cts separately
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Frank Wunderlich <linux@fw-web.de>,
        Sam Shih <sam.shih@mediatek.com>,
        Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 11:49 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Mon, Oct 17, 2022 at 5:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Sat, Oct 8, 2022 at 6:48 PM Frank Wunderlich <linux@fw-web.de> wrote:
> >
> > > From: Sam Shih <sam.shih@mediatek.com>
> > >
> > > Some mt7986 boards use uart rts/cts pins as gpio,
> > > This patch allows to change rts/cts to gpio mode, but keep
> > > rx/tx as UART function.
> > >
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> >
> > No response from maintainers for a week and patch makes sense
> > so patch applied for next!
>
> Could we add "mt7986" to the patch subject? Otherwise it could be taken
> to be updating all the SoCs.

OK I fixed it!

Yours,
Linus Walleij
