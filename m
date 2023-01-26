Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6BA067C7A4
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 10:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235811AbjAZJmY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 04:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234781AbjAZJmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 04:42:23 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EEC5CFE4
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 01:42:21 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4b718cab0e4so15598097b3.9
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 01:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8iZFlKhgmSsWsVLepJhcjvfwOv4DN7vG/elxEgpX4nA=;
        b=jNUqvctcBeK+YEbRx33ScM3vYxxeN0AETcqAdopLjdu/2bd40spBPQcJp/0owJkF2K
         3zi10wlrzd3WlTZiPBhSl2jcDhgAMm0LYXjNNXd5viwkVsAfjMz2JxaCaVHQmRAB72PT
         A+PueXc9EjQmDgpgqsUaSinVUQhLrnr7eaqKkA/ZGk/o0h4dP+B21GFKTzEZi3RCej9O
         yVkCexi+SGBaf6a/hymrrRLUVjBlPNSuPhfXoGLMgq48lGTPimL6M0vnlUjf7/T36q41
         wGLSR5d0Xd2kOKFxLZoBbaUEeX+Jqsl2yJiw4NAYiMMJAEOKSmIikiqmvJyI7LeWqDMs
         Qb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iZFlKhgmSsWsVLepJhcjvfwOv4DN7vG/elxEgpX4nA=;
        b=WaTRz0rwQ3nS8TGjYb/L8acNI3Q+WuLdIaD53E4GjK9wmLi8mDmS0wiP8M/eujMNB/
         5e2a82nany2lmftl2bVUjmsbMj1c17sncaKT4Mbs9w2JIwbAdjcRXiADcy4p7dtWfkTd
         DQtg258DNa53dYvzOZfALNjhl2aDdSeFAB8hwdOOvKz/xBwgDQj8j2J0ZN2cxLooC/20
         EXhdlXfwQQD3N3BY4uVgDuhNEyWfmmnYYc0sHhplF0+c547NuTSLpK4i30dYpLT5Pab8
         Oi0h3DUUH+EEmE0oJLmk6RSdY2WvS75eHgLoQrstfV5hlcxtc/XjJzz0jZQTHzM0/VIl
         u2Hw==
X-Gm-Message-State: AFqh2koZamhcoTh44L10ItO4/xtxVSCJGaYGsxWR1FMqWyrANNQxnmTP
        6QJPTL8azc+zkHh6AkH/NVlKBYuDLLMYeVyn74M4n80M7zG4OfDE
X-Google-Smtp-Source: AMrXdXvo2eRReRcXV+/gEOPTZAP5EUHoJPff1P20CplmHUF5rmwkBSqytWGmuk74DB3tvomFRhc8L+cazUYSj7v0z7Y=
X-Received: by 2002:a0d:ce43:0:b0:474:b3f2:8df1 with SMTP id
 q64-20020a0dce43000000b00474b3f28df1mr4143499ywd.434.1674726141168; Thu, 26
 Jan 2023 01:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com> <20230125093548.GB23347@pengutronix.de>
In-Reply-To: <20230125093548.GB23347@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 10:42:10 +0100
Message-ID: <CACRpkdbHU1ac=-YhBrRK59pgzGEhu+f62Fq7rbKgHk1YK+4p7g@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        bartosz.golaszewski@linaro.org, christophe.leroy@csgroup.eu,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 10:35 AM Sascha Hauer <sha@pengutronix.de> wrote:

> I can understand that you want to get rid of the global GPIO number
> space. Currently you can't, because there are still hundreds of
> in-Kernel users of the legacy API.

It is ~500 and used to be thousands.
An update on that specifically.

Mainline:
$ git grep 'linux\/gpio\.h' | wc -l
505

linux-next:
$ git grep 'linux\/gpio\.h' | wc -l
362

This is because Arnd delete a big slew of unmaintained boardfiles which were
the big offenders.

Now certainly we can fix 362 files soon enough, especially since we have not
just me, but Dmitry T and Andy S and Arnd working on it in parallel.

Yours,
Linus Walleij
