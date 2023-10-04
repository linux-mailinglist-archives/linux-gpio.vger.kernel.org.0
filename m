Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59E17B7E1F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 13:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241788AbjJDL1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 07:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238760AbjJDL1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 07:27:07 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F7DBD
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 04:27:03 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7ab9488f2f0so925911241.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 04:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696418822; x=1697023622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=domdQOBTB4Uh6D2HC7Jfj/foB9FFuRCeOJ79oojlb1g=;
        b=2VrqgTkkH4FPyyl3fFZJSHtaqdWgpyHMQsj5rqFa9gjTOdzx4D8oIFIKkqbYmaQqAi
         X9/gQ9PYiU8Q3//hWM0Wi8NmVu8N4/ERWgsk9/SzYoqRocGuqJMpvoIoERthuApcQ10R
         y1CM9D7lP7L2yhSvx1sEOI06gOcqhzyzJnFxbq4fSBpGvuE9Kks3Wprh8pI4ZVCvbGGn
         NMSbJa39YytoOdSayyZS3ZwKejHQf6ucZFJOudFxdqNyY9VF3qQYv8Wf1wH6KPzAP830
         eC9LmJrkyvE5bWmftEvwhf6VWw9/weWpW9z1vs4p1JyXJl4ndBPYC/+AEDDHMvvr2isj
         KCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696418822; x=1697023622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=domdQOBTB4Uh6D2HC7Jfj/foB9FFuRCeOJ79oojlb1g=;
        b=umWFGuc1SPtZLpCdmrxOTGoSRphD1kZdbFgMf5hKlO91g0GbAjB1gzAxhluZCrQPeY
         H2Ev2CiYdKAPEBJ1E4lSgHcKOC4EZsJGUuYToNeCEyCLZHwcqAb1XuXHIWky8RmEM9HV
         sTLcwaTcZR1KnXRMWpDzaNm56Np4GUL5x+s8FcBkf8m+ZM25lXMGIpPKzzz6f5NkySl6
         UaMckWzYFZcOl50C0MJL1v2SVVPrM9dAl7r/1H4HppeXo0L4XbphFTvWtd6w/vS1iMY4
         rDZKtLZiEk0sp0nnmlp1FlNQ9TgSC5klueEncTTkgniWNr8W0n03U6gVuRdVYE+nP4We
         ReKQ==
X-Gm-Message-State: AOJu0YyRuZL62DfVEkYDAElzmulMjzHNW6DWp6A5PhJrGUUv8LKubwzz
        6pHZ0Higm8CouX7y8cn9JLKkDKEHo3g+cjU4x47EhQ==
X-Google-Smtp-Source: AGHT+IH5iloK4Tk0xV0CTvT50fhAreF6D7shbHOiUxye7iij85bExgSYu4UHs4u4yUCaE2iBA7Il4ZGV2YX4dpckCTg=
X-Received: by 2002:a1f:e3c4:0:b0:49d:10ce:9a8b with SMTP id
 a187-20020a1fe3c4000000b0049d10ce9a8bmr1432502vkh.15.1696418822594; Wed, 04
 Oct 2023 04:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
In-Reply-To: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 13:26:51 +0200
Message-ID: <CAMRc=MczoC6Bj4ZigNt4Dse_6YXwGnQxgxPOVJn5Y1L8niSJ8g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 0/3] bindings: rust: fix modeling of
 line_info lifetimes
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 3, 2023 at 11:40=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> While reviewing the bindings for thread-safety, I realized that the
> bindings did not properly model the lifetimes of non-owned line_info
> instances.
>
> This fixes that. It might be a bit mind bending. I tried to provide
> lengthy comments to clarify what happens.
>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: Kent Gibson <warthog618@gmail.com>
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---

Please make sure to include my brgl@bgdev.pl address too in the future
when submitting libgpiod patches, thanks!

Bart
