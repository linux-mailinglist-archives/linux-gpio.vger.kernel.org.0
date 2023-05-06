Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA0D6F922C
	for <lists+linux-gpio@lfdr.de>; Sat,  6 May 2023 15:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbjEFNGT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 May 2023 09:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjEFNGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 May 2023 09:06:16 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8860119927
        for <linux-gpio@vger.kernel.org>; Sat,  6 May 2023 06:06:12 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-559eae63801so42050927b3.2
        for <linux-gpio@vger.kernel.org>; Sat, 06 May 2023 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683378371; x=1685970371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dS8atcxZJwQbExVYUG7qwyvLFr0woVdllJ5J88pacr0=;
        b=pZOMDYoBn4KKHsvhQqVVJVM1Jc2zPRMExhIMEZggmJ3tb7Yol4pPYD978e83PXvMlR
         kDUo55uvlrqZOdbHy7Lxnw1qk37kDBF6zWER0i7xFS5W7hKIy+48SYcnKm04uHLzJOAr
         z6HrWc4oF2MdBcQYX5CckSP3Q+QosRLBPuWQpeJmmqx/TPR1Vs1Vio/2hCSBHrYzDp/d
         Plz+1KHV8fKN87g8NgjWzskuWde1Pjb8LeWZoDdsJpEIGJvCPqwwA2Ju1jZz2Su/6yox
         Y0EgAG3/2Y1gyiVJPkaDrsGzH3cDu2EqaQkVFWScwhTk2pyzB8GHCCFzNNRZEKkeoRWd
         9oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683378371; x=1685970371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dS8atcxZJwQbExVYUG7qwyvLFr0woVdllJ5J88pacr0=;
        b=eu+lKDuRcUl7br/p0wKlkY+T3UlCTVhzObmIkf3e+wtk/DN8ryjvpWSy1eehiXoPhx
         Dn3wOgbO+MOiNMmFFGItA2sPddXMIrfQFild6nQy9wJHaRnrJbr2SVZrnJOiaLPlqUiC
         IY3YZuu5oxPpDcMexUC1smZz5ALISWiKK9mlYGbjThHq1YssA35v1s3e9aD+fm0j6ipe
         HuA2A3l/GBob9K8KejSZptBYGZMo/Z+4pB25n144t5eryr47Dn/S2YuSzoSFgALqy6gE
         B0NpGhlOyrImRfheqqkYspZ9zKoyQBhCnq3r5LT3/0jJCxoypMj1AR1WO6KjZAio/6LO
         F3jg==
X-Gm-Message-State: AC+VfDwFGcz0TVG4oq+7wAatNHbA2VsTagNR6P+znj5eok4v7nA46bgT
        Sa7UlAA+8U8PJpTbS3Sp77ZNOofie+aHPT1LfPQIFBLgKjEYOjBk
X-Google-Smtp-Source: ACHHUZ6MBhrjWIjpjNrtTBusrqWiBc1pp5i+0QA/EWcmAuKOLfnMBJbFYUX3yCk+qmOdn50UX6EKKAamK59BWwSVw/0=
X-Received: by 2002:a81:8449:0:b0:55a:6917:ee1b with SMTP id
 u70-20020a818449000000b0055a6917ee1bmr5454648ywf.43.1683378371734; Sat, 06
 May 2023 06:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230506085928.933737-1-haibo.chen@nxp.com> <20230506085928.933737-2-haibo.chen@nxp.com>
In-Reply-To: <20230506085928.933737-2-haibo.chen@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 6 May 2023 15:06:00 +0200
Message-ID: <CACRpkdYUGwEn-4T+Ay-KckO3ChFNqOrdVuP93u=gs5uc9fY0yw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mxc: switch to dynamic allocat GPIO base
To:     haibo.chen@nxp.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        christophe.leroy@csgroup.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 6, 2023 at 10:56=E2=80=AFAM <haibo.chen@nxp.com> wrote:

> From: Haibo Chen <haibo.chen@nxp.com>
>
> gpiolib want to get completely rid of static gpiobase allocation,
> so switch to dynamic allocat GPIO base, also can avoid warning
> message:
>
> [    1.529974] gpio gpiochip0: Static allocation of GPIO base
> is deprecated, use dynamic allocation.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
