Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCBA5A28C8
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 15:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbiHZNrI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 09:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiHZNrH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 09:47:07 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44312DCFC0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:47:04 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z2so2197010edc.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=tdyqm7lW/9+BRKW1noV2HeTiiovjnxyU7lQpW/yER3A=;
        b=O9w7ecSB+WNfVwITP4QWmvW6OO25vFRs1Sdo2EdTAls2m3jrPtBALKsm1IOhTVKxoA
         cXJlYperIsC5N8IyAuHQSQzyPFLBTktnttvC8CE2fVhx7MlWn7VkKNkRTej4H0OJw9CM
         u5wvIKojceg8sTi6soDnTD7Mj2W11Wj5s+kObbrzqfzBYsisqYVFrii8VV7HToejDDXP
         tnHJCciBrqk8aOhappwRGWZ/YBgSOigHd/ge969BkVJr2fo0rA6g2iDYPFI0k7V/xuZM
         c72JEdZ3Br8wj3p6s51gEoILwgjx/ZR7EAVCS2jCr2k23c8qxKaPs068T4o8Uv0BR2tZ
         vxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tdyqm7lW/9+BRKW1noV2HeTiiovjnxyU7lQpW/yER3A=;
        b=ACPLz6iOAV0Z7YIWyOkGGxILZxpaTVp4POylRr9nqxeOfsm3T8RDHaTNveYCEJwMJ3
         OF0mel+JTdDH16WYE15Q2m3FczDehpETi+T9kTLOdELfTIVIKpi55V8GHBcCgVJIcRLB
         cP5rodC4w4R2w+zEVyPYVLZCY3Cmbz+81Gi/wPHk7J4qCIZtqzbqBxkORday9Nd4ykRy
         FDU0GME1OIGcyOiIpQV1jENB2YoZs2ebaIOVm6pWn6qkWQSYAaWd9Tmjf/1sgZu2Shsg
         ixHpyr9tV5CxW73C5bpgoIaqXEsUsp6XNYdCWXvWotldM3/oHf6kWFrYTFn5W2DYn/Ri
         fxwg==
X-Gm-Message-State: ACgBeo1q1J5jcmMJqgdDTyi/x9LeIrlUqxBvQL/vLKxjmowOcNhyjVW8
        iDevb/ewu3vxsWOPFMN2psEnFh2LuOvJlV7d8F8SwaGofrw=
X-Google-Smtp-Source: AA6agR67VcVIwydkOJbRJ+QEjF4GAyGy9EWxWvhhZOU/F/3QiJ1q7RjJsgnEJCNT7kkdxyg3X2i9roJGA4m0wxjQ1sg=
X-Received: by 2002:a05:6402:1f8c:b0:43e:8fab:76c with SMTP id
 c12-20020a0564021f8c00b0043e8fab076cmr6821062edc.126.1661521622829; Fri, 26
 Aug 2022 06:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220825124134.30242-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220825124134.30242-1-yuanjilin@cdjrlc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 15:46:51 +0200
Message-ID: <CACRpkday3c1BUDgheHVovBJ=v9Z-Gbq92Ex4J3VmKDr4sYdL9w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl/nuvoton: Use 'unsigned int' instead of just 'unsigned'.
To:     Jilin Yuan <yuanjilin@cdjrlc.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Thu, Aug 25, 2022 at 2:41 PM Jilin Yuan <yuanjilin@cdjrlc.com> wrote:

> 'unsigned int' should be clearer than 'unsigned'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Patch applied.

Yours,
Linus Walleij
