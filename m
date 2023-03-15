Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7FA6BAB04
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 09:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjCOIoe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 04:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbjCOIoa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 04:44:30 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF7D1026E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 01:44:28 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id e65so9673643ybh.10
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678869868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjzCtPEm6HcJP3Dyqv3r8CH6xuRjgHHwwVWtAY22KeA=;
        b=TmAKOF7M8OJRv6ijewUFhsz3aDwUQXGJFsVcEjkqXtGHxFyIxFaPm4kq7cmash4Tps
         5X+ndCgSF3JCUp2XUR7/xccFw1BoHwrqyFqPg+TE6Je0mZxAPI0SWN9nYSYzgQml8fHL
         475jPB+I77i7uO+gBEiRINVPBUe3wRqbnOJao9vPHiSJAc/n+HCiUBFJNrM8wfu2jag7
         x86kemVHY9TVE6LFfAXFWbVy+I7thtntU4qCEGn2icSO5o0NBPLuquU6xo6Rhx5mzTBY
         HKZNNEwuEWJktmXqExPil0H88/bpR2qWFZy895iv6eW9cFOOw45+1bEz1AMxaJvEetpn
         bi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678869868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjzCtPEm6HcJP3Dyqv3r8CH6xuRjgHHwwVWtAY22KeA=;
        b=AwMtb0V4imMAO0TXfrKRVkTXLGZRfFyg/7u9Od595Iz+ErXola4NLJ90tOooGecaIs
         FnqQfTDu5ZYjw4z/eV+YlhAZ3IxBobwXLPMk62Qzee9lbDdAMFMspmbJ6D/X2iPuCern
         3QuYoPmAf/vjtUUOIQFyUOHYaggEq0edztix/wiQ8VlUTMAVUPPk1QalhF1NCR459qpB
         B6xt9CywazAdqLt242EhuH1YMJiq4brz7iQwIc0hvz0VcjcT7kzFtuLVMDxzsk20rORd
         cIpFVJPiCtoiUcPw9voAUmQN7N4/8wvDsKdRQCJX1ryddUfkJGGMQwYDNpJpnMDiHtmv
         KAZA==
X-Gm-Message-State: AO0yUKXOdH290GTKCu8xR64lrqk7WwJRAa3x4AiJY6QSUdli8HrprdOb
        OAFWT0v4WLS2EPgHVmezUo82X+iB3HY/fz/ii8QWKg==
X-Google-Smtp-Source: AK7set97ddda+/faZwlXgWPk9c7UeZbGH6FDRFXD/3tQR7P7H+odvFOuRJFu9/lgw3QfrzznGBXduFWqXqPqn2fPMU4=
X-Received: by 2002:a5b:1cb:0:b0:a6b:bc64:a0af with SMTP id
 f11-20020a5b01cb000000b00a6bbc64a0afmr25466480ybp.4.1678869868070; Wed, 15
 Mar 2023 01:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230315083456.27590-1-brgl@bgdev.pl>
In-Reply-To: <20230315083456.27590-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Mar 2023 09:44:17 +0100
Message-ID: <CACRpkdaBKxSbRxCoYRyNJMfjiDZ5TswYg7s-Z0Loy+aha4ZFLQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: fix setting event clock type
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Wes Tarro <wes.tarro@azuresummit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 15, 2023 at 9:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Fix an inverted logic bug when parsing event clock type in gpiomon.
>
> Fixes: 8ffb6489286f ("tools: line name focussed rework")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reported-by: Wes Tarro <wes.tarro@azuresummit.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> -       if (strcmp(option, "hte") !=3D 0)
> +       if (strcmp(option, "hte") =3D=3D 0)

I tend to code if (!strcmp(option, "hte")) but taste differs.

Yours,
Linus Walleij
