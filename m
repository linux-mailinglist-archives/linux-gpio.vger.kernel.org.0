Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B315B1692
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 10:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbiIHIM4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 04:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbiIHIMk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 04:12:40 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76871DAB96
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 01:12:02 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id s11so23131440edd.13
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 01:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=CsfLF9evkjLMWhZzbrS1cueTNnTYWxzmyf1KcBcwPJY=;
        b=YVwlNQvyhCelbiE1ndTP9itm1PgEu1I4mLf5jDtXzgOlwCvy2MLWSEDYYWr2Gy6Uq7
         u4awXYI98ftADXwkYE03yV1XCVXFQNO4ThcU3N23O7CZ/gr3NAateb/hGOhjFC8B6/+x
         UBeNieHXcKfM5UAYZxa5I/ua2+ZbD5cbtnZk19OPRehwKA58kZLGsh3cfIRMsYWVvKZq
         f6+vJhEQtb1MEAk/U5yFagPatlaXbTideDeoSmdhIxxntr3yl5fu4vg1/YtTbNmcm4Ne
         6m6aeNHS3Vkbr1IeA347uA13wemsdXSkiEiVmrHI+LNAG8WHqw34n12N9BRU6weF6nEO
         hI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=CsfLF9evkjLMWhZzbrS1cueTNnTYWxzmyf1KcBcwPJY=;
        b=BOUtilWpbbx9yhoXGExdu3rd969QqOk7mq7zImmbLGBZLv62/wLVyGl0ZWvgQsC9eX
         c8eVvPjff82AP0FBOpiUIvK8i8d/AiHP1f/dyzcu9Q4HQ2Fmmhm0y9Brcr3huJiT5m8U
         NvpfzbYyDfskEyYeh49MCUJNJRl9znvlH5L+C/UgUTgVupUUoP95/j3+BnYVH9Jf8v+r
         ZP+Auri0ns0vT6bZXw7dBlZjtxbA9oA4snnlfWYhH5VrgxzEqFoAlyh8CVCVMUemuEft
         0wu88UT09SNaSVeFDq+p5wvCQ5GCi0I3aakbx2bQrlSFZ57tMBurYxor/8RKY4hCELPL
         cbkA==
X-Gm-Message-State: ACgBeo1I3uUCa6PBqooMTxEAuArdRLyd0TNpoCXgsQZuoZEpys9Ky0Qj
        0/U2B/+tlQev54/9stp9Fv5lzezTg+jS7dN+c/paT7mjWSYyQQ==
X-Google-Smtp-Source: AA6agR6kg0wMenXTo0aj9ChZKdkYWULOi4m/7fUqfh/BdsmVb2bNbAqHgKqED0NA0TgTW0WakKx8AewS4OJyCfI1xSI=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr6087320edb.133.1662624720431; Thu, 08
 Sep 2022 01:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220905185102.74056-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220905185102.74056-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 10:11:49 +0200
Message-ID: <CACRpkdbFZu1Jkj8dyPwbnHRCmOsoMLZ2ZR=RrbzC+YOjMq9b5g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: ingenic: Switch to use fwnode instead of of_node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 8:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

With all these patches I will probably just apply them and see what
happens, it's low-risk stuff so I don't foresee much problems.

Yours,
Linus Walleij
