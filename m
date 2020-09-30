Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201B827E428
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 10:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgI3Iu2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 04:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3Iu2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 04:50:28 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D8AC061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:50:27 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q8so1165772lfb.6
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p9jT18DRPmM+6oT/A0SgvjeQobMXcTPWA1A49b1ezhA=;
        b=lKftBT0dAYKAhl4xnf32V5bPoxz5gnn8O8xL7hbmRT9wMNVCcn3rD/1/976g96qC5q
         ahvfu70WnSj9P7uM6dtIhuNiSSN1qhQrHiytYRJweL8sLFCiNvmbkYPDwj51KfpAxWtH
         9P3y46YPKJUsbsYzrT857GCp3HZeOyivl9iIVk7l9vQDkhGdSRgKuKkRn+yl0GB411DG
         cwphGgQt4KHSGkimli5zRfrbSzE3X8TRTsDlwL8v17PEmrS9XwkXis6hpqXwpwn+manb
         q9gqnqndzyAiyodHgsHBv3mNXvMfmySpSAZ1P1uvELq0y0WBK6FaMpwEmE8cKrK2s3F2
         r+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p9jT18DRPmM+6oT/A0SgvjeQobMXcTPWA1A49b1ezhA=;
        b=Udmm2cz1nW85gR0tqJSRyI3p2enYWtWQ9gR1p6GkjZZxHwWZqgQFdw1XLEJSnR4Cu0
         O94e4+QHIPoe6o0cdI0W6osSq64IHJwNsCWCII7Vqi3H/81RPxjwCnpYKDuQnPmc555d
         4OYJa0+O7ce/3rvP6AR+olUWlQFALOzvl37EPu1wXFCIXZNhaHCh1T5MFBVhPmLJPcxo
         8uqCT56gKwaIP4J4bu22Vuk9JN3/Mkcfy7ZvHhGxfQ6DEMvNP+62HjTClLBdMKRk+W2x
         uH2eRhOH9ttcnXxsK2EkUMDO3JB0vRP/um/Nmj/M6dgSonKJUU68/hbuDCIyxQsCBv+t
         JqiQ==
X-Gm-Message-State: AOAM531s7MSXt2iSG4kXl8/lGK+M9YYo8dEidZpy+64t2U8OQ86WZCcB
        kTNJ+DNpjwAB8NIy/YZn9X2Uef4a2vtF1YQwiWjEWg==
X-Google-Smtp-Source: ABdhPJyK72VML696C135DEXZ4OyVrftc07keF/4Ek5Cv6BHqy8lTa5W891mP9tY55Gt9drR0NvqruB+j3+zWi/eDK7c=
X-Received: by 2002:a19:520b:: with SMTP id m11mr462629lfb.502.1601455826247;
 Wed, 30 Sep 2020 01:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
In-Reply-To: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 10:50:15 +0200
Message-ID: <CACRpkdb5ibeGNoayAZvRPf6qpedJvRUTAeCkxt+8mk5Me0LBKg@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: use devm_platform_ioremap_resource_byname()
To:     Wang Xiaojun <wangxiaojun11@huawei.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 8:40 AM Wang Xiaojun <wangxiaojun11@huawei.com> wrote:

> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
>
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Patch applied.

Yours,
Linus Walleij
