Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FDB255CB4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 16:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgH1OjC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 10:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgH1Oi5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 10:38:57 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47369C061232
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:38:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 185so1564401ljj.7
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z+TaixqXEGVGQ2T/QrWllmigc9Bn2yBozBpoORD/TJw=;
        b=bthwUPubnbhn6YaESsUooZlnlA4AAH2u5bkxHyDnFmhCm7Kh8U+RM/LdfdzTy1rYap
         u44U0H4icDS300YJtLrAeN/7futTwYEW9VcOBuA4MuLVEaALI8PfhMowA05SL1w4Aht9
         EJ2c2krhGZEMNpmqLnZCHr6FP5hI4iwU/AKWJelCBMzkKU5f+mZY9UODyo7eprjDDebs
         O9ZHQCcn+Y4eCdnY+/38i5UVPDt5HBdr12ZRgh8q2eFBE/mFaM9AMXRKlxfxAn0quOPM
         bjoy/WikU5yTdZRSThu37hA3MaGWPoh5PN6jQeqLm+WZnnKTMUmXjqT3ChLDKmm4LnUk
         xFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+TaixqXEGVGQ2T/QrWllmigc9Bn2yBozBpoORD/TJw=;
        b=KNx7EepCyP+BKZDNgCYNIlpwsMD7XpZ5B/dpaspj62H1jMao8xDPNK0T+7nOveV3d5
         6RKNQK6fUHx6FT843C4i/HiMSez6N9HdB/smkdI7sCUBJi6CHSoj9JBUPup4ezy70+Al
         IZdDKwdoBylKLXsWUDlTOqZICUhx4uhc4TcupzsFDwzkGUY/q5J4GsHL79kbepY6hFsF
         mhIoLcvjX35560hRnYm63H215hhEegCIQjtFJ/DozreSxrtd2W9N5ZsbmHkzd++DyK8T
         2uNBiXpTP8bayunMI6zRuqq/omKoJOnbvL7n3zw3BHpUZAwi+t38bNzhoPKs9hA8faSi
         8Uvw==
X-Gm-Message-State: AOAM533SnJ3L9A5cT3Fyc9Td+ICXd3N2mZ2dd3JAOxw9PaOVq7lXlMkY
        ESXyLpBnEIy2g4j1SseUk+wP/5MQetE76kRW2fNY7w==
X-Google-Smtp-Source: ABdhPJwaDJ3Gr/qcSUh/+gWWdKq8kAihgP6kukxSpzeXwrAWcBQEZ3gQKkku9u7kwQPG+FNQX7jTEbu12MB2QtmIP4I=
X-Received: by 2002:a2e:81d9:: with SMTP id s25mr1013703ljg.104.1598625535585;
 Fri, 28 Aug 2020 07:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
 <CACRpkdYedyDcnL5DUD33Z2iT1jEJ_W1gvB_a8VaFnNAH1mKgzQ@mail.gmail.com> <1598581434.5835.2.camel@mtksdaap41>
In-Reply-To: <1598581434.5835.2.camel@mtksdaap41>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:38:44 +0200
Message-ID: <CACRpkdY9hbLOTjzQm34xL32PU01tRMkcB4_qTeFqwQM9Yam75A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Mediatek pinctrl patch on mt8192
To:     CK Hu <ck.hu@mediatek.com>
Cc:     Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
        srv_heupstream@mediatek.com,
        Chuanjia Liu <chuanjia.liu@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Erin Lo <erin.lo@mediatek.com>, hui.liu@mediatek.com,
        seiya.wang@mediatek.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        sin_jieyang@mediatek.com,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sean Wang <sean.wang@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        huang eddie <eddie.huang@mediatek.com>, jg_poxu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 28, 2020 at 4:24 AM CK Hu <ck.hu@mediatek.com> wrote:
> On Thu, 2020-08-27 at 10:52 +0200, Linus Walleij wrote:
> > On Mon, Aug 17, 2020 at 2:18 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> >
> > > This series includes 3 patches:
> > > 1.add pinctrl file on mt8192.
> > > 2.add pinctrl binding document on mt8192.
> > > 3.add pinctrl driver on MT8192.
> >
> > Patches applied for v5.10!
>
> I does not see these patches in your tree [1], have you applied them? I
> would like to pick these patches from your tree.

They are on my harddrive while testing, then they do onto the
server for testing, then they go to linux-next for testing.

Give it some days and some patience.

Yours,
Linus Walleij
