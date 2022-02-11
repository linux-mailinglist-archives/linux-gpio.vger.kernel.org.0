Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A15F4B1B1B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 02:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346719AbiBKBUX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 20:20:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346716AbiBKBUX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 20:20:23 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EEF262B
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 17:20:23 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id bt13so20661011ybb.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 17:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FxR2tCd2kQ2slz4IkVSpQwFsX+MPwtsdOXOlbt9nOOY=;
        b=UQnBoKSK7byn2I0KnUJSpQUYM33v2c1HGs/VbASBlEP3xui+kZkgyeCWVxp5XUdfx2
         AHCPQcjBpxGE16zdapg1W5X8VEzI6TfhymRx0nBgsvzGJ1IOGwlPD8rn59ZxC0Fa0d25
         3n2KxZYmaA/Xwu7CiH7povjf+KUmXmiOw4OgnjfEopvWVGYUGczJNe7Ir0zbFMC2Vhn3
         3Y0yk0SeMEfqjl7X+OvgxEfW2jgPdi8BB1vmotBZMER7Fco/IGR9T7RrOPS/DyyJvKtU
         0YfR/aJGhOxmpuDFWH+sf+g07IM9XxmI25DHNNX8WdX4LJvC3lDksGovzt+GUoka/84o
         x6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FxR2tCd2kQ2slz4IkVSpQwFsX+MPwtsdOXOlbt9nOOY=;
        b=IgabVOe7/YJXYkwezzfmrtLRRZlW3bh2uyGU/CNVkTBYhZlg5bFOKb1jRerVolfVaf
         NarSvE9zzCFOf7D+CxTymfuVwDibhMKI/Dj3mULfQNpIEzQDEu0XKLMb1qCbLUN7hYlq
         oBub/9RoCqBhrKtzctfiW54KyOx0LNxzMFfgZowcxh9c4JLs7L++AFvAQ5QJyYu8sGH3
         8RBgLylIrDucd1VDTc+QQj06U3pfaN+ISFAsdk9r8W+HDpF9dP6YV52NPPzmHTZzrTR2
         nRHTD1DAOPZm+p1aiLfr27EtAntmPStSFGQWU2o7Q+hjP6MltqUQKzANuxvewnRjlXQ9
         tNbA==
X-Gm-Message-State: AOAM5317RaaQPK3OqHK5sAkyUCVdy8eIPICfHvv+n0IPPea/6H4lkFmT
        VaboI7YOXur6tZWwJ6+0vynjar7QZLIRzogwfZ9tgA==
X-Google-Smtp-Source: ABdhPJxvvbhC/Ip2xmkeo9KyLe5UWlcZ2Cjmmt6Q2osiy0C19S3Zfn9E7oHXfdrmpct5QTha34v/loucubB8P31MPwI=
X-Received: by 2002:a25:5143:: with SMTP id f64mr10175550ybb.520.1644542422611;
 Thu, 10 Feb 2022 17:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20220209182822.640905-1-seanga2@gmail.com>
In-Reply-To: <20220209182822.640905-1-seanga2@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 02:20:11 +0100
Message-ID: <CACRpkdZmWAhToG5m0pqzpE6G-xZKnqYPS5GZnyLfzs0XQ3CfJQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: k210: Fix bias-pull-up
To:     Sean Anderson <seanga2@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
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

On Wed, Feb 9, 2022 at 7:28 PM Sean Anderson <seanga2@gmail.com> wrote:

> Using bias-pull-up would actually cause the pin to have its pull-down
> enabled. Fix this.
>
> Signed-off-by: Sean Anderson <seanga2@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
