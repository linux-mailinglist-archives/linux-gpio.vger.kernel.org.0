Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED80472CB03
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 18:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjFLQIU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 12:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjFLQIT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 12:08:19 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396B510D4
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:08:12 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-653f9c7b3e4so3404789b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686586091; x=1689178091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LG/2NTkpgCDTrjNzeShfDznVYkt5JKHhTS1dd9ulsnM=;
        b=RGOQfphxIJ306rHdVayyr/E9nCVqzFSe8eVQ7h3+RtgHti0dc6LlKOx7qBeUBQB3f2
         wNhDhkyHEAgavqq8ihwZB5ilMAwxZVvBaWStuYtbjBGuVPtH3kZinRXizDAxUyfvr1XK
         dVtfxaDuqgZDJqHLdHLDEoNjcX2UYMlYMzImoI632PxaEsytOIR40CG+tZ046touCAXc
         Vz3e4wdUzYOb4VEN50IlOfneu1mhd6Z7OV+Wl9SxJjwTXZAitLTXYibzeGhyopqO0Zvq
         F8eqF4V/tXr3/aVDhQDHm5siqpvqC6VyvLp142HFFLzBXrGOoGZQwosIKpD6dPgeOuZ8
         0/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686586091; x=1689178091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LG/2NTkpgCDTrjNzeShfDznVYkt5JKHhTS1dd9ulsnM=;
        b=ELNCUv376cz8g+vqFVceBlyZeo+K5QSdN0SpFtUaTAIOJ8ALXdGn/6860Skcx+SMXo
         lOZWtgRDzwmgyuMcA5vdq8jA5G4AboHECh3nRgfyxryOJ5nSaHB/ktS6nKpgjDwyZCS2
         trRWM8dxeOb21rdCM9g6AQNElSD/MMJ+xsBjcJtyXsJLIxyDnlKOgoqbT3zCUiTZUsQK
         DZXjustDcDVTHVVhgrupq/oUfJvQHP6MKROPYIMd8B76jePfEXKaAj0rsZogzglX1Rpg
         T4wBq2oFXE1Frjese7iEuWy052Py2yNSGg+/wiVgihw+zY5++NVuEOLQj/WpdXop7+ZJ
         QMLw==
X-Gm-Message-State: AC+VfDx9K4enyLKBhPqYHsTOBFoCXO4ECE1fDKNHUYDlKF2ssETR2xUO
        LdzTRmh2NYFAX2sa+DZfZXg=
X-Google-Smtp-Source: ACHHUZ54K5hkLH1B46hLvcERLvm07QONpFkeks855wGZu6xd5aMV4u/Fzvt4sMNCLQDZsyJpuPVMHQ==
X-Received: by 2002:a05:6a00:1346:b0:647:370c:2c2a with SMTP id k6-20020a056a00134600b00647370c2c2amr11969582pfu.6.1686586091522;
        Mon, 12 Jun 2023 09:08:11 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0064d681c753csm7056724pfn.40.2023.06.12.09.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 09:08:10 -0700 (PDT)
Date:   Tue, 13 Jun 2023 00:08:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Gabriel Matni <gabriel.matni@gmail.com>,
        linux-gpio@vger.kernel.org, gabriel.matni@exfo.com
Subject: Re: [libgpiod][PATCH V4 1/1] tools: gpiomon/gpionotify: add
 idle-timeout option
Message-ID: <ZIdC5sCnXwVa5LZ6@sol>
References: <20230612013049.10708-1-gabriel.matni@gmail.com>
 <CAMRc=MeBQFeafXxR9fGjUCSh0UhZKvcO0pZxsRYCNHX=s87E6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeBQFeafXxR9fGjUCSh0UhZKvcO0pZxsRYCNHX=s87E6A@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 06:05:11PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jun 12, 2023 at 3:31 AM Gabriel Matni <gabriel.matni@gmail.com> wrote:
> >
> > From: Gabriel Matni <gabriel.matni@exfo.com>
> >
> > Add an idle timeout option to gpiomon and gpionotify to exit gracefully
> > when no event has been detected for a given period.
> >
> > Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
> > ---
> > V3 -> V4: Submitting patch with git send-email
> >
> > V2 -> V3: Addressed the following review comments:
> > - Simplify the commit message
> > - Clarify the help description of the --idle-timeout option
> > - Declare ret variable at the top of function for gpionotify, not required for gpiomon
> >
> > V1 -> V2: Addressed the following review comments:
> > - Renamed timeout option to idle-timeout
> > - Timeout value is now signed
> > - Reused print_period_help() for idle-timeout option
> > - Added the idle-timeout option to gpionotify for consistency
> >
> >  tools/gpiomon.c    | 14 +++++++++++++-
> >  tools/gpionotify.c | 17 +++++++++++++++--
> >  2 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> > index c2684c2..e3abb2d 100644
> > --- a/tools/gpiomon.c
> > +++ b/tools/gpiomon.c
> > @@ -30,6 +30,7 @@ struct config {
> >         const char *fmt;
> >         enum gpiod_line_clock event_clock;
> >         int timestamp_fmt;
> > +       int timeout;
> >  };
> >
> >  static void print_help(void)
> > @@ -57,6 +58,8 @@ static void print_help(void)
> >         printf("\t\t\tBy default 'realtime' is formatted as UTC, others as raw u64.\n");
> >         printf("  -h, --help\t\tdisplay this help and exit\n");
> >         printf("  -F, --format <fmt>\tspecify a custom output format\n");
> > +       printf("      --idle-timeout <period>\n");
> > +       printf("\t\t\texit gracefully if no events occur for the period specified\n");
> 
> I think it would be useful to state the time units used by this option here.
> 

That is already covered by the period help:

Periods:
    Periods are taken as milliseconds unless units are specified. e.g. 10us.
    Supported units are 's', 'ms', and 'us'.

Cheers,
Kent.
