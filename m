Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187186BBC45
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 19:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbjCOSht (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 14:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbjCOShs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 14:37:48 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792F896614
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 11:37:17 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id 89so6526291uao.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 11:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678905427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYD0sTo43bzjcOIAl6PFP/c66GLC0lASmxL17zSZKNg=;
        b=XslfhGghkSG+zDIYsRZ64xAAunotj3/GAhwVwpy53HUCBymZJ0GvaY4sgjUpxO5gB9
         OOZUaPif08Z+aLA4xZLSppPHUb46qHJyIkFZ5WSUM0j1QL5nu58ymoMGBMK7grLRg/yn
         /x87rYm5+gk7fL2uAHiOJaqoxWPi//PWk9tKpeOapTJfZavBxjK7YxjGo3z1UPv7RmAE
         42jY0iv395NZMH/uNEAf0WdxecktCYDU7akIcj5wEQ9Q8K2S97FMnu3NiIFqLk+fUdBi
         C+QK5q/ET3towhZ9T2Hki0VOHcLq5wRqni2WMpEHPtXJSUWJ/Fwr3t9Ft5f62k7MdkB1
         ebBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678905427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYD0sTo43bzjcOIAl6PFP/c66GLC0lASmxL17zSZKNg=;
        b=zGgoyn98seTSbPq/NrJJ2Tvv5nZopffDsXvi9J9LDFu3UEE9/yJy2MD4da4IUrjx9m
         HEbHw6XKlITUktYuXUP/5nwNjy+aPUAiSKYZR7RsSToCl1D9FA3OTmtEy4b6O78vOCiB
         AxFKsgIe0wLV9I798l7It5DtSvszCIlk8XDPRCZfShvblUHQJuHCiMtLa8kkpCR8LcrL
         MFM9yYT4NykVgxx6g3hyXiMG10M25VIOXPW3wdvh5IUsNLMdVv2gzFOH6PH+WLs1LRYd
         kQ5QE+3HZdWZ5Au9ur1TyD2jdxF8U9bYUaZnXy3QMNQsvJVy8TyAxvS/cb9quKYOQ3UX
         Qb5A==
X-Gm-Message-State: AO0yUKWW6x36Wf4TDTRg9rYtTLaYxsAgJnD8q0M/5Haeuf9WdhgltcV0
        hNOflcT/E6brHPY6UGOsQSLxhPha0NRN4iDoq+lwzGpkrviechQH
X-Google-Smtp-Source: AK7set8XM+pa3TBFheZp6PC/ergmg6hjjex54gv0BWUBarmkLCeRw5Rgtgq/X1xOfDhgp29nEOkb9Zlqec39WVH/7Bs=
X-Received: by 2002:ab0:16c9:0:b0:755:9b3:fef8 with SMTP id
 g9-20020ab016c9000000b0075509b3fef8mr5092192uaf.2.1678905427268; Wed, 15 Mar
 2023 11:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230315083456.27590-1-brgl@bgdev.pl>
In-Reply-To: <20230315083456.27590-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Mar 2023 19:36:55 +0100
Message-ID: <CAMRc=Mco_Kp_+kRJD=hryN1aV58Z5vavNS8ZL+AtFtHT8nk-BQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: fix setting event clock type
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Wes Tarro <wes.tarro@azuresummit.com>
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

On Wed, Mar 15, 2023 at 9:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Fix an inverted logic bug when parsing event clock type in gpiomon.
>
> Fixes: 8ffb6489286f ("tools: line name focussed rework")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reported-by: Wes Tarro <wes.tarro@azuresummit.com>
> ---
>  tools/gpiomon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index ec177df..c2684c2 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -99,7 +99,7 @@ static int parse_event_clock_or_die(const char *option)
>  {
>         if (strcmp(option, "realtime") =3D=3D 0)
>                 return GPIOD_LINE_CLOCK_REALTIME;
> -       if (strcmp(option, "hte") !=3D 0)
> +       if (strcmp(option, "hte") =3D=3D 0)
>                 return GPIOD_LINE_CLOCK_HTE;
>         if (strcmp(option, "monotonic") !=3D 0)
>                 die("invalid event clock: %s", option);
> --
> 2.37.2
>

Patch applied.

Bart
