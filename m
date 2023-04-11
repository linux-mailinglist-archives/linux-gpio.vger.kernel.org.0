Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD156DDAC2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 14:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjDKM2H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 08:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjDKM2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 08:28:06 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C1B1FE2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 05:28:05 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-54ee108142eso156861387b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681216085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyLykmkKsurEixDg1AI7X3wq4HuPpQEyMcaksttKlGA=;
        b=CIThUZcES2oixnZoFT6HB6Wpq44+zM0H83P6g1zpi+xSZMif9NGJE9XFAuPRGV9R3L
         QRoiKlUKouMrXVD0LtRvSR2/9EDy7D37FAid2N77TgV3kICwOovnvPkZpkcFMZe9ixX2
         9nSR4mlUNYnWR9faf3jpSkGUeRArQhBx3WhKb8aGqoMiMOEuQ0Oj49GjUFBeDI04gKHh
         Pa4YS26wpvOjHwkjB3J1KRJw7v+sf6iuCQjZcw0DgFdKG6BrPXR2+EuHw8NkhY4z3d7d
         PvMOl3mJI9+SlbHLL9ZiPFWm2XF8lq7Ifyhz0qY0lTJsmr6HNN0qpT0eMfdV59MfYGG0
         nOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681216085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyLykmkKsurEixDg1AI7X3wq4HuPpQEyMcaksttKlGA=;
        b=qKEeTpNlp+VZxYiIt/pv+WMD5P1dDcP0SXRcHLmehzydREn29p5RbcGbvOXzQPeZoQ
         EMiFKAYIvkyvtDdQ7VPXSU18BPTuDkYJyqRCYgQw7EpRIQn5AukUStfZMyuR4F/ZaHZY
         +JkTsSGjVwEfCtJAuIKJ/UTxO7m+xwX9xGcQZ2iE1CxVxQOu2VvNdxI3Z1znpw3WPxvh
         nbpx4T0S+fr/hFxi4zrvslsEA4ZoCk5ysxEgDfKItUzZXH2Q1+/j2/XD8J78+U1hKxvV
         bLftYpQIsJQhHdzIaOgjOaletrceoSaBZXLg7oldlM3BsXlpeYDZrU6XD2ymzp4u4ARq
         KlJA==
X-Gm-Message-State: AAQBX9frfN4Xh7/mK/Z+VJ4njvzya63aDAymXoiPi36TafDr4XvIjGME
        nwAQYI/AAs7252skLqx5cQQU1HJyGupqllXDPVDfen9uhNFPN7Ul
X-Google-Smtp-Source: AKy350b4bZCh6pkWXg97enBiH0IjXt7vyBDFn1h3TDHbq9Ock3nlK6j3BXr/E2dpNTI5lt3wKs00om//4d62UDHNgE4=
X-Received: by 2002:a81:af0c:0:b0:54c:c979:7f95 with SMTP id
 n12-20020a81af0c000000b0054cc9797f95mr5674523ywh.9.1681216084776; Tue, 11 Apr
 2023 05:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680793130.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1680793130.git.oleksii_moisieiev@epam.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Apr 2023 14:27:53 +0200
Message-ID: <CACRpkdaY1KjkJ_it0okrixrbCbe5Yy8PZiFAYacr_C03adP_hQ@mail.gmail.com>
Subject: Re: [RFC v1 0/2] Introducing generic SCMI pinctrl driver implementation
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc:     "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Oleksii,

thanks for your patches!

On Fri, Apr 7, 2023 at 12:18=E2=80=AFPM Oleksii Moisieiev
<Oleksii_Moisieiev@epam.com> wrote:

> This RFC patch series is intended to introduce the potential generic driv=
er for
> pin controls over SCMI protocol, provided in the latest beta version of D=
EN0056 [0].
>
> On ARM-based systems, a separate Cortex-M based System Control Processor =
(SCP)
> provides control on pins, as well as with power, clocks, reset controller=
s. In this case,
> kernel should use one of the possible transports, described in [0] to acc=
ess SCP and
> control clocks/power-domains etc. This driver is using SMC transport to c=
ommunicate with SCP via
> SCMI protocol and access to the Pin Control Subsystem.
>
> The provided driver consists of 2 parts:
>  - firmware/arm_scmi/pinctrl.c - the SCMI pinctrl protocol inmplementatio=
n
>    responsible for the communication with SCP firmware.
>
>  - drivers/pinctrl/pinctrl-scmi.c - pinctrl driver, which is using pinctr=
l
>   protocol implementation to access all necessary data.

TBH this looks so good that I am happy to merge it once you send a non-RFC
version.

My main concern would have been the protocol itself, but that was very
carefully tailored to match what the pin control subsystem needs and
I am quite happy with it the way it came out: using strings for groups and
functions.

The scmi code in patch 1 adds an extra layer of abstraction and a vtable
that would not have been necessary if all of the code was confined in
one file in drivers/pinctrl but it is not up to me how the SCMI people
want to abstract their stuff and there seems to be precedents to do things
this way.

I heard that someone wanted to also implement GPIO over SCMI, but
it is not part of this driver so I guess that will be a future addition.
It's a good starting point to add GPIO later.

Yours,
Linus Walleij
