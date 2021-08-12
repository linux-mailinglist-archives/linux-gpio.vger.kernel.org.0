Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7AF33EA686
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 16:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237974AbhHLOYT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 10:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237205AbhHLOYS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 10:24:18 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FD2C061756
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 07:23:53 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so10995754pjl.4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6RTPQjtF3Gb2CI3QVNFiC5AhW0AfDETxq/GAFsIkRS4=;
        b=biuTrgMgpQW937TuhRt8c+8XdPNhMCHCKXA8Mizm8RTSYGC881Wwop6yNQcLTpXZ5b
         OHjgWdlqp1lNwuvXJn4yuxxEbJeqBVppUb+VUXEemFXwEWT+dVH9Da5gk3poSC+1r1dS
         TbUiRC4KrEn1hIVYXj/C3QtKhRDWuR+ijKI6lTqjd8l0WRYo85cvvYn4IUvka/oKnlVs
         mBhql22Q2fKs59l14AnOg103NqUKAQD4iVCCIc6X+hquROOx/ectwFk2oqRZQuRJqPUM
         CPZ+zBD3iPcOiakAyOnKoh87bUDRmhjnqApDe8e9sUfu/vCE2y8xdobSqTII5Aidhy7o
         WrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6RTPQjtF3Gb2CI3QVNFiC5AhW0AfDETxq/GAFsIkRS4=;
        b=VT46hJBeoGJ8AFE5fAuRcaMhO0IwIDt4kiUwtRt8u+3FBSXQN6tCt4ilpWCiiyqEuQ
         Hmh4PbK9NzItTH8j97EIsDJ4IjNuuDf8zJiZF2K3Qdc83FvJryHILfO1ysV1FMtIpi+I
         QdPqkXI/QhHnTosI+jElTvON9VzT2LQDc1D+9tzxpb5115t8UQenVB2QgZgLB2ewa2NU
         mN5wxWxtWFBPFxDcJvJXv3ahoLXJN9M7T/8/cKBRWG8zzBtiGf/5sXBdHcxVJNi8+pZ3
         bcGqrOWQNF53F7M+9WxVflPd+bMFuZaSuEL4hh2bfwxk+s78H7JvCptZK4peOXFejd+3
         gueA==
X-Gm-Message-State: AOAM533kPy1RyNlc0UkDar8pX7BePPcd0bZIWxwhX2hQu9sM+5yNR8+g
        Fja+szvuv4CcHp03NYky5gU=
X-Google-Smtp-Source: ABdhPJzPk0ske5LTgFYyCs8+cHN4i4W6NobN18lNVYyZ7dsO9lev3EHBzcatzaIg8VwxwmG2GaU8fQ==
X-Received: by 2002:a17:90a:2b89:: with SMTP id u9mr4639281pjd.116.1628778233164;
        Thu, 12 Aug 2021 07:23:53 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id f6sm3569297pfv.69.2021.08.12.07.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 07:23:51 -0700 (PDT)
Date:   Thu, 12 Aug 2021 22:23:45 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
Message-ID: <20210812142345.GA29599@sol>
References: <20210806132810.23556-1-brgl@bgdev.pl>
 <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol>
 <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol>
 <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
 <20210812102913.GA21938@sol>
 <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 02:51:02PM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 12, 2021 at 12:29 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 

<snip>

> >
> > Sure, it's a trade-off, but the alternative is requiring a 2-3k block
> > even for a one line request, which seems a wee bit excessive.
> >
> 
> As you said - it's on the heap, so who cares. But this is also an
> internal structure and so we can use bit fields. That should reduce
> the memory footprint significantly as we now don't require more than 3
> bits for any given enum. That would leave us with the debounce period
> and offset as full size variables.
> 

Rather than introducing a new collection of enums and bitfields, why not
just store the v2 flags for the line?

Cheers,
Kent.
