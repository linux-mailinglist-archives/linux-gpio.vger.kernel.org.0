Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD4F6E1DCD
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Apr 2023 10:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjDNIHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Apr 2023 04:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjDNIHq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Apr 2023 04:07:46 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACCC6A65
        for <linux-gpio@vger.kernel.org>; Fri, 14 Apr 2023 01:07:45 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id n203so6246107ybg.6
        for <linux-gpio@vger.kernel.org>; Fri, 14 Apr 2023 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681459664; x=1684051664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZnp/yCsMHc5KR2mJVi72YvBKCTqmijPKq0ipLNZZMk=;
        b=ktm6FG/JzVzuHbCMOSVDcY+/2bQ60RCnnINpZrzuNcm4lQmOn92FFmwyOqKzCQA4bs
         /h4dhVG9MEuhoKUl8IUJVBUrmhpVPumHcWbY6DYJnZUTgtr8dc3QVPJi+Re3IHYiuJAm
         7a8FlwRPl/iaDrwhxcVHIqaOXUAFuFGFKNgfjXA1S5g7M7STk5oxUX6P5/A18yHERe5T
         a2GFT1v0GwucfnlaI8YtZlhVHnnKo66bBLVsrM5mpEBlxjxrbLWV9CmLDKBuf84K8ojg
         Rd3ogWHf+9ybyFbYEEM3B8PnzHTNztX4LMgcwAhL74oj6FUjehodr9sB90nhrETzrCpS
         ekNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681459664; x=1684051664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZnp/yCsMHc5KR2mJVi72YvBKCTqmijPKq0ipLNZZMk=;
        b=a7TFb4OIw17isiBngOnLJ+4p3uf3z4F1ePKs1ZHDCBVGxQNNczr17xDS7zAThEocuV
         jVc3W0Y+7cB5SWVGkztmTlgPMjNZQRZsZUVoli/+Y8mczZMQyh6YFsPLgn503nLmjmfB
         ZQIKLYlUzvG75+Q5ra1dk1G4GHb+1SyKi/g2t2b1GzDOa4s1ka8Vovbxec/X2EWQdZxG
         l+OzR7P8sOA4w+uF6Q9eBq5gJxBR8apSDYXuXKIwWf3tz2/vOixqd90EaWPF+NBl5MZX
         mI+WDBDYDKXkhszgTIaJhjVPlw7/o6NZIU4XZppMHM73cy907wqYxYhoM0UWmL9xE+O8
         398A==
X-Gm-Message-State: AAQBX9d2iz+nLNqtwFm2RbtMJYhZ23KlPWOcHBkLuBiC7Zd5nnngOy8K
        9aBMv1Tvlch3/Kkb7/4MCTPg8knp1zwINft5bQLB3w==
X-Google-Smtp-Source: AKy350bLx13Jl5gFGHxjyqfCjFjz/GjXNeiJM8AOkmoHfSPx1qRKImtUe2heqX7bIsSjqpOeFvV5LWB0XQSFe2trTjQ=
X-Received: by 2002:a25:d496:0:b0:b8f:66e3:b8f9 with SMTP id
 m144-20020a25d496000000b00b8f66e3b8f9mr1726675ybf.4.1681459664714; Fri, 14
 Apr 2023 01:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230414004455.19275-1-dipenp@nvidia.com> <373eacb8-be3f-6b95-3e08-f0ff36f79891@linaro.org>
In-Reply-To: <373eacb8-be3f-6b95-3e08-f0ff36f79891@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Apr 2023 10:07:33 +0200
Message-ID: <CACRpkdY6R9WvwOr3mVgrJcf9dVB4s13eu8juZkBt0Q+=gg2G2w@mail.gmail.com>
Subject: Re: [V6 0/9] Add Tegra234 HTE support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        robh+dt@kernel.org, timestamp@lists.linux.dev,
        krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net,
        gregkh@linuxfoundation.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 14, 2023 at 9:36=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 14/04/2023 02:44, Dipen Patel wrote:
> > This patch series mainly adds support for the Tegra234 HTE provider. In
> > addition, it addresses dt binding comments which prompted code
> > changes in the existing HTE provider driver without breaking the
> > Tegra194 provider. The comments raised concern how existing code
> > retrieves gpio controller node
> > (the node is used to help namespace conversion between HTE and GPIOLIB)=
.
> > To help simplify that process, new DT property is suggested which adds
> > gpio controller node in the HTE provider binding as phandle property. T=
o
> > conlude this patch series:
> > - adds Tegra234 HTE provider
> > - modifies existing provider code to address new dt binding for Tegra23=
4
> > without breaking it for the Tegra194 chip.
> >
> > The V1 patch series:
> > - Adds tegra Tegra234 HTE(timestamp) provider supports.
> > - Updates MAINTAINERS file for git tree, mail list fields.
> > - Updates devicetree and API documentations.
> > - Enables HTE subsystem, Tegra194 and Tegra234 HTE providers
> > by default in arm64 defconfig and dts files.
>
> All your emails miss PATCH prefix. Use `git format-patch` to generate
> proper versioned patch. Stripping important part messes up with our
> filters. We have quite a lot of emails, so proper filtering is important.

At this point I would even recommend kernel maintainers to get b4
into the workflow:
https://people.kernel.org/monsieuricon/sending-a-kernel-patch-with-b4-part-=
1

This tool will also implement other desired behaviours and version
the patch set for you.

I am gradually adopting it for my own work, using it all the time when
applying patches but also getting better at using it for submitting
them. It has a small overhead (like learning and memorizing the
subcommands) but once you get used to it, it is really helpful.

Yours,
Linus Walleij
