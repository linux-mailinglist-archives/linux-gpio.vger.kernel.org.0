Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82598715DB5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 13:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjE3LqI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 07:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjE3Lpy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 07:45:54 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55423E54
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:45:21 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565ee3d14c2so30131937b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685447117; x=1688039117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXwxmYeftYzF4jtqCiLrlUMOqQIXZv6xuhc1OQJvYiE=;
        b=HJgN16ooshsHiGI4V9zZekl8WfBy0TCwlt4G4xj0wTN4T0V5SPWaECI89YjxMfYqZ7
         5J0+lobIDDpFs8nyZLHxt5X02ikL160kPbWvnId/jSEED27yjhRfOJnfa3AQgIHRQ36s
         8fptYF6EhjEtpUyBtKluUOw8En7dFNPlpOS0gCy6+CeFbSEhk+9gPlxPMEkU+HCFNXIq
         XUxlKnb0y0HRT2MknggVsoTrvukOAXFXoMV3sEJhWwBC7bApfAcCwwi1SrGcvdZ13Db0
         Ys3OVcirp6azO7+heXcstqN7opBBGbNqbBg6GpzgkjWWaz7U/pcK6K4XfId0vSM6UbBx
         DB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685447117; x=1688039117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXwxmYeftYzF4jtqCiLrlUMOqQIXZv6xuhc1OQJvYiE=;
        b=jieASpLLnzRYDY9KBb+1RofkOTFkuZkiHLhcEUSQRkv7H47vgaahdWGzu140b51Dho
         2NMBfy1b4m2I9bq+u12zNLpHSTAoNCsqaA2Z1HPgjTdsTrRzEuLzL8aq351TnzjwOe1U
         cpfzRgvZRH3fYcDVVnJBKrN/TRZiTx6+cOITHJVCzDpzc/s6dj06gHPhsCfpqCzmQ6TN
         XCjcxBDGQYliC7oEunuPZSoHD0QgOJUtkn3ZZZ27O/9PSkT6l22hGt6MUHcGpaH8qyWG
         AiSWQLWD0YB8OZc/uJ9FvF66JFn2un+yTMwDXCYtoztQZIOB8VcCuiW5+/a6tgrElNkP
         h1Fw==
X-Gm-Message-State: AC+VfDyS+0NXCxxqKV26x3b1Y5iesUwfnJFV63JAYZeURI0tBaMwKVNj
        lwT344clj5rMEp5l+b3aK0lCe96jccPsvsuKGYpbqQ==
X-Google-Smtp-Source: ACHHUZ54QNO/+6fZku62PNi90U4Qj5ZC1Ba0zmVJNFZwpokSvXDXq1LvXMXcoGLGYfuyN0jRafVEeT9V0RJEt/njhSg=
X-Received: by 2002:a81:5cc3:0:b0:562:7f3:bee6 with SMTP id
 q186-20020a815cc3000000b0056207f3bee6mr1880035ywb.45.1685447116862; Tue, 30
 May 2023 04:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230527114057.36091-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230527114057.36091-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 May 2023 13:45:05 +0200
Message-ID: <CACRpkdZadKSnRQXVaWTWKEhYJ+19XM2eQzqNmoGDZSMJq+csag@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Consolidate the allocated mask freeing APIs
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 27, 2023 at 1:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is a common API to allocate a mask, but more than one duplicative
> counterparts. Consolidate the latter into a single common API beneath.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Microoptimization, but I'm game for this one because it has a good
descriptive name making the code more readable.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
