Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1CB5BE1BC
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Sep 2022 11:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbiITJTH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Sep 2022 05:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbiITJTG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2022 05:19:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCD5AE47
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 02:19:01 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w28so2885170edi.7
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 02:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GFHVAxc4+FoQENj5lYcQDhteACuVL+R/CQebMH281fs=;
        b=Qar57NlxfhR2+VwA0PQKOcEJBo3Cvc1QBAJtflnaEtfU9EznaD7CguBXbm6hN6jhei
         lfVDLYWqcLKteLa3pd0RpvGPIsl4PfOJVKlF3LwkfwpbNTcly8LrhV47ggFXkTw2v7//
         iLP5vIL6qFjJWCF9BGk/5bm9dkdgBydNn2G/FyVTQhh1SRMT/zG418+5XvhYZUsckcsE
         2BQwXiKuYCHJCbZiImYJIJc9ELqyH0k/lg8j4Hi4AA8gRruXWQsceddd6sTJ2wAqPGsy
         ELY7ObGudFAl8qLfzYB3u/H7bXQS3U0Kp1heOXQgIFR+YCLS1Vz7uBwZ7PxNB4rK70uw
         s3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GFHVAxc4+FoQENj5lYcQDhteACuVL+R/CQebMH281fs=;
        b=pHkKg1e5Z8qn4K6HDjo1uAwwgu/KVWNkOde9tOc/ar7jApT78FyNpSS1HTxhQibeAx
         aNhycqYOPdWkmqTgvLd8uaqLwkAUK7SLQ8BGPAt4vnkfqboPtvVztal/6twN0Ek0fVI6
         NtfnLQcvF6bo3UrUwki2kYjM+4KFThw7mQ7GPwPIjEDVuoRckr3lF5vPkHyOoPo2oYfS
         6UeWdwVTyfOkpRih5BWxsn+vM/eSwy5GPFoDyJmWEdzJrYG8G975O9Tgd3/TSf59hoE9
         BxumjMLOC30JUjHmChN/amIQEC0OdUqtkz6mYL7V52XoZfbYBXks+SBW0Mz+NRn/6igY
         Q/gQ==
X-Gm-Message-State: ACrzQf2It2AQ/ZQxd4Lw3j54NhhTrsb2v7YTlf2vAc2PqW7zFa/cC8cz
        I2AU2Tln3ELDsRSm4oymPiE4Hxxh2gKbeX1R/HJwYeeKLryv6A==
X-Google-Smtp-Source: AMsMyM6mQkAKJwmkyHDMzpGyLUNrJjF0WTWWJBE7Z0jYpPir4MWVw0uiTX7tyYnonPQ6RmUxa2dH5K5brOWsD/iqKg4=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr19327429edb.133.1663665540370; Tue, 20
 Sep 2022 02:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220917122208.1894769-1-yangyingliang@huawei.com>
In-Reply-To: <20220917122208.1894769-1-yangyingliang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Sep 2022 11:18:49 +0200
Message-ID: <CACRpkdbR6J1oaKOtod9-0r2e9Y0YCLRf9Okytgkj1QYJ0cu67Q@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: sunxi: sun50i-h5: Switch to use
 dev_err_probe() helper
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-gpio@vger.kernel.org, wens@csie.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 17, 2022 at 2:15 PM Yang Yingliang <yangyingliang@huawei.com> wrote:

> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and and prints the
> error name.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Patch applied!

Yours,
Linus Walleij
