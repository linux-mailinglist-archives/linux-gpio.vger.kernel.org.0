Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F0A600B2A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 11:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbiJQJl5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 05:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiJQJl4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 05:41:56 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4309713E83
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:41:55 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id e18so15181292edj.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VQ/HSgI2YgnyJT47jhmeTT6yW7UCxZ0jSNWzQkI0FEw=;
        b=kBn4OiBZ1cWeTnBRzDnVts1O6YM1bzUTlkmnUk6qzbv03LVlaFoqC7VeVSIK+1ayXf
         8spqbtyKS/eFcrq3aFMvy+6AujV5KLTJTcUjgtC2C2LMyKuTdoejQpZXM49XKD2LVU3M
         UHHvwZa3PfzWjUqKut3gBTgwZFmoc2g4mwyhfLJCpEVyux70EJkqElrWfi0+qlbqUlL/
         rEdFsn2lQxqKi12JtQuQsU6ceDTInMEi3VPcUVxR7rKKOZZkE2tkhoPhyNODRCnROj/0
         krEKr1SmKxidWbFJtNDgMMgKc2rbiI1NWRSObYynkKJ/u6tUD8MCVkATz2QuGF7mQ48f
         aY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQ/HSgI2YgnyJT47jhmeTT6yW7UCxZ0jSNWzQkI0FEw=;
        b=03HqXgEdHloF98cwnTiPSbrQje01lnU0zZiaqBgLbv5GpR9XkHMBfeYHrBJFXoqDA7
         RDeLLBoF60RStEXWhbIoNZQ6/d9FZx8ta041WvUGRa1fe4Paz2g9rpo1um6698vO+d9X
         FYDX8aiSQt4EcoO5oO8q2RNzdPpNvPSy76vM/8+0A/kmSjVMgywNlVBInhOe+aQIHNOX
         9mkpImd8EnZCr/IpPv64hTiSr1UaU8kxQ999lCsJJoy+0ajyF58f8e/efBJ0XYw01+Dl
         Pr8IlNRRec0Tf+4wCslcRXScbzhTIRmya96klhb9Oygn/6VVFR+AI7ND8CnL8ebTWcd5
         +ZEw==
X-Gm-Message-State: ACrzQf1gMb4bbTx8Dy87ndmbAo+o3wXIBOOmrHXdMhPaoxgTyhVpLbs0
        Xzm3SyrtvSo6Zp7RF31dBPfCmfaXiwyjzyVKwL5qPA==
X-Google-Smtp-Source: AMsMyM5kbAxE5N7tiaNYd1vvW4ZCnpFPQbl0NhkiqKILYLuft/kSjMMpw2mO7Vm4BCjieaOJetA31dCsdLbgxjE4tCs=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr9489401edb.46.1665999713052; Mon, 17
 Oct 2022 02:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221008164807.113590-1-linux@fw-web.de>
In-Reply-To: <20221008164807.113590-1-linux@fw-web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:41:41 +0200
Message-ID: <CACRpkdYNZGJaVN0eRZPmkmWr=it7xZtAPM=qV0EyQWUZgZ68hQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: allow configuring uart rx/tx and
 rts/cts separately
To:     Frank Wunderlich <linux@fw-web.de>
Cc:     linux-mediatek@lists.infradead.org,
        Sam Shih <sam.shih@mediatek.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Frank Wunderlich <frank-w@public-files.de>
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

On Sat, Oct 8, 2022 at 6:48 PM Frank Wunderlich <linux@fw-web.de> wrote:

> From: Sam Shih <sam.shih@mediatek.com>
>
> Some mt7986 boards use uart rts/cts pins as gpio,
> This patch allows to change rts/cts to gpio mode, but keep
> rx/tx as UART function.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>

No response from maintainers for a week and patch makes sense
so patch applied for next!

Yours,
Linus Walleij
