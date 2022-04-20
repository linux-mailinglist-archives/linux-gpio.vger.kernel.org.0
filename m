Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 740EC50931A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 00:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378834AbiDTWrO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 18:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357089AbiDTWrM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 18:47:12 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092F8275C6
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 15:44:24 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2ec04a2ebadso34054747b3.12
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 15:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=biQCpdNqt9EOdNzfaHDH0wXEREY4vMB2K+noZnpNvLk=;
        b=nx9H6BpSgpwEF2wWC4PiwzkFKcfePbpZyW7Y/ioyrB7zH3fR2hVJ3jP61Q83EkQOVf
         uqz/nEKYIaSyferNkUQEqhgguM6ai2UqxzvBbHqJKTAjIZM7dapFIroSb5TQAJfztSzl
         znZ0XvpeJSe4qc3AXfwezdaBF1FxV/RtMW/SZKHCr4cZjDKiM6zZ7tseDOQFKrEpN71Z
         kbEOCSdp7IXDxK2hrCp577+J9wr1zGaIGA2sQcSrrnQm2GihN09ysTmXlsFuXctNCxGc
         VvPQqbemiGA8XBxBSFF2WrLbYpJGis+6K0SeP7bZ3RjxixBbKigdNmVWAemfFejCRilL
         8Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=biQCpdNqt9EOdNzfaHDH0wXEREY4vMB2K+noZnpNvLk=;
        b=kZgwfRe1Fl4KUKtsx2fCJtjZE48mIoofv7PFdl5D1tTMeML1XWYcwW8gNXoEYFy6xC
         3Xr32ragcqkD02tgumw8CIe3sd1adXjn2apzsY/rMIZ1Qk/4siovDKBsI7woEf9/J1tV
         Ta93bgVEy3r5z5DhWynGW7nbVsSubPvQfduuBzdg+VzLUpEELB3Lof0lOZO0TiCMIcdG
         +NgIitTlvhH0pOd/3UpcDz40azbxtAZNc1T7FpxRKP/NXuyof8Y61BvAe7Bn2UiBWpZj
         xz2c8YvbgT9AUNhPel/UaFZEnFmEefvNNF4esKH/Tqk7cLEkebAkBkxLc6EvfTG9DELe
         vC5Q==
X-Gm-Message-State: AOAM5303uWXtib1bVVJWek0NFk+9uU66k7lYPPvOAml5/UxlvuBbClZ9
        3fClshSn3I3oRK5lwyW/Xqb2qsKdiU355nZsJMsHNw==
X-Google-Smtp-Source: ABdhPJzF3FvLViXjWfev1hwRIHaerfHNAEFSRiDR07ODCQZKYbqJ/OG2lTs7Ul6E/bd3pAQDeY+Ar6m5rRgqx6vZmQ0=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr17254983ywd.118.1650494663286; Wed, 20
 Apr 2022 15:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220407202509.23228-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407202509.23228-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 00:44:12 +0200
Message-ID: <CACRpkdaR5Oa8=WQtrQwwZVv7AU3AKpKk37L5upe1+tPq3R=acA@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: max77620: drop unneeded MODULE_ALIAS
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 7, 2022 at 10:25 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The MODULE_DEVICE_TABLE already creates proper alias for platform
> driver.  Having another MODULE_ALIAS causes the alias to be duplicated.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
