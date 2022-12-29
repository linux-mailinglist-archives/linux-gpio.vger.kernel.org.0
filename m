Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE260658835
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 02:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiL2BAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Dec 2022 20:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiL2BAh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2022 20:00:37 -0500
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833C913D20
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:00:32 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-142b72a728fso20257578fac.9
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X4+9D7Pdm++sqmI92y+Lbv8mA/3krcFyyp1iTzuS9Ao=;
        b=ypqyR80QY9NGMCdqlvw9pUQW+S3bccILtvwOtjJjnRgaurvmX9ZjZ/Vpz3v1nZKiA+
         QS8eqdzb5zHyPuWtI+pyowDD+kWAFZ57IkrlM/8wEqKsY5PNiVY7KwCK3zQtiMGZy06q
         dOQe1EXK7pSE8p34wJ365oeNObii8g2KEkoxieKjd92FtcKremqmycijBCIuNAWHA+t0
         mCFBZSQ4q0+zR41x0a3u7V/p6Yl8yRyrCuIgQ/VBZQufZwMmFML5AHEDvgOIutFwWmTG
         YC5kRCo43ZrhL5kOIcSWKAhtinT3JttPtmIOKo+9X2VVf1KoWuWugHb7wXXhbABShK+l
         ikpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4+9D7Pdm++sqmI92y+Lbv8mA/3krcFyyp1iTzuS9Ao=;
        b=qrPSoCcZe3Wt39JRiiTCqgvTP5MPR4S66/lwAA7WgI4gjWz4P/inFz8n+aUO3M/AFf
         CR8c9fHLXnGOrqDpeMRJuSLmMwylDbJwlwdrN22Ld51hL6X9EVXgvjCCz6eRg8FmhFXn
         kwopDPRAUzv8pvS4d4EKPJlWLt5x1a22oha5KHluS4DHYDlx367Tidwza9w2+u4icLFG
         Nz0GPnFm0qhMlljBA98CWuyyoGY/Ados8F/alQzg3YepMwmgB1xffrPPWg08AfqEE4oc
         cviLqj/LvGx8/AhFIUOMxtLhMtsId4qVoo4lSGAzZHfEqL1AAIVzUd2oCl3fSBgD5bvb
         ArGA==
X-Gm-Message-State: AFqh2kpVh3NGZaslk6lEoQCD+HA9bbnAlcythfm5BqrzyozH1REr6+Vl
        TNRgdCgoIELCOdD7UD1RMnHkp3HOGq68W3Ug2ZuArQ==
X-Google-Smtp-Source: AMrXdXuahkBwaMgezerrFQyBFMf9cSY8aqq5wzfcpM35x/XQY0U22KV1pvV92FBKKq+kNp1suE6fuFr9/cfBtAYTxyM=
X-Received: by 2002:a05:6870:fd89:b0:14f:ede2:db25 with SMTP id
 ma9-20020a056870fd8900b0014fede2db25mr900949oab.42.1672275631857; Wed, 28 Dec
 2022 17:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20221208093704.1151928-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20221208093704.1151928-1-Basavaraj.Natikar@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 02:02:26 +0100
Message-ID: <CACRpkdanLQ6qWOY1BZGNBgLoB4vDUvyLiGHic=Wbq+C1Y6Rzcw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Add Z-state wake control bits
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Rajesh1.Kumar@amd.com,
        Mario Limonciello <mario.limonciello@amd.com>,
        Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 8, 2022 at 10:37 AM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> GPIO registers include Bit 27 for WakeCntrlZ used to enable wake in
> Z state. Hence add Z-state wake control bits to debugfs output to
> debug and analyze Z-states problems.
>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Tested-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>

Patch applied!

Yours,
Linus Walleij
