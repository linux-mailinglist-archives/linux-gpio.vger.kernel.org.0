Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA9F52F6A1
	for <lists+linux-gpio@lfdr.de>; Sat, 21 May 2022 02:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354191AbiEUAQe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 20:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354136AbiEUAQd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 20:16:33 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A9015FE05
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 17:16:31 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2fedd26615cso101862147b3.7
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 17:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HMCB35Do4nxxJ5Deq7wXwHlJ7AFN2mSTmdz2CZTa0iA=;
        b=NvEmPTccbXf/sm9VcR2JuXFNK+QOaXohjlLZE5gY0Tji0R59S3gNFYNqP5NKdemCbI
         AXxHxvIQXgoHZKwOD0aSvd8yi/ia1ORjeMkBSAg0HvrzTeGRoyBge7DJC+mUTdpeVAYZ
         +4nv6Z+Copf8E3yLYT2iITd/X7EVZ04k+gb57KzXUi3o/EHGsYrEUVcVmjn+nkNZ6Da+
         skQUS0RdIFyeIFL+Yle2y5GRLCBHqZZOP5XevwC+0xFbCnxGcBFpA1vV14beBv1Up8Yu
         pZjQ7FuclE5eCiQVB/BJk93rqcFhNqOH4cF5CZfPLUf+mWMG2m0AyceY7mD9a8PdgVwQ
         Hh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HMCB35Do4nxxJ5Deq7wXwHlJ7AFN2mSTmdz2CZTa0iA=;
        b=ddFoj8Nyd9WaNRbZTRaKsph2nLLB+naytwPgXtqgrVq4zspnOT0vESDHMlelSrKcFf
         eVqbKHb3D7kqjPWio9BODcUrU3Y6fKpRrhwltS8y7WOagbFjWqnegxxXWfFheUaJD6h9
         derzXn1cb0sjUvxOROxWGc+sc97JNPALwsi/zdX+O1Lt4WZH02eg5K79fFykum5NojyG
         ZXvs7Z3G5dmOOPy34c6hJZCG1WVB1MFz8YC+S2HdxTcpUt6c8SipM048D/iaZUugUGb+
         XK1bU8kLQiY0OoniUEw26whRYSDl73a5OXbhILRMeeUXJfmML55jgDI7b64nYWgGYcIK
         laPw==
X-Gm-Message-State: AOAM530u38GYoWgk4MR9O7PfqnUERMuuoZZZ8tPbGY9iJRtepjx4Er1t
        boyUD3OdeHG5adpTvkAgG2wCNxeleXm6JeAWaj0wRA==
X-Google-Smtp-Source: ABdhPJzhnzpqOdgZiqzgNB98UYPOQpFUnarclYeZ96Ou9b+bvQZLF3CorJ9d+9aIjLP2AQ21QaUu7p6eQ3dAVJoU0io=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr13210290ywh.126.1653092191044; Fri, 20
 May 2022 17:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220429220933.1350374-1-saravanak@google.com>
 <YogkhvFGVcjNQ21Z@dev-arch.thelio-3990X> <CAGETcx9nvBs1b4M=2hBhrLX_2-rzLtAmV9WfTXu0MC7JnsBvwA@mail.gmail.com>
 <YogsiMCDupNUhMgL@dev-fedora.thelio-3990X>
