Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74623675A4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 01:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343697AbhDUXQx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 19:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343694AbhDUXQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 19:16:53 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D993C06138C
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 16:16:19 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id o16so49633317ljp.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 16:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lH3rmBSxRK/l04xfD0njXYt4qzsg1pEDjz8I4N9RkzQ=;
        b=Zocw/BTbuTjrT92BAEtq7SuWLurIX0T8F12U4/fVnRIl1jEcV8f5c9c4PCalvRqx6K
         vaVdBUqssEGLbpMkHaXHJhOS+SgOJCf9ECqQga8vjVrPtTjeT4rZXqSTd5zV/G5f/B+5
         xqGIym/ALNn/owhudKff05t108R9fAPHniNklgI0y6II5DoeAGk6o2C8J0dxA4YwfrVM
         j6yWIuEW1hiATESq7POYe+5TOCXF5wpMOOjxMsgqhtvbYGz8lSCe5vZGhK771XHgbKXI
         Bxmv91kplzedqOS/WSRRP63HVL1+Yp3kWfGg68MHcMWOGe4t3ojlaiIirntXPormNVmy
         CaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lH3rmBSxRK/l04xfD0njXYt4qzsg1pEDjz8I4N9RkzQ=;
        b=Nci+irn28EgC1LHelbgk9lTCpFxAkcHETJVcfOkdZbCLKKZi+QIkT+XiqX3cqW7tBW
         Q1mMRgKw2aerF0n8sxKTY5oWDYsxDJnHao1+tU6miNsoC+MlplqjJMjjAZlohk9m6hgk
         9wNz3c0F1pB8fbbRK32dZEt9CkvSBroGhS4tloievVPHFdzb98ULoGHAEAGSDQUNvvIi
         vBcU+7Z9B8ETgN1mAGbFjbxCM1pEt1V6y6opCyRawMJ2S3KD/NIjzJ6bPqafTxjSHTqP
         aW67ShT/8bEnzBWMw03xykWw65a0M5vDYJZ/FYdWKv4ZPFwLYJIhiqZuz3IV4DPPdadg
         6ZNw==
X-Gm-Message-State: AOAM530R9clq09Vq54GCjRTdN1/RpvOUEmqfVw0v8w8sNFYp7iJcetfd
        FtHOsVlxuv/760cPRiCikggl4l1jij3yvo+Mquc9oA==
X-Google-Smtp-Source: ABdhPJxEwXEHm3CH9HRLD5IBuDLDMcjgjNd506UvXOl5v00ZCuM1qdTq1sWoS1YTy+0tCNhVk1dcE+lbFgJfGH90Z30=
X-Received: by 2002:a2e:555:: with SMTP id 82mr439242ljf.200.1619046977716;
 Wed, 21 Apr 2021 16:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 01:16:06 +0200
Message-ID: <CACRpkdY348FQM0TUqmczV96j29WvX4p6QUWajN34N=YF98aLBQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] Fix bugs and add support for new Ingenic SoCs.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, paul@boddie.org.uk,
        andy.shevchenko@gmail.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 18, 2021 at 4:44 PM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:

> v5->v6:
> 1.Add the missing lcd-24bit group.
> 2.Add DMIC pins support for Ingenic SoCs.
> 3.Adjust and simplify the code.

This v6 patch set applied!

Thanks a lot for your hard work on this Zhou!

Yours,
Linus Walleij
