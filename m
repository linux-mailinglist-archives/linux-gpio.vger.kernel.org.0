Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B563724764
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 17:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbjFFPQl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 11:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjFFPQk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 11:16:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BA0EA
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 08:16:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f4db9987f8so8888119e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686064597; x=1688656597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS9DodaEaaKdqC+AJ4L3xvIyooenaVWm37hrv78OClE=;
        b=nuTK2bxlDZsOPwqYOFuNL7Z1Y7qIAz78qUCGo4Dlt1pZ+6o700LcpP9HNESCF760yO
         zhjOQt8DihWHM9suT+grkcEBagdGUuyvfg0+868+UGA3HSscauWTFnqaU2/qG3ah0knQ
         rjJOjRO+HT+0DINnRoQvSKSPuMeiBe3q0M7kvC9vFb4pfCVsMPmtL8ryP7VkYpJ07d4g
         1LW7d3lVdKnetn+PT0reqlIWQOwbwg28jUsbveBI+2oo3c6JtOIMoBPwUTzYjA1b0RxN
         0DyfF6pJoj8YaQ5tPbgIVPMM5ISaNOIltjs5RmMIGaPF5Hgw8ZKNMNNy45UI8dfXYmz8
         CKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686064597; x=1688656597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tS9DodaEaaKdqC+AJ4L3xvIyooenaVWm37hrv78OClE=;
        b=mJA4Qqwftb9peQiSUhFHaHp/pM61bGQDB9yuyJhyeu4sUTo0u6gO1lt+M8QInKYBXS
         rbhXfQTJBDOEV8hnT+WBZjQwnUW+pOnoZe5JMGhiSyBQmH+7W3AIWiYwO0E6mBpsE7G7
         vVQ21pA7xSiVX3c7zDeZSRkU3TAx2c989oZ+YE/BYn7yPIngSdwSafOIMe2E5wTktckU
         +EErqSM9c1udVujp+Jmtbn6mPpc7QLskNzlD2l9NLelf4qnyL1QeZnPtYFvOWqn64h7Y
         E/tVBrSLXQLlYkvSN4yWS7fpeXyiHIpXs3S96NEWtaZTgj0V2WuU6JTO6Qk0+9FYbKul
         YRqQ==
X-Gm-Message-State: AC+VfDwpI2IC0FcSMpf5YPsRxFhLDtTbGDYHXR3VrDhrws3m9N6CnY6I
        8swOki2EtMd05JGpESB9RVQhYCpekEMzQ51iLhwOwSMf3MeVdqn4
X-Google-Smtp-Source: ACHHUZ72HKfDNFyQgUblbZ6+9mWTgldlaVbmoZti6PP6LzFbfk0DqN0kEaGXOg9wMz7XWr/ns3xSzxC4q3BuYGYIjzU=
X-Received: by 2002:a05:6512:2824:b0:4f6:1b91:f4b4 with SMTP id
 cf36-20020a056512282400b004f61b91f4b4mr2812106lfb.7.1686064597698; Tue, 06
 Jun 2023 08:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230605204335.4060789-1-joe.slater@windriver.com>
In-Reply-To: <20230605204335.4060789-1-joe.slater@windriver.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 6 Jun 2023 17:16:25 +0200
Message-ID: <CAMRc=McsF9B+csnbTpmW30hfogkT6U=X6wi3TTJEwmVBF-OBfQ@mail.gmail.com>
Subject: Re: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
To:     joe.slater@windriver.com
Cc:     linux-gpio@vger.kernel.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 5, 2023 at 10:43=E2=80=AFPM <joe.slater@windriver.com> wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
> The test "gpioset: toggle (continuous)" uses fixed delays to test
> toggling values.  This is not reliable, so we switch to looking
> for transitions from one value to another.
>
> We wait for a transition up to 1.5 seconds.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> index c83ca7d..05d7138 100755
> --- a/tools/gpio-tools-test.bats
> +++ b/tools/gpio-tools-test.bats
> @@ -141,6 +141,20 @@ gpiosim_check_value() {
>         [ "$VAL" =3D "$EXPECTED" ]
>  }
>
> +gpiosim_wait_value() {
> +       local OFFSET=3D$2
> +       local EXPECTED=3D$3
> +       local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> +       local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> +       local PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/va=
lue
> +
> +       for i in {1..15}; do
> +               [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> +               sleep 0.1
> +       done
> +       return 1
> +}
> +
>  gpiosim_cleanup() {
>         for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
>         do
> @@ -1567,15 +1581,15 @@ request_release_line() {
>         gpiosim_check_value sim0 4 0
>         gpiosim_check_value sim0 7 0
>
> -       sleep 1
> -
> -       gpiosim_check_value sim0 1 0
> +       # sleeping fixed amounts can be unreliable, so we
> +       # sync to the toggles
> +       #
> +       gpiosim_wait_value sim0 1 0
>         gpiosim_check_value sim0 4 1
>         gpiosim_check_value sim0 7 1
>
> -       sleep 1
>
> -       gpiosim_check_value sim0 1 1
> +       gpiosim_wait_value sim0 1 1
>         gpiosim_check_value sim0 4 0
>         gpiosim_check_value sim0 7 0
>  }
> --
> 2.25.1
>

I applied this version as it no longer breaks my qemu tests. Please
feel free to send it for meta-openembedded now with Upstream-status
set to accepted and make sure to Cc me.

Bart
