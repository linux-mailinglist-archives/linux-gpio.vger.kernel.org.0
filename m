Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74ADC64575A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 11:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbiLGKQt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 05:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiLGKQd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 05:16:33 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FC0419AF
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 02:16:30 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id m4so16785778vsc.6
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 02:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9tmwwKx6MV0vgFrkFBncMusD86WdMjC6AKDczb4IO9c=;
        b=VnW+SNqw4viODQ7B5ZCtWi0TWtz4+jw2AVRdz/q11GTQZhZE0b0GNT5Ys0mvrxv3uK
         1j7HCEDsQruezUUXE9wWwO+s06aErtn0oH03DyuRkahLEsF38JE3XHnogWlE5gKi6/PU
         xY3mOZB+inq5nYZ7/PJwKJSu9IKdrV21tHwY7w0n6OfEk/9gAxkd+rEXABvrv3Sjy8Si
         Hj/d1KKF9rUwzhWeO7yzmQSDHrFtpH7ucY1e8gjD/6yUFaBWOVL3DF8wrxsyb5/XBR5M
         /dpdLAWGTUbFuESYCdKitrgHrhX7M3iZY1ZDxU/pYrCDMdJq2ejoVWEOzDrwQLGL6uq4
         JGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tmwwKx6MV0vgFrkFBncMusD86WdMjC6AKDczb4IO9c=;
        b=rc/WRw/3nnepNky2ERn/P41kO9VXGsVzDEXR8kkhsSx5pZIN7nEmUVEu9D48NbHei3
         xfK3uJvrJ6dVzDnA3E2djX47NL93wwI6KFq4SAKV1AxcNr2ebTV8BU8p3I8bk9/pJXuF
         GXbFXpCfkYduSRG+VeOAF+NoVuG3oe8epdjNHa1jsmhqAUwYpUMgkTvrZQN88/g+WfJL
         5u7OlRfmCZB6CRsLIqF/ePSYjuOYtZNQsm8pBeaTVoqLw16YjtaAuwIlPPpnAAfyf6VN
         dV/8exa68gvRFzJph9A+59KLRBZusPfp4f0+Ep08uHLcJDc7Ld/r9CbI0o8PB3VZtBbN
         hF6w==
X-Gm-Message-State: ANoB5plasH0tmvlgLNsW9kvNJtwqPspu3e08xzUndI2HmvRU03nCc9kN
        qVdW5R2Iq8X1qWbkE8Jf63DM6AmKg4CkfkWEhtZ/WQ==
X-Google-Smtp-Source: AA0mqf6Dv2l4nAMvQ6d5Ka5C8njs2nEuVJoWrU8QnYQhSWYe0G/lcx7vl1EBBgXgTvITTUyNvDzO0mOewXhv8SxdmAk=
X-Received: by 2002:a05:6102:722:b0:3b0:eec8:ce04 with SMTP id
 u2-20020a056102072200b003b0eec8ce04mr15489833vsg.16.1670408189916; Wed, 07
 Dec 2022 02:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20221207093937.62048-1-warthog618@gmail.com>
In-Reply-To: <20221207093937.62048-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Dec 2022 11:16:19 +0100
Message-ID: <CAMRc=Mf1JjryzGY6zYoUY+a_BSrU81TWfJS1EHrof4pEFvv6Jw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: gpioset: remove pointless whitespace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 7, 2022 at 10:39 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Remove pointless whitespace in interact().
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tools/gpioset.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tools/gpioset.c b/tools/gpioset.c
> index c49d229..68b3922 100644
> --- a/tools/gpioset.c
> +++ b/tools/gpioset.c
> @@ -842,8 +842,7 @@ static void interact(struct gpiod_line_request **requests,
>                 }
>
>                 printf("unknown command: '%s'\n", words[0]);
> -               printf("Try the 'help' command\n")
> -                       ;
> +               printf("Try the 'help' command\n");
>
>  cmd_ok:
>                 for (i = 0; isspace(line[i]); i++)
> --
> 2.38.1
>

I've already fixed that automatically with my clang-format sweep of
the tree, thanks!

Bart
