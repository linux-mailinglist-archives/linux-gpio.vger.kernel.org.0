Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B6165886B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 02:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbiL2Blp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Dec 2022 20:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbiL2Blo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2022 20:41:44 -0500
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45234112D
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:41:41 -0800 (PST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-14fb7fdb977so13722290fac.12
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5EkBJQD/c68RJVZGXy0HKcVQWj7dlCTAB7HBSkm2xT8=;
        b=VJnM6/MLfCtzy4OB3sFx1Fm7iBipjbNMb2bH5oEcXDaiIJPjND9L+3WJIgG/vFFhdI
         qBuLikVKrZnlHITAQvDh4N3bTmwMcAzQqMSNxpU8NHjF47ldKXk+zimbXI02FFiSUND0
         1+mpRYOhDCWk7W+yndOYj7lJkMeDBUUUPHTw30/zGwHL2GnNTsyScpTJDdPrtW7PCzX3
         GjaShPwnLDygudFk2DbOz3dCPIq0QR9XvNdauuAaFZ7fn5iaWdcM/JZk8OHcsfzXUWlu
         lPRdYCvK3/3MzT+ppjlbYRQ4iIdzfQ1GsoAevaR8JN+alytdO7ZXeSHcjJWh5xdaanAw
         8nJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EkBJQD/c68RJVZGXy0HKcVQWj7dlCTAB7HBSkm2xT8=;
        b=c1p6fYl704/z/GMNlvW4xzagDpgmt+7/0GivG/CmY6knJODfFnsiCd68qan58lA1iW
         tq7obax0rxe7PiXi0YKnsCkYzBt+FNb4Ve6CJ36F/9JZxutGJXVTtplWoGHzBdMzdZxW
         W3Y+3gTOGl5Nu/ls4QVmYP+LVtSWVCDo8ALTBGluJiQomRknrVs/sr0tT7YZZJbcLr5b
         oU+bpHk0Kk+dU9aueqFFvqIGFq9dtcwESYf8OGpXlKSanefxvUhdiPQvizQA+DaTMxQd
         CMazBLsveSXRL+A0q2Wyam1iFVlqBWxgJqSk41lFnn8eNYHuFmgg82bPC28QDzsBknfS
         qQ+A==
X-Gm-Message-State: AFqh2ko5J2WwARokNKOXfsH/WHc6haseercfPdHJgILWz+l1qr6wF29A
        8IUw0Y7rJLXaFD237GkPeYpBgSEvuLVWusXL+oeQlA==
X-Google-Smtp-Source: AMrXdXuwaw7kd2b2t7tpaXaGkV5+98Jws9Pf+vV4ef7pixGviYj7YGU4fswLGw0TrQJnzv3W0zkI3SVwb8V1GdFKOkk=
X-Received: by 2002:a05:6870:fd89:b0:14f:ede2:db25 with SMTP id
 ma9-20020a056870fd8900b0014fede2db25mr909119oab.42.1672278100651; Wed, 28 Dec
 2022 17:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20221220090248.1134214-1-haibo.chen@nxp.com>
In-Reply-To: <20221220090248.1134214-1-haibo.chen@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 02:43:34 +0100
Message-ID: <CACRpkdbmcyO+QMbvAVC7Wm+u3btcAebiGQySSb7jG9J8gYNOnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: vf610: connect GPIO label to dev name
To:     haibo.chen@nxp.com
Cc:     brgl@bgdev.pl, stefan@agner.ch, linux-gpio@vger.kernel.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 20, 2022 at 10:02 AM <haibo.chen@nxp.com> wrote:

> From: Haibo Chen <haibo.chen@nxp.com>
>
> Current GPIO label is fixed, so can't distinguish different GPIO
> controllers through labels. Use dev name instead.
>
> Fixes: 7f2691a19627 ("gpio: vf610: add gpiolib/IRQ chip driver for Vybrid")
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
