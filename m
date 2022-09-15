Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FD75B967C
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 10:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiIOIhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 04:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiIOIhS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 04:37:18 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5954997D72
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:37:16 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a26so11706645ejc.4
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=kmlxCceTBnfaCXUh8SRcjaskyWEcbUh/c9v+aUd1dUM=;
        b=IUvPLMYOztrbRDwa2DXj550EVjY3o8RmeuEmBTA/fIWj7DWbQJ4lz6LWOj7uMPOKjS
         Bs94AzskN8/UYpBE0kjJQHmzXgp9MHTlp8GUzewhL3VxFubY7zAwOzLWO7sZeBf6e3+/
         WIVYUUNjDqx2ah44cDL5Ta/0fqdZ4+7NXk2pLL2V0jGBzpZdcVAGqV4x2OWWrqKQ9Umk
         AnxFmDN1yMQYj/HlxuWzTWfzJL2/RBqxUoWe+wWJzojHy7nLbJdSTN7QvMWpGByUrvN8
         54JRz/lMV/AMfgRlr55m2j/gEBzAwqAX3wmcqtQpFkHvvJdyH8j2nuP1x1un6ffA1y0Y
         yfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kmlxCceTBnfaCXUh8SRcjaskyWEcbUh/c9v+aUd1dUM=;
        b=e7gY0XrTbll1PAP1dFaXKhWpDClFfVwp99pRqASC0cIrawDTpT+Jc9qx3QC3dgX/F9
         cSE1d9/5Ov71eJbjTtTCKzMDbvZDwKxl+lghap6vnyej8XI/eT8ai9vE3TSrVaYSqbBX
         qVKKeBnShk0Eojnxh9uziCnI6XV/pKuUFKQXrDlEstiIkn/qL8FwIYSfYjMal4TcXtf4
         xzSUOz6rWYfTqcsVkk4qAa5RwH2q0FqlvUiObZ7vEJRjhOg+fFe7T2tMkYaH5QO1qolb
         IvwuaaS3Y3cp9dDfZ3FBQ50huhLmuStggfarT0wg/SD45KohhIMwnmS8EGsCawJp7SCK
         8JIQ==
X-Gm-Message-State: ACgBeo1b2uejezBN2VLthON2SMi5e2whsOyKj1yEpjIYYezJy0WdboQO
        +jFJ3pdWBZWe769vPi4y9zvnOlSGrTanVN2QzxZZS2oaNK8=
X-Google-Smtp-Source: AA6agR5+0g56DA5p18zK8i1cHuxGwacUwMHnMTi8BwF8bVTftIv4Zb5O6gY7XA+o/Ardg2nESNdpwo1A53U7PzNgD0Q=
X-Received: by 2002:a17:907:a079:b0:77b:8d9:9d9 with SMTP id
 ia25-20020a170907a07900b0077b08d909d9mr16504465ejc.697.1663231034975; Thu, 15
 Sep 2022 01:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220908053949.3564796-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20220908053949.3564796-1-dmitry.torokhov@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 15 Sep 2022 10:37:04 +0200
Message-ID: <CAMRc=MfxTawSP9HU__4F5XAp2k2QKa6m4wqVW+ntpPsHUT8oHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: of: do not ignore requested index when
 applying quirks
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 8, 2022 at 7:40 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> We should not ignore index passed into of_find_gpio() when handling
> quirks. While in practice this change will not have any effect, it
> will allow consolidate quirk handling.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Applied the entire series. Thanks!

Bart
