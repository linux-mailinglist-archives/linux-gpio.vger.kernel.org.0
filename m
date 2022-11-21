Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B23A632426
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 14:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiKUNqs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 08:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiKUNqr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 08:46:47 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C292AF
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 05:46:46 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id s18so13609614ybe.10
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 05:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TnAYoBxX178SMHTdhN89K1QmjqVLeFJZPhx1y0hQub4=;
        b=wunb67rRMfnxu5LI0rQVEyuX04d8RB+gdpTCFQxYS61J1o9LLZn1xXxCYEhwQsjMvO
         vTSCy+JwWLza4Y7XE6vtNTbUDA7JznZ5IGGZcB69FjBn9Gpi12u99LmT1K/ktS80OeYd
         faMPgzC1tyqGOlWRIX3B/usdXLC41X6oBRB6Xn6s+KUohMId4wd3xNbOjEF5Q1VyBmKl
         llAEVcEsHH9B82JtvYjxJfTQJMMce0FMidiaPlXVEFIYvPD8hALiC/rxOLmmwCQJoJQA
         F11CPsn6jweah7YVzEQTgJrFSEDScXMuZfUTyVPuF2tVevARSHQKhQtu/Th2qIB9ZX+2
         OzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnAYoBxX178SMHTdhN89K1QmjqVLeFJZPhx1y0hQub4=;
        b=M1UDoIYBTeUv/+6QdvZ154rvOG8p8r6r4j9c47RjQ/y7Mgwd1hVrTrhAFew7+mY+fN
         BBIq7KDLKpy7AW1fADYFjHjDjSV/rENiahxD1Ul/JP2zXuf9IlXLey8TuLLBrcqMIAmL
         QEsAG4xLwDEslhRhnBU++NTWoQvaZZNW1VReOfqfRLNxRANaU3klLLCgTXqNMUOrPFsR
         3CKxujkmsUTkr+bOCv784G96sUBJgJ2Gk+wWMwZpTC4u/e22+zDt3hIprlzREmleRerz
         6dKl1tbveSeh6ypmXz+PbxEh1SdfXR8T3gEA5JgIote+excISmrVSBlqUBrRpgjNoyLb
         TPkA==
X-Gm-Message-State: ANoB5plcU/fwsUGRA+sD3+V9hdV+kMLpOgmKU3vaOfpLuOG4JiUpYI5q
        k+WUHNpg2qLkERjLFjqkFNRNfko5PSQbDSZCRj1q1A==
X-Google-Smtp-Source: AA0mqf7LhELw9qhnn45Nh/QRYEM+7ahM4/Du47B00ChGex1u/a2xi44OTKbKO40cCHwuhiV5DtcKNxzC9K3wmTpWSkA=
X-Received: by 2002:a25:1843:0:b0:6dc:b9ec:7c87 with SMTP id
 64-20020a251843000000b006dcb9ec7c87mr629507yby.322.1669038405944; Mon, 21 Nov
 2022 05:46:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668768040.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1668768040.git.viresh.kumar@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Nov 2022 14:46:34 +0100
Message-ID: <CACRpkdaB1u9jwa+qXRZXG_1LSgO1-xVxfK_G1YwHe1LpSF5fzA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V10 0/6] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> Here is another version of the rust bindings, based of the master branch.

This stuff is great for the GPIO and Rust communities. Also, looks finished.
Here is a cheerful:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
