Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2D1606A08
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 23:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJTVFP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 17:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiJTVFM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 17:05:12 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAF86DAE8
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 14:05:01 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id i9so598962ilv.9
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 14:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vujdm73i8ZyKNIoJLaYhjSAixqeQyXLxPyQJKAuf9fo=;
        b=WYqxcU1TXmyLkxjvGQ3G/bEGI3knQjHQKYY5E76J3dt9tnFnCNwXtcNfzIC10FqTwS
         0wrn9pxm8gOnuEVRYc7KFDCp+6XM5L4yc7x0IJ/qh98/PfxFKM3bojZGuzeHqBMoUMip
         UtYeYSGXbKQVYp735EZfUCQY8cRuXmXFhKmzT9oaC8qk1iXIH7Hn96C0vnMGTgNiXjhy
         WeqdRJmKxsv0tg1ovF99T2O0QIqZc/4AyEFxLsp5k2EMlxLB6bXrnAdUm1mHTPeV2mwf
         hPfafVp2QhU0ibyJVsiZryOZjrVRxrLFJ31wq0jMBW0C3rOWUVWlWMuiS0JcAUDpIov/
         n09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vujdm73i8ZyKNIoJLaYhjSAixqeQyXLxPyQJKAuf9fo=;
        b=uRUNeIw9THmyxB8SRAnHDsmOqXmpLKaQhKkXTEVaazaPVhArq6Izc+Etq1ycR8WDeZ
         +K8VNE97jiYMRu5PP/tg9iz3LPzccAaNLb/9qYhHPztEWszQ3nFJgAq+d8yQm8xGxiMV
         2og7EjB7gyQ2SaemaEXcK+V48mb7sRhBH47/fKp0ySaHR2wPHtrwx7wTpnyqRkBkMjyn
         p9ipZCVJwkPcVmMy5QeqEO0qiPM3cyBtV7A9A7gwnGM53QdpEafgQsZKDM3Q3OrjW+Hv
         FHuzEmHwAfXDmDqVCslNe3u1rZDpp5T5cLVBF5ssNWMJ5wSJlad1tHFowh+z9KoAS8rh
         lCIw==
X-Gm-Message-State: ACrzQf19c11vnv4G9BR38eyheOn/E6SaGXxAyXI+UFkQm7fZEn3Zg28l
        Hk44NpR5ymGIzXHvL1jxMAA=
X-Google-Smtp-Source: AMsMyM52LrRkvR9qM17va5ixCNgDNbU8Kw5R2qeY5Me9p8w3XtvpMOn0x0pUzsiZumnvxNyltgOXHw==
X-Received: by 2002:a05:6e02:194d:b0:2fc:3d91:5389 with SMTP id x13-20020a056e02194d00b002fc3d915389mr11883979ilu.294.1666299899948;
        Thu, 20 Oct 2022 14:04:59 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::cb3])
        by smtp.gmail.com with UTF8SMTPSA id t4-20020a92ca84000000b002fab1376ba0sm3381071ilo.85.2022.10.20.14.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 14:04:59 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-gpio@vger.kernel.org, mailingradian@gmail.com,
        linus.walleij@linaro.org
Subject: [PATCH -next] pinctrl: qcom: sdma670: change sdm670_reserved_gpios to static
Date:   Thu, 20 Oct 2022 17:04:44 -0400
Message-Id: <20221020210444.3736-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020075650.1031228-1-yangyingliang@huawei.com>
References: <20221020075650.1031228-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> sdm670_reserved_gpios is only used in pinctrl-sdm670.c now, change it
> to static.
> 
> Fixes: 61164d220f52 ("pinctrl: qcom: add sdm670 pinctrl")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

The email headers could maybe use a little work.

	From: Yang Yingliang <yangyingliang@huawei.com>
	To: <linux-gpio@vger.kernel.org>
	CC: <mailingradian@gmail.com>, <linus.walleij@linaro.org>,
		<yangyingliang@huawei.com>
	Subject: [PATCH -next] pinctrl: qcom: sdma670: change sdm670_reserved_gpios to static

You don't need to remove people's names from their email addresses; they can go
together like so (not a strict requirement, but a nice touch in everyone's
mailboxes):

	CC: Richard Acayan <mailingradian@gmail.com>,
		Linus Walleij <linus.walleij@linaro.org>,
		Yang Yingliang <yangyingliang@huawei.com>

For this patch, there is a typo in the subject:

-Subject: [PATCH -next] pinctrl: qcom: sdma670: change sdm670_reserved_gpios to static
+Subject: [PATCH -next] pinctrl: qcom: sdm670: change sdm670_reserved_gpios to static

Otherwise, it looks good.

Acked-by: Richard Acayan <mailingradian@gmail.com>

> ---
>  drivers/pinctrl/qcom/pinctrl-sdm670.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670.c b/drivers/pinctrl/qcom/pinctrl-sdm670.c
> index 4c3c3782fef8..b888bca7ecd7 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdm670.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdm670.c
> @@ -1294,7 +1294,7 @@ static const struct msm_pingroup sdm670_groups[] = {
>  	SDC_QDSD_PINGROUP(sdc2_data, 0x9a000, 9, 0),
>  };
>  
> -const int sdm670_reserved_gpios[] = {
> +static const int sdm670_reserved_gpios[] = {
>  	58, 59, 60, 61, 62, 63, 64, 69, 70, 71, 72, 73, 74, 104, -1
>  };
>  
> -- 
> 2.25.1
