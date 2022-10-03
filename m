Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 374755F36B6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Oct 2022 21:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiJCTw7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Oct 2022 15:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiJCTw6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2022 15:52:58 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CE7326E2
        for <linux-gpio@vger.kernel.org>; Mon,  3 Oct 2022 12:52:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id b2so24476405eja.6
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2022 12:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zyAF7wz+VhkMlZQVKhMPF8IArrSVhLHqvcJj3Txxl1k=;
        b=PjORr6EXcAsKP3b4j6H5rQzqWWOUp03iLBdUR8KIvtFQInFJP70u1Er4+wjVAGFh94
         1gLahyzFk+5VhRjrH1B1YzRqG87X5klE4z6FDMyNZmMD0cjkW+MqZPWpSIxi8bEmDOY/
         4ee+wbworXJQ4ctEZpu89fREoXqyy21TGfQX7GNCE+CUTz1ujC2yWlN0tV6Pd1Cu0Xjg
         7Gxdoe7QN9poOyINSA6yjzGA9UTDFMj6dKY6w+ikgcKvyh3fD6qlCKz8Q96sdBFjPAuU
         DqNuGZdMY1co/4JymbBw5BQkR/QYUICbZdn9pDR7Qod3lpKCwdrqbvTLaivH0hu4B6In
         SojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zyAF7wz+VhkMlZQVKhMPF8IArrSVhLHqvcJj3Txxl1k=;
        b=VeyLRRDWG24jtcEvCd9vxA1HibFBHspT+gq8ax5iIiWw9G9+XiF64H10FnFprovDHk
         rvDcgVfMCUiqk+P7b4ssKzlI/fzWyFu1Na8cmh2dn4mZaU3A1o2OBQXr5mfpnpDbORTg
         CzGKb5dy40RIMZuQ0O36VhaOyqOe9fgOlgyMCc2Kf+4q1ZXfqordpkZkf1xpQpOXhnBJ
         4QXKw4auma8mXEzVBX4Kpp/iX1Uf95nYy9vFjGyBvHyoRl45NHANfPx8Ql0Fct2eUhOP
         KCyBIzI60oj5rY+0p337ramQ/ALYF/vk/OHvqTeTmRGcrVee8BjfJcnWuWrHNuTMbpJJ
         EIcg==
X-Gm-Message-State: ACrzQf0fKTSXpcQ++28z3iSnSDdTm1hhv1b7ecyomr1p90UwsFQQvQSE
        vgqnZyVF7uohxzVoHelNNybystWAta5U2qTG7nLetw==
X-Google-Smtp-Source: AMsMyM6/qMu6U/DbXO5vmyUz56WPvF3YYGgtZ5xlORtPShvTCNqNNKzptLQl38ON/JNUeLRDOU1fCZJtZW3AZKWsMuU=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr16286635ejc.440.1664826775440; Mon, 03
 Oct 2022 12:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220915114803.26185-1-shubhrajyoti.datta@amd.com> <20220915114803.26185-2-shubhrajyoti.datta@amd.com>
In-Reply-To: <20220915114803.26185-2-shubhrajyoti.datta@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Oct 2022 21:52:44 +0200
Message-ID: <CACRpkdaTddy+ZRzuA0-8-sG6fKNJS74RJmHUKHnf20_aEq-GqQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-gpio@vger.kernel.org, git@amd.com,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, brgl@bgdev.pl
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 15, 2022 at 1:48 PM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:

> This patch adds compatible string for the SLG7XL45106,
> I2C GPO expander.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
