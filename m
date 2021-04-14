Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E8D35EE32
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 09:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349582AbhDNHNc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 03:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348592AbhDNHNa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Apr 2021 03:13:30 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98DBC061574
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:13:09 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a25so8876791ljm.11
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qj0MrsT9MP5e9TP+dMw9mmYBXbSrTZPaBuJ5U6SATfM=;
        b=VmhuoHIcOki+zO4haBZBKfw7hojfMB7Nw0INkxjwf/vBzvZ7iYvt6XBll6SNoIle4r
         pB5Gvpj5/rJUHz0zQEV+nlXGMLOAEWJNTOTkWxk60N3fFyJb0tjIbRwiU0RKUGs2fYsQ
         bYYdCOzzmtp2F9hkIu1ANqoKCMSY+0gzbWuKMwwgooJOJQsuTqE9HhJJJ3MQggWOslYd
         9uuB22CtOAjy+7GArD2AA79musxSr5z09NoNhvwBqrVaMmq3KnyhdHhFq6wOlL7tMwL5
         LxivJMkFjmCuQXFQlLVCEUmPDsgf7rrWqJDiZd3cem9W6lzUqytJzaDTBm96gz1fx8Gw
         dDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qj0MrsT9MP5e9TP+dMw9mmYBXbSrTZPaBuJ5U6SATfM=;
        b=cHcDaf9dodZXXWvmbWEGh3EUxIM7iURJaUZxXTf/beiSdXqMuLL6o8InqpAjm+k6BV
         mFXLE00EcYifgBLNLRpfESoQwTdQQ00YxEBN9pFKm1MqVDSTfb4gX98Qh1WBsZahW98D
         Icu8QggRfM/3fx3GYNrdm180p6TtmnNaGcXXknnXaqYKa2kIIGyr3EsAOA6bC5FfGtrJ
         zZ534+ZvEXETamq/1zdamU8hkRzMglXOtXXk2g3wEnGpuvyiaNcQ6Wp/aNqJm4NjLkRj
         cuXP81fv3xKAj5cUWQyKa2Yse8QEtmWBOoZ7vXxQC6z2jjajxu3np8kgEsH/1fjBL7Qu
         fPeg==
X-Gm-Message-State: AOAM5316GOhHW/Ye5k894nAlMXVg/Rq75eiolJrAHZWjyDtPkoEsFYzr
        XDTvhZR5700as3edFUYiMi2rXG2+GpEQv4leJpSTDQ==
X-Google-Smtp-Source: ABdhPJzdQYN+OFaEjUwuex2WL91l2G0cQ7jC6a5Gr4VgWvGVniRwFeGdvxQ+vEG70ZSzlMCTweKJjZIDCuUm6uChqLI=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr23239380ljc.200.1618384388240;
 Wed, 14 Apr 2021 00:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210412223617.8634-1-jbx6244@gmail.com>
In-Reply-To: <20210412223617.8634-1-jbx6244@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Apr 2021 09:12:57 +0200
Message-ID: <CACRpkdZ-oq4zKt_qOYTNCL7XqvJygRG0gfb9jRGVi2XRiE_3RQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: add YAML description for rockchip,gpio-bank
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 13, 2021 at 12:36 AM Johan Jonker <jbx6244@gmail.com> wrote:

> Current dts files with "rockchip,gpio-bank" subnodes
> are manually verified. In order to automate this process
> the text that describes the compatible in rockchip,pinctrl.txt
> is removed and converted to YAML in rockchip,gpio-bank.yaml.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> Changed V2:
>   changed example gpio nodename

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
