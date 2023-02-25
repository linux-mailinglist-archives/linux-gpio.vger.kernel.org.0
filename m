Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794EC6A2B50
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 19:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjBYSg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Feb 2023 13:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjBYSg4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Feb 2023 13:36:56 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF1E13D77
        for <linux-gpio@vger.kernel.org>; Sat, 25 Feb 2023 10:36:54 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id v27so4672877vsa.7
        for <linux-gpio@vger.kernel.org>; Sat, 25 Feb 2023 10:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dYtwWQw02h1WVrKKpKa2AnZqSohaeeUZOUcV8u5rG4=;
        b=Em1HWtLeKZzBiYj3bDdITpGSazB2N32asOzcMRKb56SwjG4e+ADMUYFdRIk1jKYYmI
         UOLN6ZrmtankKgJAnl4j/EZOL2N8zFkipEKouBErXg41k+D75/RRv77BIv0cZvD4xdg6
         52ceF8cwc985zy6EkUPkIg5hPe7a2HILdW55srQc1vs5/CNO7Vp2GAeQl8lM1mKgBdJO
         45kSM19psQxzuVKPVY5C17SboiJ9ACBjvQdCSC9YFOzYOEWOTty9u7jxnr1f1fxoAx1C
         xrJm3jq3UeQ0s2CvigrY/Z0z6RSEsDyJmGWh8O32C36YvnA8y/h52JCRnJ7/2OEEs1FE
         TZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dYtwWQw02h1WVrKKpKa2AnZqSohaeeUZOUcV8u5rG4=;
        b=jnYLc1jwG4t1EP4fXIvrMogNGQ1o1CEWx2i6HttcHwMO44WsqjRi23tb/T5b+5URuQ
         SgwhXuBhYZhqPYvIJg+WFou0uCpgkPsouZP/t4qwCkH7NHnhr8VuL0wNIjdJpHYFqn7f
         SjDcxyHiONqVFNDjZGc41RqQ9PiWboPILcMx8lwemX1nRqpYRrvHBfLAB8uykjQgnHZn
         l5kTmkCmpmMrNSs/Wl0WRm3yTmPV2VlF3kHrYHte3b4jpew+0xjSa7V0ZmgicwluRdKl
         1rTSQyZd/GcGcVeDEIFcr8gyp54FNgsse5tSIf9THmzw6PAX4cP3Vr9TubHBg1qGaB4Y
         TpDw==
X-Gm-Message-State: AO0yUKX7Xp7D411H7NCRLi5HNUMfIVjv1NwIwtTTn9OpY1tKQeRBZxmb
        fE88J3VH7e6oCbatPcfd6+HDiIqTUPNcCCbrTlTQGOnnVGNOgg==
X-Google-Smtp-Source: AK7set+d9T0Rq3esb0xP4SpdM5WrUCGdFjIisnf/SNqE+XmAMB2dO+8/zt7J4gGamCfeRRFoEfFFsmoES/MDP3uGMCg=
X-Received: by 2002:ac5:cbd1:0:b0:401:8c72:4cf4 with SMTP id
 h17-20020ac5cbd1000000b004018c724cf4mr4757144vkn.1.1677350213582; Sat, 25 Feb
 2023 10:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20230225031235.3886280-1-benl@squareup.com> <20230225031235.3886280-2-benl@squareup.com>
In-Reply-To: <20230225031235.3886280-2-benl@squareup.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 25 Feb 2023 19:36:42 +0100
Message-ID: <CAMRc=MfTpSV7hmUmbY94JHmwx=aZNiBytCMacGpC6Gwf6qJ0_w@mail.gmail.com>
Subject: Re: [libgpiod,v2 1/2] tools: use getprogname() when available to
 remove dependency on glibc
To:     Benjamin Li <benl@squareup.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 25, 2023 at 4:12=E2=80=AFAM Benjamin Li <benl@squareup.com> wro=
te:
>
> Platforms like Bionic libc don't have program_invocation_[short_]name,
> which is a GNU extension. Use getprogname() from stdlib.h, another
> widely agreed extension, when it's available.
>
> It seemed a little heavyweight to add gnulib to this project's autotools
> set-up just for making one function portable, so I've just added the
> portabilty shim to tools-common.c for the moment.
>
> Signed-off-by: Benjamin Li <benl@squareup.com>
> ---

This is only relevant for gpio-tools so maybe instead of relying on
either a GNU or BSD extension, let's just ditch both (and the checking
infrastructure) and introduce our own local helpers:

void set_prog_name(const char *name);
const char *get_prog_name(void);
const char *get_prog_shortname(void);

And call set_prog_name(argv[0]) at the start of each program?
Alternatively we can just use prctl() like libgpiosim does for tests
but then we'd lose the potential info about the executable path.

I'm thinking this is better than relying on extensions as I've already
had to stop using twalk_r() due to it being a GNU extension not
provided by musl (not by bionic as I can see).

Bart
