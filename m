Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E883701B4
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 22:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbhD3UDV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 16:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234001AbhD3UDV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 16:03:21 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB39EC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 13:02:32 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id b131so9148427ybg.5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 13:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zk6sjsLBdqSSIwe3XJ97AkNfSW269vOUjc2ujsjhqpg=;
        b=CO0Qkp9tmpq2AtoKFRlahn1quPspzO9iekf3sVQkv/Gb75ctQXcCiGn+MkZ/EDEVrW
         kj9lGcM4+cS6brGgd1/m0GXLrbQ9pxQ4fKNf7Z3miueOPxj1QcGhCVE1Iu1JhTq9b5Kh
         gWrhTwJmDJhpughCzhGL1vqyRtSWidS7JvCyvuZToLuf8kMqceqaRiDCB0VE54huZWPs
         xJFg37z7pC6TKtjFwY1QewIDlHvvdO+NXih25yRDChVeE3DMZOsDc9wuS7If9fjaTF0M
         QjPtpYj2qq6/KAq+8iAhIibq1dLiW1D6NtAflSuH6dkxCoG/0aBUyOPOLRIZQoUGlGKl
         fFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zk6sjsLBdqSSIwe3XJ97AkNfSW269vOUjc2ujsjhqpg=;
        b=C9+lhf29VXPdLDevHxGS1BIWnxmDvMP51rfzkQh1b6akOL4QLclaCUbqOGWahMdwgB
         7mS4Sm6KQgDP9UBq5i7aGX7o1AG79gepWMlEECpVMSY/136DxWMGkfRKUhuFBHM3RMIS
         LzGugaP8p/if83Fc5N/5HDLA+RINEdq0brSxm517bOkLHCGiIcACFfFrlZERsYqd4yLD
         PHUOeMGUcy1VuTrg4EQbrXXAuWGvyaBKSdyS7IbrzTvHIYRIwK3QIaqAxpft28Nw3SEd
         ptJ+dP7XXv/O60wH+GU5z4SFep0BzYJn9SH2UCV02hSMsTGeUCI8q1Da9dhHxYBpQ28p
         rSsA==
X-Gm-Message-State: AOAM5326EWJkuFdJw6rshnqe3F3KDwVyElsekUR4l56+dzZgQmP2swCP
        iBQccMtWGLQE+mtIAJ9msuLy8N+1TzO7vEdQy5dOquCHIgpINw==
X-Google-Smtp-Source: ABdhPJxQ6aJhSFbBPoPPDxy2GoBgMT1aKJtYmnFXChUD0XNqMtVHgbKv94293WgAQzIkSB8P/G6PIh4zqFXuXvn/yx0=
X-Received: by 2002:a25:b0a4:: with SMTP id f36mr7049315ybj.0.1619812952047;
 Fri, 30 Apr 2021 13:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210427154224.30372-1-a.fatoum@pengutronix.de>
In-Reply-To: <20210427154224.30372-1-a.fatoum@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 30 Apr 2021 22:02:21 +0200
Message-ID: <CAMpxmJVtr9adabOjZ6VQg5rNh7sOyKnr3TtwWW1D2_zzM564rw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: gpioget: add new --dir-as-is option for
 GPO read-back
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 27, 2021 at 5:42 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Both legacy sysfs and new character device API support querying line
> state of a GPIO configured as output. But while sysfs /value can
> be read for these output GPIOs, gpioget unconditionally muxes the
> line as input. To ease migration to the new user API, add a new
> --dir-as-is parameter that doesn't force the line to input.
>
> This is especially useful for GPIO controllers that maintain their
> last configured output state.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> -n is chosen for the short option because it's the customary short
> option for dry runs, which sounds similar to what a gpio get without
> line state configuration is doing.
> ---
>  tools/gpioget.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tools/gpioget.c b/tools/gpioget.c
> index ceeec566683a..bfbf5ea748be 100644
> --- a/tools/gpioget.c
> +++ b/tools/gpioget.c
> @@ -13,11 +13,12 @@ static const struct option longopts[] = {
>         { "help",       no_argument,            NULL,   'h' },
>         { "version",    no_argument,            NULL,   'v' },
>         { "active-low", no_argument,            NULL,   'l' },
> +       { "dir-as-is",  no_argument,            NULL,   'n' },
>         { "bias",       required_argument,      NULL,   'B' },
>         { GETOPT_NULL_LONGOPT },
>  };
>
> -static const char *const shortopts = "+hvlB:";
> +static const char *const shortopts = "+hvlnB:";
>
>  static void print_help(void)
>  {
> @@ -30,6 +31,7 @@ static void print_help(void)
>         printf("  -h, --help:\t\tdisplay this message and exit\n");
>         printf("  -v, --version:\tdisplay the version and exit\n");
>         printf("  -l, --active-low:\tset the line active state to low\n");
> +       printf("  -n, --dir-as-is:\tdon't force-reconfigure line direction\n");
>         printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
>         printf("                set the line bias\n");
>         printf("\n");
> @@ -40,6 +42,7 @@ int main(int argc, char **argv)
>  {
>         struct gpiod_line_request_config config;
>         int *values, optc, opti, rv, flags = 0;
> +       int request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
>         unsigned int *offsets, i, num_lines;
>         struct gpiod_line_bulk *lines;
>         struct gpiod_chip *chip;
> @@ -60,6 +63,9 @@ int main(int argc, char **argv)
>                 case 'l':
>                         flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
>                         break;
> +               case 'n':
> +                       request_type = GPIOD_LINE_REQUEST_DIRECTION_AS_IS;
> +                       break;
>                 case 'B':
>                         flags |= bias_flags(optarg);
>                         break;
> @@ -104,7 +110,7 @@ int main(int argc, char **argv)
>         memset(&config, 0, sizeof(config));
>
>         config.consumer = "gpioget";
> -       config.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
> +       config.request_type = request_type;
>         config.flags = flags;
>
>         rv = gpiod_line_request_bulk(lines, &config, NULL);
> --
> 2.29.2
>

Makes sense, applied to master.

It'll take some time until this is released though, libgpiod v2 is in
the making and I no longer add new features to the v1.6.x branch
anymore.

Thanks!
Bartosz
