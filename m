Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 155BD6442FE
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 13:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbiLFMPa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 07:15:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiLFMPa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 07:15:30 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED02817897
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 04:15:27 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3b48b139b46so149392777b3.12
        for <linux-gpio@vger.kernel.org>; Tue, 06 Dec 2022 04:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NdWinvdpTsmIBIEdK7eGlTSj67bXYkFlPQ1KC3NWs6o=;
        b=DhKvLGPkxFA1kXlwERkRmy02U9xnyq3EyZXj9u8W9AIQ0sJRK5K67jxpUs4pCPSA5g
         7wLw/qOnVFa/mGM50KuUsLr75DibswJMmA8btBPPAtQmI/UZQ2hxCEGCq5x85SJmBooH
         bPJwIuJ8PDskI47Haf43hG5DbSVaXtFese0QpsIHQxS7ABFRCYEUZ6/3tQ/zx2h/dS9p
         x6Nwaj2uIabVHidZWY9FflOcVzkEjCwluAS8hY9e4kT7orDFGlokHdLKuSBGeE27/b5t
         FOFlTK8YLkooPzJDrLkf4CMwIQ/4jb0OSywX0aWWM3FjmlULpLfvWa+268VsrJzwUoMl
         M2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdWinvdpTsmIBIEdK7eGlTSj67bXYkFlPQ1KC3NWs6o=;
        b=xl7YJrs3RlGzDdOa9evKMeFe6size49tvhx/1Ha18sbl2WfhsucItA2pFKeJaMwWrL
         FZaeBNLIoZRWxtYF1AgJHEHqjwQ62NxJTpfpoCCAjFsVu+m7WPwtvry3IP4wAakcmPOx
         VPw2Suk+vuU5Vo+rZO3yNGsuDxCEDhwzyI6YlRzRxrxvZD1mfto7bBhJrddDGhlmD2r2
         kR/niQxXVJgkNCb21PcGBdK05L76kEXlv7T2aagKhtJexH4Eo4hpPqF4pNnBHgqz0j7o
         DBNEdtvaNy5ncAukc2ZITC4xcG+YVtu6L+svqyCZXH7ox2ka7fDRTU5id/HllDOmHXOb
         t44g==
X-Gm-Message-State: ANoB5pko1x/9oTkPHqjA44SfnbUc3qaZnmlw4VUEHn8lq0Ba/YkyK8Jo
        fdfn8tqq5Y5ofp8GzIO7bjdkauqMR49wMvSCW/s/fxR9OkQ=
X-Google-Smtp-Source: AA0mqf50pQVnEP54L7C8KnTHa+Nl7518Dtp5QII+byO54k6gVBgZBzUbcAR76VrcQ3hd+VccXVCM0WXik8hOFvbzksk=
X-Received: by 2002:a05:690c:b03:b0:3f4:6e40:89c3 with SMTP id
 cj3-20020a05690c0b0300b003f46e4089c3mr3198407ywb.266.1670328927177; Tue, 06
 Dec 2022 04:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20221205132207.94775-1-andrew@aj.id.au> <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
 <20221206000648.tyc57i4b6jwyb4y2@vireshk-i7> <72c1c5ef-8cc4-4ff7-9048-c9095e930e83@app.fastmail.com>
 <20221206034034.wranm36qjdd5ueqp@vireshk-i7> <Y469EqS544Klls+5@sol>
In-Reply-To: <Y469EqS544Klls+5@sol>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 6 Dec 2022 13:15:16 +0100
Message-ID: <CANiq72nQXVnxJ8jDeNGZPXjV89M9g6itdP5QT5dsPFnp1JPd6g@mail.gmail.com>
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to meson
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 6, 2022 at 4:55 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> I've got nothing to add - calling cargo makes sense to me.

We do that too in Kbuild in some cases (though not for building). I
think it is fine to delegate where it makes sense.

One concern may be handling `-j` properly between different build
systems. Not sure what Meson provides there. Cargo supports the GNU
Make jobserver as a client.

Cheers,
Miguel
