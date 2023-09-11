Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398A879BAA4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239686AbjIKUzU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238133AbjIKNlR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 09:41:17 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CFFCF0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:41:12 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d78328bc2abso4168134276.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694439672; x=1695044472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nSmSHdLay9tWo1ueOBouSeDs8BbyLWV7Pc0CpX32Vg=;
        b=fRx+MwvlaMHxRM8TIa8O3Dmjq+9Z7V3HFZu+twFoLTLJfkq4SBP2jauRjs2u+Jd9/3
         KfBH/zjn8/K3dlw2Ix4kcBiyVc8mJsVoPWWX05x8yhTX0McdvEyOcmyskY4xT3lOV3fM
         rmytmlssrHhbnSeGQyeRkiWWx+O1LKHe3O0U4IrnlqOH+8el/OCAPNoic9Uu0yB5x8xZ
         g0RY7kZHWRKig/E/glt9PUeIT1mI6x1PKQgiJRwz6zhXzRUPczRwjAo+3RRJ4oJ5N8mr
         5QGPr4D09UL2Azvc7I5zQWoxDIi/a1Ggu3/+SArSyu5gZ3b3G7yNJGJ4eC+0COID1hEe
         CSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694439672; x=1695044472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nSmSHdLay9tWo1ueOBouSeDs8BbyLWV7Pc0CpX32Vg=;
        b=djHXdW4xneJ1k9NrlBe/TMZBBuwo8heoZLlpGXElKewIo1JaM84OBfT3pNbJJbsMv/
         DqZMDRWMv/2kLuuCOmGGAxvQpxfAfky3XUfh86TRurcqx57Y+CTKRLcTCluzwaCIUXHN
         pOWLDYUMCB+nrYtTNm3cWWl2NzXyzoWNDpLy9VS5tsfEB3zyUIIHLqwfWHeS4fLRjOeN
         N2NQug4nluDEz/EBEWt2jQj2dKe5nt8kxfkFwIF0f+q9IUSBourNigc4URRzxvyg2nt8
         lO1FF8Or0qzljxv2u/pWzXIhhWciHp87/fehhEv6ARbAg5vwzKgyxC5FjeliKdY6q7YE
         0ayA==
X-Gm-Message-State: AOJu0YzB9w1h2USylQCoSqAJJ8tm2oWTvxbgwiAKL6hfl/q36aSNlvR7
        6hPKbbFv76XWiK56Rzw9/O5liJNn4PCZhZ6eLmfirg==
X-Google-Smtp-Source: AGHT+IEWBodMRYoPw67CDfe1qi/gAWKjCx2VF+eFj06Y3kZgEZ3CDzO8HvC6ljEaTiF2RSH76zpapCoshLhrfKyRQsg=
X-Received: by 2002:a25:410f:0:b0:d80:8497:72c7 with SMTP id
 o15-20020a25410f000000b00d80849772c7mr3990786yba.15.1694439672060; Mon, 11
 Sep 2023 06:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230908055146.18347-1-Linhua.xu@unisoc.com>
In-Reply-To: <20230908055146.18347-1-Linhua.xu@unisoc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 15:41:00 +0200
Message-ID: <CACRpkdbUOM7KD2h+mSZ4xj7UCCe_Gj_Dzcc7hSmOfOftve_kyg@mail.gmail.com>
Subject: Re: [PATCH V2 0/6] pinctrl: sprd: Modification of UNIOC Platform
 pinctrl Driver
To:     Linhua Xu <Linhua.xu@unisoc.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        lh xu <xulh0829@gmail.com>,
        Zhirong Qiu <zhirong.qiu@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 8, 2023 at 7:52=E2=80=AFAM Linhua Xu <Linhua.xu@unisoc.com> wro=
te:

> From: Linhua Xu <Linhua.Xu@unisoc.com>
>
> Recently, some bugs have been discovered during use, and patch2 and patch=
3
> are bug fixes. Also, this patchset add new features: patch1 is for
> compatibility with more platforms, patch4 add pinctrl support for UMS512,
> patch5 Increase the range of register values, patch6 add pinctrl support
> for UMS9621.
>
> change in V2

V2 is starting to look good, please address Andy's comments, especially
move the fixes first in the series so they can be queued as fixes
if need be.

I would really appreciate if Baolin can review the patches as well as
he knows this hardware very well and wrote the initial version.

Yours,
Linus Walleij
