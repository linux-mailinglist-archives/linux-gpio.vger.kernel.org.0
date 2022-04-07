Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5874F8586
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Apr 2022 19:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243272AbiDGRJI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Apr 2022 13:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237807AbiDGRJH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Apr 2022 13:09:07 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E45D12B5D8
        for <linux-gpio@vger.kernel.org>; Thu,  7 Apr 2022 10:07:06 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id p15so12194081ejc.7
        for <linux-gpio@vger.kernel.org>; Thu, 07 Apr 2022 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xs34HmB3mQxNQ3MLumY+2KQcgDnFTGSI4kG5G0wYBkE=;
        b=ww8yK1BrSCPVvq7ixEbabV33ZCd1Z1LaPKRg8Y9l2GljGEWdrrYaE0IAolAPWLNSYw
         P4+1yvv+UgVofEqgfmJPEcKQVCsAk3cFZ6FJzhqn/kIoheUME8P3uujDLRTfAlbCGi8U
         uB58U1uqH9WnrU8adscton7OROJADVndd3wQTshdIDgKvImF+v+elde6rHo8ACcJHqzU
         sqVb/Gz0LrcRDCsPqoMyqr43J578NpzZjNpJuzYR3jaZFDC0f0VK9fT8yw2LO9goEewV
         oPy1VILSQGCwc11r6vmvxPPBQgvoWaHcfSzucncGfZCa9OYQLYbN/x32hsVO5mLtNzhk
         Tnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xs34HmB3mQxNQ3MLumY+2KQcgDnFTGSI4kG5G0wYBkE=;
        b=q2qTRnEKiy4y563HeYLK5xKqjZVkk8zcAnC4HtApbOfuDCH9BWjARnM6SCLxptZnaO
         3OwqlJ/sBskgBkDeNQYWW8rBcuxT1SzYSFyREUmGCwF9W2pAwx8HDNip/z7oBZAE3dVk
         i8wApoVYhyHqmfS+9Aesr54VBoAGvrIKRwlFZBMb5XaNJN0D7zBKgAaQb7UXqUoHgs08
         HGwCMruc279E073N/gBlaiI4db2SuRa+fhXksku0inOeWkd2yTqKHPn1INMFLRJqUYGB
         8O7YfiLmtQ7nDfksCsycFNFkKC4fP0W0CbBYNc+5JNHuh/39qOvhbaS5NZAuyHVev+Ot
         vZLg==
X-Gm-Message-State: AOAM530xdRRy/CGd/xCOKcncoxPZFFfppNDoPmQuouubc0e2STHY/0BT
        J+76/STL0u/UbOIh81EkQllFJI30HxEOKrNR6AlGDg==
X-Google-Smtp-Source: ABdhPJwjeWPbD/dZXbSPnBJKZaQvd4USo4WUCxzx+qC69rVqMrvdlR4MAcWXbshhJpd9JhWv2OjJdw/mZvqpOBsdsiA=
X-Received: by 2002:a17:906:300f:b0:6e0:b38d:777d with SMTP id
 15-20020a170906300f00b006e0b38d777dmr14495463ejz.189.1649351201083; Thu, 07
 Apr 2022 10:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220406233648.21644-1-brad@pensando.io> <20220406233648.21644-10-brad@pensando.io>
 <CAK8P3a1RdHTngDVqg4KnVA3N8EjDfbpQ=cEcz_CK8NmG2EgYLQ@mail.gmail.com> <3c8e94e1-fb8e-0d8f-4e79-b8313a1da5cb@intel.com>
In-Reply-To: <3c8e94e1-fb8e-0d8f-4e79-b8313a1da5cb@intel.com>
From:   Brad Larson <brad@pensando.io>
Date:   Thu, 7 Apr 2022 10:06:30 -0700
Message-ID: <CAK9rFnwsMd1+oQ8cg8Biw7HM=R6aOudfK7Ja+E+iGVgfrvC9Gg@mail.gmail.com>
Subject: Re: [PATCH 09/11] mmc: sdhci-cadence: Add Pensando Elba SoC support
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        David Clear <dac2@pensando.io>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 7, 2022 at 12:13 AM Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> What is the relationship between cadence and pensando elba?

Pensando licensed the cadence controller, its 100% cadence IP.  The
integration issue we ran into was with the accessors where we have the
workaround.  The initial patch added a separate Elba driver file but
the feedback was the Elba support didn't justify doing that and to add
to sdhci-cacence.c.

Regards,
Brad
