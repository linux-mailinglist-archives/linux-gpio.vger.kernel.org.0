Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5585B758B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 17:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbiIMPtU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 11:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236497AbiIMPsY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 11:48:24 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D9D86FDB
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:50:35 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t7so21143415wrm.10
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uuUAUlYESfHNDi+YejfXdKYw5fjz5eIR1Jp8rUlK19c=;
        b=7cHS8TMvfuKzbGm40Tb3+VrP9f7Ar6nDXuKiFbRac2N9EgqeHDVhDiidwGww+WcreG
         gLMpW9BQLTN5UKyfsuPg7uNGyu9uUzldNFxWsdf7Uiei3xexG3BOOZYf2csxmyZZaMPG
         k0D+n231T7uc4N2wfptEAOrDV78/XWJNCDyilJttB3yxs/dkpH5/gfZqXaqYRTEK+2Rq
         eq4fuLlgjc3g8OntzKwPbwkl++Bc/2c1yEwPYbdFB0WD8a19WFnCHCtbTj6A42HQpO8t
         PVnP3G3Gjvg8movdXdz+j275mpHNx4CtyqM+i1/7MJIB3VZV1FqtVfl09xpDTeHH6pq/
         5Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uuUAUlYESfHNDi+YejfXdKYw5fjz5eIR1Jp8rUlK19c=;
        b=yLqBTTKU34PjsvMGxtJ1m1j47PqsRcRwroR31C5JHCQE7eUtFtWvOiTJzIOTxaef1g
         iVNkC8HhrZ6qow+b2V9Z2VzUhlbEHwuZH1iFXbvKffLky9nov+6bjZ/80vpTVZlh6Hmk
         zKKHNIW+sBhLDdlj0FqVGlyvs5+P2YIc90qO0Nc+i39NlFeDg1pG0NZG2BTUDNtJYe5o
         2Lrc3sgQbmaGVomcBxCFb5111PgAws9yBvMdeQw6j5lZyti55ipVv7NEvs2yb2etEEe3
         WECyQwdNUi8OQ5cVKLnaatiexYGa/OEuaN48jV7/0W+GRyCxfyWLxH/cm8PD2tIgVLMx
         dASg==
X-Gm-Message-State: ACgBeo1+a5X/XLV7mywzaJhbm2MA5yWTbXmpORRAPrmAKdS+eea0dPlX
        i6YOJsJft2G6IX5ihjE8qZlXlnCNFdSygK3qR0rJ54pePrQ=
X-Google-Smtp-Source: AA6agR6QIGrp2fAdnkwFjFQk/HswZRvMxVXZ0JkwXjwGIC0UzX658mD2J7R45Mae0DXy8vKUiThb3nPXp2Jt9SuFGyU=
X-Received: by 2002:a05:6402:42c5:b0:44e:b640:16fb with SMTP id
 i5-20020a05640242c500b0044eb64016fbmr26672124edc.29.1663078386576; Tue, 13
 Sep 2022 07:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220908112151.13912-1-f.fangjian@huawei.com>
In-Reply-To: <20220908112151.13912-1-f.fangjian@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Sep 2022 16:12:55 +0200
Message-ID: <CAMRc=MftDHFhPQzaJgf4WUjTqNpGsEWi4mHWRVPWWtWx_Z-hbg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update HiSilicon GPIO Driver maintainer
To:     Jay Fang <f.fangjian@huawei.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        jonathan.cameron@huawei.com, jiaxingluo@autox.ai,
        prime.zeng@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 8, 2022 at 1:24 PM Jay Fang <f.fangjian@huawei.com> wrote:
>
> Add Jay Fang as the maintainer of the HiSilicon GPIO Driver, replacing
> Luo Jiaxing.
>
> Cc: Luo Jiaxing <jiaxingluo@autox.ai>
> Signed-off-by: Jay Fang <f.fangjian@huawei.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1390b8270b2..907451fb013a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9122,7 +9122,7 @@ S:        Maintained
>  F:     drivers/dma/hisi_dma.c
>
>  HISILICON GPIO DRIVER
> -M:     Luo Jiaxing <luojiaxing@huawei.com>
> +M:     Jay Fang <f.fangjian@huawei.com>
>  L:     linux-gpio@vger.kernel.org
>  S:     Maintained
>  F:     drivers/gpio/gpio-hisi.c
> --
> 2.33.0
>

Queued, thanks!

Bart
