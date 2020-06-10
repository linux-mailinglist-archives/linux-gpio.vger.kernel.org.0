Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EFE1F52DF
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 13:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbgFJLJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 07:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgFJLJg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 07:09:36 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B86C03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:09:35 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so1948298ljn.4
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JTxJ0V+tkINvi/5XahhTkNwUPIq8Y7XaD42/R2v4jCY=;
        b=DMtVd9YvbrtbtU/UGaEYJLtcE34ggycudhebhrhlx6vekMfbfj0+lckx5WqPKeijcL
         FTMA4iqATUDSCAG3gGP8Bc6fbw11dKnNgS/aBtdbZS5g/dICPlVUW/qRq0NvSZ4QHUdD
         UNpXn7b0ABYXAkbFgOFLikYCQ9dfJYOFH2l1kcAfKa0v0Jd3p1Wsw0snEcSn/9KO5EUL
         E6/X/+/Orm9a322JKmpn2e9QyBK1L0YS3ShoUPspI50/tg/10SIpGHg/fY5cAL0KsRY9
         yV58JjGgxZHuzZjGn1/vrBnT65sdcgcAqkr2THswbnrp9SI0q8fVG/l6Cxde9froeEQn
         QM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JTxJ0V+tkINvi/5XahhTkNwUPIq8Y7XaD42/R2v4jCY=;
        b=CUWFtDCUDrtJmYBi49NZJHyGsICEFnAlGPUNdwMXrVhTdZJlQOTcL/R8lTNSU/DtGn
         vO5UaA9dCLArF2vrEhSbrUBRGLrGu417fe/9hFyBopHeii3S0b0g4GLYIofBd9u434Ig
         Fzw/hN8PFPAQuZV+1QQjKFGRS9P6FNd0cPQPbWBWRgMyTDvHwRz2nZn3sn+0RvrrqX0A
         L7oPZxb5Hcxd4uvTGpjwwEBg6rTewB8WiO0VDzTHt0hKTGB/8oUH0045cUmGIdvF3OKr
         B0eWHCJ5sFgail+dNeZvFIUIjTplrFyQ5MyCEQ1si/u+TB+q8I1kK+LqrSgnVt+jf9+e
         4w0g==
X-Gm-Message-State: AOAM530Gz7ssNp0w3geDmVCGY4h+q9lC+XKQH8h1ectieEyf46ozlwWX
        +kKtWSB/RZez2/NMO6vVuUWEzNMfp291fygfT86q3w==
X-Google-Smtp-Source: ABdhPJypSN5QorFkNeGSsLkCxGsAL4uoIO8FrcW1T9gcz8KEfc93JWeEnCkciFpnvoow6wpHCzy9rqY/fQMwVBpAAVU=
X-Received: by 2002:a2e:880c:: with SMTP id x12mr663585ljh.293.1591787373343;
 Wed, 10 Jun 2020 04:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <202006080944.vTmpp64f%lkp@intel.com> <20200608010253.GA79576@44f7ab9e8d59>
In-Reply-To: <20200608010253.GA79576@44f7ab9e8d59>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 13:09:21 +0200
Message-ID: <CACRpkdaOcaf2W6-sbULK_FogHg=1YYn0_sUsuHZUEafPLP_MPA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Split to three parts: fix
 ptr_ret.cocci warnings
To:     kernel test robot <lkp@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kbuild-all@lists.01.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 8, 2020 at 3:03 AM kernel test robot <lkp@intel.com> wrote:

> From: kernel test robot <lkp@intel.com>
>
> drivers/pinctrl/pinctrl-mcp23s08_spi.c:129:1-3: WARNING: PTR_ERR_OR_ZERO =
can be used
>
>
>  Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>
> Generated by: scripts/coccinelle/api/ptr_ret.cocci
>
> Fixes: 0f04a81784fe ("pinctrl: mcp23s08: Split to three parts: core, I=E6=
=B6=8E, SPI")
> CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>

Patch applied with Andy's ACK.

Yours,
Linus Walleij
