Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048646C6215
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 09:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjCWIkn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 04:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbjCWIkM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 04:40:12 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B2F1B567
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 01:38:46 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54184571389so383326837b3.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1cIEqXClsIkjDNlYez3V926czPhumNF8sofNyJFFdA=;
        b=eUTIHwb9gHiKe80gCXINbKnZwZKRxQ9pCErWt8YiVhFdExfyg6azrWWNruAziA3WY5
         +Sm+oMyhOCxn4XhLzVHa3dDRskexRoUtiWfxEEZrpnGIHJdahOLjorgzYJtIhCAXoDdN
         +NUGr6PHcKZdNqaAvXc25OCDVatxFA5JYhPWjS3P6Hiul3AsWzClzjlJwLYndxcYiX9K
         JOjA0k+//SCJcc7whw5XEyvjpGrtLGzm+Vnno8YgalqgzgSqCfX7gIEd31dCMBrXfLnB
         APxTJDnIXHpIL6v1Yy8Fe5unGJAi3tg53SBJPVLM6/qGdCsdlUDz8GHex+iycfgzQdE1
         nSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1cIEqXClsIkjDNlYez3V926czPhumNF8sofNyJFFdA=;
        b=Neddu16//S35fg2HDpjS87/kS51Ez25PJjETdfxj8lW/G2xo+SH+LnXsRGgBSdQJUS
         FqOvV5zyVclINoFl5MRIopfQ0aYxp1PqZcnFpTADdEKGNCHRXN9CJcn+VFquePz8k6xf
         fybUQPKdOTePRtra7EPH7bikmpMAs9MRBFYaGh8skIUdh5iNGWjVioNhyT2jEGm3vo38
         k+HAAwgw3/G1TZAwnD4m2ppH21LBu1m+0dMGM3sH20xPOn5H7ZCyreSsCNjI0k0F0RT9
         /A5RwchdEHI7QKxB0FD4RMyMZ9gmfV/TgcvkPlsr5CuGJeVHDiiY9HJ20A3iYSfZHjk5
         PMhg==
X-Gm-Message-State: AAQBX9euRJI6SEeOfARMEZrrtd6AFhlX8WK6gQD6ZUT3901vRjlxbWe1
        lteY33y753DGezhin9jIoRE7Zz90k+YxjLbStLsbyA==
X-Google-Smtp-Source: AKy350YpQG1QeS/JHf1yz/+Mbi9pos/zlzsSJzy4Cm1WDOD9XB83zWfD4msAOPcBGwB9h63MVlcOeGakOFuzLin2Osw=
X-Received: by 2002:a81:b603:0:b0:545:883a:544d with SMTP id
 u3-20020a81b603000000b00545883a544dmr730788ywh.9.1679560725079; Thu, 23 Mar
 2023 01:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-11-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-11-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:38:33 +0100
Message-ID: <CACRpkdapq1cR5id3K3zASprmUbTmh+QixyUEZFjNqYZPjWw2qw@mail.gmail.com>
Subject: Re: [PATCH V4 10/10] gpio: tegra186: Add Tegra234 hte support
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> To enable timestamp support for the Tegra234, has_gte variable needs
> to be set true.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
