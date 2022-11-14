Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E784628392
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 16:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236428AbiKNPMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 10:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237144AbiKNPMc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 10:12:32 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2CFDFA4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 07:12:30 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so10920253pjd.4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 07:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwEb/qIRjqnKTLFdyj7tFGznF3ILfpFsVkdiNDDJeIA=;
        b=XDCkZkOh+QA4l5pFoNJFJocV/coljfERuzXuZbvZwH6bLiszeKPb7qpOmpLTMxpivt
         8hny/UwYzscQxlrSrWsNZP5P9jEzTQz74ltUfvtzA5InEW5tZclDY8r/pfqw/tcGaUQo
         wdJyEoLpryWSjbyG/Cn1qjIRWqm9FKXlGXQleiec+5pAGzrvFyq+ALE9coQlW3LpwR2m
         TdE8fyYHnC9vKPyt81iA27Rqfds9Sor9o5GUvs+cKi57proQaiMhDCXY4USQ2/kzRfHs
         ovfrOXbZy3OoHu8LK2GEbVCsmlLA9P1NV4fbFQkJiBT47MVlnWHep8O6pJHsqdzpJb0F
         Dj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwEb/qIRjqnKTLFdyj7tFGznF3ILfpFsVkdiNDDJeIA=;
        b=RlkExxENw2yW6RbG5HM0Ie8OTjx3y1eu9XrCDYv60k0ZvdgvbE+9+SDdq2hE5ius3z
         PPTnVRn6lUKSxjNlz5pOXDFTginEpmeZCTTEB9Xiw/RksdMLeK71a/9vgtT1wzL69uQJ
         5vdmTWIuhplQ7cIGSB+b6x+kJ+BltKDYe2gfClpbSK9fJMUOPnxndmNPFNNHPhwDBqlY
         1FZWt0QppYWF8ukp4cU9hrcgsepF+ODUNTOTFFvDXDRSV20dow4m6Blfnr+477fstzmy
         IVkWwtDLgRvB8iTPHnHWfi2QaF3LnkDpLIl9XqY8F68N8yviImfk21Wn+NhirhvStlXC
         lJdA==
X-Gm-Message-State: ANoB5pnvV0Ytyunr0k3vpUnAUPLO4fmI+evktp022YbYNGrcYnOBI65x
        FBupdCGJBzt+mi8XAov+GIyYsFsFLNc=
X-Google-Smtp-Source: AA0mqf5YUe3QCVG2/dt8Tz2PSMyYvjcfo9KLAc8kYfg/3iAptzhGIlXClMu0iWAHpzWiL/xGJNx7Gw==
X-Received: by 2002:a17:902:eb91:b0:186:a687:e077 with SMTP id q17-20020a170902eb9100b00186a687e077mr14455603plg.26.1668438750153;
        Mon, 14 Nov 2022 07:12:30 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id s10-20020a17090a764a00b0020ad26fa65dsm6552044pjl.56.2022.11.14.07.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 07:12:29 -0800 (PST)
Date:   Mon, 14 Nov 2022 23:12:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v4 0/5] tools: improvements for v2
Message-ID: <Y3Ja2d1X0vC663gl@sol>
References: <20221114040102.66031-1-warthog618@gmail.com>
 <CAMRc=MdUNHsL3_uFR1j2ao4GCMvH_1W0ZMxe4QBG0HFu4xNcew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdUNHsL3_uFR1j2ao4GCMvH_1W0ZMxe4QBG0HFu4xNcew@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 03:26:38PM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> I played with the tools a bit and really like the way they look now. I
> think they're ready to hop into master, I'll do some more testing and
> they should be in this week. Just one last request from my side: would
> you mind updating the TOOLS section of the README? I'm aware it's not
> yet updated for v2 and I plan to do it soon but we could already start
> with the tools examples. You can send an incremental patch on top of
> this series.
> 

Good point - I totally forgot about the README.
I'll take a look at it.

Cheers,
Kent.
