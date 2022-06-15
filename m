Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0632854CA6F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 15:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353542AbiFON4O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 09:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353817AbiFON4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 09:56:12 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC843255AF
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:56:10 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id k2so20649229ybj.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9hpOwo475/GfD5T4YpcQXF5pUrUs042A49YLVq0nVIk=;
        b=sl9HaTGrSTucowL62Hj1bdr2Rw2h8OanldxUf5+eW+8ljpUhm/RwL9Ar+a7DTr5/9Z
         rNcJiwgDITYye1xsATupQlMD7t0NW3TGmTwnuhqUGRjGaM4c+5YarPBo5CQ6J54HURYW
         DSJj5x7WGsvGj4sPDQ90wpOKKbA7v7BbzQgCy7Za+TSy5kS5dWQYSHjnWgHEqhNBTAu6
         f5RufuCncF8mppxdzL0EBNoVshgPpqTPTxhQ3P0bLBvz+HGu6smkBuNBXVt13OJ1m8qL
         mYbZUJLjCj3gEEJKqe5inucgyaBmnps7Kns9LqKnSdwzeir/a4vyrDKnv1CkzjYDJ3cE
         LGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9hpOwo475/GfD5T4YpcQXF5pUrUs042A49YLVq0nVIk=;
        b=LAm+j+hlqdAK1rjBi42CpWP7Z+ewRuerXtECCFONnwAyFKivyxjjCQg8arUoD+WZSq
         PWgJ6p0x4ZGIbkM8idBJYtEK6bgvWJvOA43vDPYjEzdV6L3OkJ18UGS9ROCycaygyXSo
         BNd8tLngL/fNX5dwwOK7H/qKiXB2fzBRyX62Mp8Zbm4QhSfauNzqvlxL6+nqcTUfk5Sd
         y/8V+PvRH3UdkoTCUK9ywzv5eGR82BTSx9lxy20jyvzD/tLfrmeYeRXj48Xd2N90N0p5
         mbbnQ49Aavkf8GHFh8xGZAdPHKRjuHT3QQnD6J5yFEVBBVR/MOY57D2Jd/xq4AGixVQF
         8OBA==
X-Gm-Message-State: AJIora8zzuDIOU072M7oA3oyaaP9xHHRIHCqAX6K1f64O92k7uXWbHVK
        HdHjSqBuX3BUpdjsSv7ORf6tgyYmdjYLoMiI/i2pZg==
X-Google-Smtp-Source: AGRyM1tyiU81aR8Utpw7gEL+Hb6Da9WbABnFnwJghLDts9gz6EER9tITEh3rrZAgzSlHUEpQBKzFzjCoXSTJfzc1hCs=
X-Received: by 2002:a25:bf87:0:b0:664:8c4f:1441 with SMTP id
 l7-20020a25bf87000000b006648c4f1441mr10525066ybk.492.1655301370088; Wed, 15
 Jun 2022 06:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
 <CACRpkdaQQxSO+dSbsFdgmzprJTexepmtBqbuX-X-XP2zVzepsw@mail.gmail.com> <Yp3R3RrH2/SGx6oo@smile.fi.intel.com>
In-Reply-To: <Yp3R3RrH2/SGx6oo@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 15:55:59 +0200
Message-ID: <CACRpkdbynUtZgT9Pcc3eoF6FKMxJ4Jjc=R9-osZvBK2ACbd08g@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Enhancements to AMD pinctrl and implementation of
 AMD pinmux
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        mika.westerberg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 6, 2022 at 12:07 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Sat, Jun 04, 2022 at 12:12:31AM +0200, Linus Walleij wrote:
> > On Wed, Jun 1, 2022 at 5:29 PM Basavaraj Natikar
> > <Basavaraj.Natikar@amd.com> wrote:
> >
> > > Changes include enhancements to pinctrl-amd and implementing
> > > AMD pinmux functionalities.
> > >
> > > v6:
> > >         - avoid nested conditionals.
> >
> > Patches applied for the next kernel cycle (v5.20).
>
> Can you provide an immutable tag / branch, so I can pick it up to my tree and
> develop patches for Intel drivers based on patch 1 from this series?

Sorry for slowness.
Created ib-v5.20-amd-pinctrl as a branch in the pinctrl
tree and merged to devel. Pushing it out soon!

Yours,
Linus Walleij
