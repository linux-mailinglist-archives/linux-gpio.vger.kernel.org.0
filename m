Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D16086EA517
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 09:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjDUHmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 03:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjDUHm3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 03:42:29 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AEF9020
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 00:42:21 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-54fb9384c2dso15687087b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682062940; x=1684654940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5qwtO2M6ufvgxUEmylAEP2JCLOd17b640nkbmHh5AU=;
        b=Ja6oIOBG7fC93WFZHcW9jCbEh8MsI6L75Ulayim5Cs9VF/0IyccASpXaVVbJtw2b/b
         C1TxkX+Scru3vPLYGLLVRNjQDWFPmiulb3gxuO6LZH6rMxsDey3DdFJI23nIIb9PR1XN
         qORRa1+adobTO2PNnMObA3xbP2kEcqUrmIBXVDtF4tlMaaUdW+LwoclWsQGsTIWMs24T
         /kQQA6PfmwEOIlxESIvPL/9Yt2mcEbKovvXT7Mw49GWfikLR3IiH1CqrNmlERFTqT4GF
         Bv3vesqi1wflSPgeKW9pXk4rtHQwNHez34uO8NOxZ+ZOsLjmGEtcV2JHUKLwH4TYCCl4
         gNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682062940; x=1684654940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5qwtO2M6ufvgxUEmylAEP2JCLOd17b640nkbmHh5AU=;
        b=eOnV0vCYwEV3NcaRDkJeb6QnWW5CTRXblDUb5Lcvl+I6QyKdwM5AB4cycJlOKToHwA
         oFEuG6PFptNRQBDkRMsSpT+kuzMl+fBvYzmlJbu6QVYs3mO7NvieCoJMi5aIXX1Nf7ns
         KH1ccWvSOHvmUdP+Mr/y4TBRCQ9FfdJ7/S/U1uDyWz4OROSfa7FDKtGPiR9T8GrBpPmE
         FPCVpLfmt6YTXFFVK8luwF1mNTErNjNfuc2Ohsj/7HAyzHD/yFAiX3XqP9Ap3q36fVxX
         nurdpS+O0iFj++/pFD3VfrSRVZEtMShfZaK3ndHl0iezd5ZS9tWOERkkk0QYKzPFCydk
         uIhA==
X-Gm-Message-State: AAQBX9c4SLkZE5wSmoHn6lbFs4QU4DVDTTcmVxyY7NB9zgy5yVBxHOaD
        JANvhOTQmAmTLKt2ZYng8hJRlqQfDjGVqJu8L8jtN3jazxpghuIg
X-Google-Smtp-Source: AKy350YFJm+c/TNcgCjLGQjlhgIznEQGho1ynf3eavSGKciAToxR1CXLQKcmWfMmkL/YCOIJRjrRvywvby2k8tGAC18=
X-Received: by 2002:a81:8306:0:b0:54c:1d4a:1ec3 with SMTP id
 t6-20020a818306000000b0054c1d4a1ec3mr1012675ywf.43.1682062940069; Fri, 21 Apr
 2023 00:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230117084159.485234-1-linus.walleij@linaro.org>
 <dbf568ba-22a6-3936-6acd-3a6e3260d9fa@nvidia.com> <2e5cfd08-f879-7ead-d2d5-dfc97907f853@nvidia.com>
In-Reply-To: <2e5cfd08-f879-7ead-d2d5-dfc97907f853@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 09:42:09 +0200
Message-ID: <CACRpkdaC_qoCH0wLBkcy-1wzEZHnO1MS0q64_Vr83CZLs2XVrw@mail.gmail.com>
Subject: Re: [PATCH v2] hte: tegra-194: Use proper includes
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 20, 2023 at 11:48=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wr=
ote:
> On 4/20/23 2:22 PM, Dipen Patel wrote:
> > On 1/17/23 12:41 AM, Linus Walleij wrote:
> >> The test driver uses the gpiod consumer API so include the right
> >> <linux/gpio/consumer.h> header. This may cause a problem with
> >> struct of_device_id being implcitly pulled in by the legacy
> >> header <linux/gpio.h> so include <linux/mod_devicetable.h>
> >> explicitly as well.
> >>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > I will push this patch to HTE subsystem tree...
> >
> > Acked-by: Dipen Patel <dipenp@nvidia.com>
> >
> Sorry for spamming your inbox, it seems
> https://patchwork.kernel.org/project/linux-media/patch/20230208173343.375=
82-4-andriy.shevchenko@linux.intel.com/
> is the latest version of the patch and its been there since Feb 2023.
> Do you want me to push that patch through HTE sub tree?

Yes please! :)

I think Andy's series is partially merged but indeed this one patch
isn't in linux-next. Also it definietly makes things easier with this
patch upstream.

Yours,
Linus Walleij
