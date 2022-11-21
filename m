Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8F8632DDA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 21:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiKUUWk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 15:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiKUUWj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 15:22:39 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C8F62E8
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 12:22:37 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id g16so6206813vkl.11
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 12:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8MW535ckwMs+wvDkuq0sbQAYdO1U1rMrqGHSs3G5Tvg=;
        b=2P2Wj4BQnygAzKsEPkU+wdyCmJSqkexeiN2Uk7Oe75A2PdU1pT7HsnsBBi4Vwnihhy
         Hwz0B1YxhZzN0dcuAHVj9b7STpiu0/JI/sO/lQPLjgDSDo/q7jYSYlkLf787ZoFTvVlM
         Dvee+ij2Yp/Vvw7BD1RdVJs9+57nr3B1+SR2LhFisqZDoFXM9F0O26TYRPBaJmwVsGS2
         43Nys6YT93joMeeUBNDH1lmkdN0BFx4WjcqzPyabNuT1TE659SpUtqHdHJaMwDcB8pb0
         vXiqkiAM4jOkamqSZrqPR9LEfHywxZVmtG+Hhsv4VxmEMJmYFo8BNKhS7W4NrTARHv6W
         t93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MW535ckwMs+wvDkuq0sbQAYdO1U1rMrqGHSs3G5Tvg=;
        b=y+ORqey+eIeZVQ1RIzVK8Yb9geChyhxUt9idbcleUhP2lKRFOB124NW1Ocpt3I/Xga
         UQ0Wm+V2rhO0fRGJnZJF+sGOnokaHGNLhXEIRht1lKovYIW9kJcimCjpWSaNoMybC4hG
         zTnFgelrg66Nu1crEQSxLA7YQFE9LC7yn+22xGLrpVkDAkGmo3zMw8NMpdDHWP2wSW2r
         WzMU6gdRQo/+ZX0r9Bfb5ZLwdrhwlOitr5zuds5rL/LANzKmJJwbSYM9yoPbm/KG3OEf
         rgEGT1QyM8XItXBUDJqNYMAiCSTOYqwXpwGSrYGdKetTovqa6zySBIsJ1pUAOmxR5jJ1
         TJMQ==
X-Gm-Message-State: ANoB5pkJm22ozNC32bVUEuI8uSblA/26Osj5q4ljfVFzl7KugVaDpSNg
        fcxLHxxVdyoNbyg7ZxEE92LBY1Ywc1OvonMRaNm8+A==
X-Google-Smtp-Source: AA0mqf6wX0RjcxOt9DVfCnui3vzmkRJyXB9JFlVwxUx5WMxMDpppfPguh5RH4w8b3oeCnaoTlQRXOeiUWAhx/R1iVpU=
X-Received: by 2002:a1f:1854:0:b0:3bc:6e40:8088 with SMTP id
 81-20020a1f1854000000b003bc6e408088mr5337919vky.3.1669062156454; Mon, 21 Nov
 2022 12:22:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668768040.git.viresh.kumar@linaro.org> <CACRpkdaB1u9jwa+qXRZXG_1LSgO1-xVxfK_G1YwHe1LpSF5fzA@mail.gmail.com>
In-Reply-To: <CACRpkdaB1u9jwa+qXRZXG_1LSgO1-xVxfK_G1YwHe1LpSF5fzA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Nov 2022 21:22:25 +0100
Message-ID: <CAMRc=McHUfLO4CbgRdBwGF0YktGFaQvbHszeNqcxRFifUNat4g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V10 0/6] libgpiod: Add Rust bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 21, 2022 at 2:46 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Nov 18, 2022 at 11:45 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> > Here is another version of the rust bindings, based of the master branch.
>
> This stuff is great for the GPIO and Rust communities. Also, looks finished.
> Here is a cheerful:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Agreed. Series applied. Great work and thank you Viresh for the perseverance!

Bart
