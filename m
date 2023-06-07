Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF46725489
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jun 2023 08:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233989AbjFGGmi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jun 2023 02:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237700AbjFGGmd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jun 2023 02:42:33 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F911994
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 23:42:31 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bab8f66d3a2so8194091276.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 23:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686120151; x=1688712151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK5z7dUWVG58zsoC7wJacwd4OyZa5brj5wzjjWx3qb0=;
        b=eadr6XrEBEc5GZoaAHzHZeFJPQyEfiSpgDaf6bDIU1NdULV+xpfmtzpCuYkDvuEu97
         SgcZ1KkYxRyg18MT9637GDufEincgcJZnM5EpCO0uCrbpVQwPNNhf0PSSgv/KncRa2Tz
         a2+SxrQmZUqyq58HMQdmIhlCP9et7kpFCMi/4pHLB2FUuLUsxQv9HIv/ZVQt9pjb0JUG
         jsDAsE3OjlHJq7JmDkssD0TxiV6d7MnN3GAwuwb28+E3UZsM+XS9Pp5nco3QHfJweyE/
         G8Tfm4bSAJX4TByff6juCtidk48AVanurwIzUchHMZ5ytkrj1ITR07d3SPviDSRQ/2Ua
         lPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686120151; x=1688712151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EK5z7dUWVG58zsoC7wJacwd4OyZa5brj5wzjjWx3qb0=;
        b=X7+f55gcyr15to5ce3LfwNScAbEf0KtpVfAZBMoEbQvc/Vg9AfMpinbQbMbXvXvmVZ
         IZW0Pwf9LrpBX69nL7XPjYUc0ch+OG0hhTrCQ5SImBiqLVj+rk4akAwtQ9OUq6XDbzSy
         wpf6YYRTuiKl8wDnhvv9RaSbOknaGjfaXS4mELl/WsF0oWrLDh70kcuCjLag0bhNotRb
         afvinWBTDXLe55Pd28oULD93krTGyrj3lA1SzvORlKkKJgYfwcrhd0PrQ+wg3Zi8dc6C
         wv4nay3Qix2lm4iIOCJSLK8l2TO1PBV2dW0B1RIeelXNdZQlxK6mE/CeWwFNRPHMfyOf
         JSSg==
X-Gm-Message-State: AC+VfDxPLR7LQY0KidSqOAIGB+z0tlEu31eCOUt4Bi5w81hACoNci6PT
        m/j/opGUoTKTan1nDoqUWnECE9UPFgL8M6Nj4HB1DQ==
X-Google-Smtp-Source: ACHHUZ7riXczuKphogAN8vH0TEGssdCGzymYS/fnF4vyN8idKsV8bNrGo40I9LXfdmAPG5052O6Bd3TJASq7kcT1oS0=
X-Received: by 2002:a25:4889:0:b0:bac:748a:5759 with SMTP id
 v131-20020a254889000000b00bac748a5759mr4309395yba.37.1686120150852; Tue, 06
 Jun 2023 23:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230605164943.3641-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230605164943.3641-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Jun 2023 08:42:19 +0200
Message-ID: <CACRpkdbnHgqiXHFS+UnCrs5dPCwTd+g3NLyF-NcOq9ugdzZM=A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Add Intel Meteor Lake-S pin
 controller support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
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

On Mon, Jun 5, 2023 at 6:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This driver adds pinctrl/GPIO support for Intel Meteor Lake-S.
> The GPIO controller is based on the next generation GPIO hardware
> but still compatible with the one supported by the Intel pinctrl
> and GPIO core driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I expect this to arrive by pull request with other Intel stuff
as usual.

Yours,
Linus Walleij
