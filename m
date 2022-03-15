Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CEC4D9B17
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 13:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347311AbiCOMZV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 08:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348227AbiCOMZU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 08:25:20 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C95639F
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:24:08 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id f8so19389507pfj.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=auKpZpNCxF0BChftpn8vwIHdurX7g2q4P4NDFv6SI7c=;
        b=T9NnNQ2klz9gj8qMN1jZZ2z9lgjQJKe4Eokini8XCi0TxK01VB8bCbI2LMp84QBRFM
         rCsxaYPM9rZ8ReqdHXH0yS2NEkwhJOKr/XctA2gtCOgxgA++URxqwo/PjSsGwXWg4Sk5
         u8p3RTaeI4CeqNtH20G9DtQeXYNlqpD/g9wsqlAFK/fLSXr3Ja5+9/sNMeTrUvzyzq4I
         vLGxd+Tx+XOWVWY+11FnT0/lmUc0HO9tVP3LhRgGpYUttZYHJ+7O95ZtP5Pnp/yYWKo6
         rTfh7PdWL7bzTDPVknu2iFfbI/rvPiXLGsGkD20kvULfRBZx7r4aswdHtx2UrL3MCAnp
         JmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=auKpZpNCxF0BChftpn8vwIHdurX7g2q4P4NDFv6SI7c=;
        b=CKDHA7N9qIC7Q2Ns77TNSl1s4oQ/3PlM9WsynYZwWc2bdRfRazppzakgtL+kQfzI/9
         ApnzIySxi4Pvu+8xpDwGcfA7cWzKmyXX8VLE1oc6kkcijvdQz1tO4noHbCRNPXqaDBM7
         NMFLkOLnEdSEONb3XRreXjQFPk3NJ1wyJeKobECRoAaY3X1UDDP6e1Bzg/fL99/JFyJ4
         vot8y3lpcA5kCjKb7Gb+pNmbnW7JXW86M2wvkIN4Rd+gyFiZqBZgKpA+daggoh9eOIHG
         xiiju/b3E53cgxjryrZPRnHcn3n2SAdUXYqdZ6qHWb9sIEBpNUC90IrzOFsx0UQFm1RG
         euBw==
X-Gm-Message-State: AOAM533rvkfw6c2mmWnTTXlqHSDV/ZH5pwI57d560LGWYMJTDklmRf7f
        2sBhVo8R8DjiifZir8GMgSQ6GHBMyMnOLQ==
X-Google-Smtp-Source: ABdhPJwAuVZRtNqHWUhr2OnwM99jdR81HHCXy9UqFmxxSCEY7Ebo+5+nQaAHRDJnsza4069cIynzRQ==
X-Received: by 2002:a62:7b55:0:b0:4f6:adc7:c306 with SMTP id w82-20020a627b55000000b004f6adc7c306mr28450153pfc.29.1647347048217;
        Tue, 15 Mar 2022 05:24:08 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id w21-20020a056a0014d500b004f7261ad03esm24963917pfu.35.2022.03.15.05.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:24:07 -0700 (PDT)
Date:   Tue, 15 Mar 2022 20:24:03 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 3/3] line-info: rename infobuf to uinfo
Message-ID: <20220315122403.GA174661@sol>
References: <20220315053220.102934-1-warthog618@gmail.com>
 <20220315053220.102934-4-warthog618@gmail.com>
 <CAMRc=McOh6FwkzttD9b+bFf5X7EF_wT0oyeCcnRwcUprw8w6nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McOh6FwkzttD9b+bFf5X7EF_wT0oyeCcnRwcUprw8w6nw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 01:14:33PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 15, 2022 at 6:33 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > The infobuf variable in gpiod_line_info_from_kernel() refers to the
> > uAPI version of the info, and the "buf" suffix doesn't really
> > emphasise that, so rename it to uinfo.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> 
> I don't entirely disagree with infobuf not being the best name but
> uinfo is even less so. The 'u' prefix doesn't mean anything on its
> own. If anything I would think it has something to do with udev,
> udisks, upower etc. Or "mili" like useconds. How about info_kernel?
> kernel_info? uapi_info?
> 

uapi_info works for me.

Cheers,
Kent.
