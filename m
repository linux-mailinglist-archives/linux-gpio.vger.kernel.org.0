Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15583411724
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 16:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240419AbhITOe6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 10:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237264AbhITOet (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 10:34:49 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96048C061574
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:33:22 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h17so62395723edj.6
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M85n9+HdjcguC5a8vNAivAuHLA/HH1/W1cziXiOVcZo=;
        b=QLV9jeVPh5kEdqXZwQ/LJy4U95ba/abhHHDf+fy/Q9i0oxecaI2pDrMRaUGwqwLsp0
         kLFGMoV8SrPrdo0Nqi5W9GGi2Ey2gXsscl8vP8AZSwdCaKHg8XeJQDAY/EoJw8zH0LDY
         xW7IHnwBekzOwHds5lYAQtcXQT2MQFWbW75IJVLzROIh3I0U2gvyW1dB7HH7qGbZPbqh
         RfIYqLvkqAEFIhak5CmHMA7jk3UHm2MfbvYydv/pZu8EzbPsh8ifYckXmBI8jaKYUqRv
         TxToSR/9daL5IES4tgS+yodp6YQaRrYZvJyhllx0VYL0XsVuzG1E61/K8+cke48VhUu+
         Ojbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M85n9+HdjcguC5a8vNAivAuHLA/HH1/W1cziXiOVcZo=;
        b=5uOr+HB8MkLLW741lofxmNlZGw3zDb/FvUfXsFE6pS6V6/SBnGDwSTfOBO8aAw4LPY
         UdE1RUR6vme0N7yOxJp64McpsVxeKM/ONX/gF8oTEm3ZGjHO/j5cq6rgY9+SDJlXEaGB
         KWWu9E0z/fEQlOTlu8ZUtskTs1Oi1nZDGWeVjwHTWxUFZxhaTQNs2tQEsTDLeZaMy2to
         FqERmEKWc+1tDcVFMUPw6v/hHQNjvvbwsrgqgztuIzlnPooR3Kw8RM/kewDxZ1bEa19a
         yb/dI4/nw5LomQx9wZ0/sYBkQqEO3Rhiq6OGNx5P6yZrimWSD3pe1kVMM5StUNFCmNpS
         Mo9g==
X-Gm-Message-State: AOAM530jGMrSjmwCWyj3PgBUtx1GmT3wmCDdoxrFXexWtI6i8dVMfAFT
        iTpc37aONXy/SwHIsfXmMMpIeRWYKlqoTynkM3BfOxfkJXc=
X-Google-Smtp-Source: ABdhPJwK9T9p89aTgaFMjgYYYmuJFoD2gaY650Q8PdbOs79zV9BIxOwJIm58md3nm5KhRA5HJPhnZxKwAzzAjUFSSpo=
X-Received: by 2002:a17:907:785a:: with SMTP id lb26mr29565718ejc.77.1632148353178;
 Mon, 20 Sep 2021 07:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210728211916.GB14442@cephalopod>
In-Reply-To: <20210728211916.GB14442@cephalopod>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Sep 2021 16:32:22 +0200
Message-ID: <CAMRc=McdCUmqny7d11pdf6ShSEbMRf+V0od-SrKmmE7NrjG2Qg@mail.gmail.com>
Subject: Re: [PATCH libgpiod-v2] tools: Restore support for opening chips by label
To:     Ben Hutchings <ben.hutchings@mind.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 11:19 PM Ben Hutchings <ben.hutchings@mind.be> wrote:
>
> Support for opening chips by label was removed because labels
> are not necessarily unique and lookup by label requires opening
> every GPIO device.
>
> I don't think these concerns apply to the tools.  They will normally
> be run by root, and if a label is specified it's because it's known to
> be unique.
>
> This adds a chip_open_by_label() function to tools-common.c, which:
>
> 1. Scans the /dev/ directory for GPIO devices, and opens each in turn
> 2. Checks whether the label matches, and that the label isn't used by
>    two distinct devices
> 3. If all devices can be opened and exactly one matches the label,
>    return that device
>
> It changes chip_open_lookup() to call chip_open_by_label() as a final
> fallback, rather than the previous behaviour.  This should avoid
> producing spurious error messages if a tool is run by a user that can
> only access a subset of GPIO devices.
>
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  tools/tools-common.c | 63 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/tools/tools-common.c b/tools/tools-common.c
> index 36724d5..d2665e8 100644
> --- a/tools/tools-common.c
> +++ b/tools/tools-common.c
> @@ -4,6 +4,7 @@
>  /* Common code for GPIO tools. */
>
>  #include <ctype.h>
> +#include <dirent.h>
>  #include <errno.h>
>  #include <gpiod.h>
>  #include <libgen.h>
> @@ -146,6 +147,66 @@ static struct gpiod_chip *chip_open_by_number(unsigned int num)
>         return chip;
>  }
>
> +struct gpiod_chip *chip_open_by_label(const char *label)
> +{
> +       struct gpiod_chip *chip = NULL, *next = NULL;
> +       struct dirent **entries;
> +       int num_chips, i, error = 0;
> +
> +       num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
> +       if (num_chips < 0) {
> +               error = errno;
> +               fprintf(stderr, "unable to scan /dev: %s\n", strerror(error));
> +               goto out;
> +       }
> +
> +       for (i = 0; i < num_chips; i++) {
> +               next = chip_open_by_name(entries[i]->d_name);
> +               if (!next) {
> +                       error = errno;
> +                       fprintf(stderr, "unable to open %s: %s\n",
> +                               entries[i]->d_name, strerror(error));

How about using access() to check the permissions first? This way we
wouldn't need to spam the user with error messages - we'd just
silently ignore chips we don't have access to.

Bart

> +                       break;
> +               }
> +
> +               if (chip && !strcmp(gpiod_chip_get_name(chip),
> +                                   gpiod_chip_get_name(next))) {
> +                       /* chip and next are actually the same device */
> +                       gpiod_chip_close(next);
> +               } else if (!strcmp(gpiod_chip_get_label(next), label)) {
> +                       /* label matches; check it's not a duplicate */
> +                       if (chip) {
> +                               fprintf(stderr,
> +                                       "multiple chips have the label \"%s\"\n",
> +                                       label);
> +                               error = EINVAL;
> +                               break;
> +                       }
> +                       chip = next;
> +               } else {
> +                       gpiod_chip_close(next);
> +               }
> +       }
> +
> +       if (error) {
> +               if (chip)
> +                       gpiod_chip_close(chip);
> +               if (next)
> +                       gpiod_chip_close(next);
> +               chip = NULL;
> +       } else if (!chip) {
> +               error = ENOENT;
> +       }
> +
> +       for (i = 0; i < num_chips; i++)
> +               free(entries[i]);
> +       free(entries);
> +
> +out:
> +       errno = error;
> +       return chip;
> +}
> +
>  static bool isuint(const char *str)
>  {
>         for (; *str && isdigit(*str); str++)
> @@ -166,6 +227,8 @@ struct gpiod_chip *chip_open_lookup(const char *device)
>                 else
>                         chip = gpiod_chip_open(device);
>         }
> +       if (!chip)
> +               chip = chip_open_by_label(device);
>
>         return chip;
>  }
> --
> 2.20.1
