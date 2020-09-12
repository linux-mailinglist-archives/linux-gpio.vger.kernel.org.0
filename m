Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C197426798B
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 12:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgILKbT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 06:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgILKbR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 06:31:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFA4C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 03:31:14 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a15so14609541ljk.2
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nqLEtIwvK/EbczcZ3jk1qcSGestWoV05xtB32zvNzic=;
        b=hCvfuXiPp8HJBbZG0l/3Jbipu9f8xKI61/bEfj7yNj5hB1Nu3Tq17Ijlr5JLDa32fi
         hxlkr3xT+mHH0IXTY1tB0m6X9NhbgR4Tp4iz5BP2onDKFPX3tri/xS9r7I0rxWyR/bnA
         iW6fMan6lb+helDhG/rTUPi09xFpP3hXH6GZepGTa3anwyfvM1VMN2/S0IlIT8uksNf1
         1NEgYJW96LQ0TeMrP6jZxsV9oLUaufDVKF+rEnsSrI48UlPQ643aenGFe+wLXjnmaP1g
         kfqeeGU0JV26qoagi/rvGi/FrZeZ4JBX59txoHs7vH0YiBA7NNVwGIXcYKG4iDsjsoH1
         S+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nqLEtIwvK/EbczcZ3jk1qcSGestWoV05xtB32zvNzic=;
        b=PnxJINA/7JpkTtaIE4N06LXTUixuanS8jf9/3Wrffr6APKH/e3jJshZE822sqQoKuo
         44B0f7UPLyIYUtbfytFTHmp/oYXaSwaecIMG8t77H8+gsHrpF4abMJmUS9ovM+/ubXmn
         Ba5D/kEdVX4RoGCnJzLXAo0sHSLqUHtJIiy4nJSLiSMIrC798R7P8McJXN7qdB4AMV6+
         dcXLAICFcGcVYmPkt46ZlV56yiSbNX7knLUw1fZRQAFD8PO8oPxxBhcmWxy5gldzvue4
         iNQ82og4tMqSP6qaUV458QSzwHo4kpQHl8nNN6TK7Jb3x6ws4g3Pc7Tp6I/MI6YS5luA
         07Kg==
X-Gm-Message-State: AOAM533TSsP989pckcAATrIGhuIL66+Y49Hl3zEGicuW9zT/N4SeFtmC
        t9WXowG0+pYzVJnImCsugg6qGVa+d42ypyvgfEgF2g==
X-Google-Smtp-Source: ABdhPJwxQQ4So4+24yv1p3RplMFD3YddPUuixU5O4ZxYauh3Wj3TWIT3t0UuKTe6tw+yv9jAjEVPe1GQ7Uk9PW3+yT8=
X-Received: by 2002:a2e:9988:: with SMTP id w8mr2333823lji.286.1599906672401;
 Sat, 12 Sep 2020 03:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200912060425.30423-1-zhouyanjie@wanyeetech.com>
In-Reply-To: <20200912060425.30423-1-zhouyanjie@wanyeetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 12:31:01 +0200
Message-ID: <CACRpkdYGg_w2wzw7T0PHjEomkqFn8Jw4bTzfovi5qT0qdScMvw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: Ingenic: Add support for SSI and I2S pins.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 12, 2020 at 8:05 AM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:

> 1.Add SSI pins support for JZ4770 and JZ4780.
> 2.Correct the pullup and pulldown parameters of JZ4780.
> 3.Add I2S pins support for JZ4780, X1000, X1500, and X1830.
>
> v2->v3:
> 1.Add Paul Cercueil's Reviewed-by.
> 2.Fix bug about PE15's pull-up parameter.

This looks good to me, I'm just waiting for Paul to look at patches 2&3
before applying.

Yours,
Linus Walleij
