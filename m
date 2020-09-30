Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D228F27E431
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 10:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbgI3Ixw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 04:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbgI3Ixv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 04:53:51 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A818C061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:53:51 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 197so566646lfo.11
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3z2xOif8bgrl4CXIfjrJIpR+vLzOyA+RktpULqT3bh0=;
        b=qrofEe4M1Xd/el20IewAIFLEt4T8hUHh/n3Q1WXwOuKu3e2R4xpOQBO2TBhln5msHM
         FGsckaPK88lI2NhWKga5UDDsfC0pUTzx2a/f+Prnt/aaNJuZhYtsdIaGQtqHrWZLbDve
         +SXI2jRCFzFnFEgXOxElCgSfXePsUiP/9DJxdTyLdYPqRXZ/DzM6CeqifPWCDfe+1nfV
         3zZEYx2dgqahuhN6vaOgy9YU/cMWLAiMuTerlD6//ZqEUnP/pbg7Wwym+nxkYDjtDWlj
         RF+j/fCbtpvYLw5HK6i9V2IrpXiOlnQkmTKFRQfGNylSRab3xzsPqiypuduF8wvSsb7G
         L44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3z2xOif8bgrl4CXIfjrJIpR+vLzOyA+RktpULqT3bh0=;
        b=izjqdD6MMxaSnWfWFfiwkOPYmEStkEJ+P5719QAYCgj7YpzZH8ZmfVXWRRdMBi+LZ4
         ftaKqaWzx3/nfwHbqxC8Yyw5hC9lCesORxySc/wr5J6+QKmNa4rIYaIJhcHFeqCoSquI
         Me85nSFCEx4Ci3G2WY099PgH5JDdawzImg0lxrwrr7aIc7xokWBaR0ZmNmpICQ37X0xY
         zm7iP2bHRRjjVmUcDb1jqFzjfHWS5nn4nY43n//khMUhPtmF+6TMMPqgs+gul3Nn3kIZ
         3esSC/GuGw9wTVhAIiYl3MZkCZsmZhlsXtbBkZ51Zk+8GM8I3trlwzBr8S8U6E4pK7sk
         hhbQ==
X-Gm-Message-State: AOAM533Nzxn30fzjF6HRKCQehO4NYaxwEtL9zOKJOO2lQRjBIdplBYxP
        DBbATjURLdmUcJasHuVfmfer3teP1Famv33Of3ZkNA==
X-Google-Smtp-Source: ABdhPJzi4flBuB3wmmmt9LtKMpa6PA1KfwRmboYTD0A5gCDHKZ3c33ZbcjL3MiGZbitzxdQhZsN3HZRaN/nxffefeQo=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr484379lfb.585.1601456029840;
 Wed, 30 Sep 2020 01:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131056.92848-1-miaoqinglang@huawei.com>
In-Reply-To: <20200921131056.92848-1-miaoqinglang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 10:53:39 +0200
Message-ID: <CACRpkdZxgw7zmmWyVpxQ5N60Yxzj+u_LPAkRGN0qS3A4DqKNgw@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: simplify the return expression
 of mtk_pinconf_bias_disable_set_rev1()
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 21, 2020 at 3:10 PM Qinglang Miao <miaoqinglang@huawei.com> wrote:

> Simplify the return expression.
>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

This patch does not apply to the pinctrl "devel" branch, please
rebase and resend, include Sean's ACK.
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Yours,
Linus Walleij
