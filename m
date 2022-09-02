Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1CF35ABAC0
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Sep 2022 00:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiIBWSM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 18:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbiIBWSK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 18:18:10 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB61BB3B0A
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 15:18:07 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b44so4376609edf.9
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=HpxkiE/rVFlomk7mcFdG7tTVTXis1x8OYXXnEOdixck=;
        b=sNUWaqdd13oguTLoGAm+2mJSFjGuXPrQsZYidBhDKc/a7ZiL914yaOs6ivNAzRt8kt
         ThnDLOjK7qzifJ+xMM1zEmNR3HrRRY3f1kH3XSAoV4VgAWJftAOKwF44PToqA561zDrs
         l2sFlo26RW0fL7ohETfS7Fiv8F3yGM1AglYGSln/33vqrSHVRSfjisKFYgNOuMPiQe10
         irT9I6XpGJzFJGVbt2zCVgPzg+0S6KHY2EOaTgZj6vjCcY7r7Zvglx8aa8EiDkpB+myM
         uPdsCFmxLBkg8UfcpGl4v1s4FzXEfW9NXnNadrFV1E1WQzIckQF/GQXiLmnawzupmros
         RHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=HpxkiE/rVFlomk7mcFdG7tTVTXis1x8OYXXnEOdixck=;
        b=bq9JqC6K73im4YY5UtwAO1ytL9IoiQXINJ0mMFe5v0Svu2+aeTgw/VgSauT+YOYMRk
         HPUw3gOod2oNvyO6hB7OS6sgYfHfkA5x8Jh4v6T48YM1GvLthfOgVeDaa7eCliX6fC8N
         d2Uqjwb8gWfdaPxHn28LVwabgleZMHOwZpNyywfWKbNPdIDwV2WRQYr7IVFyk18eywZT
         bY+XALNtSB9/rjA0IbnijJDD3j2aSOwajFMaaxX/Zd/jSmnW6XJpbvFgL3Iv8b2akoOg
         3nYOPOxk60C9347dTFUr5b1Vfw5euRuxJI+CyK/9v2iuqun/v8BJxbFdl0JqhH0inLuS
         581Q==
X-Gm-Message-State: ACgBeo2Em0l57B4+oXHUjicoaRQJjw/JcvT82OuRnlCpldjD33ntrVmg
        MmrV0vea6YXHVi7yy8haA6C7kbI39nz90a12oSUrNQ==
X-Google-Smtp-Source: AA6agR7gx7SWF6iioajuC2kzWbvgag4v4M6Wj8SiTTynJ7CJ1hFTpicL6hCmGvt6sR+w6BLqsQpAyq9Hat89QHlr0NM=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr34269265edb.46.1662157086243; Fri, 02
 Sep 2022 15:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220830175850.44770-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220830175850.44770-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Sep 2022 00:17:55 +0200
Message-ID: <CACRpkday-0zhppj1V6Hp097hZGxaAOxZ=Xbsn_+93TQW_6mC_Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: mcp23s08: Drop assignment of default
 number of OF cells
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Aug 30, 2022 at 7:58 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The GPIO library code will assign default value for number of OF
> cells, no need to repeat this in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
