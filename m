Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C0C7789F9
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 11:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235169AbjHKJce (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 05:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235075AbjHKJcZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 05:32:25 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5684730DE
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 02:32:24 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d4364cf8be3so1673822276.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691746343; x=1692351143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIUWah3ZHsW9fjPYHkUzRyvpVVLPmFz1Sr2nMFev8LY=;
        b=L2AVn9waDP0qa4+fk9FVrNkmaRlLx/Gzt6TBJfwbUoDzOAkNA+eM9SY7SJmlX0AwOR
         bz3J0kffBAUpEh6W/rZgla7a/jpoKd5Umxjrn7FI0+GpCvA/qQnf4S16ilSMSp2g8Pr7
         bC6VbvtuARSPxK3TS+rzz71PrnZjcBftFB9P/X/9bfm5IDaM67VwQy0S0YRv7BObTsFr
         U4Zwlqxc35xNbHSVs+llXr4OyGGQTRgaOLBd1TJQuaDJidYfgbJHlMtQZAFa5Qhw6SGZ
         GhCvVOx5U2h3XdCjzQAQgjG8b31MnIqHndnPN44+9YOpwdNJrkUpOLvKztrFTXhSfNsU
         7cXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691746343; x=1692351143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIUWah3ZHsW9fjPYHkUzRyvpVVLPmFz1Sr2nMFev8LY=;
        b=LOd6EmhasVO9AsEZTcxx9vD2gu9EpMHjuk2En2K9EBMD0nZfIa0b9odhIpXd/3gKXk
         9IZ3Uaqc/Sg46tCmWr4PGK1ursk8dPMLkZWy/Z6QUhi7Q4N/g/LB0o1qzT6aR+FrkOEe
         KkV8Yv9Rwq23Qo05wpUZjUylV+i5RUHMFoAOEYuB7DvZZNErtXIGsgr+tN1oSGp4ZsH7
         l2ZvWWha3HRSnlMSGPFRBC0RWpg1yVYZ5rUIOo4FdK0Xh0VDJcAeS7Wjg/6rDUDnZY/J
         c7v/pk9hA4AnupbX2RKKROhOruIvVmTqto4sUUHhLww0b3JVSozwTxRwgW1QlkNBR+GY
         8V3g==
X-Gm-Message-State: AOJu0YyNpV0rmKZBx85XWeIGe2tK2jilUeEtVQRWkWf07C8efNZYwfKJ
        kC4Hrqrg7MOMcsM8HQWKYFKA3oVtc5V97RSpsz8mQg==
X-Google-Smtp-Source: AGHT+IE7APCRfNQkkBCoQSOQF1n1tctmW7mQ1WLnXMi8dlzz/rrPRaxMr7JqGv+EVthpkT2vKsksGiRJ8t40ENGuX0Y=
X-Received: by 2002:a25:b286:0:b0:d0a:8269:e5d9 with SMTP id
 k6-20020a25b286000000b00d0a8269e5d9mr1017814ybj.60.1691746343556; Fri, 11 Aug
 2023 02:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691703927.git.william.gray@linaro.org>
In-Reply-To: <cover.1691703927.git.william.gray@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Aug 2023 11:32:12 +0200
Message-ID: <CACRpkdZ_vUsgWWoQTO_c=pBz3wFYP0VMsCKNQNSSw-ASXC+V3g@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/7] Migrate ACCES and WinSystems drivers to the
 regmap API
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 11, 2023 at 12:00=E2=80=AFAM William Breathitt Gray
<william.gray@linaro.org> wrote:

> This patchset is a collection and resend of the lingering GPIO patches
> for the regmap migration of the ACCES and WinSystems drivers.[^1][^2]
> Previously, these patches were postponed due to pending dependency
> patches that have since been merged into mainline. Now that those
> dependencies are present in the GPIO tree, this patchset can be merged
> without incident. An IRQ handling fix for the ws16c48 driver is also
> included at the end.[^3]

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

The result is really nice!

Yours,
Linus Walleij
