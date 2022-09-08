Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2575B1734
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 10:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiIHIgG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 04:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiIHIgE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 04:36:04 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3BBDFF67
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 01:36:02 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id fy31so36383307ejc.6
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OUaGQ6uHB2+dXwiGE5+SddWRClVepXq6e8KWvsAWyP4=;
        b=PiSCA7ypGDZI4XkBQF4UUIrgN/BP8oLsZwNWQH3bREqrgToKcIfdN/4ceZWHNLX9HK
         rVIWS2yjw+/aFNVQbBzn1FYDtaG3vgt0tiXQA2Fn1IdezJ+5CLJE88Cmi5pU9OIqv3XW
         K6rEiwChBEFImck1k1N6huDaunHr//2mluYWC7h+FMLFlByC1e+KLFTuoXaNON+jhxv4
         0cUx+bC9K7rJeLzRu54byKrreiJGOguyXhprTDst7OGXMKW+XuMjE8P6nGQHBN2nPWhX
         haEj6ir5R6vNC763uquwTMEHlT5yf7VWTnUFoK88Qi5ym6SMg8uYx+7ElB20RkTZqzkV
         tbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OUaGQ6uHB2+dXwiGE5+SddWRClVepXq6e8KWvsAWyP4=;
        b=qhN0JPsOqA9qMDhu2Nl1RSNIHfKTN5PMGruyT0zTbLsoSCmKVkpnUZ4rKE9v0V06pi
         zP2CH+faND9ZgpW9TJ3PiSmvqE1b7+39RB/m7KHvNKk6onyh/DEKnZdiLuqZkm6XjyA1
         fmb1s6qyvshzx+l1aaAxrAToW95B+702a+6vZTSQ43XyYAMbpl4Af+LXHDaQsTronb25
         QvnFsNAFMHI4Le+Ihk8Aqe6wmibgLXCAPNrS5YFXC9IULD6vEBQVuGEuG/xN9R5olvaR
         3fZfhITMODMJtXnWSE4x0+yvWwk2GSLg/9NknFrY7hqKnNR6MUWsS5l8dlCaTdeZnyZt
         39vA==
X-Gm-Message-State: ACgBeo2KZCNH+zPAL4KnqJjZoX9Hryvk6aAOdWaHBvBsyLVbbSkwOrDw
        y5CFltXblpuAM1MkyAv5DYJwqlKaWpUQ+iyENJzboQ==
X-Google-Smtp-Source: AA6agR4v7NBtPCgQRzAi/ZTCyJl7YFqTNxvR+MInAejEIuCw6PFGA+JstRAz6Wl6A39KNFiN9NMu9qm0UxdfUIKShNo=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr5241555ejc.203.1662626161400; Thu, 08
 Sep 2022 01:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220905180034.73132-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220905180034.73132-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 10:35:50 +0200
Message-ID: <CACRpkdYW+ZnR9tP5UyUYxQ+CYNYDvMqrbV4g8sOQAVqS1zCLkg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: meson: Switch to use fwnode instead of of_node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 8:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
