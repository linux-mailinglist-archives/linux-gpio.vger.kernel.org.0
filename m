Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9BA4586DF
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 23:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhKUXAQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 18:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhKUXAP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 18:00:15 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45105C061574
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 14:57:10 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so26062583otj.7
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 14:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9XpcC2OzJKUPIULTfHPzivkbHxJbmpO+PtuVvED5p2I=;
        b=mVoyODWPGJCR+2Aba02Adr7LwF8b5MfaDHuieArmPUpfYS778GnhgKQAbvpVFoNWTM
         BFf/+vNPQfOSWaZiNcYF7XwGuGJgnYy6RnCa/9sljFofJACgWpichxq9pTbJUyjkgmKW
         ulkzWJm5Qck6BKKVyVHxNZzis2Lz1BPBL2eTPruicv/xWAwkV4Q9vwPwgS093JrilN4o
         Nv5IslpCAjs9AKKA2NMiCsNAUzwtx+5Z757VFEvIIp8uvjprc1boLADUzpC+O0yexslY
         RnEW7OJwhiOR09CkfYGoKfkNTbbJDjQW8g4aojgo64VOhyI/pFySTWwaEiZ3RP6mJI2j
         ShZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9XpcC2OzJKUPIULTfHPzivkbHxJbmpO+PtuVvED5p2I=;
        b=ebQ+8w5i2PL0NMFMkE7XGLsRL19++d/ovs08PV7/SrRwqLtSjiFnliLcom3nrWTFEq
         aolZRKuyPSuxUjyq+/GykDXK1STYWqWfF2FACz8x72a8u7WiBzH99qTL+YSpGFCMi7Mq
         ZKT38/2NyidRDJJhQBBaFASUxU2SXjQtpuVBOxH9/le/hAOOY65H+Pjlvo1f2rfA4rwK
         0PARv5Zovw063Bu+VtaUlk2tA56fDP1RaAmb7bEIPhz96uyk3EycI6p6FcTHdWn3/jOd
         1DAZ/E7aeO6Qx8maYUo5wVZdA7Mpqw3MPQBE1Jo6NV+rENO7qK9Ax5gS6TmecPJ7F3TZ
         jzeg==
X-Gm-Message-State: AOAM530c6msMPMVT1NYCyf5K3SHy8S6Y+xruFVtMpBZ+YICJcB7Hkjp5
        lOxk35nCU+5Qq5t3yfMt/TpjsojTtKzLEmB1OmLbow==
X-Google-Smtp-Source: ABdhPJxzNFh6C9N+oywTSQc3Tu6q4zZFkC2s7yr/nmKU6Lmxipg1uw0WFkxVFR5of0PSyTxufTbf5CuuXzrFU4AEA5w=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21295623otg.179.1637535429674;
 Sun, 21 Nov 2021 14:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20211110165720.30242-1-zajec5@gmail.com>
In-Reply-To: <20211110165720.30242-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 21 Nov 2021 23:56:58 +0100
Message-ID: <CACRpkdbQVJTnVH8LBKAY3eCXvZLRnXXEMdgNtGwWVb0Zhk94sA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: convert controller description
 to the json-schema
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 10, 2021 at 5:57 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This helps validating DTS and writing YAML files.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

This looks good to my eyes but I definitely need Rob to look at this before
merging!

Yours,
Linus Walleij
