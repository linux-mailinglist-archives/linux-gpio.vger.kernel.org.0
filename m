Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE04A51FBB3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 May 2022 13:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbiEILx7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 May 2022 07:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbiEILw1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 May 2022 07:52:27 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB3A21AA9E
        for <linux-gpio@vger.kernel.org>; Mon,  9 May 2022 04:48:31 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2f7c424c66cso141295287b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 May 2022 04:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RD5UBc9Tp8nxPaMy9EtIkwGnYmwjmD8F//1MaTDPdS4=;
        b=ZT7EyveKN4tEMbX9Dkz1rllst2CQaRkI2llk34jeTE80NYlapr/CVm+qZSp2amUWNy
         3sF0B3aDQSsUt8vHz9wRxa9mY4g8Aymj9eGW3a0jXLx536XykNSFvcx+uesq1bbIXBOV
         gE6y41hJfP45iQUXFAKLUmPrJHZ4VEXaY3s8xyEWMHAuMfsgtSdHPB5eFzAZ2/fuEoXO
         UbVS4Ypn2MOaa3xt26SEGmPcG0CAUtyU4q31Rj+wHb7yq4/YPREmEGWTwRanO9Oq5e2i
         0twRqgHTtPXl//9FtJlCwIV4hCEfKFleuegv8YDAh7WMU4QFOBLqeDnI7GK9c4NSksV9
         TCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RD5UBc9Tp8nxPaMy9EtIkwGnYmwjmD8F//1MaTDPdS4=;
        b=YGrs+drr06TJ4VGpBu371gio9yXD3fVCkC5VdB79y2O7YoaXGWJnvBfRApBO9ykrF3
         PLKU14aCXqEN3xZS7k7m1umm5P7HfjTGRQppbnQFyx0s7IbTZ7f/2V/CiuaQGweOQoiI
         1ykKI6uMfVNvjaiiFkHyyAhb8aBNmjeCtVyGanHvcigDMVNBPZjHIVh6D5Q/xBRfWQp5
         ELlWxsCV+Mb6aKe9R6cMjHBdqewpYq9RY5A9EQ/eAVYK4zeQdDgyEv3jmvmwkVMsRNrY
         rVBEesXUa4JT/jgJqy9Psls3D0dhe/igeSJ0Ldv0STlmQsmEBXWs5fabhc7hoUwNBuhr
         IRww==
X-Gm-Message-State: AOAM5307UzKYG6ALmWwxPsJcU9HQe5zqG5o6+pZeoR2F3QH4Zm+mmZmy
        gaaad9rZ8YnYKS9HS11ntc8SdBIrfD16wkeCoZdtjQ==
X-Google-Smtp-Source: ABdhPJzHzWjkwY2TT13Qf2WLxvQu1bcsQfixOklAup0qs85vi7n3/8pWUCANEvn8ywtnFm3S4xH89Fq1aRrd1AD9HCA=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr14457243ywe.140.1652096911136; Mon, 09
 May 2022 04:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220503151517.59115-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220503151517.59115-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 May 2022 13:48:20 +0200
Message-ID: <CACRpkdZEeEX6qOxkG0AFih4bMXaFraUFchgOXEKDO9pEh=mGGA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: microchip-sgpio: Switch to use fwnode
 instead of of_node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Michael Walle <michael@walle.cc>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 3, 2022 at 5:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
