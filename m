Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 856C75E9A66
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbiIZH10 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbiIZH1Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:27:25 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3E220BD9
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:27:23 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id iv17so3845177wmb.4
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=zubJIXmuUlfj8y+X7ZsbYv3JeG6JFdVK1Q2FbkUA5ug=;
        b=fMhbNZElR89NcaN0To6NsBjZw2zKAJW1D4IFBz6JctZLE4IPHnEtqPyITGMKE+fHfC
         hUJyVrtJyptyuclW+3C8wZ31QCIt14OAoPWb2Dybv63ogqvTQ+Bi95ImiwpvG51SugEy
         wvtptqUu+E8n4RQ5370r6otruOfIf9o5EvX2+K/e9xeFuj9KczGq8sAlFqfLHKj/KqQw
         V0/OzPo5unR81j5bc8bL6ksQ01n5C2oqFurr8hRPkzo3XneYRwAVmYIq8I9bo/Q5gt7R
         6BJf+ZM0Cqxop/gi7LmddY/3gXWZwdqA06icFsdgbUVk9yo/DytwE4RpmCQmiLpa7Qa9
         xcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zubJIXmuUlfj8y+X7ZsbYv3JeG6JFdVK1Q2FbkUA5ug=;
        b=SdwFOLLAnI+upKXxsHgyFFQZBwOJPUr2XhmSLXDkZv8pktv4vZEzdxaLzDWd2blUiW
         YT88Xy9sxOmtAF0+7hE2Eh0zsP1HNc2oVAXjv1Z4zb6/Hzgm05/AOB0WgRdUIMolr4Fr
         oNLLZMVZMId52YM+fy6px62MwliZKylyjbkxIOxW+rttfDeBaZd9utHc5ULQhx9a6Lry
         9TtFyXb0aXHaUPHkCXly0YKaQ5Mu0EAxKDGbCMRm/PKDV08gGdJaGllhBF224FSm9gtl
         SvSGSHWkvRrWmyRk9ZNKdV1aGhJ2BF/bDe+9XnHKCrwCljBlMhDIkmzTSW4qOzEwq1UY
         GADQ==
X-Gm-Message-State: ACrzQf22uMiWmp6RJr7xus67ciULsaoRA2ao3xBDPzxhwso13J2Q+3CW
        Ky7qpfnNvN9+7HpAOTn9pSaOUeyTam/+oJXr8j4vMQ==
X-Google-Smtp-Source: AMsMyM7xMGIVVToA5AN1/jgoODmhEbMuhmoVnDP+T87PXH7Sic5DMpZNydXJKIs2uiuhhS32DOJGBv3vfei3TdeY0AA=
X-Received: by 2002:a05:600c:4f8d:b0:3b4:9f2f:4311 with SMTP id
 n13-20020a05600c4f8d00b003b49f2f4311mr13504647wmq.17.1664177242176; Mon, 26
 Sep 2022 00:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220905145555.674800-1-etienne.carriere@linaro.org>
 <CAMRc=Mcq3u+1JjvXJ2X774vknq-LOeCfE7hLj2As7Q5A13tx0w@mail.gmail.com> <20220924175721.GA1051922-robh@kernel.org>
In-Reply-To: <20220924175721.GA1051922-robh@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Sep 2022 09:27:11 +0200
Message-ID: <CAMRc=Mf=U4PVQJVoxdub+BUUrZQyHGs7wF8DxRwxdw=izcb6Zg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-binding: gpio: publish binding IDs under dual license
To:     Rob Herring <robh@kernel.org>
Cc:     Etienne Carriere <etienne.carriere@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Stephen Warren <swarren@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 24, 2022 at 7:57 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 22, 2022 at 10:37:03AM +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 5, 2022 at 4:57 PM Etienne Carriere
> > <etienne.carriere@linaro.org> wrote:
> > >
> > > Changes gpio.h DT binding header file to be published under GPLv2 or
> > > BSD-2-Clause license terms. This change allows this GPIO generic
> > > bindings header file to be used in software components as bootloaders
> > > and OSes that are not published under GPLv2 terms.
> > >
> > > All contributors to gpio.h file in copy.
> > >
> > > Cc: Stephen Warren <swarren@nvidia.com>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Laxman Dewangan <ldewangan@nvidia.com>
> > > Cc: Andrew Jeffery <andrew@aj.id.au>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > > Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > >
> > > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > > ---
> >
> > Applied, thanks!
>
> I don't think anyone is really going to care, but you first need acks
> from the Cc list to re-license or a lawyer to tell you it's not
> copyrightable anyways and doesn't matter. Your choice. ;)
>
> Rob

Eek, you're right. Will back it out for now.

Thanks
Bartosz
