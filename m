Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C804D90D6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 01:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239743AbiCOAII (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 20:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237985AbiCOAIH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 20:08:07 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD1F40A3B
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:06:56 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id g26so34086850ybj.10
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JBuIzHr/hNW9HnE6Wb7cA2vFROsqgqu51wMCBe03Gu4=;
        b=BwQUfr1TiWA50lgUJa4/5OtO3NncrQ7jwFSZ+fYmqj1CdMRsgw64FndNFGz6Ji/Gj1
         8zBXbVA+NHEnX2L6z4ln7DYOKnvpMvhqJUtmFB3wBEpnIgrc5jOEH2LSdO6lm/0ZSoH5
         OlDGNRfArFvUqWXe6WbmtMwTQdkM08jlRokFaZvKLi0fe4d22WPpVMUqRWC1QQnjxEBl
         aVlIVEHnWC0kq82yXUto2rGB0aBxgUZ1G192vNpx3lBshVdKDEl/w0LgPb+iAdQgGPRw
         FC1sZJXyuU/13HgJPM4uYVbaOtzA3Lv+9fpHTCBQJDKExOJNg2IB38MQv44YJ/MtXKCa
         ogVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JBuIzHr/hNW9HnE6Wb7cA2vFROsqgqu51wMCBe03Gu4=;
        b=4/+aRahj9pLXaYzVxSjjp6HyPNE0ai5T5eB7M1YCr+pbNhAgf8DPiXqA/q7WMb3Hb8
         cSfihx7yXik3nDFuK/55sEtktAUymRldObm1VVhcCAEhHnfYe31K6sZx2Bb/D3iWGcrc
         0VMmuGL9Z4spgYJX1xhWz5fwbLHUI0denIfpGxBry8sZ2xjUy1SI0vloO3uALYDNJ4h1
         bPn80tY5XvgOdeP+uwwi62bnRNaw3ts3NZC8/luxDgTmM3wvIfVxK4v7D9n2q5aF62mX
         IMaYf55KGu7Z6jiFmKZgbW/dmV+6vrchiaarXZacEnYE7KOHHZh4sTPJh4KELgcw2pos
         ctZg==
X-Gm-Message-State: AOAM531RAJJJS6ACYsWyQ0niN6iXAnUZwGgLheNLomdyh6tn2AVVMQgl
        Wq2yGARHIN0UFGJX5YNf0n95VkA5bpCaVWM4mWb31M/8HCY=
X-Google-Smtp-Source: ABdhPJzmknoXTod2xBAeQXjdNuh4jQWme0RxTMFeHvO2t4kLLwhqTyhxNa0I//BO7FuSoFfI05lv0gg6cO9YHANAhUU=
X-Received: by 2002:a05:6902:203:b0:628:7b6f:2845 with SMTP id
 j3-20020a056902020300b006287b6f2845mr21062560ybs.533.1647302816147; Mon, 14
 Mar 2022 17:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220216122727.1005041-1-michael@walle.cc>
In-Reply-To: <20220216122727.1005041-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 01:06:45 +0100
Message-ID: <CACRpkdbYNRrSsQqtfBb4rGjxrEWcw8gQSQZsbYGd2pTQKeJ0MQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ocelot: fix duplicate debugfs entry
To:     Michael Walle <michael@walle.cc>
Cc:     Colin Foster <colin.foster@in-advantage.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Feb 16, 2022 at 1:27 PM Michael Walle <michael@walle.cc> wrote:

> This driver can have up to two regmaps. If the second one is registered
> its debugfs entry will have the same name as the first one and the
> following error will be printed:
>
> [    2.242568] debugfs: Directory 'e2004064.pinctrl' with parent 'regmap' already present!
>
> Give the second regmap a name to avoid this.
>
> Fixes: 076d9e71bcf8 ("pinctrl: ocelot: convert pinctrl to regmap")
> Signed-off-by: Michael Walle <michael@walle.cc>

Patch applied!

Yours,
Linus Walleij
