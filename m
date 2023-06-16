Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE6A07331D2
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jun 2023 15:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344594AbjFPNFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jun 2023 09:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240000AbjFPNFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 09:05:08 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220752D79
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 06:05:07 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b29c972e00so649500a34.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 06:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686920706; x=1689512706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCWwAxyqGz0dxVXdN4x1E9m1cKBoRvQl+WOQKo4Ngkc=;
        b=bRIswQGjLCf4y769A4u1naT+GmdQ7J9gqc/qYPwOG9iZLIg8+p8+TFhbysRY4yLagf
         PCwjS/lmcpP3s6vbvMDu+sUUT2q/SCzff0NyY2je/HimhrKySASex85fx0+NaiDrNxS4
         45yfAbnr1AAciLpEzdK9il8dxT62VDZaOnk/ZKXq3Pyew9zWerTYfvxPravHnsYJHu0Z
         RSd3aDRCdMkm7QzOcd22Svqcr6N7tc/bcLO4vLYlFqUrOROKkPzEfMaCKnzqbJNupmjM
         eVn+ZAb4I6hPa8Hzj2/T924Kog+B9QPc6wqVApa9g9Y3Lqe1Q6lv+OYvx22LuMvt3YMh
         sA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686920706; x=1689512706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCWwAxyqGz0dxVXdN4x1E9m1cKBoRvQl+WOQKo4Ngkc=;
        b=LDMkLD8OaUaQBX1696R1aknW3OB4wtz29LvV8ZrFOHd7prs9Zo3mOnxFT7+YMXqbWh
         5KOOa2jyHBp0p8WXNG9OmrCTPVPTEfpyi1SA4a034U5cQ1gX3V6b4jZMVg2qfVDIaYe7
         0nC4AW2zsHywBaf/1expXit6nVAV/mhu6W94vdhS+m+MHWLq+srsp+WlarqhpR0I5UMl
         ONgDWpmIE3qIyD0645fp9XI9KP2ldtuqvbukCe+8t6nuKN+aAk2n55M64AM4HaI5uSgq
         hv+tUUg8vpp+scZCzJrH3CIysVEDwZxx59jgkWEHXJXqs1vNMgKoFrSXDzeRIygl/11R
         Ms8A==
X-Gm-Message-State: AC+VfDw1rKHpT6hDLnkp5E2Hi63u686jPNlagJVud3nQEvRX3F0LqkpB
        rjYGxO1reyhIJCxNE+3umT2dXd2dFWgXM4p/s7EJxw==
X-Google-Smtp-Source: ACHHUZ5++cXvffXo4HJKBt1su21q2bNr/RxKNcZzN+Mrk92uq/9o7JMH+fwk3dYR3jVUGdS4GcAQ6LwWi1XJY7iQ3BE=
X-Received: by 2002:a9d:7410:0:b0:6ad:da5d:5357 with SMTP id
 n16-20020a9d7410000000b006adda5d5357mr1789424otk.38.1686920706256; Fri, 16
 Jun 2023 06:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230615164204.25462-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230615164204.25462-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 16 Jun 2023 15:04:55 +0200
Message-ID: <CACRpkdZdLYT8Uoi0CU3cO71dNXOJxWwf0Y72msMnz1ct6pMSCA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: lantiq: Remove unused of_gpio.h inclusion
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Aleksander Jan Bajkowski <olek2@wp.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Thu, Jun 15, 2023 at 6:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is not and shouldn't be used in the drivers. Remove it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
