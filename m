Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73DD962C82E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 19:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239070AbiKPSvK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 13:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbiKPSup (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 13:50:45 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBB768C68
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 10:47:07 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id w9so1453600qtv.13
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 10:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6mUWcAUsHBLBBOyPZl9KLfZxNzmpm7+WnSZ6t7cdFnY=;
        b=U7dU9rv6wUpFKpXsiQgGTKHI1hOhD02/8YUvZyUexZM44blcMCXRGGDvsVwpihMpCg
         DIulg/dlhgxKhfU+3Lcr+hbAyQ3jN0jbIsxVUJasZCrsnbqL7HwqcLDq3ySQRfjehh4E
         KAYEZXQsL1ygEwCovCE/tuMViSZr67pc5yQ6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mUWcAUsHBLBBOyPZl9KLfZxNzmpm7+WnSZ6t7cdFnY=;
        b=EnKn2LpIEFljrTkPcYZaXdqCXXLizH1OowojI7SizCzqTNGwbtAWMbfStzYZJTLGz5
         HCwYeIBX5hnBewtlgPZ7waWZkdvXvkhWqBfMD2a3a7mGKBn5LPjAtnLs33wnf4cKWcmd
         4dXdsi6F0zQfMgNgtg7tvz9mPHOXmZhl3kIEwg6mT/Jm9NSC3dI0DyljmjnSzSGQ+8mH
         Riwu8aQPjFU9czcQ2naVoXOb0Yu3z2bUTrUy3YwKm06XdNKzc9AHsfPAWCEvxz4V8ezT
         FsrJw55QHlNzY9AD+/t0HwWvLk/4n3195+37NBYPM6iCvug3nxTQaDIMAcqIyyDNvVQy
         IyzQ==
X-Gm-Message-State: ANoB5pkdbQ3cjK6AhcJaP24PIZQX6cLuKVb2OvyS/1wGZ1ve3eaIPV7a
        3a8Md2QM+2EAtwgJkPt+3AYx0C6P0sBs3Q==
X-Google-Smtp-Source: AA0mqf4K22/zsLaaeVdr7ai4ru3DsT4krmRVAVEp+72u4Ps56DSXv7SX/ZzgkO6XbdG+C1Vd62/MIQ==
X-Received: by 2002:ac8:72c7:0:b0:3a5:8687:9d5 with SMTP id o7-20020ac872c7000000b003a5868709d5mr22388326qtp.68.1668624425914;
        Wed, 16 Nov 2022 10:47:05 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id z12-20020ac8454c000000b003a4f435e381sm9052036qtn.18.2022.11.16.10.47.05
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 10:47:05 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id g10so12280905qkl.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 10:47:05 -0800 (PST)
X-Received: by 2002:a05:620a:2795:b0:6fb:628a:1aea with SMTP id
 g21-20020a05620a279500b006fb628a1aeamr16303743qkp.697.1668624424863; Wed, 16
 Nov 2022 10:47:04 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdaJy5hhrMfdZWtpoBUxBEc1QnxaX4pRzQVUBoEoKqrwzA@mail.gmail.com>
In-Reply-To: <CACRpkdaJy5hhrMfdZWtpoBUxBEc1QnxaX4pRzQVUBoEoKqrwzA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Nov 2022 10:46:49 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi0_VS4r7y9=4jyvpnVLMLkWpDz-xjGxWtTBSefB8VfYQ@mail.gmail.com>
Message-ID: <CAHk-=wi0_VS4r7y9=4jyvpnVLMLkWpDz-xjGxWtTBSefB8VfYQ@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for v6.1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 6:57 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> GPG might need some UX polish

Hahhhahhhahaaa [takes breath] hahahahaaa!

pgp (and gpg) "needing UX polish" is like saying "cars might need
wheels" or "fish might need water".

There's being cryptic, there's being actively user-hostile. And then
there is pgp.

I point people to

   https://www.vice.com/en/article/vvbw9a/even-the-inventor-of-pgp-doesnt-use-pgp

whenever they wonder about some oddity in pgp/gpg.

                  Linus
