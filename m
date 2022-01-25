Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DBF49AD30
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jan 2022 08:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391663AbiAYHK3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jan 2022 02:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1325318AbiAYECY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 23:02:24 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C52C06139D
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 16:43:12 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id r65so53169331ybc.11
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 16:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QR4ODCGloiSEuxz9w6zI+W3jBwxc9y0Io++GcFYvn/E=;
        b=a/ESHOliZ2cm6ktrQxxYDm98SV5xTuU5suiJ8i7uRsgOEItokvMNG9kUI4lkRcgXzS
         K9u41GjHfSdI+SG8X7SqcfhcU+B768MfJYEfP/YoRtKFRTpZOTG6/XSh4bQL9MMcE+dD
         SCVqYfE6fV5D6WQA5bnXH8u47QxJQcS7yRcbiSkjoOOAqFl3gvqo6X+WpMrpGqt7lmIP
         2rDMrQn6csCQwiewWyLAVL2pdeEhNWJ2UJ3A3I9TC6oh64ILlzNVZ1bpUY26/VxPG9+z
         nOSEkqrwXgQXQsGKbipijIc6ORoQEUIdfqdIMDDwWXbWQ+uP55Z7X+e7tpjZMs4nDtlD
         /HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QR4ODCGloiSEuxz9w6zI+W3jBwxc9y0Io++GcFYvn/E=;
        b=NShMhLHRh6jDrEAAdD1FoDCclm4fbPDKbLUMDy1lq5xozCZMV36animvxIlDgS1VDI
         F7ZnC8ysi+TsEjL8ooLff1/DrxY/kx5LaXsxdhoxFTtYGEnq+BEATTw8WtyN+PlWJ3l1
         FUFT/pqaGVEA0hVrnIE2+ntfVhZXvndc0jsiyPs9LujRwcoEW6LDLUzPolIRfMW36sfs
         A0B2VGbgPWRwtUUeS0f6WgzCYekOg3Qd+hjuAF3pZ8uwJG8nl9sNVTF9sysKa2tfuGWm
         s3HRQ7aEGWngQQ0btch/8GCvALElX80T5thc+4M1vCo2k3esqqgpbQUx/YRP5KFqQ+Tr
         bW+A==
X-Gm-Message-State: AOAM530fJ8RgpkqxG66m3v87dUnLr0250mH/1b9rlvscOcGerqgxOTHT
        jfajq3ZcFAFQU0dEqR0k+XAEnxe+Us/abIcr+BaiCg==
X-Google-Smtp-Source: ABdhPJyv5QgyRIOOGd9z0Lzg/vfhhng5aATh0xdbR1lqw01SPdgIbD2vl8GpOdvSrZU6wucGgZ7M6PGU+6+xo4x8TwM=
X-Received: by 2002:a25:8e89:: with SMTP id q9mr29308114ybl.520.1643071392215;
 Mon, 24 Jan 2022 16:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20220124102243.14912-1-zajec5@gmail.com> <20220124102243.14912-2-zajec5@gmail.com>
In-Reply-To: <20220124102243.14912-2-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jan 2022 01:43:01 +0100
Message-ID: <CACRpkdanFtHyvg9kt2xuB0d9cZLcWNP8WOAo2x8f5++bpbSnmg@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 24, 2022 at 11:22 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> BCM4908 has its own pins layout so it needs a custom binding and a Linux
> driver.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> V2: Formatting fixes
>     Kconfig fix
>     Cleanup of #include-s
>     Use devm_kasprintf_strarray()
> V3: Bring back OF dependency - required by pinconf_generic_dt_node_to_map=
()
> V4: Rebased on top of the latest for-next which includes 5.17-rc1 now

Patch applied!

Yours,
Linus Walleij
