Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8C1A6793C2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 10:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjAXJPs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 04:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjAXJPr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 04:15:47 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFA217CE3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 01:15:46 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id c15so3375117uas.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tb/IacxuSx5q1edSBhtyJICTudoAu3rs/yZNGoLgFe0=;
        b=Od6uR+BuuGKXTe5UqoA8YUcjEcSDzUejXwVtf9OnnqRPzPpanTqmi59wph22e7K86S
         NPfxAdc7XFPOZlrjnISm+QmDT/QkkXS5yNy5rve94bUwNwWX0fPv36yL/oc75oNmIUaI
         7CNw4DLQJjShCDplNiQtb7M6YMzIrEI4eEQ0xp0rLYfrz5klXClvUQ2h/7WtjhJPaCLB
         ExCAZo3allIIgH68RPU9Y5GLP9Tu5TpwMc4+fQnzDcWg0Albp2yA+qvwbc02DvtM3fwX
         mYT7KabpP3TFNWGs4H+x8zraQSpJjUa5lbho1hAyc/NHMXLShSRyzvcsw5G5hConSfzL
         kmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb/IacxuSx5q1edSBhtyJICTudoAu3rs/yZNGoLgFe0=;
        b=ES/nYMWw2G2TRqe4250dk0mon/JuwGZwKzWbIfpw3TlfhGywKjCbueJuWNxUt9DXhV
         S55fqsJ3n2sGWyHWU8uGnUq6Fx9yWBrlwyDxU9cUOb1QKnWJdRMN+X1HvqvChT9FTif+
         iFc4OHbs5oGjtrY+qqMwTBW8d+o7RASSd9rSbLenWVdTcMK/ZlwIgwtDKsRcHzieSbJk
         nol/qyb45VVMXMsrK3wNUFNXvhyUjknArEoACQsbEIeuYzkMtP2Y22oDqEpcoGHnNJme
         bwbBXw65VmnxAnmIkbON/vPiaItfZ0RNaQxIm6pdHC/cTEwSoASpueCWX9J942pdv9Iq
         g8Vg==
X-Gm-Message-State: AFqh2kqdmb93PC7kRxXesRHw1Vw2SDhAGBVG6PbhMP5EialoIAuUf+Vi
        X57LZsO2bqBawm8iEFNlXPyg6MCdkQsJgr9gndXWQA==
X-Google-Smtp-Source: AMrXdXsFlD+z2ilMD1q0kWAnPFliHHAEE3+/XCs5B/peCQZ6s5Mhwn6+msOayMJofxB6biJEjHiVaIqf+fjmxpjHUV8=
X-Received: by 2002:ab0:6c54:0:b0:424:e8b8:7bcb with SMTP id
 q20-20020ab06c54000000b00424e8b87bcbmr3283559uas.123.1674551745871; Tue, 24
 Jan 2023 01:15:45 -0800 (PST)
MIME-Version: 1.0
References: <9ecb05d3e4518c8ace2747274da5521a0abdcde3.1674548551.git.viresh.kumar@linaro.org>
In-Reply-To: <9ecb05d3e4518c8ace2747274da5521a0abdcde3.1674548551.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 24 Jan 2023 10:15:35 +0100
Message-ID: <CAMRc=Mcm+nwDmsSUfERZLWzDk5zWSTU1SytFF1+dcbB856_6sw@mail.gmail.com>
Subject: Re: [PATCH] rust: Align formatting to what's suggested by 'cargo fmt'
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 24, 2023 at 9:23 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Align code to follow what 'cargo fmt' suggests.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Applied, thanks!

Bart
