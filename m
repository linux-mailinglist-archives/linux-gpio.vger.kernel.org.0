Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85EA85F35FE
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Oct 2022 20:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiJCS56 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Oct 2022 14:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiJCS5x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2022 14:57:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EE1371B6
        for <linux-gpio@vger.kernel.org>; Mon,  3 Oct 2022 11:57:50 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id e18so7589856wmq.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2022 11:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sWBCePO1yc3ehsSOLYqdO1HxPbUDLg8Mw6hPEvtGOZ4=;
        b=E5IJ+vLtHUuKDhwQRojA3DL0RPFg3zDYAMiq48QV0Wnw1F0J2MeXI66nhLKVr2R4i0
         WbqJjuFGk6T2n9rEII8q13s/dNnhaAW8QvN8TRlLw3RIatgXh7fMqeLfELEmb0i4z3pu
         hTg51h763QiSga4PW/t6D5TP+SRA6qrex6p4ZTUg1AaPtuD9SPv1WWmlljGq367yxs55
         ANNwChEBqX/zcC02gME1NSL09CMSRD9e1djmUeUo2NE/SJTXcx/F5V8fd+n2jt5vxeG1
         EPuOg5/ueAdt+RUJSIjt+4uKXKS47KoAJRj8VtNtzj2HnGNNGqYWaJORQFakYrVpkKcy
         HICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sWBCePO1yc3ehsSOLYqdO1HxPbUDLg8Mw6hPEvtGOZ4=;
        b=s5QqH5VqZeYnjpDJEOCEfJRNPoy1WQZPmBsPqZ3aVrhvR6j1/h2v0DFzgie/osmqmc
         Tv4Vsw8dcvLJmeYwldWWLa/ldD2pcpezlursF2gmfTiASVPM48tVwGufDkbjqEhrsS2q
         Os04LwiWtZZgHowkhOLFu+fwAenvY7LHTFZz0F0K4Kuzh2WBNr34Eq+1FjkCUB73lWFk
         75OpPMkVkfUmcSiy3ZM7AHCaFcLSnCm/YzJ7AewrXUjJk0jcAXzwzQO603pY61fYfYaF
         +0XmqhKQz8H8kKvvzjF6xmgbgGo1ZnlVMcYdJzGBOxjMK9TxQm+NPwMB7buh8RhjW7yK
         1z3w==
X-Gm-Message-State: ACrzQf0dNJy0V9hFGWNqLerDn/D0hqu3ac+39U9MkKZc4bZQPwmBGKSQ
        rU6VUTvjrsjrWO1O/P8QTeWYxMc3kWGZk1fCdR737A==
X-Google-Smtp-Source: AMsMyM4gQpRW6RybKOyY5PojGAmBhRa8j9y95xNU3ZsWqA5W1JM9eyNsecIeEJ9jfyDrbhPsIp7lGq+039PtZSZEY0k=
X-Received: by 2002:a05:600c:1e08:b0:3b4:8fef:d63c with SMTP id
 ay8-20020a05600c1e0800b003b48fefd63cmr7634987wmb.158.1664823469252; Mon, 03
 Oct 2022 11:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221003074520.2526581-1-linus.walleij@linaro.org>
In-Reply-To: <20221003074520.2526581-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Oct 2022 20:57:38 +0200
Message-ID: <CAMRc=McJha_-0XqDcyyZZYESRWQTnkgJJc0yvcoxb7MVU94hCQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tc3589x: Make irqchip immutable
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 3, 2022 at 9:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This turns the Toshiba tc3589x gpio irqchip immutable.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

I applied it to my for-next tree and will send it to Linus T. together
with my GPIO PR later this week.

Bart
