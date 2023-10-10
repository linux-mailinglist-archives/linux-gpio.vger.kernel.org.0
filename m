Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4FEE7BFE43
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbjJJNpb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbjJJNoz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:44:55 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBE910DF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:44:21 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a7bbcc099fso11105057b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945460; x=1697550260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=Hfd6muxuY+9Eds1eZ+RBD0C2c48CH5u9Dx6Cd2hpm7k5jL8xrI3/TEKmfRwjQfrzoR
         uIv3AbVVXbCh+0OlS4InjO1VJwUuXyR1hGgQ+boH4qYdbNa0EWlzLsRA3VTQ2t2FyNP+
         xbR901yxHOr8lGLdWD1Xc3NiKXZUpx2yGDQH/mmrDC2NW9nWsgK1+ETKHLDwYqtpTd2C
         ZgqX7TgJvQxlpmjs1a/RoS/4cEaAsyJm8SSE1dRWP+oinhTk/ZvXX5eZYnVYcEnaMVYb
         QBb2I+HSQgzEqVsYdlwot2gjBXT7OEQuvJLfpWBK2ea6kkSvbxvpJ2+g/+DVbTkMZOaT
         glyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945460; x=1697550260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=Y1cyzXRSOPYw9VdUa4rKQEwuDap/3ewEQ6pVKGShUIg7HDeoab5Gwms8SIPWeV+e4e
         W5Q8ohd2od8yRfXSmBi7P0YnqnUoXRKnW1d8VsgwD3B0Tt5AU0rTXCA/JexEa9+9KPET
         zHwMhCazWbYIlZh71uyf7I6o0aNaPj+fKbQOuN6yB/RYDUPCT4kpohQz4LYQp9Qq9RyH
         RK4TXHA3lMcgbXjE63yDiraNsr2//dKSCyom8R75Zw/Q/sw0zO5Q9DkXLJNjaEkF9YKd
         6pXxw3t9eOM/tfmKnTudcnGiCCoX7lltcfX4C/412Ed8FBsMFRQ1Y9W6Sz7dfw2Byjsy
         HsBQ==
X-Gm-Message-State: AOJu0Yx8p3JVBIsKD1MUsX6QmxshWikYt+TjHmH8PBnW6ljYXEy4gku0
        3STyU32gkAbvXVn86aLuJbD2Je9uHxlBGBzunL5q4A==
X-Google-Smtp-Source: AGHT+IGPzgwlYn1dXJ4egxXKG1Kdn0b5UQFiIXiF327ltewq5kCECA8LJ4iu/KXiC6IHbqEToMvv5nzVhLpzxUCU0lw=
X-Received: by 2002:a0d:df11:0:b0:5a7:b81a:7f5d with SMTP id
 i17-20020a0ddf11000000b005a7b81a7f5dmr3036369ywe.18.1696945460664; Tue, 10
 Oct 2023 06:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-19-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-19-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:44:09 +0200
Message-ID: <CACRpkdZ9F94MzSCcoTh99MxNuvgnns+=_WEAX3kMGaRoV0CLZA@mail.gmail.com>
Subject: Re: [PATCH 18/20] pinctrl: qcom: ssbi-mpp: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
