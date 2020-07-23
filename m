Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AA122B073
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 15:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgGWNZk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 09:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgGWNZk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 09:25:40 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2265AC0619DC
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:25:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q7so6344466ljm.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jjczOP4Lu1g1g+37UpjSnjuQvuguh9yOBVIpR976oI=;
        b=BoW1bFcGpf/LlOR4kSOBJG1m7T+jcsunaRyHsL8EB/e2knW65BpxDja3LsDLvW7Qcm
         jNnz1b3vfrvntrH3tGiUXf8ZZHvGRBITtk55iELblRP0m6HLFf9OLb2RyYzt08ChugCT
         X/KDqfD8XGrLH8eWFB7OszJp1DVqVt2k3V7EUfNmgn8XSD3U0JV1uFr6cIV+dUGQNDlf
         flxfM+WKMBJhFqVj0DUj58OQ+I2Gvzoa21WgkBqkA/+IrE521qeIdQNz2on2ORONwzy+
         pwY71KYBX5V/XZsffcKvTCzrHro4la1KU1YNGt0cXf8cFUXnW8Bv6YV5s96whl1txExf
         UFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jjczOP4Lu1g1g+37UpjSnjuQvuguh9yOBVIpR976oI=;
        b=NsD5M18gW30K1HU8+2R9mxXpBRod8yXAfiobq3Ydxi3frd6UIHTq0sq8J3Ef330b6k
         +xd6RgSI4IZqWqYZ8mrp5CHuDBDDG0Ayl/jYKsxoBrQtO+zSAPxZjAUoq+SX8RubHXen
         Ju2cyk1Xg5TDtSqzS7XJG5Xr4dzy2Cni5ZzXtE5IuVGdtdzKHoXYg44dyPC7szu/bb0p
         1D4pA3MWozPxmftZZ8TydKr7aF+rTdKmS11xHuL5ToGG0aA7Appaqe3IQd2ctkDd6U3g
         Vki8HFgrLXMzXZiJAoSW9KLZ6wRWxFUmyk9rFKgWhQa3LDEGW58aE7MwUtReAd53kejt
         rsHA==
X-Gm-Message-State: AOAM533HhyomLE4/T2yaPQ992hffvi+w9/HKp7Rhg05v3A1W1q5kzpL2
        8EYew7ASV3Uuc1PxTo4gB0Pob4JghoAsRW3K3AIItQ==
X-Google-Smtp-Source: ABdhPJzqK3FsqJ/H+gx22NXh9P4EXchoYK6Pz+NCpDzWteC77pBDLWy2/y3svYjnTm9rqrlHC7uEUexi0eAqcq5BB6Q=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr2133642ljg.100.1595510737599;
 Thu, 23 Jul 2020 06:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jul 2020 15:25:25 +0200
Message-ID: <CACRpkdYpMWHKNe_jOHJxLvLC=H_yVSJfhNp09ahy-dh9qJC+gg@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] Add basic SoC Support for Mediatek MT6779 SoC
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        wsd_upstream@mediatek.com, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hanks,

I applied patched from v9 1-5 to the pinctrl tree again for test!

Yours,
Linus Walleij
