Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56A9420430
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 00:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhJCWDa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Oct 2021 18:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbhJCWDa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Oct 2021 18:03:30 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163A9C0613EC
        for <linux-gpio@vger.kernel.org>; Sun,  3 Oct 2021 15:01:42 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j5so58635324lfg.8
        for <linux-gpio@vger.kernel.org>; Sun, 03 Oct 2021 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SRVyXOWt8mtWnh8G8lJe1b0B8K7o+vzNCzCuZppoeFY=;
        b=UDdv8wy81dZshSCHMsMUGGkkoe7F62j5Oc3ivfQ2gglLlCiEpPAM8Qjhq6vgr4SET8
         t7BsQOt+U8D4dBUn5CSJpMr/AAcXh0L/ZXWyYbtvtOfiJn19rWyAkySe/U7fA5wA56S5
         XKFijSIaUB6Wy9bo5j2YjyUCuLlMPip0R3CgJ32eX63IsZz0RReD7n6rrsYzZu0mxfRn
         8X3ay3BVSBl4kkD1b2/eP/lpaIOvls13ll+sxXMbCcn5L3BiShjUBpQwSYZ7+Vme035r
         xRcIFEBRtIpRuS09YBaHbSELcLsSnCNWqKNewWZuDakqbQlmMEm7PAGR1a3jrLHKecRv
         hjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SRVyXOWt8mtWnh8G8lJe1b0B8K7o+vzNCzCuZppoeFY=;
        b=a8ho+jgnxpcL4nOEOosgQnwVOQLvJNrUkVnt7e+DHngv8Jya0nGIdN9OuFfXOXWtKP
         AGPk5ypVm58vntFPDIBFJXaUSZLxY0FScf72jbDLvnaUujM9PO7CVN0HTbRi26I/21Em
         e9nbT6UBGXfmjlQYNChAl4c50B24ckTxkw1r0dg65qwDsmXd7t3b0qORDVanDpM5F1Of
         OOIYzxPgPGIPSpI8pSg361COM/+HLsIqwr9ql3Ky5sWWsfd48DG19SdBhYf5yfap94UJ
         BVCfBYLalyKfSphycPX4l2RNyt904ccIWTrvH/liZvIqJjv8k9g9sDFve0ROmtjE2AK3
         i/fA==
X-Gm-Message-State: AOAM532ujIW5TXH37jL55x4sy4wRG1/6p/U0b9Fqr89PaCllMqmjyxoo
        PG2kfSLXTl3P7eL7g31Nck2R8TLCLeceviOO7m3uSg==
X-Google-Smtp-Source: ABdhPJwU6BYO1GlIKyiXf6kB7vXBupuW2rZNjpSs4uhugAZi6XlfLxoLWKJqpFoHQcAxQrzVJQWf/ubSB89t2TdMy3o=
X-Received: by 2002:a2e:7f14:: with SMTP id a20mr12507373ljd.259.1633298500413;
 Sun, 03 Oct 2021 15:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210930232617.6396-1-dipenp@nvidia.com> <20210930232617.6396-7-dipenp@nvidia.com>
In-Reply-To: <20210930232617.6396-7-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Oct 2021 00:01:29 +0200
Message-ID: <CACRpkdZCLe2cNiJRDzSvUFN+7qzV5kQnfkys4js9pDksYtAT9A@mail.gmail.com>
Subject: Re: [RFC v2 06/11] gpiolib: Add HTE support
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 1, 2021 at 1:26 AM Dipen Patel <dipenp@nvidia.com> wrote:

> Some GPIO chip can provide hardware timestamp support on its GPIO lines
> , in order to support that additional API needs to be added which
> can talk to both GPIO chip and HTE (hardware timestamping engine)
> subsystem. This patch introduces APIs which gpio consumer can use
> to request hardware assisted timestamping. Below is the list of the APIs
> that are added in gpiolib subsystem.
>
> - gpiod_req_hw_timestamp_ns - Request HTE on specified GPIO line.
> - gpiod_rel_hw_timestamp_ns - Release HTE functionality on GPIO line.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> Changes in v2:
> - removed get timestamp and is timestamp enabled APIs

Pretty straight forward IMO
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
