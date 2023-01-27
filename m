Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA8E67E5A0
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 13:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbjA0Ml7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 07:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234373AbjA0Mln (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 07:41:43 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B757C715
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:41:12 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id m199so5817323ybm.4
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nAikRR13dTkUr1t3vMZlpkFDzeprSZfkzxiq8MolwCo=;
        b=GMvsxzcW2ruEf4qvPhkFOAmmaB8qF09GWO6xT0aDY36VaANjPRJTpsZSZ7/n7s21Og
         iULIwuMMxR4IWSGTf7bC0bstDXMwAikmXIlwiNKdDPgbJ3SJv4G9WSIqzrD15Gp0oRyH
         0GJ86RI0egiqdaOb4gDFrVNfnwZdtyO5Tl1ut2fy3MnKsBzL2GCeBR8y3qtUhjziWJ74
         fOWF4EyULdXlkPA4ko5NFVRV40hg6rGj8Ris3Flt55HYV8y2/oohAOHuZZw5KStcyCgU
         vZX5KePjqxXmorOOjGsXyMWemmqWsGAOJw99gRda6nOc5t3WkBZ1Y9k7tMbYtHvi8nMB
         poZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAikRR13dTkUr1t3vMZlpkFDzeprSZfkzxiq8MolwCo=;
        b=QVqWsJNqbwvUsbEbZ3dLrFjCZQSVb1m2sLKkN98B6Wt1M0RmTBnoW7L8teQRUuaTSR
         Dcz+tN03oenFR6lcBaAMQKeAWNWjV4xlgUvapmO6sJB5gBU1XAc5bKZduSsN4cgaKB1r
         U2QL77H3oK13RElUMJ0L2b5QK+8yq1qGxaWBx4d/CpWZF0FAAHcN0exs7W2xeT9H894/
         eo3cZBc7JPXk404JVsm+UR1HpbDxQ22elcsf4dS/tkfmyQBWyyDKpSC6S2qBo16MsPSf
         GdoXTszPb+ZdCUuQCgo+7MtzoEJhG7DwDvKQAKxwmykKNU06wt+i/Yjqbp837cHH80sh
         GPCw==
X-Gm-Message-State: AFqh2kqHVcK+LaIfN5YPz8Ta1sVtQGm65eXc1aWZ0S8kkW0uoehT0ghs
        QlQvWxJVuAagoz5acYGegKQJUgu1y/wguG43G6LURQ==
X-Google-Smtp-Source: AMrXdXsLGmMYxS4Lv/7/nNDt8nMdm5gK8FPg+SMZ7iNaHRfX5eFWqNJS1S6nAZnXfvLQmUS9rLByVhmZPlL5e6wxC5w=
X-Received: by 2002:a5b:38b:0:b0:7ca:9b40:72a7 with SMTP id
 k11-20020a5b038b000000b007ca9b4072a7mr4926787ybp.130.1674823270471; Fri, 27
 Jan 2023 04:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20230121134812.16637-1-mario.limonciello@amd.com> <20230121134812.16637-2-mario.limonciello@amd.com>
In-Reply-To: <20230121134812.16637-2-mario.limonciello@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 13:40:59 +0100
Message-ID: <CACRpkdb5J6Jnob7ZdjZVGnVvNj7bf_zred04UyN4cevvo5QZ=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: amd: Fix debug output for debounce time
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sat, Jan 21, 2023 at 2:48 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> If one GPIO has debounce enabled but future GPIOs in the list don't
> have debounce the time never gets reset and shows wrong value.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patch applied for fixes.

Yours,
Lijnus Walleij
