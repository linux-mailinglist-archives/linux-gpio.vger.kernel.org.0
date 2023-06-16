Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2A9732B27
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jun 2023 11:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344100AbjFPJLN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jun 2023 05:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344876AbjFPJKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 05:10:37 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D324227
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 02:09:17 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-43f519c0888so162550137.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 02:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686906556; x=1689498556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AV3ZtPJBZL0WfMRwAHbBXb9JyUQlYU2aDfkGkK4GxeM=;
        b=J4uPShd2TmNiqE7+9BgoXBhgurdP8tS8ZKPiUMuegu2ZjrueviMWEf9XgteyLckeaS
         BnUJ6P83EBCpdT+yisBC7i9o9BsKBdCY4oOnSbGAS4o7+Hm1WUfeTkwByPu8cbd/mwVk
         x3NqL4AfpGBmDIJYGkt/iDZLH4fcbCWa6Op7zo9suZQKExfdausPLNDXvcByI8Wl6XbV
         Bl9J0AZ4PmayVcmJDv8B8Pr/7OrsIdYYLsVDvk80JGs/LnnT3KuIbPzTkhWJ002sH8Ny
         gWYvGG1a496Bg5/qsOAybQLK6L9zRIFcqemwSBJrH9wQYvRlpXUiqe9tadHM8/uA17Ep
         C3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686906556; x=1689498556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AV3ZtPJBZL0WfMRwAHbBXb9JyUQlYU2aDfkGkK4GxeM=;
        b=L1aF8l/1/79oRHSUM6ncd99Jv4D/pRfvXOMYPG1xSgQ/d6sCHPp2asVuzTOOLXJRJR
         z5K6H7bzDQpDT/CwBfLR72DdIbeyOWKuSH+Ei9cw5GjDDONkj877T0gebJAwoatP27oI
         NKc/St6+SdrXqXyA/5nUIvNGsZKYzn8UOO/5xxX2WXF+6wpYmy3Ac/7CnO+gz3xcXXDa
         Lb3JTh7Sukkkope26vaqz42/xQbGdBd2BzQw9ftOSxsAyfUmjGulldXEcy2utc2qMGIu
         cn7Mc/F+SIsjUiA48zook8EpWbXfmLEelVK8ml4uocx00xvsE71V8eIRO9mIPIr6Nbpy
         M9xg==
X-Gm-Message-State: AC+VfDwe2KnMkIkWm3vl+3R2eOVCxT7EMOuMQcmEovYY7LGDwLrYygZ3
        zpWkkC0fMA5l6XwTwuM0g6RKwH6SZmhO2lYL2/nnPA==
X-Google-Smtp-Source: ACHHUZ7kqcUseSELHedqy89cjsjeAsc5SW5/5yfXaYeGGHZrQYpawpCNDfyiHXU5oNxtDiVcFfTWQ5E4fIdIvQN4sGA=
X-Received: by 2002:a67:fc4d:0:b0:43f:5d2f:b878 with SMTP id
 p13-20020a67fc4d000000b0043f5d2fb878mr1398900vsq.17.1686906556338; Fri, 16
 Jun 2023 02:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230315215027.30685-1-asmaa@nvidia.com> <20230315215027.30685-2-asmaa@nvidia.com>
In-Reply-To: <20230315215027.30685-2-asmaa@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Jun 2023 11:09:05 +0200
Message-ID: <CAMRc=MeFn+oMt8s=_-inYTEMX3EfG0XPkGF0XX1QTECM=JOacg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] gpio: mlxbf3: Add gpio driver support
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     andy.shevchenko@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 15, 2023 at 10:50=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wr=
ote:
>
> Add support for the BlueField-3 SoC GPIO driver.
> This driver configures and handles GPIO interrupts. It also enables a use=
r
> to manipulate certain GPIO pins via libgpiod tools or other kernel driver=
s.
> The usables pins are defined via the "gpio-reserved-ranges" property.
>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---

Applied, thanks!

Bart
