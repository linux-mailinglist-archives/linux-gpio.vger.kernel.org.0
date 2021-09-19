Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA8D410D47
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Sep 2021 22:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhISU3Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Sep 2021 16:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbhISU3W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Sep 2021 16:29:22 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9112DC061760;
        Sun, 19 Sep 2021 13:27:56 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g8so52642364edt.7;
        Sun, 19 Sep 2021 13:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M6v530uQl/IBMDjOt1iPGFN8T7UMibEQIKXXYAgZsd4=;
        b=CA8lJujaqBksQ/bi3zC4xkDc2TRjU3eQP6QyBu8aQwR2/atOCXwO92t5aNn73+E6rD
         F7JCmkPTG097rC7LPLnplgT7Kyw3vLZO/ykamG6TrqSnSieG3l1Enj3o8gPbacxXYii3
         mBdg/uQS6ofMBeU4o3fDex2B9KyQ9UZtplqXKf5lclmyJMwLQVV7ejM2QIqSae3OLhzL
         VUqbcv0NrDQqg7YKB7kSsUfnmJmq5s3Jf3o7ErqdkiHSPsUpCj43sVolKOQ7Lk8kJbdJ
         WpGxgLi/H80n2t9xXOGjXFZwD20lco9P9b7hAeihFqqBZuM963Wn0aDShwTc0o+sbND0
         wsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M6v530uQl/IBMDjOt1iPGFN8T7UMibEQIKXXYAgZsd4=;
        b=SIcrAPeuG867PkxApl323ELZzAyvqctAflrJrTcsWL40+bDv7fsubj8blX/B0iI5Tv
         Fm68C9QMakf3mAdOKtmijw5+mNVhD6gII0dWPddBwmOI5RrYuc06er+95cPb9tJJ99MJ
         nP3d1n9wRkwXysO6I7QgbVmBM4oXa5ZrtolFfKyB1XNZy5Ze4h/E95Li3c77hCbWSW4k
         +EkV1aM0BYlnpEqn/JJ20SMEzs1f1Q//LRJ6ZadiIsbjsi00v8Cr5j2f37Pozg+rzf3Q
         /pTdsd3cmsmFpXS5jrKpoWjkPNK82yLhPU2ZNSj9kfGmhhSgeZuWR6hi1X1etKx9OUBn
         dQgA==
X-Gm-Message-State: AOAM530QPrdN79THPWn/Ixq7IifwuydvtlHE4THXtrb2Ahru+nG+5R7T
        vysUpmCPzu58mCgjJaJvdnDzZtNVaao7FPmf3ak=
X-Google-Smtp-Source: ABdhPJwjvY5fmYqNGtV2kNvA1HdKK9Jz4KYV57WFaEDJwS+4jtZiPqWbEdBdHklQHy4pyUC0UFxyspoOicIErUiziTc=
X-Received: by 2002:a17:906:3b56:: with SMTP id h22mr24379630ejf.141.1632083275022;
 Sun, 19 Sep 2021 13:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210918083307.3195-1-wsa+renesas@sang-engineering.com> <20210918083307.3195-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210918083307.3195-2-wsa+renesas@sang-engineering.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 19 Sep 2021 23:27:14 +0300
Message-ID: <CAHp75Vdv=0i05EitMi6JjbjML-jFD_1M0q7ps2KVHcN4UtFU-w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 18, 2021 at 5:22 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.

Thanks for update, my comments below.

...

> +       /* upper limit is arbitrary */

Not really. I believe if the upper limit is > PAGE_SIZE, you would get
-ENOMEM with much higher chances. So, I think the comment should be
amended,

> +       if (count > 2048 || count & 1)
> +               return -EINVAL;

...

> +       ret = device_property_read_string_array(dev, "probe-names", gpio_names,
> +                                               priv->descs->ndescs);
> +       if (ret >= 0 && ret != priv->descs->ndescs)
> +               ret = -ENODATA;
> +       if (ret < 0) {

> +               dev_err(dev, "error naming the GPIOs: %d\n", ret);
> +               return ret;
> +       }

Perhaps

  return dev_err_probe() ?

And I think it might be split into two conditionals with
distinguishable error messages.

...

> +       dev_info(dev, "initialized");

Unneeded noise.

...

> +       [ -n "$cur_cpu" ] && fail "CPU$isol_cpu requested but CPU$cur_cpu already isolated"

For the sake of style (handle errors on the error) I would use

[ -z "..." ] || fail ...

...

> +       # Move tasks away from isolated CPU
> +       for p in $(ps -o pid | tail -n +2); do
> +               mask=$(taskset -p "$p") || continue
> +               [ "${mask##*: }" != "$oldmask" ] && continue

Perhaps

  [ ... = ... ] || continue

to be in alignment with the rest of the similar lines here?

> +               taskset -p "$newmask" "$p" || continue
> +       done 2>/dev/null >/dev/null

...

> +while true; do
> +       case "$1" in
> +       -c|--cpu) initcpu="$2"; shift;;
> +       -d|--duration-us) duration="$2"; shift;;
> +       -h|--help) print_help; exit 0;;
> +       -i|--instance) lainstance="$2"; shift;;
> +       -k|--kernel-debug-dir) debugdir="$2"; shift;;
> +       -n|--num_samples) numsamples="$2"; shift;;
> +       -o|--output-dir) outputdir="$2"; shift;;
> +       -s|--sample_freq) samplefreq="$2"; shift;;
> +       -t|--trigger) triggerdat="$2"; shift;;
> +       --) break;;
> +       *) fail "error parsing commandline: $*";;

command line

> +       esac
> +       shift
> +done

...

> +[ "$samplefreq" -eq 0 ] && fail "Invalid sample frequency"

Same as above, use '... || fail ...' approach.

...

> +if [ -n "$lainstance" ]; then

Shouldn't be rather '-d' ?

> +       lasysfsdir="$sysfsdir/$lainstance"
> +else
> +       lasysfsdir="$(find "$sysfsdir" -mindepth 1 -type d -print -quit)"
> +fi

...

> +[ ! -d "$lacpusetdir" ] && echo "Auto-Isolating CPU1" && init_cpu 1

This ! along with double && is hard to read. Simply

[ -d ... ] || {
  ...
}

no?

...

> +[ -z "$workcpu" ] && fail "No isolated CPU found"

As above, use ' ... || fail ...' approach.

-- 
With Best Regards,
Andy Shevchenko
