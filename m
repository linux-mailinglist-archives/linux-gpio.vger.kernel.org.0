Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18BB64D99C9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 11:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347695AbiCOLAE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 07:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347711AbiCOLAB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 07:00:01 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D933CFCA
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 03:58:48 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bg10so40374740ejb.4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 03:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vhkRFrje+3uJcCBKvzPs8/fAA2YESaNlXBMk+FpVdSc=;
        b=fOJ+fdGS2QwbutYjMd2zjWqNZhQq/1bai5R8BZVYYCtbsfQcXaTcKKsUnUyXJYXeTo
         z19TlFEXzO3RnnuYCgkQKIb2FxhKnoHUOvzhhq7oXjQptKVuN/WT3ccRcAgn6S5YwIiE
         HZuLj01iE1HdUZgR1LzUxBCOLTFt/OOy4a++ap5ffy5R9JpTKCs/3yiUE3Qz/O4sK67J
         TuzASiXnQOO3aUfvChNxcFTSid0gxi3I19reMW3pGzsa0aN06BBToHLIJp0lCgKWD2xG
         fUYb4IZuaUFNCb1ZqHJW5CempOuO1vtiQjy/lP3sqDQ/+6f3BMCP9E4Li7gg9PmVYwkB
         OnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vhkRFrje+3uJcCBKvzPs8/fAA2YESaNlXBMk+FpVdSc=;
        b=Ul+iISl6gzir7o2RkW5+gTuD/lI1EpXDFDDjK63ddwFn4xTJi2v7Fz1U3u4MzkWVAt
         UwVaV6wJ1Qwq9d2h0zPGuHHNuEiSq9zg2wdMt+SQfUhFPs03IdCCKRPnvbfY5UQaVkqK
         9Pz9Hqn5Rg3uPo2Be71ntY5ybrYU6rZPrvO/G/9emebAoaYi2DB9ezcsW9uTKUix8HZK
         qAm/ca1oNqnjIXCmpWcCYVC2Ie2lYLaGsZbM8c6Xqg20Fcm8z/mQ+EesXf2q75mGXE3l
         E67UQnCDxGeDhhQksDrpKyIX9gEs13IrA6ErgAfk3FgVmcWYe7C4do8HKfwwnZOxr85e
         MVoQ==
X-Gm-Message-State: AOAM5336mDZ0l2xBVejWe84y2VkjsioJtlZZIib1DKKZ2mjzGZ2gQ0sC
        MH4jHIzdZ950GrPDZduWeGFtvb1hMOddDuiiV++rSg==
X-Google-Smtp-Source: ABdhPJyHtJGfB0Qv9xFA0QqxMalP8Vqqp+ER9NdVhnq8K4CGNhErK4fOfimmyf7r0eueswyGzwIhMs5jxNXJhk24mlc=
X-Received: by 2002:a17:907:3f24:b0:6da:68fa:b2cc with SMTP id
 hq36-20020a1709073f2400b006da68fab2ccmr22334732ejc.734.1647341927036; Tue, 15
 Mar 2022 03:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220311073926.78636-1-warthog618@gmail.com> <20220311073926.78636-5-warthog618@gmail.com>
In-Reply-To: <20220311073926.78636-5-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 11:58:36 +0100
Message-ID: <CAMRc=MdOHW3bD5BvVXD9eHH-7kmCj-fhDmta8OnkyORVCh2euQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 4/6] line-config: rename num_values to num_lines
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 11, 2022 at 8:40 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Other functions, such as gpiod_line_request_set_values_subset()
> use num_lines to indicate the size of the set, so change
> num_values to num_lines in gpiod_line_config_set_output_values()
> to be consistent.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

This is the same issue as with patch 2. We're setting a number of
offset to value mappings (it's better visible in the C++ bindings
where we're actually setting std::pairs of offset -> value mapping. I
think that we need to pass is the number of values to set and not
number of lines. We are still preparing the configuration.

Bart
