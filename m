Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 008CE6F6CA3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 May 2023 15:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjEDNKd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 May 2023 09:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjEDNKc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2023 09:10:32 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45575E49
        for <linux-gpio@vger.kernel.org>; Thu,  4 May 2023 06:10:26 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-44035aba96aso162297e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 May 2023 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683205825; x=1685797825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHCCOoL74B4NPcE/blXH8nEmFuyNaeO84v52uad1Ph4=;
        b=yigVCncT0fZ2ea1EQ8ZeMc7ZFc/h9mElkSQW/YvzpXsoua/jhq2A/oqim68iQTwZAf
         FHg8ySoDG/L61zAElUVs6BvqLco5kjgTq+d3tHZEMppURdwTbxQc7p7D2p/AdERKFwhj
         2g3Ew7ntKSHYaNtAVnqsLzxh0BkMIKZZmeSYIM11XLk0l6uXkIhJJB/3fHYVr1VI6/v3
         tjiOASMlFaafYv1wTuWvhlBXrXcXV2i33Plwkl1BhuBlllypKFaWgr4cHFegWpPHK7uO
         yawRUXHtPwRCJm90wi9rpILUUWm4PMWsJHqzGlu8CmTX1oZo/jZ4QONzSeeU8hyPDkAi
         FCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683205825; x=1685797825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHCCOoL74B4NPcE/blXH8nEmFuyNaeO84v52uad1Ph4=;
        b=iAI+dsoZFdjIxgnxfLS4PEhplAMw2ryLv0C9I0HHQa09BQpLGD/15dF6726kHQdc+x
         6qkvKGxhXUT2kbISz/f42WBnS5GT3BI46X+LftjtjNIj64VcRz5mgBvQ09kKBVvUGQCX
         MypfE//O6ebQeeQ6aQik/OWxoYZI3x+FCHrQVwaVrjtb2NislB8EgPXjN0Dva9o/4KQ+
         RWEyTWQ2CCRucti77jJgzwtFcu2sT7PlMx6aPEtsAen+Fvc6aTuDd9Aj0VSU1NE7rM+B
         N0c2MxPpNYWbuZAjS8nUjE5sQTUv5RiS5xLuVfVgqF4QuSFYhs0IWfobMVf6YIuGAdhv
         aqlA==
X-Gm-Message-State: AC+VfDwAZblFrK012iAmdiimYL5hh7XIt03OVS3z3ZKrDuKusy9LjcXI
        Q1FEdbVGccBx7boZ7Yued8ZWgYIw0ov00dzxmNO2Hg==
X-Google-Smtp-Source: ACHHUZ7DmkAwZ8pguXh25bdfnh+D4hEZ0VXO4Iiv7V+5DnaM6bHORQzs12X9dvdPobyritrA2b9Ms4vWcl73vBD/AWg=
X-Received: by 2002:a05:6102:445:b0:430:2c61:411f with SMTP id
 e5-20020a056102044500b004302c61411fmr2711274vsq.21.1683205825388; Thu, 04 May
 2023 06:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <7bdede8a77fd5868d19a255378bebfb2d7706bfd.1683180819.git.viresh.kumar@linaro.org>
In-Reply-To: <7bdede8a77fd5868d19a255378bebfb2d7706bfd.1683180819.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 4 May 2023 15:10:14 +0200
Message-ID: <CAMRc=Mc+2Rh3QBJ=nanzP95GRoH0kkU2XAdgKZ5KrGu0Sr50Kg@mail.gmail.com>
Subject: Re: [PATCH] bindings: rust: skip building all rust crates by default
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 4, 2023 at 8:13=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> We don't really need to build all the available rust crates here by
> default, but only what's required by the libgpiod crate.
>
> Currently we try to build gpiosim-sys crate as well, even if
> "--enable-tests" isn't passed to autogen.sh, which results in following
> build failure:
>
>   error: could not find native static library `gpiosim`, perhaps an -L fl=
ag is missing?
>
> Fix this by building just the libgpiod crate instead, which can force
> building of the other crates based on the enabled configuration options.
>
> Reported-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Applied, thanks!

Bart
