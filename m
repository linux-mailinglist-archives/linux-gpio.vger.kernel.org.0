Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4D23AA84F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 02:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbhFQA6U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 20:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbhFQA6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 20:58:20 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9D9C061574
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 17:56:13 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id q25so3600575pfh.7
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 17:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4bP5GgQqZ3RWevdeHKizIwNV5iKbuGevYnARiwIizvw=;
        b=KJMgijy2InNS89hiLegB6H3ZCDS/6S6SqM7QnD7Yg0CLjCVqhCkvUG2pcARpvAGIVL
         ulNcZjP3akSzBxoiG7fuBfJCqidLA9/L81M5PbAmTL2mjRLAD005vpaAgGZHBc2YQUE5
         tBg470LfgCnDVji3iO+MU1ntOcNhYUDrIt9joFjLPPM6SdpduMFvaILuAkhMPvdimFk7
         nNRAmaU8bekTjjvxdg8Q0a9n8s8k42y2Xe4qcybDEfJ9DjRVk2uWw+2gXAml7UhirZsz
         JY+0C7gpf/WJTpDZQDz4JkgfdSBNTI8pRfyQtjTV2gYa2JOtjSYgJHNhAQuKxRmlsf3W
         Iq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4bP5GgQqZ3RWevdeHKizIwNV5iKbuGevYnARiwIizvw=;
        b=LhjKL36a5X2qLcJ1cVhBzyICMR5+inb9D9gyQFAww5UB9CbCFKMpC42wg9BbNg/BR5
         /Y2NXKsIC6cAGC8sqB4s8Cc6T5jrk+Adfw+V1/MMf39m7ZxyK5RiOZ4pS8dZgqHT9IYv
         4ByWwllF+mWJLTrlUEMAiDei9/km98ZKjMqaiR7P3PjiK9ueOEVn0jCDU+fesjSb/A3/
         Bdt01GWbG2le3kLaC0JPR21MVguaFjEsYYBq7YBY6q/bSuepNyu58J+Hkny7e9N/MKie
         jkN9hYRCLBAEl8Smk7v5dUw/OKvfJL7WzPwR4FKHbX2zI1QX04DMNtTf6SCnn49V5yhh
         nlRA==
X-Gm-Message-State: AOAM533Bfle2o/K/+bhJ6BTKCDkRIFLo8CS6qOtuKNiMykdWbk5RMx5J
        hn5YsXnr/Y7KaNAZTmDlQ8K0V4NariT6Pg==
X-Google-Smtp-Source: ABdhPJwENRPXfJmRt7DBfmoF7eCOZTcmBl64yCxivk5O2/EkHKXDc47Kq3cYwutJjDfgF2Y1X6eIGw==
X-Received: by 2002:a63:a019:: with SMTP id r25mr2368249pge.139.1623891373029;
        Wed, 16 Jun 2021 17:56:13 -0700 (PDT)
Received: from sol (106-69-169-160.dyn.iinet.net.au. [106.69.169.160])
        by smtp.gmail.com with ESMTPSA id n14sm3106537pfa.138.2021.06.16.17.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 17:56:12 -0700 (PDT)
Date:   Thu, 17 Jun 2021 08:56:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Knezek <gabeknez@microsoft.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: Potential bug in gpiolib-cdev.c in v1
 notification about line info changes
Message-ID: <20210617005608.GA6358@sol>
References: <SN4PR2101MB0734B4BE5D7750A5CD43C3ACDA309@SN4PR2101MB0734.namprd21.prod.outlook.com>
 <20210616104442.GA160816@sol>
 <SN4PR2101MB073495FA53DFFDB024AB74CEDA0F9@SN4PR2101MB0734.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN4PR2101MB073495FA53DFFDB024AB74CEDA0F9@SN4PR2101MB0734.namprd21.prod.outlook.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 16, 2021 at 09:24:01PM +0000, Gabriel Knezek wrote:
> > 
> > Looks like a bug to me too - well spotted :(.
> > 
> > > We wanted to get your thoughts on if you feel this is actually a bug, or if we
> > overlooked something.
> > > We're proposing to fix this issue by memsetting the entire structure to zero
> > before calling the conversion routine; if you agree that that's a valid
> > approach, I'm happy to submit an official patch.
> > >
> > 
> > Go for it.
> > I'd zero the padding in the conversion routine myself, but zeroing the whole
> > struct in the same routine as the copy_to_user(), as you suggest, would more
> > clearly demonstrate that it isn't leaking stack.
> 
> Sounds good. I'll send out the patch shortly.
> Do you think I should CC: security@kernel.org on the patch?
> 

Not totally clear on the procedure myself, and give this is a potential
security issue, you probably should've gone there first, or mailed the
maintainers privately rather than going straight to the list?
For that matter, I probably should've replied privately rather than
confirming the bug on the list.  But that horse has bolted.

I'd expect the maintainers to promptly direct the patch to the appropriate
channels, though forwarding a copy to security@kernel.org probably
couldn't hurt.

Thanks again for spotting this one - I'm still kicking myself for
missing it.

Cheers,
Kent.

