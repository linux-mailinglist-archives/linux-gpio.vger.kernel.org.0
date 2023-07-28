Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA314766FFA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jul 2023 17:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbjG1PAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jul 2023 11:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbjG1PAU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2023 11:00:20 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE611FFF
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 08:00:19 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4436f2d8bcdso2226230137.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690556419; x=1691161219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuPdbJvh//P9+Pb76MeyBw5t4AfBYdtsB0suBCsBAhg=;
        b=WiuiUsRXFsW4j9RnFRtFLRFDHsCGvOot7FqdHYA2NK5XJRMzKrh4SZUfU7CGVfSWkf
         70LC//ZSDN6LlMfgI8U+TBGHaaZ6GVVZrWogT8lPPW1KgF8Vkj3vjB3b7CMG95IWCVzR
         wXqPDRvIE61bia5ChGHQxV49f9nDapYLL2r6g+boI7hZP3L/DZ/NY7VzF4Y3xgUMSsX1
         LzSpAq8qAUDL0kH8L2bRrfUEl35TIOKCi4hk7RDMVFMlGxMdFNZ/Iyf6lgYWi4CJR99M
         S9wm/p0yjhlZbUX9TX5KolIkqZePlC2IOCeebqj7YIIOCjyDc6+5BQEk3/JepYZ4WJLX
         2egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690556419; x=1691161219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuPdbJvh//P9+Pb76MeyBw5t4AfBYdtsB0suBCsBAhg=;
        b=SNNVuJKY0h+5L802c5GYnHJDvvsxc079jiLi1CW8AA1p/8iIh0G6ToeueNP5dCbT9w
         VMdNRSM8Hl4AXiBNdbTczVn1a1l8zHuxvvDwbMXbppo17SxAE5N9q9i+xz6He1uNgYrz
         +Q6HQUywPJSeoCOaAr/wvTgFmeLUO6pP0WvSCLyrSHnjGhfal14tlMLPmdKk+hVMCzIv
         ubBGUaWCsHbfubqmWj4ETPKV9RNz68+8bCrF+yaV1ZFfJY/8aTw0kwBUmOPjJ/oWWErC
         ERCoSHyLUgT/OcVhgms+jwJ2HugOu8ovGQekkQ0ozFbqbA7VMH+wpiWF1q0qFFGl80BX
         1tHg==
X-Gm-Message-State: ABy/qLYG8Er2ACBh0uAicl4HbTEXkraebWJg7APZZRyrkBd4meC1VVvc
        GJLGfdibHU42LyAgWM3CfTHrgA9Hdvs9sKXN3Ixaor2f+Gcxlj03UgU=
X-Google-Smtp-Source: APBJJlEfef15cDhtB6DUoG6s/Gp/0viXiX6W0x4zG0eN6AiY2ahQA4/nfkD+OFT4bwcf8qd77bCm3SuJIVERYcQUIVc=
X-Received: by 2002:a67:f559:0:b0:445:bfe:5012 with SMTP id
 z25-20020a67f559000000b004450bfe5012mr1191941vsn.6.1690556418713; Fri, 28 Jul
 2023 08:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230727211056.19187-1-warthog618@gmail.com>
In-Reply-To: <20230727211056.19187-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 28 Jul 2023 17:00:07 +0200
Message-ID: <CAMRc=MdOr0jptSjOP0OcO0mA7hurSMWBi7XtfCiptX_NLOujZA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] examples: simplify find_line_by_name
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 27, 2023 at 11:11=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> Simplify the find_line_by_name example by using
> gpiod_chip_get_line_offset_from_name() rather than iterating over each
> line in a chip.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  examples/find_line_by_name.c | 31 +++++++++++--------------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
>
> diff --git a/examples/find_line_by_name.c b/examples/find_line_by_name.c
> index 16d2c4c..87b66ac 100644
> --- a/examples/find_line_by_name.c
> +++ b/examples/find_line_by_name.c
> @@ -69,12 +69,9 @@ int main(void)
>         static const char *const line_name =3D "GPIO19";
>
>         struct gpiod_chip_info *cinfo;
> -       struct gpiod_line_info *linfo;
> -       unsigned int j, num_lines;
>         struct gpiod_chip *chip;
>         char **chip_paths;
> -       const char *name;
> -       int i, num_chips;
> +       int i, num_chips, offset;
>
>         /*
>          * Names are not guaranteed unique, so this finds the first line =
with
> @@ -85,26 +82,20 @@ int main(void)
>                 chip =3D gpiod_chip_open(chip_paths[i]);
>                 if (!chip)
>                         continue;
> +
> +               offset =3D gpiod_chip_get_line_offset_from_name(chip, lin=
e_name);
> +               if (offset =3D=3D -1)
> +                       goto close_chip;
> +
>                 cinfo =3D gpiod_chip_get_info(chip);
>                 if (!cinfo)
> -                       continue;
> +                       goto close_chip;
>
> -               num_lines =3D gpiod_chip_info_get_num_lines(cinfo);
> -               for (j =3D 0; j < num_lines; j++) {
> -                       linfo =3D gpiod_chip_get_line_info(chip, j);
> -                       if (!linfo)
> -                               continue;
> -                       name =3D gpiod_line_info_get_name(linfo);
> -                       if (name && (strcmp(line_name, name) =3D=3D 0)) {
> -                               printf("%s: %s %d\n", line_name,
> -                                      gpiod_chip_info_get_name(cinfo), j=
);
> -                               return EXIT_SUCCESS;
> -                       }
> -
> -                       gpiod_line_info_free(linfo);
> -               }
> +               printf("%s: %s %d\n", line_name,
> +                                      gpiod_chip_info_get_name(cinfo), o=
ffset);
> +               return EXIT_SUCCESS;
>
> -               gpiod_chip_info_free(cinfo);
> +close_chip:
>                 gpiod_chip_close(chip);
>         }
>
> --
> 2.41.0
>

Applied, thanks!

Bart
