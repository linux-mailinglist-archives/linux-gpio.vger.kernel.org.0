Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53305687F0E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 14:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbjBBNrh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 08:47:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbjBBNrh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 08:47:37 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC058FB6B
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 05:47:22 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id v81so892011vkv.5
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 05:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j4oCXdup8n6v8+NV1Y2tr9d5t5xzk71vogTRfgmjQAo=;
        b=1e4Nqng+igmZ/sjJvxRnooaGcY+pPB2sg/FxoprfRpsjC5cQW8IZFzHDJJAbwwaY78
         4NplP5dAh0zX4BcyTqf6pG1twOZPFll0xuyW6ikhN3RiLlVbWs/ko8SgrK7gGN1v49TS
         trjUctTtWZ+98Uvm6w1ywzwfQOAmW2FspORdBESQdAYv3+WOuPD3Ckw5HjqNggqJiLO0
         aTot93GIXsE/VprawkW07yqvz7UdANVnaDD8sMdpwKSHByyF/ittLdo3AAu6ws3Zbgoc
         lejTDW61JzTbRqsDEyRipHtceS0DhEdebaVBX89rgNnj9qIlb9HG8r8W14q9JJlvQdGz
         aYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4oCXdup8n6v8+NV1Y2tr9d5t5xzk71vogTRfgmjQAo=;
        b=hcJWTNoct/sK6RTZf1lJBu91LifCvb/7KphO7N2OVGrUo/dP8QWRaD2PKbwQumvPtc
         PvGVSE4ioVhU2k2+rNRzQi7uAZTqJ5nCX0rg+y85x6c/iazdmzDVgLjaQwXJfZmjL3xL
         owwClHh1BLJolPVjA6hXWQxg9904oqj+J0CUveHlkLQIKdADII4pYzhACXJdOes3RG7b
         FPTSi6rdaxUCXkmfIJ5XL/svhYzIln8po4UssqsUv8bS6iunhI2mxZcjE+4ZB771cyJv
         qMmHrQ+wchW6dXtvjMxvSA9KJOOv5Trf6XtmwAcJr55iP9FBTz0k5N+e7fXi0+pJnhDg
         o8WQ==
X-Gm-Message-State: AO0yUKWqO0KjafMeCPdHycXnErYwUQpDW6+Z/A4RZmMbI4IWVudj7iRi
        0fd6K4PhAHFQZlsOsBt76MmOBCA0Q2vJA26GPl19wg==
X-Google-Smtp-Source: AK7set9hPhIWcpZYmygU9JQRV/1iD1bXGVCi4ox3CXAnd/nPJK3j3mhMIvfPBqdsldpRjnsmjXk2Q0qfO2TpUHdjtcE=
X-Received: by 2002:a05:6122:1688:b0:3e1:db78:6cd9 with SMTP id
 8-20020a056122168800b003e1db786cd9mr909715vkl.25.1675345641149; Thu, 02 Feb
 2023 05:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20230201150011.200613-1-brgl@bgdev.pl> <CACRpkdYEQkxEJ23Xt4hjwu3Jxct-QXZktdzze5Pf6SBNYj80Fg@mail.gmail.com>
 <CAMRc=MdDwSi+DDJmn3Yrnh5m8EK5EJEfLrejXHN0+0k41DKx3w@mail.gmail.com> <CACRpkdbLjcGUvycX9p=hYjMwS6UJOkUTOJvbEcNtddx5mnbSuQ@mail.gmail.com>
In-Reply-To: <CACRpkdbLjcGUvycX9p=hYjMwS6UJOkUTOJvbEcNtddx5mnbSuQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Feb 2023 14:47:10 +0100
Message-ID: <CAMRc=Me2wQTvx83nZSuaiagO3Z02Q55p6u1pXKnx9LkF10OY1g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: add dt-bindings and driver for sa8775p-tlmm
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 2, 2023 at 1:54 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Feb 2, 2023 at 9:25 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Wed, Feb 1, 2023 at 11:46 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > On Wed, Feb 1, 2023 at 4:00 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > This series contains the device-tree bindings and the pinctrl driver for the
> > > > SA8775P platforms.
> > > >
> > > > v2 -> v3 (Changes in DT bindings only)
> > > > - fix the gpio pattern property (platform has 148 GPIOs)
> > > > - add blank lines for better readability
> > >
> > > v3 patch set applied, fixing the 149->148 number in the example
> > > in patch 1!
> > >
> >
> > Thanks! Seems like only patch 1/2 got into your branch?
>
> That's confusing, it looks to me like they are both there?
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
>
> Isn't "pinctrl: qcom: add the tlmm driver sa8775p platforms" patch 2/2?
>

Strange, didn't see it there before. Anyway, thanks a lot!

Bart
