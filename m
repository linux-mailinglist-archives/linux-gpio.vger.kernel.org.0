Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB777BFAA9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 14:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbjJJMDX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 08:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbjJJMDM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 08:03:12 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E95210F6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 05:02:11 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7af52ee31so15003877b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 05:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939330; x=1697544130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wBmjqlIuY6Zt3anxCmFrS7RpdSFcEoQFexeps6+6pY=;
        b=rL1gnGF1CY5LPc8nXqvzRkIo1/UjamFxouqBjzU8QYBea4DYgr+wOmDJ4rGnF4hxxm
         TjgOf/uWchnObpuoDUW83O3WeNYsbV53RfyfEt+TY74ArJ4YjIPv0uNGijYsItDd6eB/
         JCBDkAs1iBUO7yqRjmr3/jSaOHX7CYLv0Kv2M0l+b8yCAl/RJJE5XNEk2V32cSwkR5ag
         EeomPruX3/j1cQpUfnpIXZw+AS8FsKXyFr2ttHwqr0MpKA8gaf/oEFvpMRXa+4WgSpGP
         yIqak4qHkRDyL/byK4rbwlOjePGQHmScDdDSus4tdee21tFQSFGck++iAQLysjXG1YGS
         Z2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939330; x=1697544130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wBmjqlIuY6Zt3anxCmFrS7RpdSFcEoQFexeps6+6pY=;
        b=k8ESkf9uJ6dw4/ic4KyTCitlh8ZMSby8Td0ace2olHOBNy3TKWr61yGtPVgKy9Gunw
         8RlBUfgn78Sr2eSx7Bu873YNHSVxJfyDM7cDIEfEldTXMpLcfPjlocCpmvP77bmDTbdR
         Z9YrPrAJqh+2dM2upog8JPe6oxBAnDCgL6KA8YqOGFV58PlVoSRyrwDw2P6LYxdKP++d
         3KoCkaYY7pX1NW6k31MsXfP/++ZN8KJ378NXY/TJRdn67Vfp3f64bzKlfp555qtjvhTj
         aQcTlFOoQfuK/AhQlvf+/tWW7SS+lW/H4kM1G2LNI6rIkfFZ0k2pIhILYutSOl1Cm6KY
         bcWw==
X-Gm-Message-State: AOJu0YzQgeNEXvBCy4ocPedBWegJpmjj+GSNU320Vp8by/2jSeaEf7tv
        GUlzC8rKtGYy3OuWg07vzUDu+UKL+YqJcBE1PPUJKot5ex6f6G0h
X-Google-Smtp-Source: AGHT+IG23K04t+lvBS9/HwvoXXibHWZT2x93Gqx7aXMv0MEjbeY28YO9n63irEBhuu2GkQHI23S6u1dmnLY+nMNTZc4=
X-Received: by 2002:a05:690c:d87:b0:5a5:7ed:cf80 with SMTP id
 da7-20020a05690c0d8700b005a507edcf80mr20364608ywb.23.1696939329657; Tue, 10
 Oct 2023 05:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231005030849.11352-2-zev@bewilderbeest.net>
In-Reply-To: <20231005030849.11352-2-zev@bewilderbeest.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 14:01:58 +0200
Message-ID: <CACRpkdZDBmUMY7pVxtSkVQnm9bHp+ObfmumO39j=XYeDJaD7Dw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Allow changing SPI mode from hardware
 strap defaults
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Andrew Jeffery <andrew@codeconstruct.com.au>,
        Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 5, 2023 at 5:09=E2=80=AFAM Zev Weiss <zev@bewilderbeest.net> wr=
ote:


> Some platforms unfortunately have their SPI mode selection bits
> strapped incorrectly (such as being configured for passthrough mode
> when master mode is in fact the only useful configuration for it) and
> thus require correction in software.  Add the SPI mode bits to the
> GPIO passthrough bits as the exceptions to the read-only rule for the
> hardware strap register so that the pinctrl subsystem can be used for
> such corrections.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Patch applied!

Yours,
Linus Walleij
