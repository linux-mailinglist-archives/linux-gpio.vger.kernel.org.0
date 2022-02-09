Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C244AED89
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Feb 2022 10:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiBIJEM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Feb 2022 04:04:12 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:56338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiBIJEK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Feb 2022 04:04:10 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DCFC1DF8CB
        for <linux-gpio@vger.kernel.org>; Wed,  9 Feb 2022 01:04:04 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id ch26so3592716edb.12
        for <linux-gpio@vger.kernel.org>; Wed, 09 Feb 2022 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4MJZRpDu7px3hzAL62uWvtStglik1kTMv6esLPZmHkQ=;
        b=GAU2UQ/RY2pIX2GmuJ7MaIMU7gN67xhuckkp6l7CJoUXKE6KRXl8YpT7gq7hSd26/X
         to2r8r5aGhIg525KpxEuFMeV0mVFrHZIe+1WLgYtKm5apOxZCVSedOtgUYiLIrVis5MO
         s3haBaz2cUcKSs38t58gXcPz2fwbsgjD049wdiS2dIY1lBE8vISTsxEo/JlCPKflliaM
         OXQbS3Suv4JGc2ehJ+epZDtxmTprkhTfdTJZQ/KreSIxu5PERMen4Szp0r9/BY0H7QHt
         IpTPrvEw/sEhW2CiyPJflMT+dlNbz4TVWe+cmqUnbEiSiGXQfNhrtp9K774bWbIrdgs7
         dxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4MJZRpDu7px3hzAL62uWvtStglik1kTMv6esLPZmHkQ=;
        b=UsKlNT+NsziFL2CpLHyxy9hyJo6UbUXUv5hbe6OOr/qqUiwsi9ijx4gQ5AOvehcv7Z
         t+IXhscQ8Vt4a7XRR0hxZCLbjKV2ok6hzWW8suiTP4dfEwGK+jgOBnibIJ3KTOo0F0sa
         z91AY5vvRAya0cZQN3N+XQpTZae16wrEpyzba+Sni+hTTuxNDk74x/gfbBXGVL1ejRq4
         0PxoWRjRSDgGrFt1955T7uTFx2HUzTFbv8suufc4zMTTuid8jWG4V1Z5mvE5pYZv4HCY
         VBqeOU+aH3tfn9lVrEleaCm9tZoPJgAfhMYki2Kyu976i98koY9O8nDRoOYmBfZc2wa8
         WkJQ==
X-Gm-Message-State: AOAM532LBxUYF5GeB0nhoz7SlKy3NJSqaEfLsb6+FZx2QoXtiH+W6THj
        LkKwx/tiYgwlCnA2p4FMyhQ5VQsm0IRFvoyIdcMQXA==
X-Google-Smtp-Source: ABdhPJyKoXmsTwTN4HrstgLy4ApxQgcwa+O8Y9wd29EmwhIN8g4C3xsnxpN75JPBscEQOgAoqsgIwR3g+uY4PfKIArI=
X-Received: by 2002:aa7:c947:: with SMTP id h7mr1292056edt.447.1644397418840;
 Wed, 09 Feb 2022 01:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20220209085258.1468649-1-clabbe@baylibre.com>
In-Reply-To: <20220209085258.1468649-1-clabbe@baylibre.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Feb 2022 10:03:28 +0100
Message-ID: <CAMRc=MfFbU=QgTgcXFwOa7xVEZD7ugPjQ1uXXQqqKpGrUQY1JQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: convert faraday,ftgpio01 to yaml
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     krzysztof.kozlowski@canonical.com, linus.walleij@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 9, 2022 at 9:53 AM Corentin Labbe <clabbe@baylibre.com> wrote:
>
> Converts gpio/faraday,ftgpio010.txt to yaml.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---

Applied for next, thanks!

Bart
