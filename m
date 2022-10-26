Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F25960DCAE
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 10:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbiJZIAS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 04:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbiJZIAR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 04:00:17 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C2B38A3B
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 01:00:14 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id n12so13735643eja.11
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mCbWzo/9kWo2Sq8jUgAnZQrIjhNinjZClOiq8Bd8Zy8=;
        b=lspEgDIl3lW7/8XU7Oe63DkgwzMhy2DFnx4Him2Z3BwbX65pQjfan9fm2HYcHy43bC
         YCFe3eI/QvSi1/e4adpzRAxSmZIBs7RDrdbnK9qVkh5xFgj+rwPRaufwxZOtSlEC7m8k
         5/WNxLyWnVH4+X4cy9f0E4QdHncYlaxwWWUZgnfks2P3OoflfU7bVx4sRK0i/HE9I/Tj
         wKzPh1XUx9UhOmLwVj5KJSIJItDFGkREE6/C8ah9vd0V3taazERxUS2adfAFQhPyc0Mx
         ieRfg5pRYU1DR3S/HqkUbFfpU/8wKs38tkudVBj8gibcLIAMJPGdtNiMkwHO9KpS57i8
         KTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCbWzo/9kWo2Sq8jUgAnZQrIjhNinjZClOiq8Bd8Zy8=;
        b=taOGDvx3laoE2U++jd5KQx2wg7QoU24IND+blaS/aqFRLSSNbC+4v+zBa2+5x6uoeD
         NZKVvokSGJFyTsiUdGZNs9xcpV30bTvI3W0Dje1IT1ZvzGPTVU066RwqQpob6daCNnvB
         CD8qfoqWevWiE0D308bu/TgdbspNY87njsVemcYn5EAuoc/q4OMSWhTqX7+nG8/3UeUE
         KV5/pcoHmB84+6Wqv7xrySxkZo10ofniPJeptA+LmoZMNDtCbVX8MaoDkmi9susdGtoa
         b5SYFzh5IWwIepJxoA77UnV4TYQ+v26L/mWG0WX0bVGlbw++LeivzfIxdifbbfVn7exQ
         sEtA==
X-Gm-Message-State: ACrzQf2jW6JKzHuBLClvlgUB/Pw9k+V+Y2VkMJ9ecH6owac36LzfWH6e
        9ygCuuc+3x+2h5+Al4AdVSUatV5OdA4yodAFRNxVEmid+2ervA==
X-Google-Smtp-Source: AMsMyM6MUptvr6oj6E1AkekTT/hziniE69ZnnwaNGvfK7mRR+vXyLjicZeb44pDkgKVT3jafMMMUeAAJ7e3wFk3tTP4=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr36928953ejc.190.1666771213495; Wed, 26
 Oct 2022 01:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <Y1fl6ZaTNa7L6QfQ@black.fi.intel.com>
In-Reply-To: <Y1fl6ZaTNa7L6QfQ@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Oct 2022 10:00:02 +0200
Message-ID: <CACRpkdb3-ifo2u02kcxbQzB6fJzYSQOSjVhXRWWsCRrc2_BU-Q@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 25, 2022 at 3:34 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A bunch of cleanups of the pin control and GPIO headers. It has been a couple
> of days in Linux Next without any major issue reported, a few fixes are already
> incorporated in the respective patches. The idea is that pin control and GPIO
> subsystems take it now and we will continue from this for all new code.

I'm a big fan of this cleanup series!

> Linus, Bart, please pull to your trees.
> The tag is signed and can be considered as immutable.

Pulled in to my devel branch for v6.2.

Yours,
Linus Walleij
