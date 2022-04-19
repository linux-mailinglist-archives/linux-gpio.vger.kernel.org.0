Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B89507BDA
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 23:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357977AbiDSVYm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 17:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350237AbiDSVYl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 17:24:41 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAEC41FA5
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:21:57 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id b95so101113ybi.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2022 14:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uFa5rTd0mVzbn/LyQsQjYiYFNZBK/D6kGFcBSmtjLzY=;
        b=jZGIoPgbLJiiEHlzQQgD7dBWSd44jma5Asn5zN8Hv+DzGVfn+Z8QYPBZF/yOMRxI36
         +697N4jLNJkwyf2GT1+HWAEz681hCqZn1RZH9RC2xJyu2MAgEKPu9qd3qqPWgweNd60O
         IZVgKVP3TQzl5GanOxBptfUgEOwCkizZD18Mq9ySHXdBckEYkY5ARw9doi5IRCSn8N+K
         SLU+rOP0uYgBKhZcv6e689XcsNVhwgZrxt/gXMwRP2JciAuY4++kl0nrUeJ4B4LFau6m
         h2LiQZH3uoKqnhkGJ5V4ualqtverZx96tnLKt3zzGHaELFiHSzuAX4BomV4/rra90cug
         WN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFa5rTd0mVzbn/LyQsQjYiYFNZBK/D6kGFcBSmtjLzY=;
        b=Hs2aArX2LOOk5N7nMAPK7O4kMB+yPh6UeS4CB4qZCnCUs2bd0QGO2MTOvbPcdlcMcD
         BgQVB5wPm4OlRtBDc9PdOah+OL3lX/UHNLa6tsuzFwoqbLMd0DckIFE8zKf9J6EhLozX
         PtdVsMUGTbcP9wE20EJSOUd0ixg0W5wcYHJSv5FnTid63j90xsQPFaYC5RqAmVdrQ/Ts
         PQAaZTyS0fIcPcL7ilXwF0X5qSbf8JgxjegQhiKpaToW10ooEo8TXK+0wt75RBdpE5qa
         FbWebDi7dshS7KVyRRCXxy6JTcPsSmHda3uy/etSFpbliTs6fpyDGqotvcdSfZ5OAvuX
         TiLA==
X-Gm-Message-State: AOAM5305+EH4cCgbTLYxhhuYjfTi2No6HPkFBYad1weB2xmVTqWZ8ntD
        GOHENaQcqAm7QXKzk3lQHYTG4X3bjyhQ4IKlTuQlkA==
X-Google-Smtp-Source: ABdhPJysRmddY6nT3hJooaAQ8BuTBiC61BBGBEyVsL1Lb67LFGJd2WHsNLGvyHgeulgTFv/nksGEdAm30zL3GtNCK20=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr17263610ybr.295.1650403316892; Tue, 19
 Apr 2022 14:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <1649048650-14059-1-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1649048650-14059-1-git-send-email-quic_rohiagar@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Apr 2022 23:21:45 +0200
Message-ID: <CACRpkdZKHbWH4EO7nMJJqiXsSWNq9OikpVwC1dY5bh1y9E_tcw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add pmx65 support for pinctrl
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Mon, Apr 4, 2022 at 7:04 AM Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:

> Separating the two patches from the original patch series
> "Add Power Domains and Regulators in SDX65" as suggested
> by Linus Walleij.
>
> Thanks,
> Rohit.

Patches applied! They have surely been reviewed long enough.

Yours,
Linus Walleij