In-Reply-To: <YogsiMCDupNUhMgL@dev-fedora.thelio-3990X>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 20 May 2022 17:15:55 -0700
Message-ID: <CAGETcx-JyWwoGA3o8eep7E29Cm4DcVT6D1JFJh72jLcqm_mjCQ@mail.gmail.com>
Subject: Re: [PATCH v1] driver core: Extend deferred probe timeout on driver registration
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Will Deacon <will@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        iommu@lists.linux-foundation.org, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 20, 2022 at 5:04 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, May 20, 2022 at 04:49:48PM -0700, Saravana Kannan wrote:
> > On Fri, May 20, 2022 at 4:30 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Hi Saravana,
> > >
> > > On Fri, Apr 29, 2022 at 03:09:32PM -0700, Saravana Kannan wrote:
> > > > The deferred probe timer that's used for this currently starts at
> > > > late_initcall and runs for driver_deferred_probe_timeout seconds. The
> > > > assumption being that all available drivers would be loaded and
> > > > registered before the timer expires. This means, the
> > > > driver_deferred_probe_timeout has to be pretty large for it to cover the
> > > > worst case. But if we set the default value for it to cover the worst
> > > > case, it would significantly slow down the average case. For this
> > > > reason, the default value is set to 0.
> > > >
> > > > Also, with CONFIG_MODULES=y and the current default values of
> > > > driver_deferred_probe_timeout=0 and fw_devlink=on, devices with missing
> > > > drivers will cause their consumer devices to always defer their probes.
> > > > This is because device links created by fw_devlink defer the probe even
> > > > before the consumer driver's probe() is called.
> > > >
> > > > Instead of a fixed timeout, if we extend an unexpired deferred probe
> > > > timer on every successful driver registration, with the expectation more
> > > > modules would be loaded in the near future, then the default value of
> > > > driver_deferred_probe_timeout only needs to be as long as the worst case
> > > > time difference between two consecutive module loads.
> > > >
> > > > So let's implement that and set the default value to 10 seconds when
> > > > CONFIG_MODULES=y.
> > > >
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: Will Deacon <will@kernel.org>
> > > > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > > > Cc: Kevin Hilman <khilman@kernel.org>
> > > > Cc: Thierry Reding <treding@nvidia.com>
> > > > Cc: Mark Brown <broonie@kernel.org>
> > > > Cc: Pavel Machek <pavel@ucw.cz>
> > > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > Cc: linux-gpio@vger.kernel.org
> > > > Cc: linux-pm@vger.kernel.org
> > > > Cc: iommu@lists.linux-foundation.org
> > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > >
> > > I bisected a boot hang with ARCH=s390 defconfig in QEMU down to this
> > > change as commit 2b28a1a84a0e ("driver core: Extend deferred probe
> > > timeout on driver registration") in next-20220520 (bisect log below).
> > >
> > > $ make -skj"$(nproc)" ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- defconfig bzImage
> > >
> > > $ timeout --foreground 15m stdbuf -oL -eL \
> > > qemu-system-s390x \
> > > -initrd ... \
> > > -M s390-ccw-virtio \
> > > -display none \
> > > -kernel arch/s390/boot/bzImage \
> > > -m 512m \
> > > -nodefaults \
> > > -serial mon:stdio
> > > ...
> > > [    2.077303] In-situ OAM (IOAM) with IPv6
> > > [    2.077639] NET: Registered PF_PACKET protocol family
> > > [    2.078063] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
> > > [    2.078795] Key type dns_resolver registered
> > > [    2.079317] cio: Channel measurement facility initialized using format extended (mode autodetected)
> > > [    2.081494] Discipline DIAG cannot be used without z/VM
> > > [  260.626363] random: crng init done
> > > qemu-system-s390x: terminating on signal 15 from pid 3815762 (timeout)
> > >
> > > We have a simple rootfs available if necessary:
> > >
> > > https://github.com/ClangBuiltLinux/boot-utils/raw/bc0d17785eb67f1edd0ee0a134970a807895f741/images/s390/rootfs.cpio.zst
> > >
> > > If there is any other information I can provide, please let me know!
> >
> > Hmm... strange. Can you please try the following command line options
> > and tell me which of these has the issue and which don't?
>
> Sure thing!
>
> > 1) deferred_probe_timeout=0
>
> No issue.
>
> > 2) deferred_probe_timeout=1
> > 3) deferred_probe_timeout=300
>
> Both of these appear to hang in the same way, I let each sit for five
> minutes.

Strange that a sufficiently large timeout isn't helping. Is it trying
to boot off a network mount? I'll continue looking into this next
week.

-Saravana

>
> Cheers,
> Nathan
