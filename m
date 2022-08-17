Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45608597122
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Aug 2022 16:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239317AbiHQO0G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Aug 2022 10:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236463AbiHQO0F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Aug 2022 10:26:05 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7125C63F35;
        Wed, 17 Aug 2022 07:26:04 -0700 (PDT)
Date:   Wed, 17 Aug 2022 22:25:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1660746362;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z8+5aIhcSmi0wPdPxRQlOAd4m4En2jwXZdUe8Xcm1YM=;
        b=T9xn3JMtrV5zLp8RY5njHKqGWFEHljyH3vXQFYKo1Ld+tCc/S276Xbq65YFpX0DsQA/cEx
        pEiCywATjSB23WsZ4qjAMAInU5h46AGkWOH2Yw5k6xkOkIitI0owW/qV61Yx+ojRN1NqdQ
        7Tq5XOVbzlomN38uABCuh4erJbrxZ98=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, tekkamanninja@gmail.com,
        corbet@lwn.net, alexs@kernel.org, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs/zh_CN: Update the translation of gpio to 6.0-rc1
Message-ID: <Yvz6XLWEQ9RMvMLH@bobwxc.mipc>
References: <20220817020830.799468-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817020830.799468-1-siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

话说 Yanteng Si 于 2022-08-17 (三) 10:08:30 +0800 曰过：
> Update to commit 5513b411ea5b ("Documentation: rename pinctl to
> pin-control")
> Move .../zh_CN/gpio.txt to .../zh_CN/driver-api/gpio/legacy.rst
> Translate .../driver-api/index.rst into Chinese.
> Translate .../driver-api/gpio/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
> v3:
> * When restoring the list, I seem to forget
>   to restore the symbol, so fix it.
> 
> v2:
> * Modify some words under Xiangcheng's advice.
> * pinctrl -> 引脚控制
> * Restore some lists.
>  .../zh_CN/driver-api/gpio/index.rst           |  69 +++++++
>  .../{gpio.txt => driver-api/gpio/legacy.rst}  | 184 +++++++++++-------
>  .../translations/zh_CN/driver-api/index.rst   | 132 +++++++++++++
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  4 files changed, 316 insertions(+), 71 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/driver-api/gpio/index.rst
>  rename Documentation/translations/zh_CN/{gpio.txt => driver-api/gpio/legacy.rst} (89%)
>  create mode 100644 Documentation/translations/zh_CN/driver-api/index.rst
> 

Thanks,

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

